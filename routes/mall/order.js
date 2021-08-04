const express = require('express');
const router = express.Router();
// 数据库
let db = require('../../config/mysql');

/**
 * @api {post} /api/order/settle 获取"确认订单"页面的数据
 * @apiDescription 点击结算按钮之后传参至"确认订单"，此API返回"确认订单"页面需要的数据，此时订单需要用户确认商品价格、数量、支付金额，收货地址在此页面选择或者修改
 * @apiName SettleOrder
 * @apiGroup Order
 * @apiPermission user
 *
 * @apiParam {Number[]} goods 欲购买商品id，格式：[id1,id2,id3];
 *
 * @apiSampleRequest /api/order/settle
 */
router.post('/settle', function (req, res) {
	let { goods } = req.body;
	let { id } = req.user;
	// 多表查询
	let data = {};
  let sql = `SELECT g.id, g.name, g.price, g.img_md, c.goods_num FROM goods g JOIN cart c ON g.id = c.goods_id  WHERE c.uid = ? AND c.goods_id IN (?)`;
  db.query(sql, [id, goods], function (results, fields) {
    console.log(results);
    data.goods = results;
    //成功
    res.json({
      status: true,
      msg: "success!",
      data
    });
  });
});
/**
 * @api {post} /api/order/create 提交订单->生成订单
 * @apiDescription 在确认订单页面，提交订单按钮意味着将购物车中的商品转移到订单中，生成新的订单，称之为下单操作
 * @apiName CreateOrder
 * @apiGroup Order
 * @apiPermission user
 *
 * @apiParam {Number} payment 支付金额,小数点至2位;
 * @apiParam {Number} addressId 收货地址id;
 * @apiParam {Object[]} goodsList 商品数组,包含每一个商品的id,数量，例：[{id:15,num:1},{id:16,num:2}];
 * @apiParam {Number} goodsList.id 商品id;
 * @apiParam {Number} goodsList.num 商品数量;
 *
 * @apiSampleRequest /api/order/create
 */
router.post('/create', function (req, res) {
	// 准备查询的商品id,方便使用IN
	let queryGid = [];
  console.log(222);
  let { addressId, payment, goodsList } = req.body;
	let { id } = req.user;
	goodsList.forEach(function (item) {
		queryGid.push(item.id);
	});
	// 检查库存是否充足
	let sql = `SELECT inventory FROM goods WHERE id IN (?)`;
	db.query(sql, [queryGid], function (results, fields) {
		// every碰到第一个为false的，即终止执行
		let isAllPassed = results.every(function (item, index) {
			let isPassed = item.inventory >= goodsList[index].num;
			if (isPassed == false) {
				res.json({
					status: false,
					msg: `id为${goodsList[index].id}的商品，库存不足!`,
					data: {
						id: goodsList[index].id
					}
				});
			}
			return isPassed;
		});
		// 库存不足,终止执行
		if (isAllPassed == false) {
			return;
		}
		// 数据库事务
		let { pool } = db;
		pool.getConnection(function (err, connection) {
			if (err) {
				throw err;
			}
			connection.beginTransaction(function (error) {
				// 库存充足,对应商品减库存,拼接SQL
				let sql = `UPDATE goods SET  inventory = CASE id `;
				goodsList.forEach(function (item, index) {
					sql += `WHEN ${item.id} THEN inventory - ${item.num} `;
				});
				sql += `END WHERE id IN (${queryGid});`;
				connection.query(sql, function (error, results, fields) {
					if (error || results.changedRows <= 0) {
						return connection.rollback(function () {
							throw error || `${results.changedRows} rows changed!`;
						});
					}
					// 订单表中生成新订单
					let sql = `INSERT INTO orders (uid, payment, create_time) VALUES (?,?,CURRENT_TIMESTAMP())`;
					connection.query(sql, [id, payment], function (error, results, fields) {
						// 提取新订单id
						let { insertId, affectedRows } = results;
						if (error || affectedRows <= 0) {
							return connection.rollback(function () {
								throw error || `${affectedRows} rows affected!`;
							});
						}
						// 存储收货地址快照
						let sql =
							`INSERT INTO order_address ( order_id, name, tel, province_id, city_id, county_id, town_id, street, code )
							 SELECT ( ? ), name, tel, province_id, city_id, county_id, town_id, street, code FROM address WHERE id = ?`;
						connection.query(sql, [insertId, addressId], function (error, results, fields) {
							let { affectedRows } = results;
							if (error || affectedRows <= 0) {
								return connection.rollback(function () {
									throw error || `${affectedRows} rows affected!`;
								});
							}
							// 购物车对应商品复制到order_goods表中，cart表删除对应商品
							let sql = `INSERT INTO order_goods ( order_id, goods_id, goods_num, goods_price )
								SELECT ( ? ), c.goods_id, c.goods_num, g.price FROM cart c JOIN goods g ON g.id = c.goods_id WHERE c.uid = ? AND c.goods_id IN (?);
								DELETE FROM cart WHERE uid = ? AND goods_id IN (?)`;
							connection.query(sql, [insertId, id, queryGid, id, queryGid], function (error, results,
								fields) {
								if (error) {
									return connection.rollback(function () {
										throw error;
									});
								}
								connection.commit(function (err) {
									if (err) {
										return connection.rollback(function () {
											throw err;
										});
									}
									res.json({
										status: true,
										msg: "success!",
										data: {
											order_id: insertId
										}
									});
								});
							});
						});
					});
				});
			});
		});
	});
});
/**
 * @api {get} /api/order/list 获取订单列表
 * @apiDescription 本账户uid中的订单列表，根据订单状态获取列表，具备分页功能
 * @apiName OrderList
 * @apiGroup Order
 * @apiPermission user
 *
 * @apiParam {Number} [pageSize] 一个页有多少个商品,默认4个;
 * @apiParam {Number} [pageIndex] 第几页,默认1;
 * @apiParam {Number=0,3,4,5} status 订单状态:0-待付款，3-待发货，4-待收货，5-待评价;
 *
 * @apiSampleRequest /api/order/list
 */
router.get('/list', function (req, res) {
	let { pageSize = 4, pageIndex = 1, status } = req.query;
	let { id } = req.user;
	let size = parseInt(pageSize);
	let count = size * (pageIndex - 1);
	// 查询订单信息
	let sql =
		`SELECT o.id, o.create_time, o.payment, os.text AS status
		 FROM orders o JOIN order_status os ON o.order_state = os.CODE
		 WHERE o.uid = ? AND o.order_state = ? LIMIT ?, ?`;
	db.query(sql, [id, status, count, size], function (results, fields) {
		// 查询订单商品信息
		let data = results;
    console.log(data);
    let sql =
			`SELECT g.id, o.id AS order_id, g.name, g.img_md, og.goods_num, og.goods_price
			 FROM orders o JOIN order_goods og ON o.id = og.order_id
			 JOIN goods g ON g.id = og.goods_id
			 WHERE o.uid = ? AND o.order_state = ?`;
		db.query(sql, [id, status], (results, fields) => {
			data.forEach((order) => {
				if (!order.goodsList) {
					order.goodsList = [];
				}
				results.forEach((goods) => {
					if (order.id == goods.order_id) {
						order.goodsList.push(goods);
					}
				});
			});
			//成功
			res.json({
				status: true,
				msg: "success!",
				data
			});
		});
	});
});

module.exports = router;
