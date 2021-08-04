/*
 Navicat Premium Data Transfer

 Source Server         : zhibi
 Source Server Type    : MySQL
 Source Server Version : 50715
 Source Host           : localhost:3306
 Source Schema         : mall

 Target Server Type    : MySQL
 Target Server Version : 50715
 File Encoding         : 65001

 Date: 13/05/2021 23:35:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `tel` varchar(255) NOT NULL COMMENT '手机号',
  `province_id` varchar(255) NOT NULL COMMENT '省',
  `city_id` varchar(255) NOT NULL COMMENT '市',
  `county_id` varchar(255) NOT NULL COMMENT '区',
  `town_id` varchar(255) NOT NULL COMMENT '街道（镇）',
  `street` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `code` varchar(255) DEFAULT NULL COMMENT '邮编',
  `isDefault` int(11) DEFAULT '1' COMMENT '是否默认',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='收货地址';

-- ----------------------------
-- Records of address
-- ----------------------------
BEGIN;
INSERT INTO `address` VALUES (20, 2, '啦啦啦', '15863008280', '370000000000', '370200000000', '370213000000', '370213010000', '滨海大道', '2006601', 1);
COMMIT;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `fullname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `sex` varchar(255) DEFAULT '男' COMMENT '性别',
  `avatar` varchar(255) DEFAULT '/images/avatar/default.jpg' COMMENT '头像',
  `tel` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(255) DEFAULT NULL COMMENT '注册邮箱',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '登录时间',
  `login_count` bigint(20) NOT NULL DEFAULT '1' COMMENT '登录次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of admin
-- ----------------------------
BEGIN;
INSERT INTO `admin` VALUES (1, 'admin', '123456', '超级管理员', '男', '/images/avatar/default.jpg', '13475829262', NULL, '2019-05-14 20:39:31', '2021-05-12 22:48:11', 126);
INSERT INTO `admin` VALUES (2, '15863008280', '123456', '黄小米', '女', '/images/avatar/default.jpg', '15863008280', NULL, '2019-05-11 18:21:37', '2020-10-09 15:33:33', 7);
INSERT INTO `admin` VALUES (3, 'moz', '123', '黄渤', '男', '/images/avatar/default.jpg', '13475829262', NULL, '2019-10-11 12:03:12', '2020-10-09 15:33:11', 2);
COMMIT;

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL COMMENT '用户id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
BEGIN;
INSERT INTO `admin_role` VALUES (2, 2, 2);
INSERT INTO `admin_role` VALUES (1, 1, 1);
INSERT INTO `admin_role` VALUES (3, 3, 3);
COMMIT;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `goods_num` int(11) NOT NULL COMMENT '商品数量',
  `status` tinyint(4) DEFAULT '1' COMMENT '1-正常，0-禁用，-1-删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='购物车';

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '名称',
  `pId` int(11) NOT NULL COMMENT '父级id',
  `level` int(11) DEFAULT NULL COMMENT '层级',
  `img` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=141 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品分类';

-- ----------------------------
-- Records of category
-- ----------------------------
BEGIN;
INSERT INTO `category` VALUES (1, '全部分类', 0, 1, '');
INSERT INTO `category` VALUES (2, '女装', 1, NULL, 'http://localhost:3002/images/common/707d6060-cbb7-11ea-8d4a-bf562cfb5ba9.jpeg');
INSERT INTO `category` VALUES (3, '男装', 1, NULL, 'http://localhost:3002/images/common/a1306ae0-cbb7-11ea-8d4a-bf562cfb5ba9.jpeg');
INSERT INTO `category` VALUES (4, '美妆', 1, NULL, 'http://localhost:3002/images/common/c8a7b830-cbb7-11ea-8d4a-bf562cfb5ba9.jpeg');
INSERT INTO `category` VALUES (5, '医药', 1, NULL, 'http://localhost:3002/images/common/e6a33210-cbb7-11ea-8d4a-bf562cfb5ba9.jpeg');
INSERT INTO `category` VALUES (6, '箱包', 1, NULL, 'http://localhost:3002/images/common/ef216ba0-cbb7-11ea-8d4a-bf562cfb5ba9.jpeg');
INSERT INTO `category` VALUES (7, '百货', 1, NULL, 'http://localhost:3002/images/common/f5d4a930-cbb7-11ea-8d4a-bf562cfb5ba9.jpeg');
INSERT INTO `category` VALUES (8, '鞋靴', 1, NULL, 'http://localhost:3002/images/common/fdc45e60-cbb7-11ea-8d4a-bf562cfb5ba9.jpeg');
INSERT INTO `category` VALUES (9, '手机', 1, NULL, 'http://localhost:3002/images/common/03899270-cbb8-11ea-8d4a-bf562cfb5ba9.jpeg');
INSERT INTO `category` VALUES (10, '母婴', 1, NULL, 'http://localhost:3002/images/common/0909a730-cbb8-11ea-8d4a-bf562cfb5ba9.jpeg');
INSERT INTO `category` VALUES (11, '饰品', 1, NULL, 'http://localhost:3002/images/common/1049e280-cbb8-11ea-8d4a-bf562cfb5ba9.jpeg');
INSERT INTO `category` VALUES (12, '进口', 1, NULL, 'http://localhost:3002/images/common/16f81700-cbb8-11ea-8d4a-bf562cfb5ba9.jpeg');
INSERT INTO `category` VALUES (13, '食品', 1, NULL, 'http://localhost:3002/images/common/1c5f4c90-cbb8-11ea-8d4a-bf562cfb5ba9.jpeg');
INSERT INTO `category` VALUES (14, '内衣', 1, NULL, 'http://localhost:3002/images/common/22d3fa80-cbb8-11ea-8d4a-bf562cfb5ba9.jpeg');
INSERT INTO `category` VALUES (15, '运动', 1, NULL, 'http://localhost:3002/images/common/27d3bbb0-cbb8-11ea-8d4a-bf562cfb5ba9.jpeg');
INSERT INTO `category` VALUES (16, '家装', 1, NULL, 'http://localhost:3002/images/common/32157730-cbb8-11ea-8d4a-bf562cfb5ba9.jpeg');
INSERT INTO `category` VALUES (17, '洗护', 1, NULL, 'http://localhost:3002/images/common/3734ce50-cbb8-11ea-8d4a-bf562cfb5ba9.jpeg');
INSERT INTO `category` VALUES (18, '数码', 1, NULL, 'http://localhost:3002/images/common/3d4981f0-cbb8-11ea-8d4a-bf562cfb5ba9.jpeg');
INSERT INTO `category` VALUES (19, '电器', 1, NULL, 'http://localhost:3002/images/common/42cd6740-cbb8-11ea-8d4a-bf562cfb5ba9.jpeg');
INSERT INTO `category` VALUES (20, '车品', 1, NULL, 'http://localhost:3002/images/common/4a5f1df0-cbb8-11ea-8d4a-bf562cfb5ba9.jpeg');
INSERT INTO `category` VALUES (21, '企业', 1, NULL, 'http://localhost:3002/images/common/4fdebd80-cbb8-11ea-8d4a-bf562cfb5ba9.jpeg');
INSERT INTO `category` VALUES (22, '保健', 1, NULL, 'http://localhost:3002/images/common/56ba1c80-cbb8-11ea-8d4a-bf562cfb5ba9.jpeg');
INSERT INTO `category` VALUES (23, '生鲜', 1, NULL, 'http://localhost:3002/images/common/664bdc10-cbb8-11ea-8d4a-bf562cfb5ba9.jpeg');
INSERT INTO `category` VALUES (140, '显示器', 18, NULL, 'http://localhost:3002/images/common/f34c1fe0-86bf-11eb-9155-81b308c2293d.jpeg');
INSERT INTO `category` VALUES (30, '方领连衣裙', 2, NULL, 'http://localhost:3002/images/common/52f91a10-cbfe-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (31, '泡泡袖', 2, NULL, 'http://localhost:3002/images/common/59e89d50-cbfe-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (32, 'JK制服', 2, NULL, 'http://localhost:3002/images/common/64e914f0-cbfe-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (33, '洛丽塔', 2, NULL, 'http://localhost:3002/images/common/6ad69180-cbfe-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (34, '西装连衣裙', 2, NULL, 'http://localhost:3002/images/common/754f3b80-cbfe-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (35, '束脚裤', 2, NULL, 'http://localhost:3002/images/common/7f4966b0-cbfe-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (36, '连衣裙', 2, NULL, 'http://localhost:3002/images/common/8bfbfb20-cbfe-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (37, '半身裙', 2, NULL, 'http://localhost:3002/images/common/94654d20-cbfe-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (38, '旗袍', 2, NULL, 'http://localhost:3002/images/common/99251f20-cbfe-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (39, 'T恤', 2, NULL, 'http://localhost:3002/images/common/a3d4deb0-cbfe-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (40, '衬衫', 2, NULL, 'http://localhost:3002/images/common/a8d674a0-cbfe-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (41, '雪纺衫', 2, NULL, 'http://localhost:3002/images/common/b0612670-cbfe-11ea-9199-4f212e5ee595.png');
INSERT INTO `category` VALUES (42, '卫衣', 2, NULL, 'http://localhost:3002/images/common/b5b10370-cbfe-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (43, '毛衣', 2, NULL, 'http://localhost:3002/images/common/baeb0e80-cbfe-11ea-9199-4f212e5ee595.png');
INSERT INTO `category` VALUES (44, '马甲', 2, NULL, 'http://localhost:3002/images/common/bffea5d0-cbfe-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (45, '休闲裤', 2, NULL, 'http://localhost:3002/images/common/c9b92ff0-cbfe-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (46, '牛仔裤', 2, NULL, 'http://localhost:3002/images/common/cfb57990-cbfe-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (47, '打底裤', 2, NULL, 'http://localhost:3002/images/common/d5c32850-cbfe-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (48, '西装裤', 2, NULL, 'http://localhost:3002/images/common/dba6e0e0-cbfe-11ea-9199-4f212e5ee595.png');
INSERT INTO `category` VALUES (49, '棉裤羽绒裤', 2, NULL, 'http://localhost:3002/images/common/01b8d1d0-cbff-11ea-9199-4f212e5ee595.png');
INSERT INTO `category` VALUES (50, '时尚套装', 2, NULL, 'http://localhost:3002/images/common/102a5450-cbff-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (51, '运动套装', 2, NULL, 'http://localhost:3002/images/common/15f3a710-cbff-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (52, '短外套', 2, NULL, 'http://localhost:3002/images/common/1fb64780-cbff-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (53, '风衣', 2, NULL, 'http://localhost:3002/images/common/247b97c0-cbff-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (54, '西装', 2, NULL, 'http://localhost:3002/images/common/29e0d180-cbff-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (55, '毛呢大衣', 2, NULL, 'http://localhost:3002/images/common/2ff29ef0-cbff-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (56, '羽绒服', 2, NULL, 'http://localhost:3002/images/common/35531dc0-cbff-11ea-9199-4f212e5ee595.png');
INSERT INTO `category` VALUES (57, '棉衣棉服', 2, NULL, 'http://localhost:3002/images/common/3bb79f10-cbff-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (58, '皮草', 2, NULL, 'http://localhost:3002/images/common/41e5a710-cbff-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (59, '皮衣', 2, NULL, 'http://localhost:3002/images/common/47453b80-cbff-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (64, '冰感T恤', 3, NULL, 'http://localhost:3002/images/common/88f9c230-cbff-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (65, '伞兵裤', 3, NULL, 'http://localhost:3002/images/common/8df84ae0-cbff-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (66, '无性别T恤', 3, NULL, 'http://localhost:3002/images/common/94f1e040-cbff-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (67, '夜跑裤', 3, NULL, 'http://localhost:3002/images/common/9a188a60-cbff-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (68, '工装裤', 3, NULL, 'http://localhost:3002/images/common/aa1a97f0-cbff-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (69, '牛仔短裤', 3, NULL, 'http://localhost:3002/images/common/b2dae390-cbff-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (70, '牛仔长裤', 3, NULL, 'http://localhost:3002/images/common/ba1b45f0-cbff-11ea-9199-4f212e5ee595.png');
INSERT INTO `category` VALUES (71, '皮裤', 3, NULL, 'http://localhost:3002/images/common/bef1ad30-cbff-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (72, '休闲长裤', 3, NULL, 'http://localhost:3002/images/common/c50883b0-cbff-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (73, 'Polo衫', 3, NULL, 'http://localhost:3002/images/common/da61c140-cbff-11ea-9199-4f212e5ee595.png');
INSERT INTO `category` VALUES (74, 'T恤', 3, NULL, 'http://localhost:3002/images/common/df45bd10-cbff-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (75, '背心马甲', 3, NULL, 'http://localhost:3002/images/common/e5bcb4f0-cbff-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (76, '衬衫', 3, NULL, 'http://localhost:3002/images/common/ec8ec520-cbff-11ea-9199-4f212e5ee595.png');
INSERT INTO `category` VALUES (77, '短外套', 3, NULL, 'http://localhost:3002/images/common/f415cd70-cbff-11ea-9199-4f212e5ee595.png');
INSERT INTO `category` VALUES (78, '风衣', 3, NULL, 'http://localhost:3002/images/common/fb043f40-cbff-11ea-9199-4f212e5ee595.png');
INSERT INTO `category` VALUES (79, '毛呢大衣', 3, NULL, 'http://localhost:3002/images/common/0019f970-cc00-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (80, '毛衣', 3, NULL, 'http://localhost:3002/images/common/05d5deb0-cc00-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (81, '棉衣', 3, NULL, 'http://localhost:3002/images/common/0a560fa0-cc00-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (82, '皮衣', 3, NULL, 'http://localhost:3002/images/common/0fc8ddf0-cc00-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (83, '卫衣', 3, NULL, 'http://localhost:3002/images/common/14e4b2a0-cc00-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (84, '羊绒衫', 3, NULL, 'http://localhost:3002/images/common/19eefb20-cc00-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (85, '羽绒服', 3, NULL, 'http://localhost:3002/images/common/20ab8780-cc00-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (86, '西服', 3, NULL, 'http://localhost:3002/images/common/2eb631e0-cc00-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (87, '西服套装', 3, NULL, 'http://localhost:3002/images/common/33210610-cc00-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (88, '西裤', 3, NULL, 'http://localhost:3002/images/common/396ad370-cc00-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (89, '休闲套装', 3, NULL, 'http://localhost:3002/images/common/3e819f10-cc00-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (139, '整机一体', 18, NULL, 'http://localhost:3002/images/common/bc88ce90-86bf-11eb-9155-81b308c2293d.jpeg');
INSERT INTO `category` VALUES (93, '彩妆套装', 4, NULL, 'http://localhost:3002/images/common/ed0fbf80-cc00-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (94, '粉底', 4, NULL, 'http://localhost:3002/images/common/f1ec6850-cc00-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (95, '隔离', 4, NULL, 'http://localhost:3002/images/common/fa2f1f80-cc00-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (96, '化妆工具', 4, NULL, 'http://localhost:3002/images/common/ff9320c0-cc00-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (97, '睫毛膏', 4, NULL, 'http://localhost:3002/images/common/06b76fa0-cc01-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (98, '口红', 4, NULL, 'http://localhost:3002/images/common/0ccebb50-cc01-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (99, '眉粉', 4, NULL, 'http://localhost:3002/images/common/13d87d50-cc01-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (100, '修容', 4, NULL, 'http://localhost:3002/images/common/1b83fd90-cc01-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (101, '眼影眼线', 4, NULL, 'http://localhost:3002/images/common/22b8ee40-cc01-11ea-9199-4f212e5ee595.jpeg');
INSERT INTO `category` VALUES (102, '鼻贴', 4, NULL, 'http://localhost:3002/images/common/82ad92c0-cc1e-11ea-abbe-6755e5a10676.jpeg');
INSERT INTO `category` VALUES (103, '防晒', 4, NULL, 'http://localhost:3002/images/common/8ef46d10-cc1e-11ea-abbe-6755e5a10676.jpeg');
INSERT INTO `category` VALUES (104, '护肤套装', 4, NULL, 'http://localhost:3002/images/common/a9836ff0-cc1e-11ea-abbe-6755e5a10676.jpeg');
INSERT INTO `category` VALUES (105, '化妆水', 4, NULL, 'http://localhost:3002/images/common/b64bd650-cc1e-11ea-abbe-6755e5a10676.jpeg');
INSERT INTO `category` VALUES (106, '洁面', 4, NULL, 'http://localhost:3002/images/common/be47c080-cc1e-11ea-abbe-6755e5a10676.png');
INSERT INTO `category` VALUES (107, '精华', 4, NULL, 'http://localhost:3002/images/common/eaf4fa30-cc1e-11ea-abbe-6755e5a10676.jpeg');
INSERT INTO `category` VALUES (108, '面膜', 4, NULL, 'http://localhost:3002/images/common/f75aa720-cc1e-11ea-abbe-6755e5a10676.jpeg');
INSERT INTO `category` VALUES (109, '男士洁面', 4, NULL, 'http://localhost:3002/images/common/00b3fe70-cc1f-11ea-abbe-6755e5a10676.jpeg');
INSERT INTO `category` VALUES (110, '乳霜面霜', 4, NULL, 'http://localhost:3002/images/common/0834ec40-cc1f-11ea-abbe-6755e5a10676.jpeg');
INSERT INTO `category` VALUES (111, '润唇膏', 4, NULL, 'http://localhost:3002/images/common/186c88c0-cc1f-11ea-abbe-6755e5a10676.jpeg');
INSERT INTO `category` VALUES (112, '卸妆', 4, NULL, 'http://localhost:3002/images/common/1f72c850-cc1f-11ea-abbe-6755e5a10676.jpeg');
INSERT INTO `category` VALUES (113, '眼霜', 4, NULL, 'http://localhost:3002/images/common/2ac00060-cc1f-11ea-abbe-6755e5a10676.jpeg');
INSERT INTO `category` VALUES (114, '美甲', 4, NULL, 'http://localhost:3002/images/common/5cc10eb0-cc1f-11ea-abbe-6755e5a10676.jpeg');
INSERT INTO `category` VALUES (115, '美容仪', 4, NULL, 'http://localhost:3002/images/common/62300c70-cc1f-11ea-abbe-6755e5a10676.jpeg');
INSERT INTO `category` VALUES (116, '手霜手膜', 4, NULL, 'http://localhost:3002/images/common/68826550-cc1f-11ea-abbe-6755e5a10676.jpeg');
INSERT INTO `category` VALUES (117, '香水', 4, NULL, 'http://localhost:3002/images/common/6e310420-cc1f-11ea-abbe-6755e5a10676.jpeg');
INSERT INTO `category` VALUES (138, '笔记本电脑', 18, NULL, 'http://localhost:3002/images/common/a42ab570-86bf-11eb-9155-81b308c2293d.jpeg');
INSERT INTO `category` VALUES (137, '户外服装', 15, NULL, 'http://localhost:3002/images/common/1adba590-86bf-11eb-9155-81b308c2293d.jpeg');
INSERT INTO `category` VALUES (136, '自行车', 15, NULL, 'http://localhost:3002/images/common/d59370d0-86be-11eb-9155-81b308c2293d.jpeg');
COMMIT;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_1st` int(11) NOT NULL COMMENT '一级分类id',
  `cate_2nd` int(11) NOT NULL COMMENT '二级分类id',
  `cate_3rd` int(11) DEFAULT NULL COMMENT '三级分类id',
  `name` varchar(255) NOT NULL COMMENT '商品名称',
  `hotPoint` varchar(255) DEFAULT NULL COMMENT '商品热点描述',
  `price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `marketPrice` decimal(10,2) NOT NULL COMMENT '市场价',
  `cost` decimal(10,2) NOT NULL COMMENT '成本价',
  `discount` decimal(10,0) DEFAULT NULL COMMENT '折扣',
  `inventory` int(11) NOT NULL COMMENT '库存',
  `articleNo` int(11) NOT NULL COMMENT '货号',
  `img_lg` varchar(255) NOT NULL COMMENT '商品主图-720',
  `img_md` varchar(255) NOT NULL COMMENT '商品主图-360',
  `slider` varchar(520) NOT NULL COMMENT '商品轮播图片',
  `brand` varchar(255) DEFAULT NULL COMMENT '商品品牌',
  `detail` varchar(5000) NOT NULL COMMENT '商品详情',
  `freight` decimal(10,0) DEFAULT '0' COMMENT '商品运费',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品表';

-- ----------------------------
-- Records of goods
-- ----------------------------
BEGIN;
INSERT INTO `goods` VALUES (15, 18, 138, NULL, '机械师F117荣耀版 游戏本七代i7-7700HQ/GTX1050Ti 4G独显游戏本笔记本电脑', '【9月20号0:00首发，预约享12期免息特权，仅此一天】【鎏金3D金属A壳】【1677万色RGB背光键盘】【IPS雾面屏】', 6999.00, 7500.00, 6000.00, 9, 998, 1, 'http://localhost:3002/images/goods/b5dcffe0-e7b0-11e8-8eb5-2933d116d7fc_720.jpg', 'http://localhost:3002/images/goods/b5dcffe0-e7b0-11e8-8eb5-2933d116d7fc_360.jpg', 'http://localhost:3002/images/goods/b7604480-e7b0-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3002/images/goods/b8fc6850-e7b0-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3002/images/goods/ba1615b0-e7b0-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3002/images/goods/bb5a5580-e7b0-11e8-8eb5-2933d116d7fc_720.jpg', '机械师', '<p><img src=\"http://localhost:3002/images/details/c7c5f5e0-e7b0-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width:100%;\"><img src=\"http://localhost:3002/images/details/c999a470-e7b0-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/cba81210-e7b0-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/ce3bdc50-e7b0-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/ef071800-e7b0-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/f0bcde50-e7b0-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/f2c44710-e7b0-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/f4ba98d0-e7b0-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><br></p>', 0, '2018-11-14 09:59:57', '2021-03-17 09:28:18');
INSERT INTO `goods` VALUES (16, 18, 140, NULL, '【京东配送】AOC C2791VHE/WS 27英寸 1800R曲率 VA广视角 家用电竞双实力 不闪屏曲面显示器', '1800R曲率 VA广视角 家用电竞双实力 不闪屏曲面显示器', 1249.00, 1500.00, 1000.00, 8, 998, 2, 'http://localhost:3002/images/goods/93016550-e7b1-11e8-8eb5-2933d116d7fc_720.jpg', 'http://localhost:3002/images/goods/93016550-e7b1-11e8-8eb5-2933d116d7fc_360.jpg', 'http://localhost:3002/images/goods/948ebc10-e7b1-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3002/images/goods/95d9d9b0-e7b1-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3002/images/goods/96e3a890-e7b1-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3002/images/goods/98a6dc60-e7b1-11e8-8eb5-2933d116d7fc_720.jpg', 'AOC', '<p><img src=\"http://localhost:3002/images/details/a1e7c9b0-e7b1-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width:100%;\"><img src=\"http://localhost:3002/images/details/a3afdf80-e7b1-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/a55af770-e7b1-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/a7204e20-e7b1-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/a89fe940-e7b1-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/aa1a0620-e7b1-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><br></p>', 0, '2018-11-14 10:04:52', '2021-03-17 09:28:00');
INSERT INTO `goods` VALUES (17, 18, 139, NULL, '京天（KOTIN）第八代i5 8400/GTX1050Ti 4GD独显吃鸡游戏组装机DIY台式组装电脑主机', '更“芯”换代，升级配置，请联系客服。', 4599.00, 5000.00, 4000.00, 9, 1000, 3, 'http://localhost:3002/images/goods/0bda9730-e7b2-11e8-8eb5-2933d116d7fc_720.jpg', 'http://localhost:3002/images/goods/0bda9730-e7b2-11e8-8eb5-2933d116d7fc_360.jpg', 'http://localhost:3002/images/goods/0f6d5ae0-e7b2-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3002/images/goods/10eccef0-e7b2-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3002/images/goods/11f628a0-e7b2-11e8-8eb5-2933d116d7fc_720.jpg', '京天', '<p><img src=\"http://localhost:3002/images/details/201879b0-e7b2-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width:100%;\"><img src=\"http://localhost:3002/images/details/219a85d0-e7b2-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/232df710-e7b2-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/24f326b0-e7b2-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/266f8d80-e7b2-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/28101e20-e7b2-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/29d12f10-e7b2-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/2c030330-e7b2-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><br></p>', 0, '2018-11-14 10:08:31', '2021-03-17 09:26:34');
INSERT INTO `goods` VALUES (18, 18, 138, NULL, '惠普(HP) 幽灵Spectre x360 13.3英寸超轻薄翻转笔记本', '13.9mm超薄！全金属！360°翻转触控！窄边框！带手写触控笔！（SSD FHD 触控屏 黑金版）', 8499.00, 9000.00, 6000.00, 9, 1000, 4, 'http://localhost:3002/images/goods/f56613b0-e7b3-11e8-8eb5-2933d116d7fc_720.jpg', 'http://localhost:3002/images/goods/f56613b0-e7b3-11e8-8eb5-2933d116d7fc_360.jpg', 'http://localhost:3002/images/goods/f6df6d40-e7b3-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3002/images/goods/f828b620-e7b3-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3002/images/goods/f92083a0-e7b3-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3002/images/goods/fa6d00d0-e7b3-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3002/images/goods/fbd6a2f0-e7b3-11e8-8eb5-2933d116d7fc_720.jpg', 'HP', '<p><img src=\"http://localhost:3002/images/details/4a8f9220-e7b5-11e8-8eb5-2933d116d7fc.png\" style=\"max-width:100%;\"><img src=\"http://localhost:3002/images/details/4cda6c80-e7b5-11e8-8eb5-2933d116d7fc.png\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/4f0a1dc0-e7b5-11e8-8eb5-2933d116d7fc.png\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/50ccb550-e7b5-11e8-8eb5-2933d116d7fc.png\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/52886f10-e7b5-11e8-8eb5-2933d116d7fc.png\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/554b86b0-e7b5-11e8-8eb5-2933d116d7fc.png\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/57857120-e7b5-11e8-8eb5-2933d116d7fc.png\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/59596dd0-e7b5-11e8-8eb5-2933d116d7fc.png\" style=\"max-width: 100%;\"><br></p>', 0, '2018-11-14 10:31:26', '2021-03-17 09:26:19');
INSERT INTO `goods` VALUES (19, 3, 74, NULL, '【5折抢购】CH新款潮流短袖T恤衫学生休闲假两件日系韩版潮修身纯色短T恤男', '限时抢购经典假两件纯棉纯色T恤衫，潮男必备！ ！ ！', 49.00, 60.00, 20.00, 8, 1000, 5, 'http://localhost:3002/images/goods/a37041a0-e7b5-11e8-8eb5-2933d116d7fc_720.jpg', 'http://localhost:3002/images/goods/a37041a0-e7b5-11e8-8eb5-2933d116d7fc_360.jpg', 'http://localhost:3002/images/goods/a4bdf750-e7b5-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3002/images/goods/a66e1850-e7b5-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3002/images/goods/a76b3d00-e7b5-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3002/images/goods/a8b4fb10-e7b5-11e8-8eb5-2933d116d7fc_720.jpg', 'CH', '<p><img src=\"http://localhost:3002/images/details/b110df90-e7b5-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width:100%;\"><img src=\"http://localhost:3002/images/details/b298b810-e7b5-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/b41fa630-e7b5-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/b59926d0-e7b5-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/b7cca8a0-e7b5-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/b90af500-e7b5-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/baba2ba0-e7b5-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/bd659c90-e7b5-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><br></p>', 0, '2018-11-14 10:34:06', '2021-03-17 09:23:21');
INSERT INTO `goods` VALUES (24, 3, 76, NULL, '幸福时光男装2017新款秋冬新款格子衬衫韩版休闲C35', 'C35', 89.00, 120.00, 20.00, 7, 1000, 6, 'http://localhost:3002/images/goods/0b78fcf0-e7b7-11e8-8eb5-2933d116d7fc_720.jpg', 'http://localhost:3002/images/goods/0b78fcf0-e7b7-11e8-8eb5-2933d116d7fc_360.jpg', 'http://localhost:3002/images/goods/0cd35cd0-e7b7-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3002/images/goods/0e1b9440-e7b7-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3002/images/goods/0f4c9a30-e7b7-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3002/images/goods/109f31e0-e7b7-11e8-8eb5-2933d116d7fc_720.jpg', '幸福时光', '<p><img src=\"http://localhost:3002/images/details/1a3ff270-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width:100%;\"><img src=\"http://localhost:3002/images/details/1b9dfbd0-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/1d630460-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/1f1cc250-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/2091d620-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/2210adf0-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/242758f0-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/25b30200-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/27f773c0-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/2a3a37d0-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/2c0bc380-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/2dea6e90-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><br></p>', 0, '2018-11-14 10:44:30', '2021-03-17 09:23:01');
INSERT INTO `goods` VALUES (25, 3, 74, NULL, '探路者Toread男装棉T恤-TAJF81937-C27X', '', 65.00, 80.00, 20.00, 8, 992, 7, 'http://localhost:3002/images/goods/9c360ee0-e7b7-11e8-8eb5-2933d116d7fc_720.jpg', 'http://localhost:3002/images/goods/9c360ee0-e7b7-11e8-8eb5-2933d116d7fc_360.jpg', 'http://localhost:3002/images/goods/9dd47ca0-e7b7-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3002/images/goods/9f6f19d0-e7b7-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3002/images/goods/a0bea440-e7b7-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3002/images/goods/a1be39f0-e7b7-11e8-8eb5-2933d116d7fc_720.jpg', '探路者', '<p><img src=\"http://localhost:3002/images/details/ac04fe80-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width:100%;\"><img src=\"http://localhost:3002/images/details/ad9dee00-e7b7-11e8-8eb5-2933d116d7fc.png\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/af0f3140-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/b07fd840-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/b258b6f0-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/b3c147a0-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/b52fcbc0-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/b719e880-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><br></p>', 0, '2018-11-14 10:48:13', '2021-03-17 09:22:29');
INSERT INTO `goods` VALUES (26, 15, 137, NULL, 'AIRTEX亚特户外男女防晒衣轻薄透气弹力皮肤风衣夹克长款外套M2169&W2170', '弹力面料 防晒轻簿 中长款', 259.00, 300.00, 100.00, 9, 992, 8, 'http://localhost:3002/images/goods/ef53fb50-e7b7-11e8-8eb5-2933d116d7fc_720.jpg', 'http://localhost:3002/images/goods/ef53fb50-e7b7-11e8-8eb5-2933d116d7fc_360.jpg', 'http://localhost:3002/images/goods/f0a6e120-e7b7-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3002/images/goods/f1f13b70-e7b7-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3002/images/goods/f2e119b0-e7b7-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3002/images/goods/f41a0ee0-e7b7-11e8-8eb5-2933d116d7fc_720.jpg', 'AIRTEX', '<p><img src=\"http://localhost:3002/images/details/03eb2160-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width:100%;\"><img src=\"http://localhost:3002/images/details/05a83ab0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/06e638f0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/08607ce0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/0a104fc0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/0bb43bc0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/1f121e80-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/2121c4a0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/246e5790-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/26c0fa20-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/28c3cf00-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><br></p>', 0, '2018-11-14 10:51:24', '2021-03-17 09:21:56');
INSERT INTO `goods` VALUES (27, 15, 136, NULL, '永久（FOREVER）自行车24速山地车26寸转把双碟刹男女式学生单车 猎狐T01-A', '温馨提示：新疆西藏地区暂不支持配送，自行车属大件商品，如人为原因拒收，需客户承担运费\n每天14：30前发货，客服在线时间9点-17点\n★【11月12日-15日返场购车领券满399-30 另加送骑行手电 评价还送二重礼包】', 599.00, 700.00, 300.00, 9, 1000, 9, 'http://localhost:3002/images/goods/6de67a60-e7b8-11e8-8eb5-2933d116d7fc_720.jpg', 'http://localhost:3002/images/goods/6de67a60-e7b8-11e8-8eb5-2933d116d7fc_360.jpg', 'http://localhost:3002/images/goods/6f328260-e7b8-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3002/images/goods/708a9850-e7b8-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3002/images/goods/7160d410-e7b8-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3002/images/goods/73521cc0-e7b8-11e8-8eb5-2933d116d7fc_720.jpg', '永久', '<p><img src=\"http://localhost:3002/images/details/7a82c7b0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width:100%;\"><img src=\"http://localhost:3002/images/details/7bd78240-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/7d807750-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/7eb1a450-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/80547ee0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/81b60ab0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/837ce800-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/85267950-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><br></p>', 0, '2018-11-14 10:53:56', '2021-03-17 09:20:17');
INSERT INTO `goods` VALUES (28, 15, 136, NULL, '凤凰 高碳钢破风设计21速钳型刹越野学生车弯把公路车自行车', '用户需知：新疆西藏地区暂不支持配送，自行车属大件商品，如人为原因拒收商品，由用户自行承担退回所产生的运费！！！', 700.00, 900.00, 350.00, 8, 1000, 10, 'http://localhost:3002/images/goods/b63efc60-e7b8-11e8-8eb5-2933d116d7fc_720.jpg', 'http://localhost:3002/images/goods/b63efc60-e7b8-11e8-8eb5-2933d116d7fc_360.jpg', 'http://localhost:3002/images/goods/b8042c00-e7b8-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3002/images/goods/b95d5360-e7b8-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3002/images/goods/ba73a560-e7b8-11e8-8eb5-2933d116d7fc_720.jpg', '凤凰', '<p><img src=\"http://localhost:3002/images/details/c11f8ff0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width:100%;\"><img src=\"http://localhost:3002/images/details/c2d667b0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/c47857e0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/c5d1cd60-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/c7597ed0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/ca644dd0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/cbf9e1f0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/cd84c7b0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/cef4d270-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/d1a684f0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/d3d090e0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/d5f93d40-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/d8684170-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/db0867c0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/defc1020-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/e18b6d90-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/e47c24e0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/f472c0c0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><br></p>', 0, '2018-11-14 10:57:06', '2021-03-17 09:19:58');
INSERT INTO `goods` VALUES (29, 2, 30, NULL, '法式桔梗碎花连衣裙女夏小清新复古方领泡泡袖小个子2020夏装新款', '', 219.00, 429.00, 100.00, 5, 1000, 11, 'http://localhost:3002/images/goods/08a04fe0-cc2d-11ea-a0c3-4166efc6fb01_720.jpeg', 'http://localhost:3002/images/goods/08a04fe0-cc2d-11ea-a0c3-4166efc6fb01_360.jpeg', 'http://localhost:3002/images/goods/0fc08010-cc2d-11ea-a0c3-4166efc6fb01_720.jpeg,http://localhost:3002/images/goods/12acca90-cc2d-11ea-a0c3-4166efc6fb01_720.jpeg,http://localhost:3002/images/goods/151d2e50-cc2d-11ea-a0c3-4166efc6fb01_720.jpeg,http://localhost:3002/images/goods/174ae3c0-cc2d-11ea-a0c3-4166efc6fb01_720.jpeg,http://localhost:3002/images/goods/1a30c5a0-cc2d-11ea-a0c3-4166efc6fb01_720.jpeg', 'Hyliangpin', '<p><img src=\"http://localhost:3002/images/details/96e84320-cc2d-11ea-a0c3-4166efc6fb01.jpeg\" style=\"max-width:100%;\"></p><p><img src=\"http://localhost:3002/images/details/d3f47770-cc2d-11ea-a0c3-4166efc6fb01.jpeg\" style=\"max-width: 100%;\"><br></p><p><img src=\"http://localhost:3002/images/details/19fd8b30-cc2e-11ea-a0c3-4166efc6fb01.jpeg\" style=\"max-width:100%;\"><br></p><p><img src=\"http://localhost:3002/images/details/1ea34580-cc2e-11ea-a0c3-4166efc6fb01.jpeg\" style=\"max-width:100%;\"><br></p>', 0, '2020-07-22 23:15:43', '2020-07-22 23:18:44');
INSERT INTO `goods` VALUES (30, 2, 30, NULL, '大码女装2020夏装新款微胖妹妹mm仙女中长款雪纺显瘦遮肚子连衣裙', '', 299.00, 399.00, 150.00, 7, 1000, 12, 'http://localhost:3002/images/goods/172bd770-dbee-11ea-8858-c992a1c4bc0e_720.png', 'http://localhost:3002/images/goods/172bd770-dbee-11ea-8858-c992a1c4bc0e_360.png', 'http://localhost:3002/images/goods/1c4e89f0-dbee-11ea-8858-c992a1c4bc0e_720.png,http://localhost:3002/images/goods/1fe12690-dbee-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3002/images/goods/22fee150-dbee-11ea-8858-c992a1c4bc0e_720.jpeg', '韩风', '<p><img src=\"http://localhost:3002/images/details/27fc5890-dbee-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width:100%;\"><img src=\"http://localhost:3002/images/details/2c0c6290-dbee-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><br></p>', 0, '2020-08-12 00:19:14', NULL);
INSERT INTO `goods` VALUES (31, 2, 30, NULL, '2020夏季新款女装胖mm大码气质显瘦方领泡泡袖高腰雪纺波点连衣裙', '', 116.00, 200.00, 40.00, 6, 1000, 13, 'http://localhost:3002/images/goods/b4bef970-dbf0-11ea-8858-c992a1c4bc0e_720.jpeg', 'http://localhost:3002/images/goods/b4bef970-dbf0-11ea-8858-c992a1c4bc0e_360.jpeg', 'http://localhost:3002/images/goods/bb98aac0-dbf0-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3002/images/goods/c017a330-dbf0-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3002/images/goods/ccdd2360-dbf0-11ea-8858-c992a1c4bc0e_720.jpeg', '布拉格', '<p><img src=\"http://localhost:3002/images/details/d3e81de0-dbf0-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width:100%;\"></p><p><img src=\"http://localhost:3002/images/details/dae6bc50-dbf0-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><br></p><p><img src=\"http://localhost:3002/images/details/ea52f280-dbf0-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width:100%;\"><br></p>', 0, '2020-08-12 00:37:38', NULL);
INSERT INTO `goods` VALUES (32, 2, 30, NULL, '方领连衣裙2020夏新款职场ol气质系带收腰a字裙女', '', 287.00, 420.00, 120.00, 7, 1000, 14, 'http://localhost:3002/images/goods/3021c6f0-dbf2-11ea-8858-c992a1c4bc0e_720.jpeg', 'http://localhost:3002/images/goods/3021c6f0-dbf2-11ea-8858-c992a1c4bc0e_360.jpeg', 'http://localhost:3002/images/goods/369d2ba0-dbf2-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3002/images/goods/3c3dc0b0-dbf2-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3002/images/goods/4070e310-dbf2-11ea-8858-c992a1c4bc0e_720.jpeg', '粉领', '<p><img src=\"http://localhost:3002/images/details/46cd2700-dbf2-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width:100%;\"><img src=\"http://localhost:3002/images/details/4c2f7a90-dbf2-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/532c4440-dbf2-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><br></p>', 0, '2020-08-12 00:47:52', NULL);
INSERT INTO `goods` VALUES (33, 2, 30, NULL, '夏季气质性感v领连衣裙纯色泡泡袖连衣裙中长款收腰显瘦连衣裙', '', 689.00, 1200.00, 100.00, 6, 1000, 15, 'http://localhost:3002/images/goods/f8d07b90-dbf3-11ea-8858-c992a1c4bc0e_720.jpeg', 'http://localhost:3002/images/goods/f8d07b90-dbf3-11ea-8858-c992a1c4bc0e_360.jpeg', 'http://localhost:3002/images/goods/02430030-dbf4-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3002/images/goods/09cffbf0-dbf4-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3002/images/goods/10c6f940-dbf4-11ea-8858-c992a1c4bc0e_720.jpeg', 'UC', '<p><img src=\"http://localhost:3002/images/details/16dd81a0-dbf4-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width:100%;\"><img src=\"http://localhost:3002/images/details/20eb34d0-dbf4-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><br></p>', 0, '2020-08-12 01:00:37', NULL);
INSERT INTO `goods` VALUES (34, 2, 30, NULL, '复古温柔赫本风优雅方领丝绒连衣裙', '', 199.00, 289.00, 60.00, 7, 1000, 16, 'http://localhost:3002/images/goods/6afe5f20-dbf4-11ea-8858-c992a1c4bc0e_720.jpeg', 'http://localhost:3002/images/goods/6afe5f20-dbf4-11ea-8858-c992a1c4bc0e_360.jpeg', 'http://localhost:3002/images/goods/712cdc50-dbf4-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3002/images/goods/77662ef0-dbf4-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3002/images/goods/7d0d0590-dbf4-11ea-8858-c992a1c4bc0e_720.jpeg', 'WEMEN', '<p><img src=\"http://localhost:3002/images/details/83dad000-dbf4-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width:100%;\"><img src=\"http://localhost:3002/images/details/8a9cdaa0-dbf4-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/90830430-dbf4-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><br></p>', 0, '2020-08-12 01:03:45', NULL);
INSERT INTO `goods` VALUES (35, 2, 30, NULL, '阔色小紫薯复古方领连衣裙2020夏新款韩版复古盘扣格纹裙子女', '', 99.00, 152.00, 20.00, 7, 997, 17, 'http://localhost:3002/images/goods/f9d65d60-dbf4-11ea-8858-c992a1c4bc0e_720.jpeg', 'http://localhost:3002/images/goods/f9d65d60-dbf4-11ea-8858-c992a1c4bc0e_360.jpeg', 'http://localhost:3002/images/goods/fe583c00-dbf4-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3002/images/goods/0525b850-dbf5-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3002/images/goods/0a2fd9c0-dbf5-11ea-8858-c992a1c4bc0e_720.jpeg', 'CC', '<p><img src=\"http://localhost:3002/images/details/10ffee20-dbf5-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width:100%;\"><img src=\"http://localhost:3002/images/details/157b3d10-dbf5-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/190eeb20-dbf5-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><br></p>', 0, '2020-08-12 01:07:25', NULL);
INSERT INTO `goods` VALUES (36, 2, 30, NULL, '方领连衣裙2020夏新款韩版格纹裙子', '', 269.00, 350.00, 100.00, 8, 997, 18, 'http://localhost:3002/images/goods/c4867cc0-dbf5-11ea-8858-c992a1c4bc0e_720.jpeg', 'http://localhost:3002/images/goods/c4867cc0-dbf5-11ea-8858-c992a1c4bc0e_360.jpeg', 'http://localhost:3002/images/goods/c8047ff0-dbf5-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3002/images/goods/caf202f0-dbf5-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3002/images/goods/ce90d490-dbf5-11ea-8858-c992a1c4bc0e_720.jpeg', 'Lisa', '<p><img src=\"http://localhost:3002/images/details/d3bc1290-dbf5-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width:100%;\"><img src=\"http://localhost:3002/images/details/d7cd7c20-dbf5-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><br></p>', 0, '2020-08-12 01:13:01', NULL);
INSERT INTO `goods` VALUES (37, 2, 30, NULL, '梵希2020夏季新款复古方领泡泡袖开叉短袖连衣裙收腰仙女裙小白裙', '', 389.00, 659.00, 200.00, 6, 1000, 19, 'http://localhost:3002/images/goods/8025cc60-dbf6-11ea-8858-c992a1c4bc0e_720.jpeg', 'http://localhost:3002/images/goods/8025cc60-dbf6-11ea-8858-c992a1c4bc0e_360.jpeg', 'http://localhost:3002/images/goods/84e72500-dbf6-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3002/images/goods/8a653df0-dbf6-11ea-8858-c992a1c4bc0e_720.jpeg', '梵希', '<p><img src=\"http://localhost:3002/images/details/9fbec9a0-dbf6-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width:100%;\"><img src=\"http://localhost:3002/images/details/a446e9d0-dbf6-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/a889eab0-dbf6-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><br></p>', 0, '2020-08-12 01:18:26', NULL);
INSERT INTO `goods` VALUES (38, 4, 93, NULL, '蜜搭 新款复古收腰桔梗初恋裙 夏法式方领绿色泡泡袖中长款连衣裙 158', '', 98.00, 189.00, 35.00, 5, 973, 20, 'http://localhost:3002/images/goods/fa05bfe0-dbf6-11ea-8858-c992a1c4bc0e_720.jpeg', 'http://localhost:3002/images/goods/fa05bfe0-dbf6-11ea-8858-c992a1c4bc0e_360.jpeg', 'http://localhost:3002/images/goods/00176640-dbf7-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3002/images/goods/04569690-dbf7-11ea-8858-c992a1c4bc0e_720.jpeg', '蜜芽', '<p><img src=\"http://localhost:3002/images/details/0aabae90-dbf7-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width:100%;\"><img src=\"http://localhost:3002/images/details/0f139c90-dbf7-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3002/images/details/13071de0-dbf7-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><br></p>', 20, '2020-08-12 01:21:44', '2021-05-12 22:50:05');
COMMIT;

-- ----------------------------
-- Table structure for icon
-- ----------------------------
DROP TABLE IF EXISTS `icon`;
CREATE TABLE `icon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '图标名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=281 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of icon
-- ----------------------------
BEGIN;
INSERT INTO `icon` VALUES (1, 'platform-eleme');
INSERT INTO `icon` VALUES (2, 'eleme');
INSERT INTO `icon` VALUES (3, 'delete-solid');
INSERT INTO `icon` VALUES (4, 'delete');
INSERT INTO `icon` VALUES (5, 's-tools');
INSERT INTO `icon` VALUES (6, 'setting');
INSERT INTO `icon` VALUES (7, 'user-solid');
INSERT INTO `icon` VALUES (8, 'user');
INSERT INTO `icon` VALUES (9, 'phone');
INSERT INTO `icon` VALUES (10, 'phone-outline');
INSERT INTO `icon` VALUES (11, 'more');
INSERT INTO `icon` VALUES (12, 'more-outline');
INSERT INTO `icon` VALUES (13, 'star-on');
INSERT INTO `icon` VALUES (14, 'star-off');
INSERT INTO `icon` VALUES (15, 's-goods');
INSERT INTO `icon` VALUES (16, 'goods');
INSERT INTO `icon` VALUES (17, 'warning');
INSERT INTO `icon` VALUES (18, 'warning-outline');
INSERT INTO `icon` VALUES (19, 'question');
INSERT INTO `icon` VALUES (20, 'info');
INSERT INTO `icon` VALUES (21, 'remove');
INSERT INTO `icon` VALUES (22, 'circle-plus');
INSERT INTO `icon` VALUES (23, 'success');
INSERT INTO `icon` VALUES (24, 'error');
INSERT INTO `icon` VALUES (25, 'zoom-in');
INSERT INTO `icon` VALUES (26, 'zoom-out');
INSERT INTO `icon` VALUES (27, 'remove-outline');
INSERT INTO `icon` VALUES (28, 'circle-plus-outline');
INSERT INTO `icon` VALUES (29, 'circle-check');
INSERT INTO `icon` VALUES (30, 'circle-close');
INSERT INTO `icon` VALUES (31, 's-help');
INSERT INTO `icon` VALUES (32, 'help');
INSERT INTO `icon` VALUES (33, 'minus');
INSERT INTO `icon` VALUES (34, 'plus');
INSERT INTO `icon` VALUES (35, 'check');
INSERT INTO `icon` VALUES (36, 'close');
INSERT INTO `icon` VALUES (37, 'picture');
INSERT INTO `icon` VALUES (38, 'picture-outline');
INSERT INTO `icon` VALUES (39, 'picture-outline-round');
INSERT INTO `icon` VALUES (40, 'upload');
INSERT INTO `icon` VALUES (41, 'upload2');
INSERT INTO `icon` VALUES (42, 'download');
INSERT INTO `icon` VALUES (43, 'camera-solid');
INSERT INTO `icon` VALUES (44, 'camera');
INSERT INTO `icon` VALUES (45, 'video-camera-solid');
INSERT INTO `icon` VALUES (46, 'video-camera');
INSERT INTO `icon` VALUES (47, 'message-solid');
INSERT INTO `icon` VALUES (48, 'bell');
INSERT INTO `icon` VALUES (49, 's-cooperation');
INSERT INTO `icon` VALUES (50, 's-order');
INSERT INTO `icon` VALUES (51, 's-platform');
INSERT INTO `icon` VALUES (52, 's-fold');
INSERT INTO `icon` VALUES (53, 's-unfold');
INSERT INTO `icon` VALUES (54, 's-operation');
INSERT INTO `icon` VALUES (55, 's-promotion');
INSERT INTO `icon` VALUES (56, 's-home');
INSERT INTO `icon` VALUES (57, 's-release');
INSERT INTO `icon` VALUES (58, 's-ticket');
INSERT INTO `icon` VALUES (59, 's-management');
INSERT INTO `icon` VALUES (60, 's-open');
INSERT INTO `icon` VALUES (61, 's-shop');
INSERT INTO `icon` VALUES (62, 's-marketing');
INSERT INTO `icon` VALUES (63, 's-flag');
INSERT INTO `icon` VALUES (64, 's-comment');
INSERT INTO `icon` VALUES (65, 's-finance');
INSERT INTO `icon` VALUES (66, 's-claim');
INSERT INTO `icon` VALUES (67, 's-custom');
INSERT INTO `icon` VALUES (68, 's-opportunity');
INSERT INTO `icon` VALUES (69, 's-data');
INSERT INTO `icon` VALUES (70, 's-check');
INSERT INTO `icon` VALUES (71, 's-grid');
INSERT INTO `icon` VALUES (72, 'menu');
INSERT INTO `icon` VALUES (73, 'share');
INSERT INTO `icon` VALUES (74, 'd-caret');
INSERT INTO `icon` VALUES (75, 'caret-left');
INSERT INTO `icon` VALUES (76, 'caret-right');
INSERT INTO `icon` VALUES (77, 'caret-bottom');
INSERT INTO `icon` VALUES (78, 'caret-top');
INSERT INTO `icon` VALUES (79, 'bottom-left');
INSERT INTO `icon` VALUES (80, 'bottom-right');
INSERT INTO `icon` VALUES (81, 'back');
INSERT INTO `icon` VALUES (82, 'right');
INSERT INTO `icon` VALUES (83, 'bottom');
INSERT INTO `icon` VALUES (84, 'top');
INSERT INTO `icon` VALUES (85, 'top-left');
INSERT INTO `icon` VALUES (86, 'top-right');
INSERT INTO `icon` VALUES (87, 'arrow-left');
INSERT INTO `icon` VALUES (88, 'arrow-right');
INSERT INTO `icon` VALUES (89, 'arrow-down');
INSERT INTO `icon` VALUES (90, 'arrow-up');
INSERT INTO `icon` VALUES (91, 'd-arrow-left');
INSERT INTO `icon` VALUES (92, 'd-arrow-right');
INSERT INTO `icon` VALUES (93, 'video-pause');
INSERT INTO `icon` VALUES (94, 'video-play');
INSERT INTO `icon` VALUES (95, 'refresh');
INSERT INTO `icon` VALUES (96, 'refresh-right');
INSERT INTO `icon` VALUES (97, 'refresh-left');
INSERT INTO `icon` VALUES (98, 'finished');
INSERT INTO `icon` VALUES (99, 'sort');
INSERT INTO `icon` VALUES (100, 'sort-up');
INSERT INTO `icon` VALUES (101, 'sort-down');
INSERT INTO `icon` VALUES (102, 'rank');
INSERT INTO `icon` VALUES (103, 'loading');
INSERT INTO `icon` VALUES (104, 'view');
INSERT INTO `icon` VALUES (105, 'c-scale-to-original');
INSERT INTO `icon` VALUES (106, 'date');
INSERT INTO `icon` VALUES (107, 'edit');
INSERT INTO `icon` VALUES (108, 'edit-outline');
INSERT INTO `icon` VALUES (109, 'folder');
INSERT INTO `icon` VALUES (110, 'folder-opened');
INSERT INTO `icon` VALUES (111, 'folder-add');
INSERT INTO `icon` VALUES (112, 'folder-remove');
INSERT INTO `icon` VALUES (113, 'folder-delete');
INSERT INTO `icon` VALUES (114, 'folder-checked');
INSERT INTO `icon` VALUES (115, 'tickets');
INSERT INTO `icon` VALUES (116, 'document-remove');
INSERT INTO `icon` VALUES (117, 'document-delete');
INSERT INTO `icon` VALUES (118, 'document-copy');
INSERT INTO `icon` VALUES (119, 'document-checked');
INSERT INTO `icon` VALUES (120, 'document');
INSERT INTO `icon` VALUES (121, 'document-add');
INSERT INTO `icon` VALUES (122, 'printer');
INSERT INTO `icon` VALUES (123, 'paperclip');
INSERT INTO `icon` VALUES (124, 'takeaway-box');
INSERT INTO `icon` VALUES (125, 'search');
INSERT INTO `icon` VALUES (126, 'monitor');
INSERT INTO `icon` VALUES (127, 'attract');
INSERT INTO `icon` VALUES (128, 'mobile');
INSERT INTO `icon` VALUES (129, 'scissors');
INSERT INTO `icon` VALUES (130, 'umbrella');
INSERT INTO `icon` VALUES (131, 'headset');
INSERT INTO `icon` VALUES (132, 'brush');
INSERT INTO `icon` VALUES (133, 'mouse');
INSERT INTO `icon` VALUES (134, 'coordinate');
INSERT INTO `icon` VALUES (135, 'magic-stick');
INSERT INTO `icon` VALUES (136, 'reading');
INSERT INTO `icon` VALUES (137, 'data-line');
INSERT INTO `icon` VALUES (138, 'data-board');
INSERT INTO `icon` VALUES (139, 'pie-chart');
INSERT INTO `icon` VALUES (140, 'data-analysis');
INSERT INTO `icon` VALUES (141, 'collection-tag');
INSERT INTO `icon` VALUES (142, 'film');
INSERT INTO `icon` VALUES (143, 'suitcase');
INSERT INTO `icon` VALUES (144, 'suitcase-1');
INSERT INTO `icon` VALUES (145, 'receiving');
INSERT INTO `icon` VALUES (146, 'collection');
INSERT INTO `icon` VALUES (147, 'files');
INSERT INTO `icon` VALUES (148, 'notebook-1');
INSERT INTO `icon` VALUES (149, 'notebook-2');
INSERT INTO `icon` VALUES (150, 'toilet-paper');
INSERT INTO `icon` VALUES (151, 'office-building');
INSERT INTO `icon` VALUES (152, 'school');
INSERT INTO `icon` VALUES (153, 'table-lamp');
INSERT INTO `icon` VALUES (154, 'house');
INSERT INTO `icon` VALUES (155, 'no-smoking');
INSERT INTO `icon` VALUES (156, 'smoking');
INSERT INTO `icon` VALUES (157, 'shopping-cart-full');
INSERT INTO `icon` VALUES (158, 'shopping-cart-1');
INSERT INTO `icon` VALUES (159, 'shopping-cart-2');
INSERT INTO `icon` VALUES (160, 'shopping-bag-1');
INSERT INTO `icon` VALUES (161, 'shopping-bag-2');
INSERT INTO `icon` VALUES (162, 'sold-out');
INSERT INTO `icon` VALUES (163, 'sell');
INSERT INTO `icon` VALUES (164, 'present');
INSERT INTO `icon` VALUES (165, 'box');
INSERT INTO `icon` VALUES (166, 'bank-card');
INSERT INTO `icon` VALUES (167, 'money');
INSERT INTO `icon` VALUES (168, 'coin');
INSERT INTO `icon` VALUES (169, 'wallet');
INSERT INTO `icon` VALUES (170, 'discount');
INSERT INTO `icon` VALUES (171, 'price-tag');
INSERT INTO `icon` VALUES (172, 'news');
INSERT INTO `icon` VALUES (173, 'guide');
INSERT INTO `icon` VALUES (174, 'male');
INSERT INTO `icon` VALUES (175, 'female');
INSERT INTO `icon` VALUES (176, 'thumb');
INSERT INTO `icon` VALUES (177, 'cpu');
INSERT INTO `icon` VALUES (178, 'link');
INSERT INTO `icon` VALUES (179, 'connection');
INSERT INTO `icon` VALUES (180, 'open');
INSERT INTO `icon` VALUES (181, 'turn-off');
INSERT INTO `icon` VALUES (182, 'set-up');
INSERT INTO `icon` VALUES (183, 'chat-round');
INSERT INTO `icon` VALUES (184, 'chat-line-round');
INSERT INTO `icon` VALUES (185, 'chat-square');
INSERT INTO `icon` VALUES (186, 'chat-dot-round');
INSERT INTO `icon` VALUES (187, 'chat-dot-square');
INSERT INTO `icon` VALUES (188, 'chat-line-square');
INSERT INTO `icon` VALUES (189, 'message');
INSERT INTO `icon` VALUES (190, 'postcard');
INSERT INTO `icon` VALUES (191, 'position');
INSERT INTO `icon` VALUES (192, 'turn-off-microphone');
INSERT INTO `icon` VALUES (193, 'microphone');
INSERT INTO `icon` VALUES (194, 'close-notification');
INSERT INTO `icon` VALUES (195, 'bangzhu');
INSERT INTO `icon` VALUES (196, 'time');
INSERT INTO `icon` VALUES (197, 'odometer');
INSERT INTO `icon` VALUES (198, 'crop');
INSERT INTO `icon` VALUES (199, 'aim');
INSERT INTO `icon` VALUES (200, 'switch-button');
INSERT INTO `icon` VALUES (201, 'full-screen');
INSERT INTO `icon` VALUES (202, 'copy-document');
INSERT INTO `icon` VALUES (203, 'mic');
INSERT INTO `icon` VALUES (204, 'stopwatch');
INSERT INTO `icon` VALUES (205, 'medal-1');
INSERT INTO `icon` VALUES (206, 'medal');
INSERT INTO `icon` VALUES (207, 'trophy');
INSERT INTO `icon` VALUES (208, 'trophy-1');
INSERT INTO `icon` VALUES (209, 'first-aid-kit');
INSERT INTO `icon` VALUES (210, 'discover');
INSERT INTO `icon` VALUES (211, 'place');
INSERT INTO `icon` VALUES (212, 'location');
INSERT INTO `icon` VALUES (213, 'location-outline');
INSERT INTO `icon` VALUES (214, 'location-information');
INSERT INTO `icon` VALUES (215, 'add-location');
INSERT INTO `icon` VALUES (216, 'delete-location');
INSERT INTO `icon` VALUES (217, 'map-location');
INSERT INTO `icon` VALUES (218, 'alarm-clock');
INSERT INTO `icon` VALUES (219, 'timer');
INSERT INTO `icon` VALUES (220, 'watch-1');
INSERT INTO `icon` VALUES (221, 'watch');
INSERT INTO `icon` VALUES (222, 'lock');
INSERT INTO `icon` VALUES (223, 'unlock');
INSERT INTO `icon` VALUES (224, 'key');
INSERT INTO `icon` VALUES (225, 'service');
INSERT INTO `icon` VALUES (226, 'mobile-phone');
INSERT INTO `icon` VALUES (227, 'bicycle');
INSERT INTO `icon` VALUES (228, 'truck');
INSERT INTO `icon` VALUES (229, 'ship');
INSERT INTO `icon` VALUES (230, 'basketball');
INSERT INTO `icon` VALUES (231, 'football');
INSERT INTO `icon` VALUES (232, 'soccer');
INSERT INTO `icon` VALUES (233, 'baseball');
INSERT INTO `icon` VALUES (234, 'wind-power');
INSERT INTO `icon` VALUES (235, 'light-rain');
INSERT INTO `icon` VALUES (236, 'lightning');
INSERT INTO `icon` VALUES (237, 'heavy-rain');
INSERT INTO `icon` VALUES (238, 'sunrise');
INSERT INTO `icon` VALUES (239, 'sunrise-1');
INSERT INTO `icon` VALUES (240, 'sunset');
INSERT INTO `icon` VALUES (241, 'sunny');
INSERT INTO `icon` VALUES (242, 'cloudy');
INSERT INTO `icon` VALUES (243, 'partly-cloudy');
INSERT INTO `icon` VALUES (244, 'cloudy-and-sunny');
INSERT INTO `icon` VALUES (245, 'moon');
INSERT INTO `icon` VALUES (246, 'moon-night');
INSERT INTO `icon` VALUES (247, 'dish');
INSERT INTO `icon` VALUES (248, 'dish-1');
INSERT INTO `icon` VALUES (249, 'food');
INSERT INTO `icon` VALUES (250, 'chicken');
INSERT INTO `icon` VALUES (251, 'fork-spoon');
INSERT INTO `icon` VALUES (252, 'knife-fork');
INSERT INTO `icon` VALUES (253, 'burger');
INSERT INTO `icon` VALUES (254, 'tableware');
INSERT INTO `icon` VALUES (255, 'sugar');
INSERT INTO `icon` VALUES (256, 'dessert');
INSERT INTO `icon` VALUES (257, 'ice-cream');
INSERT INTO `icon` VALUES (258, 'hot-water');
INSERT INTO `icon` VALUES (259, 'water-cup');
INSERT INTO `icon` VALUES (260, 'coffee-cup');
INSERT INTO `icon` VALUES (261, 'cold-drink');
INSERT INTO `icon` VALUES (262, 'goblet');
INSERT INTO `icon` VALUES (263, 'goblet-full');
INSERT INTO `icon` VALUES (264, 'goblet-square');
INSERT INTO `icon` VALUES (265, 'goblet-square-full');
INSERT INTO `icon` VALUES (266, 'refrigerator');
INSERT INTO `icon` VALUES (267, 'grape');
INSERT INTO `icon` VALUES (268, 'watermelon');
INSERT INTO `icon` VALUES (269, 'cherry');
INSERT INTO `icon` VALUES (270, 'apple');
INSERT INTO `icon` VALUES (271, 'pear');
INSERT INTO `icon` VALUES (272, 'orange');
INSERT INTO `icon` VALUES (273, 'coffee');
INSERT INTO `icon` VALUES (274, 'ice-tea');
INSERT INTO `icon` VALUES (275, 'ice-drink');
INSERT INTO `icon` VALUES (276, 'milk-tea');
INSERT INTO `icon` VALUES (277, 'potato-strips');
INSERT INTO `icon` VALUES (278, 'lollipop');
INSERT INTO `icon` VALUES (279, 'ice-cream-square');
INSERT INTO `icon` VALUES (280, 'ice-cream-round');
COMMIT;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `name` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `pId` int(11) DEFAULT NULL COMMENT '父级id',
  `path` varchar(255) DEFAULT NULL COMMENT '链接url',
  `menu_order` varchar(255) DEFAULT NULL COMMENT '显示顺序',
  `icon_id` varchar(255) DEFAULT NULL COMMENT '图标id',
  `component` varchar(255) DEFAULT NULL COMMENT '组件名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of menu
-- ----------------------------
BEGIN;
INSERT INTO `menu` VALUES (1, '全部菜单', 0, NULL, '0', NULL, NULL);
INSERT INTO `menu` VALUES (2, '商品管理', 1, '', '2000', '16', NULL);
INSERT INTO `menu` VALUES (3, '用户管理', 1, '', '5000', '8', NULL);
INSERT INTO `menu` VALUES (4, '订单管理', 1, '', '3000', '147', NULL);
INSERT INTO `menu` VALUES (5, '账户设置', 1, '', '4000', '6', NULL);
INSERT INTO `menu` VALUES (7, '商品分类', 2, '/goods/category/', '2001', '', NULL);
INSERT INTO `menu` VALUES (8, '发布商品', 2, '/goods/release', '2002', '', NULL);
INSERT INTO `menu` VALUES (9, '商品列表', 2, '/goods/list', '2003', '', NULL);
INSERT INTO `menu` VALUES (10, '用户列表', 3, '/user/list', '5001', NULL, NULL);
INSERT INTO `menu` VALUES (11, '订单列表', 4, '/order/list', '3001', '', NULL);
INSERT INTO `menu` VALUES (12, '账户信息', 5, '/user/info', '4001', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for order_address
-- ----------------------------
DROP TABLE IF EXISTS `order_address`;
CREATE TABLE `order_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `tel` varchar(255) NOT NULL COMMENT '手机号',
  `province_id` varchar(255) NOT NULL COMMENT '省',
  `city_id` varchar(255) NOT NULL COMMENT '市',
  `county_id` varchar(255) NOT NULL COMMENT '区',
  `town_id` varchar(255) NOT NULL COMMENT '街道（镇）',
  `street` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `code` varchar(255) DEFAULT NULL COMMENT '邮编',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='收货地址';

-- ----------------------------
-- Records of order_address
-- ----------------------------
BEGIN;
INSERT INTO `order_address` VALUES (1, 1, '啦啦啦', '15863008280', '370000000000', '370200000000', '370213000000', '370213010000', '滨海大道', '2006601');
INSERT INTO `order_address` VALUES (10, 11, '啦啦啦', '15863008280', '370000000000', '370200000000', '370213000000', '370213010000', '滨海大道', '2006601');
INSERT INTO `order_address` VALUES (9, 10, '啦啦啦', '15863008280', '370000000000', '370200000000', '370213000000', '370213010000', '滨海大道', '2006601');
COMMIT;

-- ----------------------------
-- Table structure for order_goods
-- ----------------------------
DROP TABLE IF EXISTS `order_goods`;
CREATE TABLE `order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `goods_num` int(11) DEFAULT NULL COMMENT '商品数量',
  `goods_price` double(20,2) DEFAULT NULL COMMENT '商品价格',
  `status` tinyint(4) DEFAULT '1' COMMENT '0-禁用，1-正常，-1-删除',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='订单-商品表';

-- ----------------------------
-- Records of order_goods
-- ----------------------------
BEGIN;
INSERT INTO `order_goods` VALUES (2, 10, 38, 6, 98.00, 1, '2021-05-12 23:49:38');
INSERT INTO `order_goods` VALUES (3, 11, 35, 3, 99.00, 1, '2021-05-12 23:50:55');
COMMIT;

-- ----------------------------
-- Table structure for order_status
-- ----------------------------
DROP TABLE IF EXISTS `order_status`;
CREATE TABLE `order_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` tinyint(4) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单状态-字典表';

-- ----------------------------
-- Records of order_status
-- ----------------------------
BEGIN;
INSERT INTO `order_status` VALUES (1, -1, 'CREAT_FAILED', '创建订单失败');
INSERT INTO `order_status` VALUES (2, 0, 'WAIT_BUYER_PAY', '等待买家付款');
INSERT INTO `order_status` VALUES (3, 1, 'PAYMENT_CONFIRMING', '付款确认中');
INSERT INTO `order_status` VALUES (4, 2, 'BUYER_PAYMENT_FAILED', '买家付款失败');
INSERT INTO `order_status` VALUES (5, 3, 'BUYER_PAYMENT_SUCCESS', '买家付款成功');
INSERT INTO `order_status` VALUES (6, 4, 'SELLER_DELIVERED', '卖家已发货');
INSERT INTO `order_status` VALUES (7, 5, 'BUYER_RECEIVED/TO BE COMMENTED', '买家已收货/待评价');
INSERT INTO `order_status` VALUES (9, 7, 'GOODS_RETURNING', '退货中');
INSERT INTO `order_status` VALUES (10, 8, 'GOODS_RETURNED_SUCCESS', '退货成功');
INSERT INTO `order_status` VALUES (11, 9, 'ORDER_CLOSED', '订单关闭');
INSERT INTO `order_status` VALUES (8, 6, 'ORDER_SUCCESS', '交易成功');
COMMIT;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `payment` double(20,2) DEFAULT NULL COMMENT '支付金额',
  `payment_type` tinyint(4) DEFAULT NULL COMMENT '1-在线支付，1-货到付款',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `ship_fee` double(20,2) DEFAULT NULL COMMENT '邮费',
  `ship_time` datetime DEFAULT NULL COMMENT '发货时间',
  `ship_name` varchar(255) DEFAULT NULL COMMENT '快递公司',
  `ship_number` varchar(100) DEFAULT NULL COMMENT '快递单号',
  `received_time` datetime DEFAULT NULL COMMENT '收货时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `finish_time` datetime DEFAULT NULL COMMENT '交易完成时间',
  `close_time` datetime DEFAULT NULL COMMENT '交易关闭时间',
  `order_state` int(11) DEFAULT '0' COMMENT '状态字典',
  `status` tinyint(4) DEFAULT '1' COMMENT '1-正常，0-禁用，-1-删除',
  `refund_state` tinyint(4) DEFAULT NULL COMMENT '退款状态',
  `comment_state` tinyint(4) DEFAULT NULL COMMENT '评论状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单表';

-- ----------------------------
-- Records of orders
-- ----------------------------
BEGIN;
INSERT INTO `orders` VALUES (11, 1, 9999.99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-12 23:50:55', NULL, NULL, NULL, 0, 1, NULL, NULL);
INSERT INTO `orders` VALUES (10, 1, 9999.99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-12 23:49:38', NULL, NULL, NULL, 0, 1, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(255) DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES (1, '超级管理员');
INSERT INTO `role` VALUES (2, '管理员');
INSERT INTO `role` VALUES (3, '运营人员');
INSERT INTO `role` VALUES (4, '设计人员');
INSERT INTO `role` VALUES (5, '财务人员');
INSERT INTO `role` VALUES (6, '仓库人员');
COMMIT;

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `menu_id` int(11) DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
BEGIN;
INSERT INTO `role_menu` VALUES (50, 1, 7);
INSERT INTO `role_menu` VALUES (51, 1, 2);
INSERT INTO `role_menu` VALUES (55, 1, 9);
INSERT INTO `role_menu` VALUES (54, 1, 8);
INSERT INTO `role_menu` VALUES (5, 1, 3);
INSERT INTO `role_menu` VALUES (6, 1, 10);
INSERT INTO `role_menu` VALUES (56, 1, 4);
INSERT INTO `role_menu` VALUES (57, 1, 11);
INSERT INTO `role_menu` VALUES (49, 1, 12);
INSERT INTO `role_menu` VALUES (48, 1, 5);
INSERT INTO `role_menu` VALUES (43, 1, 13);
INSERT INTO `role_menu` VALUES (45, 1, 14);
INSERT INTO `role_menu` VALUES (44, 1, 6);
INSERT INTO `role_menu` VALUES (17, 2, 2);
INSERT INTO `role_menu` VALUES (18, 2, 7);
INSERT INTO `role_menu` VALUES (19, 2, 8);
INSERT INTO `role_menu` VALUES (20, 2, 9);
INSERT INTO `role_menu` VALUES (21, 2, 3);
INSERT INTO `role_menu` VALUES (22, 2, 10);
INSERT INTO `role_menu` VALUES (23, 2, 4);
INSERT INTO `role_menu` VALUES (24, 2, 11);
INSERT INTO `role_menu` VALUES (25, 2, 5);
INSERT INTO `role_menu` VALUES (26, 2, 12);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `sex` varchar(255) DEFAULT '男' COMMENT '性别',
  `avatar` varchar(255) DEFAULT './images/avatar/default.jpg' COMMENT '头像',
  `tel` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '登录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (2, 'user2', '123456', '黄晓明', '女', 'http://localhost:3002/images/avatar/default.jpg', '15863008280', '2019-05-11 18:21:37', '2020-10-14 14:44:43');
INSERT INTO `user` VALUES (1, 'user1', '123456', 'admin', '男', 'http://localhost:3002/images/avatar/default.jpg', '13475829262', '2019-05-14 20:39:31', '2020-10-14 14:44:39');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
