/*
Navicat MySQL Data Transfer

Source Server         : 本地centos7-mysql8
Source Server Version : 80027
Source Host           : 192.168.189.128:3306
Source Database       : yrh_chart

Target Server Type    : MYSQL
Target Server Version : 80027
File Encoding         : 65001

Date: 2022-05-26 23:06:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for AdminUser
-- ----------------------------
DROP TABLE IF EXISTS `AdminUser`;
CREATE TABLE `AdminUser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '业务id',
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `lastLoginTime` timestamp(6) NULL DEFAULT NULL COMMENT '最后登录时间',
  `roleId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of AdminUser
-- ----------------------------
INSERT INTO `AdminUser` VALUES ('1', 'fac808d6-aeba-4f92-a0bb-0c5acdf587d1', 'admin', 'admin', '2022-05-26 21:56:03.000000', '4616c635-65bd-43db-aa28-9cd2a47adf38');
INSERT INTO `AdminUser` VALUES ('3', 'ee6bf371-3575-4ddb-be7f-c48f719adb7e', 'jumang', 'jumang', null, '4616c635-65bd-43db-aa28-9cd2a47adf38');
INSERT INTO `AdminUser` VALUES ('4', 'fac4f88a-77e9-4cc3-8155-2d3a975e1ff7', 'zhurong', 'zhurong', null, 'f8d1fca6-5fda-418a-9f0e-81b2a188d85c');
INSERT INTO `AdminUser` VALUES ('5', '3015251f-f969-4b98-91e2-c1cbb86ca7b8', 'yuhuang', 'yuhuang', null, 'fcfef3ce-6851-4ae8-8fa7-5fd8f6f10450');
INSERT INTO `AdminUser` VALUES ('7', 'c9afac38-2fcb-4184-9c8f-0fd15fcb16a0', 'rushou', 'rushou', null, '4616c635-65bd-43db-aa28-9cd2a47adf38');
INSERT INTO `AdminUser` VALUES ('8', 'd009d0b8-be92-48b8-96e3-d17f5111c4c1', 'ouqiang', 'ouqiang', null, '4616c635-65bd-43db-aa28-9cd2a47adf38');
INSERT INTO `AdminUser` VALUES ('9', 'c4271c4c-781d-4ac1-9eee-54de8dcf1245', 'gouchen', 'gouchen', null, '4616c635-65bd-43db-aa28-9cd2a47adf38');
INSERT INTO `AdminUser` VALUES ('10', 'e1f1322b-7c1f-40ed-b110-db66d9e47851', 'ziwei', 'ziwei', null, '4616c635-65bd-43db-aa28-9cd2a47adf38');
INSERT INTO `AdminUser` VALUES ('11', '0fe3bafd-202c-4ade-af08-6778330cbe79', 'changsheng', 'changsheng', null, '4616c635-65bd-43db-aa28-9cd2a47adf38');
INSERT INTO `AdminUser` VALUES ('14', 'c6b93af5-6d0c-4dd3-8085-98bc10ddbc42', 'houtu', 'houtu', null, '4616c635-65bd-43db-aa28-9cd2a47adf38');

-- ----------------------------
-- Table structure for AdminUserInfo
-- ----------------------------
DROP TABLE IF EXISTS `AdminUserInfo`;
CREATE TABLE `AdminUserInfo` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户id 主键',
  `uuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '业务id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '昵称',
  `sex` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '性别',
  `phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系方式',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '住址',
  `introduction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '个人简介',
  `registerTime` timestamp(6) NULL DEFAULT NULL COMMENT '注册时间',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户头像',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='用户信息表';

-- ----------------------------
-- Records of AdminUserInfo
-- ----------------------------
INSERT INTO `AdminUserInfo` VALUES ('1', 'fac808d6-aeba-4f92-a0bb-0c5acdf587d1', 'system manager', '男', '15895555555', '厦门', '系统管理员', '2022-01-10 16:54:42.000000', '');
INSERT INTO `AdminUserInfo` VALUES ('3', 'ee6bf371-3575-4ddb-be7f-c48f719adb7e', '木神句芒', '男', '', '', '东方句芒，鸟身人面，乘两龙', '2022-01-28 17:17:44.000000', '');
INSERT INTO `AdminUserInfo` VALUES ('4', 'fac4f88a-77e9-4cc3-8155-2d3a975e1ff7', '火神祝融', '男', '', '', '南方祝融，兽身人面，乘两龙', '2022-01-28 17:34:08.000000', '');
INSERT INTO `AdminUserInfo` VALUES ('5', '3015251f-f969-4b98-91e2-c1cbb86ca7b8', '玉皇大帝', '男', '', '', '', '2022-01-28 17:35:58.000000', '');
INSERT INTO `AdminUserInfo` VALUES ('7', 'c9afac38-2fcb-4184-9c8f-0fd15fcb16a0', '金神蓐收', '男', '', '', '西方蓐收，左耳有蛇，乘两龙', '2022-01-28 17:37:43.000000', '');
INSERT INTO `AdminUserInfo` VALUES ('8', 'd009d0b8-be92-48b8-96e3-d17f5111c4c1', '海/风/瘟神禺强', '男', '', '', '北方禺强，人面鸟身，珥两青蛇，践两青蛇', '2022-01-28 17:37:52.000000', '');
INSERT INTO `AdminUserInfo` VALUES ('9', 'c4271c4c-781d-4ac1-9eee-54de8dcf1245', '勾陈上宫天皇大帝', '男', '', '', '', '2022-01-28 17:37:57.000000', '');
INSERT INTO `AdminUserInfo` VALUES ('10', 'e1f1322b-7c1f-40ed-b110-db66d9e47851', '中天北极紫薇大帝', '男', '', '', '', '2022-01-28 17:38:00.000000', '');
INSERT INTO `AdminUserInfo` VALUES ('11', '0fe3bafd-202c-4ade-af08-6778330cbe79', '南极长生大地', '男', '', '', '', '2022-01-28 17:38:03.000000', '');
INSERT INTO `AdminUserInfo` VALUES ('14', 'c6b93af5-6d0c-4dd3-8085-98bc10ddbc42', '承天效法后土皇地鍦', '女', '', '', '', '2022-01-28 17:38:26.000000', '');

-- ----------------------------
-- Table structure for AdminUserRole
-- ----------------------------
DROP TABLE IF EXISTS `AdminUserRole`;
CREATE TABLE `AdminUserRole` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色id 主键',
  `uuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '业务id',
  `roleName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色名字',
  `routerId` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '路由id',
  `roleMark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='用户角色表';

-- ----------------------------
-- Records of AdminUserRole
-- ----------------------------
INSERT INTO `AdminUserRole` VALUES ('1', '4616c635-65bd-43db-aa28-9cd2a47adf38', '超级管理员', 'c0fc057e-cf35-482c-a644-41e2b452932c,1d38be3d-22e5-4f37-ad64-8ec494eaee12,7b2a27eb-d992-4ee8-8217-cd46b7eda06c,f97488e4-a352-47d1-b96b-1336077e127a,115c9429-f92f-4b42-b03c-3cbbb3bfd14a,0f1ac61c-0b82-47b1-82fa-d85b0bc283e7,133a4be4-4c7d-41c5-973b-78930d80058e', '超级管理员');
INSERT INTO `AdminUserRole` VALUES ('15', 'f8d1fca6-5fda-418a-9f0e-81b2a188d85c', '普通管理员', '', '普通管理员');
INSERT INTO `AdminUserRole` VALUES ('17', 'fcfef3ce-6851-4ae8-8fa7-5fd8f6f10450', '一品官员', '', '一品官员');
INSERT INTO `AdminUserRole` VALUES ('18', '0b8161a7-4c08-443d-896d-d464cdccea6d', '二品官员', '', '二品官员');
INSERT INTO `AdminUserRole` VALUES ('22', '1244f72c-b457-42c9-b804-ddb5a996a105', '三品官员', '', '三品官员');
INSERT INTO `AdminUserRole` VALUES ('28', 'c3169d88-2be8-4e69-96c5-d85da168070e', '四品官员', '', '四品官员');
INSERT INTO `AdminUserRole` VALUES ('29', 'cfcf6349-8963-474a-a4de-6b9d0f38c603', '五品官员', '', '五品官员');
INSERT INTO `AdminUserRole` VALUES ('30', '41a3b7ca-698b-41f9-85be-92985e15d8c2', '六品官员', '', '这是一个六品官员');
INSERT INTO `AdminUserRole` VALUES ('32', '6e144826-046e-44b3-87a1-55f2f68fc0a6', '七品官员', '', '七品官员');
INSERT INTO `AdminUserRole` VALUES ('33', 'ef0a0c2b-20db-478c-af18-80f71d9152e5', '八品官员', '', '八品官员');
INSERT INTO `AdminUserRole` VALUES ('34', '9c187af7-23d8-418c-8f2a-77a45d77d573', '九品官员', '', '这只是一个九品芝麻小官');

-- ----------------------------
-- Table structure for AdminUserRouter
-- ----------------------------
DROP TABLE IF EXISTS `AdminUserRouter`;
CREATE TABLE `AdminUserRouter` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '路由id 主键',
  `uuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '业务id',
  `routerName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '路由名字',
  `rootId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '根级id',
  `parentId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父级id',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '路由图标',
  `routerFnId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '功能id',
  `routerSrc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '路由路径',
  `pageSrc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '页面路径',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `parentId` (`parentId`) USING BTREE,
  KEY `parentId_2` (`parentId`,`uuid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='用户路由表';

-- ----------------------------
-- Records of AdminUserRouter
-- ----------------------------
INSERT INTO `AdminUserRouter` VALUES ('63', '0f806328-42d5-4537-8779-cb0fe8c55d37', '项目管理', '', '', '234', '', '', '');
INSERT INTO `AdminUserRouter` VALUES ('65', '382b38f3-4411-416b-b72b-d459fa36f4c2', '项目1', '0f806328-42d5-4537-8779-cb0fe8c55d37', '0f806328-42d5-4537-8779-cb0fe8c55d37', '上的上的广告', '', '', '');
INSERT INTO `AdminUserRouter` VALUES ('67', 'a078ca99-2bd6-4215-a8bd-5bf6d1523064', '项目2', '0f806328-42d5-4537-8779-cb0fe8c55d37', '0f806328-42d5-4537-8779-cb0fe8c55d37', '', '', '', '');
INSERT INTO `AdminUserRouter` VALUES ('68', 'c0fc057e-cf35-482c-a644-41e2b452932c', '开发1', '382b38f3-4411-416b-b72b-d459fa36f4c2', '382b38f3-4411-416b-b72b-d459fa36f4c2', '', '', '', '');
INSERT INTO `AdminUserRouter` VALUES ('69', '1d38be3d-22e5-4f37-ad64-8ec494eaee12', '开发2', '382b38f3-4411-416b-b72b-d459fa36f4c2', '382b38f3-4411-416b-b72b-d459fa36f4c2', '', '', '', '');
INSERT INTO `AdminUserRouter` VALUES ('70', '7b2a27eb-d992-4ee8-8217-cd46b7eda06c', '设计1', '382b38f3-4411-416b-b72b-d459fa36f4c2', '382b38f3-4411-416b-b72b-d459fa36f4c2', '', '', '', '');
INSERT INTO `AdminUserRouter` VALUES ('71', 'f97488e4-a352-47d1-b96b-1336077e127a', '项目2-开发组长', 'a078ca99-2bd6-4215-a8bd-5bf6d1523064', 'a078ca99-2bd6-4215-a8bd-5bf6d1523064', '', '', '', '');
INSERT INTO `AdminUserRouter` VALUES ('72', '23dd8411-ee0d-410d-91c4-0ddbddaf4266', '系统管理', '', '', 'el-icon-s-tools', '', '/system', 'Layout');
INSERT INTO `AdminUserRouter` VALUES ('75', '115c9429-f92f-4b42-b03c-3cbbb3bfd14a', '系统用户管理', '23dd8411-ee0d-410d-91c4-0ddbddaf4266', '23dd8411-ee0d-410d-91c4-0ddbddaf4266', 'el-icon-user-solid', '', 'userManager', './views/system/userManager/index');
INSERT INTO `AdminUserRouter` VALUES ('76', '0f1ac61c-0b82-47b1-82fa-d85b0bc283e7', '角色管理', '23dd8411-ee0d-410d-91c4-0ddbddaf4266', '23dd8411-ee0d-410d-91c4-0ddbddaf4266', 'el-icon-s-custom', '', 'roleManager', './views/system/roleManager/index');
INSERT INTO `AdminUserRouter` VALUES ('77', '133a4be4-4c7d-41c5-973b-78930d80058e', '路由管理', '23dd8411-ee0d-410d-91c4-0ddbddaf4266', '23dd8411-ee0d-410d-91c4-0ddbddaf4266', 'el-icon-s-promotion', '', 'routerManager', './views/system/routerManager/index');

-- ----------------------------
-- Table structure for AdminUserRouterFunction
-- ----------------------------
DROP TABLE IF EXISTS `AdminUserRouterFunction`;
CREATE TABLE `AdminUserRouterFunction` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '功能id 主键',
  `uuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '业务id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '功能名字',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='用户路由下功能表';

-- ----------------------------
-- Records of AdminUserRouterFunction
-- ----------------------------

-- ----------------------------
-- Table structure for ChatRecord
-- ----------------------------
DROP TABLE IF EXISTS `ChatRecord`;
CREATE TABLE `ChatRecord` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `messageContent` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '消息内容',
  `messageType` tinyint DEFAULT NULL COMMENT '消息类型1文字2图片3视频4语音5混合',
  `receiveStatus` tinyint DEFAULT NULL COMMENT '接收状态 1已读2未读',
  `sendid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '发送者id',
  `receiveid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '接收者id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ChatRecord
-- ----------------------------

-- ----------------------------
-- Table structure for Friend
-- ----------------------------
DROP TABLE IF EXISTS `Friend`;
CREATE TABLE `Friend` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户id',
  `friendid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '好友id',
  `friendNotes` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '好友备注',
  `belongid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '所属分组id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of Friend
-- ----------------------------

-- ----------------------------
-- Table structure for FriendGroups
-- ----------------------------
DROP TABLE IF EXISTS `FriendGroups`;
CREATE TABLE `FriendGroups` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户id',
  `groupName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '分组名字',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of FriendGroups
-- ----------------------------

-- ----------------------------
-- Table structure for GroupsMSGContent
-- ----------------------------
DROP TABLE IF EXISTS `GroupsMSGContent`;
CREATE TABLE `GroupsMSGContent` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '群消息id 主键',
  `sendid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '发送者id',
  `sendTime` timestamp(6) NULL DEFAULT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of GroupsMSGContent
-- ----------------------------

-- ----------------------------
-- Table structure for GroupsToUser
-- ----------------------------
DROP TABLE IF EXISTS `GroupsToUser`;
CREATE TABLE `GroupsToUser` (
  `userid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id 主键',
  `groupid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '群id',
  `groupUserName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '群内用户昵称',
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of GroupsToUser
-- ----------------------------

-- ----------------------------
-- Table structure for User
-- ----------------------------
DROP TABLE IF EXISTS `User`;
CREATE TABLE `User` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '账号',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `lastLoginTime` timestamp(6) NULL DEFAULT NULL COMMENT '最后登录时间',
  `loginFailCount` tinyint DEFAULT NULL COMMENT '登录失败次数',
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'token',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of User
-- ----------------------------
INSERT INTO `User` VALUES ('1', 'admin', 'admin', '2021-12-29 15:11:07.000000', '0', null);
INSERT INTO `User` VALUES ('20211229163128', 'test', '123', null, null, null);
INSERT INTO `User` VALUES ('9eEPx8-20211229163540', 'tes1t', '123', null, null, null);
INSERT INTO `User` VALUES ('jmBiyy-20211229165309', 'tesadasd1t', '123', '2022-01-04 16:52:30.000000', '0', '');

-- ----------------------------
-- Table structure for UserGroup
-- ----------------------------
DROP TABLE IF EXISTS `UserGroup`;
CREATE TABLE `UserGroup` (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '群id 主键',
  `createTime` timestamp(6) NULL DEFAULT NULL COMMENT '创建时间',
  `groupName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '群昵称',
  `groupNotice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '群公告',
  `groupIntroduce` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '群简介',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of UserGroup
-- ----------------------------

-- ----------------------------
-- Table structure for UserInfo
-- ----------------------------
DROP TABLE IF EXISTS `UserInfo`;
CREATE TABLE `UserInfo` (
  `userid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id 主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '昵称',
  `sex` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '性别',
  `phone` tinyint DEFAULT NULL COMMENT '联系方式',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '住址',
  `introduction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '个人简介',
  `status` tinyint DEFAULT NULL COMMENT '当前状态0离线1在线2隐身',
  `registerTime` timestamp(6) NULL DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of UserInfo
-- ----------------------------
INSERT INTO `UserInfo` VALUES ('jmBiyy-20211229165309', null, null, null, null, null, null, '2021-12-29 16:53:10.000000');
