/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : bank

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2017-04-11 08:48:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_customer`
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customername` varchar(30) DEFAULT NULL COMMENT '客户姓名',
  `sex` varchar(4) DEFAULT NULL COMMENT '性别',
  `certificatetype` varchar(20) DEFAULT NULL COMMENT '证件类型',
  `centificatenumber` varchar(50) DEFAULT NULL COMMENT '证件号码',
  `telephone` varchar(12) DEFAULT NULL COMMENT '手机号码',
  `wechatwhite` varchar(20) DEFAULT NULL COMMENT '微信白名单(openid)',
  `openchannel` varchar(30) DEFAULT NULL COMMENT '开户渠道',
  `qqwhile` varchar(30) DEFAULT NULL COMMENT 'QQ白名单(openid)',
  `customertype` varchar(20) DEFAULT NULL COMMENT '客群分类',
  `comeinchannel` varchar(20) DEFAULT NULL COMMENT '进线渠道',
  `callphone` varchar(15) DEFAULT NULL COMMENT '来电号码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES ('1', 'zhansan', '1', '8', '112222', '2222', '2222', '10', '222', '222', '11', '2222');
INSERT INTO `t_customer` VALUES ('2', 'lisi', '1', '7', '12222', '222', '2222', '9', '22', '222', '12', '222');
INSERT INTO `t_customer` VALUES ('3', '老王', '1', '8', '1222', '222', '22222', '9', '22', '222', '11', '222');
INSERT INTO `t_customer` VALUES ('4', '22222', '2', '8', '222', '222', '2222', '9', '22', '222', '11', '222');
INSERT INTO `t_customer` VALUES ('5', '小黄', '1', '8', '2323', '2323', '2323', '9', '2323', '2323', '11', '232');
INSERT INTO `t_customer` VALUES ('6', '小张', '1', '7', '111', '111', '111', '9', '111', '11', '11', '111');

-- ----------------------------
-- Table structure for `t_data`
-- ----------------------------
DROP TABLE IF EXISTS `t_data`;
CREATE TABLE `t_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `memo` varchar(50) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_data
-- ----------------------------
INSERT INTO `t_data` VALUES ('1', '证件类型', null, '0');
INSERT INTO `t_data` VALUES ('2', '开户渠道', null, '0');
INSERT INTO `t_data` VALUES ('3', '进线渠道', null, '0');
INSERT INTO `t_data` VALUES ('4', '处理时效', null, '0');
INSERT INTO `t_data` VALUES ('5', '紧急程度', null, '0');
INSERT INTO `t_data` VALUES ('6', '问题类型', null, '0');
INSERT INTO `t_data` VALUES ('7', '身份证', null, '1');
INSERT INTO `t_data` VALUES ('8', '警官证', null, '1');
INSERT INTO `t_data` VALUES ('9', '微信', null, '2');
INSERT INTO `t_data` VALUES ('10', '支付宝', null, '2');
INSERT INTO `t_data` VALUES ('11', '微信', null, '3');
INSERT INTO `t_data` VALUES ('12', '电话', null, '3');
INSERT INTO `t_data` VALUES ('13', '12', null, '4');
INSERT INTO `t_data` VALUES ('14', '72', null, '4');
INSERT INTO `t_data` VALUES ('15', '低', null, '5');
INSERT INTO `t_data` VALUES ('16', '中', null, '5');
INSERT INTO `t_data` VALUES ('17', '高', null, '5');
INSERT INTO `t_data` VALUES ('18', '咨询->借款->审核失败', null, '6');
INSERT INTO `t_data` VALUES ('19', '咨询->借款->查询借款流水', null, '6');
INSERT INTO `t_data` VALUES ('20', '咨询->借款->贷款利息', null, '6');
INSERT INTO `t_data` VALUES ('21', '建议->界面操作类', null, null);

-- ----------------------------
-- Table structure for `t_dept`
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `memo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dept
-- ----------------------------
INSERT INTO `t_dept` VALUES ('1', '运维组', null);
INSERT INTO `t_dept` VALUES ('2', '清算组', null);
INSERT INTO `t_dept` VALUES ('3', '管理组', null);

-- ----------------------------
-- Table structure for `t_handleworkhistory`
-- ----------------------------
DROP TABLE IF EXISTS `t_handleworkhistory`;
CREATE TABLE `t_handleworkhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workorderid` varchar(30) DEFAULT NULL COMMENT '工单编号',
  `handleperson` int(11) DEFAULT NULL COMMENT '处理人id',
  `handlepersonname` varchar(50) DEFAULT NULL COMMENT '处理人名字',
  `handlegroup` int(11) DEFAULT NULL COMMENT '处理组id',
  `handlegroupname` varchar(50) DEFAULT NULL COMMENT '处理组名字',
  `actionstr` varchar(100) DEFAULT NULL COMMENT '操作（如归档或新增）',
  `createdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '处理操作时间',
  `descs` varchar(100) DEFAULT NULL COMMENT '处理意见',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_handleworkhistory
-- ----------------------------
INSERT INTO `t_handleworkhistory` VALUES ('1', '201703171548081', '8', 'aaa', '1', '运维组', '转办', '2017-03-21 10:42:30', '转');
INSERT INTO `t_handleworkhistory` VALUES ('2', '201703171548081', '9', 'bbb', '2', '清算组', '归档', '2017-03-21 11:05:11', '处理完成');
INSERT INTO `t_handleworkhistory` VALUES ('3', '201703171548081', '9', 'bbb', '2', '清算组', '挂起', '2017-03-21 11:09:50', '挂');
INSERT INTO `t_handleworkhistory` VALUES ('4', '201703211120591', '8', 'aaa', '1', '运维组', '新增', '2017-03-21 11:21:43', '这里要加的');
INSERT INTO `t_handleworkhistory` VALUES ('5', '201703211120591', '8', 'aaa', '1', '运维组', '转办', '2017-03-21 11:22:50', '');
INSERT INTO `t_handleworkhistory` VALUES ('6', '201703211120591', '9', 'bbb', '2', '清算组', '挂起', '2017-03-21 11:24:26', '挂起');
INSERT INTO `t_handleworkhistory` VALUES ('7', '201703211120591', '9', 'bbb', '2', '清算组', '归档', '2017-03-21 11:26:43', '处理完成');
INSERT INTO `t_handleworkhistory` VALUES ('8', '201703171548081', '8', 'aaa', '1', '运维组', '退单', '2017-03-21 16:11:39', '退单');
INSERT INTO `t_handleworkhistory` VALUES ('9', '201703171548081', '8', 'aaa', '1', '运维组', '退单', '2017-03-21 16:14:25', '');
INSERT INTO `t_handleworkhistory` VALUES ('10', '201703211616211', '8', 'aaa', '1', '运维组', '新增', '2017-03-21 16:16:21', '这里要加的');
INSERT INTO `t_handleworkhistory` VALUES ('11', '201703211616211', '9', 'bbb', '2', '清算组', '退单', '2017-03-21 16:30:07', '退单');
INSERT INTO `t_handleworkhistory` VALUES ('12', '201703211616211', '8', 'aaa', '1', '运维组', '转办', '2017-03-21 16:31:21', '转办');
INSERT INTO `t_handleworkhistory` VALUES ('13', '201703211616211', '9', 'bbb', '2', '清算组', '挂起', '2017-03-21 16:31:56', '');
INSERT INTO `t_handleworkhistory` VALUES ('14', '201703211616211', '9', 'bbb', '2', '清算组', '归档', '2017-03-21 16:32:16', '');
INSERT INTO `t_handleworkhistory` VALUES ('15', '201703200913101', '8', 'aaa', '1', '运维组', '归档', '2017-03-21 17:26:14', '');

-- ----------------------------
-- Table structure for `t_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `MID` int(4) NOT NULL AUTO_INCREMENT,
  `MENUNAME` varchar(50) DEFAULT NULL,
  `PID` int(4) DEFAULT NULL,
  `ISDEL` int(1) DEFAULT NULL,
  `ORDERID` int(4) DEFAULT NULL,
  `SECURITYNAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('1', '系统管理', '0', null, null, null);
INSERT INTO `t_menu` VALUES ('2', '用户模块', '1', null, null, 'USER_QUERY');
INSERT INTO `t_menu` VALUES ('3', '用户查询', '2', null, null, 'USER_QUERY');
INSERT INTO `t_menu` VALUES ('4', '用户新增', '2', null, null, 'USER_CREATE');
INSERT INTO `t_menu` VALUES ('5', '用户修改', '2', null, null, 'USER_UPDATE');
INSERT INTO `t_menu` VALUES ('6', '用户删除', '2', null, null, 'USER_DELETE');
INSERT INTO `t_menu` VALUES ('7', '角色模块', '1', null, null, 'ROLE_QUERY');
INSERT INTO `t_menu` VALUES ('8', '角色列表', '7', null, null, 'ROLE_QUERY');

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `RID` int(4) NOT NULL AUTO_INCREMENT,
  `ROLENAME` varchar(20) NOT NULL,
  `DESCRIPTION` varchar(200) DEFAULT NULL,
  `ISDEL` int(1) DEFAULT '0',
  PRIMARY KEY (`RID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '超级管理员', null, '0');
INSERT INTO `t_role` VALUES ('2', '普通管理员', null, '0');
INSERT INTO `t_role` VALUES ('3', '用户管理人员2', '', '0');
INSERT INTO `t_role` VALUES ('5', '22', '222', '0');

-- ----------------------------
-- Table structure for `t_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu` (
  `RID` int(4) NOT NULL,
  `MID` int(4) NOT NULL,
  PRIMARY KEY (`RID`,`MID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES ('1', '2');
INSERT INTO `t_role_menu` VALUES ('1', '3');
INSERT INTO `t_role_menu` VALUES ('1', '4');
INSERT INTO `t_role_menu` VALUES ('1', '5');
INSERT INTO `t_role_menu` VALUES ('1', '6');
INSERT INTO `t_role_menu` VALUES ('1', '7');
INSERT INTO `t_role_menu` VALUES ('1', '8');
INSERT INTO `t_role_menu` VALUES ('3', '1');
INSERT INTO `t_role_menu` VALUES ('3', '2');
INSERT INTO `t_role_menu` VALUES ('3', '3');
INSERT INTO `t_role_menu` VALUES ('3', '4');
INSERT INTO `t_role_menu` VALUES ('3', '6');
INSERT INTO `t_role_menu` VALUES ('5', '1');
INSERT INTO `t_role_menu` VALUES ('5', '2');
INSERT INTO `t_role_menu` VALUES ('5', '3');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `USERID` int(4) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(20) DEFAULT NULL,
  `PASSWORD` varchar(100) DEFAULT NULL,
  `REALNAME` varchar(20) DEFAULT NULL,
  `DID` int(4) DEFAULT NULL,
  `JID` int(4) DEFAULT NULL,
  `OPENTIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SEX` varchar(4) DEFAULT NULL,
  `CITY` varchar(20) DEFAULT NULL,
  `PID` varchar(20) DEFAULT NULL,
  `TELEPHONE` varchar(20) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `MOBILE` varchar(20) DEFAULT NULL,
  `ADDRESS` varchar(200) DEFAULT NULL,
  `MARRIED` int(1) DEFAULT NULL,
  `salt` varchar(10) DEFAULT NULL COMMENT '盐(为了MD5加密)',
  PRIMARY KEY (`USERID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('8', 'aaa', 'd9f6e636e369552839e7bb8057aeb8da', 'aaa', '1', null, '2017-03-16 17:13:18', null, null, null, '123', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('9', 'bbb', '003d81296cbed643579b24d1cf6c907c', 'bbb', '2', null, '2017-03-16 17:13:41', null, null, null, '123', null, null, null, null, null);

-- ----------------------------
-- Table structure for `t_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `USERID` int(4) NOT NULL,
  `RID` int(4) NOT NULL,
  PRIMARY KEY (`USERID`,`RID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('4', '1');
INSERT INTO `t_user_role` VALUES ('5', '1');
INSERT INTO `t_user_role` VALUES ('5', '2');
INSERT INTO `t_user_role` VALUES ('7', '1');
INSERT INTO `t_user_role` VALUES ('7', '2');
INSERT INTO `t_user_role` VALUES ('8', '1');
INSERT INTO `t_user_role` VALUES ('8', '2');
INSERT INTO `t_user_role` VALUES ('9', '2');
INSERT INTO `t_user_role` VALUES ('9', '3');

-- ----------------------------
-- Table structure for `t_workattach`
-- ----------------------------
DROP TABLE IF EXISTS `t_workattach`;
CREATE TABLE `t_workattach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `newfilename` varchar(20) DEFAULT NULL,
  `oldfilename` varchar(20) DEFAULT NULL,
  `workid` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_workattach
-- ----------------------------
INSERT INTO `t_workattach` VALUES ('1', '201703171.xls', 'aaa.xls', '201703171623271');
INSERT INTO `t_workattach` VALUES ('2', '201703201.xls', 'owned.xls', '201703200908301');

-- ----------------------------
-- Table structure for `t_workorder`
-- ----------------------------
DROP TABLE IF EXISTS `t_workorder`;
CREATE TABLE `t_workorder` (
  `workorderid` varchar(20) NOT NULL DEFAULT '' COMMENT '工单编号',
  `customerid` int(11) DEFAULT NULL COMMENT '客户id',
  `customername` varchar(30) DEFAULT NULL COMMENT '客户姓名',
  `centificatenumber` varchar(50) DEFAULT NULL COMMENT '证件号码',
  `aging` int(11) DEFAULT NULL COMMENT '处理时效',
  `problemtype` varchar(50) DEFAULT NULL COMMENT '问题类型',
  `handlegroup` int(11) DEFAULT NULL COMMENT '处理组(流转对象)',
  `handleperson` int(11) DEFAULT NULL COMMENT '处理人',
  `urgencylevel` varchar(5) DEFAULT NULL COMMENT '紧急程度',
  `status` int(11) DEFAULT '0' COMMENT '状态(0表示未处理，1表示处理中2表示归档3表示退单)',
  `creatdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`workorderid`),
  KEY `index_status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_workorder
-- ----------------------------
INSERT INTO `t_workorder` VALUES ('1111', null, null, null, null, null, null, null, null, '1', '2017-03-31 10:19:33');
INSERT INTO `t_workorder` VALUES ('201703171548081', '1', 'zhansan', '112222', '14', '19', '1', '8', '16', '1', '2017-03-31 10:19:35');
INSERT INTO `t_workorder` VALUES ('201703171548082', '5', 'aaa', '122', null, null, null, null, null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('201703171623271', '2', 'lisi', '12222', '13', '18', '1', '8', '15', null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('201703200908301', '3', '老王', '1222', '13', '18', '1', '8', '15', null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('201703200913101', '4', '22222', '222', '13', '18', '1', '8', '15', null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('201703211120591', '5', '小黄', '2323', '13', '18', '2', '9', '15', null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('201703211616211', '6', '小张', '111', '13', '18', '2', '9', '15', null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder1', '3', '张1', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder10', '3', '张10', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder100', '3', '张100', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder101', '3', '张101', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder102', '3', '张102', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder103', '3', '张103', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder104', '3', '张104', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder105', '3', '张105', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder106', '3', '张106', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder107', '3', '张107', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder108', '3', '张108', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder109', '3', '张109', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder11', '3', '张11', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder110', '3', '张110', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder111', '3', '张111', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder112', '3', '张112', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder113', '3', '张113', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder114', '3', '张114', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder115', '3', '张115', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder116', '3', '张116', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder117', '3', '张117', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder118', '3', '张118', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder119', '3', '张119', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder12', '3', '张12', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder120', '3', '张120', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder121', '3', '张121', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder122', '3', '张122', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder123', '3', '张123', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder124', '3', '张124', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder125', '3', '张125', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder126', '3', '张126', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder127', '3', '张127', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder128', '3', '张128', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder129', '3', '张129', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder13', '3', '张13', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder130', '3', '张130', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder131', '3', '张131', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder132', '3', '张132', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder133', '3', '张133', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder134', '3', '张134', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder135', '3', '张135', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder136', '3', '张136', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder137', '3', '张137', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder138', '3', '张138', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder139', '3', '张139', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder14', '3', '张14', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder140', '3', '张140', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder141', '3', '张141', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder142', '3', '张142', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder143', '3', '张143', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder144', '3', '张144', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder145', '3', '张145', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder146', '3', '张146', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder147', '3', '张147', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder148', '3', '张148', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder149', '3', '张149', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder15', '3', '张15', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder150', '3', '张150', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder151', '3', '张151', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder152', '3', '张152', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder153', '3', '张153', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder154', '3', '张154', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder155', '3', '张155', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder156', '3', '张156', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder157', '3', '张157', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder158', '3', '张158', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder159', '3', '张159', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder16', '3', '张16', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder160', '3', '张160', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder161', '3', '张161', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder162', '3', '张162', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder163', '3', '张163', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder164', '3', '张164', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder165', '3', '张165', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder166', '3', '张166', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder167', '3', '张167', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder168', '3', '张168', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder169', '3', '张169', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder17', '3', '张17', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder170', '3', '张170', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder171', '3', '张171', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder172', '3', '张172', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder173', '3', '张173', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder174', '3', '张174', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder175', '3', '张175', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder176', '3', '张176', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder177', '3', '张177', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder178', '3', '张178', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder179', '3', '张179', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder18', '3', '张18', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder180', '3', '张180', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder181', '3', '张181', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder182', '3', '张182', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder183', '3', '张183', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder184', '3', '张184', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder185', '3', '张185', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder186', '3', '张186', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder187', '3', '张187', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder188', '3', '张188', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder189', '3', '张189', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder19', '3', '张19', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder190', '3', '张190', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder191', '3', '张191', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder192', '3', '张192', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder193', '3', '张193', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder194', '3', '张194', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder195', '3', '张195', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder196', '3', '张196', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder197', '3', '张197', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder198', '3', '张198', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder199', '3', '张199', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder2', '3', '张2', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder20', '3', '张20', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder200', '3', '张200', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder201', '3', '张201', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder202', '3', '张202', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder203', '3', '张203', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder204', '3', '张204', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder205', '3', '张205', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder206', '3', '张206', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder207', '3', '张207', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder208', '3', '张208', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder209', '3', '张209', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder21', '3', '张21', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder210', '3', '张210', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder211', '3', '张211', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder212', '3', '张212', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder213', '3', '张213', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder214', '3', '张214', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder215', '3', '张215', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder216', '3', '张216', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder217', '3', '张217', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder218', '3', '张218', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder219', '3', '张219', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder22', '3', '张22', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder220', '3', '张220', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder221', '3', '张221', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder222', '3', '张222', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder223', '3', '张223', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder224', '3', '张224', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder225', '3', '张225', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder226', '3', '张226', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder227', '3', '张227', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder228', '3', '张228', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder229', '3', '张229', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder23', '3', '张23', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder230', '3', '张230', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder231', '3', '张231', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder232', '3', '张232', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder233', '3', '张233', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder234', '3', '张234', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder235', '3', '张235', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder236', '3', '张236', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder237', '3', '张237', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder238', '3', '张238', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder239', '3', '张239', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder24', '3', '张24', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder240', '3', '张240', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder241', '3', '张241', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder242', '3', '张242', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder243', '3', '张243', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder244', '3', '张244', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder245', '3', '张245', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder246', '3', '张246', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder247', '3', '张247', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder248', '3', '张248', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder249', '3', '张249', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder25', '3', '张25', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder250', '3', '张250', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder251', '3', '张251', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder252', '3', '张252', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder253', '3', '张253', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder254', '3', '张254', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder255', '3', '张255', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder256', '3', '张256', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder257', '3', '张257', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder258', '3', '张258', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder259', '3', '张259', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder26', '3', '张26', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder260', '3', '张260', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder261', '3', '张261', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder262', '3', '张262', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder263', '3', '张263', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder264', '3', '张264', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder265', '3', '张265', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder266', '3', '张266', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder267', '3', '张267', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder268', '3', '张268', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder269', '3', '张269', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder27', '3', '张27', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder270', '3', '张270', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder271', '3', '张271', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder272', '3', '张272', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder273', '3', '张273', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder274', '3', '张274', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder275', '3', '张275', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder276', '3', '张276', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder277', '3', '张277', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder278', '3', '张278', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder279', '3', '张279', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder28', '3', '张28', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder280', '3', '张280', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder281', '3', '张281', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder282', '3', '张282', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder283', '3', '张283', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder284', '3', '张284', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder285', '3', '张285', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder286', '3', '张286', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder287', '3', '张287', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder288', '3', '张288', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder289', '3', '张289', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder29', '3', '张29', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder290', '3', '张290', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder291', '3', '张291', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder292', '3', '张292', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder293', '3', '张293', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder294', '3', '张294', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder295', '3', '张295', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder296', '3', '张296', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder297', '3', '张297', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder298', '3', '张298', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder299', '3', '张299', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder3', '3', '张3', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder30', '3', '张30', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder300', '3', '张300', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder301', '3', '张301', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder302', '3', '张302', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder303', '3', '张303', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder304', '3', '张304', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder305', '3', '张305', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder306', '3', '张306', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder307', '3', '张307', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder308', '3', '张308', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder309', '3', '张309', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder31', '3', '张31', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder310', '3', '张310', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder311', '3', '张311', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder312', '3', '张312', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder313', '3', '张313', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder314', '3', '张314', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder315', '3', '张315', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder316', '3', '张316', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder317', '3', '张317', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder318', '3', '张318', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder319', '3', '张319', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder32', '3', '张32', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder320', '3', '张320', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder321', '3', '张321', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder322', '3', '张322', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder323', '3', '张323', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder324', '3', '张324', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder325', '3', '张325', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder326', '3', '张326', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder327', '3', '张327', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder328', '3', '张328', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder329', '3', '张329', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder33', '3', '张33', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder330', '3', '张330', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder331', '3', '张331', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder332', '3', '张332', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder333', '3', '张333', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder334', '3', '张334', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder335', '3', '张335', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder336', '3', '张336', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder337', '3', '张337', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder338', '3', '张338', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder339', '3', '张339', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder34', '3', '张34', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder340', '3', '张340', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder341', '3', '张341', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder342', '3', '张342', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder343', '3', '张343', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder344', '3', '张344', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder345', '3', '张345', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder346', '3', '张346', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder347', '3', '张347', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder348', '3', '张348', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder349', '3', '张349', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder35', '3', '张35', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder350', '3', '张350', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder351', '3', '张351', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder352', '3', '张352', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder353', '3', '张353', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder354', '3', '张354', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder355', '3', '张355', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder356', '3', '张356', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder357', '3', '张357', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder358', '3', '张358', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder359', '3', '张359', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder36', '3', '张36', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder360', '3', '张360', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder361', '3', '张361', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder362', '3', '张362', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder363', '3', '张363', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder364', '3', '张364', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder365', '3', '张365', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder366', '3', '张366', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder367', '3', '张367', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder368', '3', '张368', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder369', '3', '张369', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder37', '3', '张37', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder370', '3', '张370', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder371', '3', '张371', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder372', '3', '张372', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder373', '3', '张373', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder374', '3', '张374', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder375', '3', '张375', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder376', '3', '张376', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder377', '3', '张377', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder378', '3', '张378', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder379', '3', '张379', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder38', '3', '张38', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder380', '3', '张380', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder381', '3', '张381', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder382', '3', '张382', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder383', '3', '张383', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder384', '3', '张384', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder385', '3', '张385', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder386', '3', '张386', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder387', '3', '张387', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder388', '3', '张388', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder389', '3', '张389', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder39', '3', '张39', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder390', '3', '张390', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder391', '3', '张391', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder392', '3', '张392', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder393', '3', '张393', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder394', '3', '张394', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder395', '3', '张395', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder396', '3', '张396', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder397', '3', '张397', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder398', '3', '张398', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder399', '3', '张399', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder4', '3', '张4', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder40', '3', '张40', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder400', '3', '张400', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder401', '3', '张401', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder402', '3', '张402', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder403', '3', '张403', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder404', '3', '张404', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder405', '3', '张405', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder406', '3', '张406', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder407', '3', '张407', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder408', '3', '张408', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder409', '3', '张409', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder41', '3', '张41', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder410', '3', '张410', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder411', '3', '张411', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder412', '3', '张412', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder413', '3', '张413', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder414', '3', '张414', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder415', '3', '张415', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder416', '3', '张416', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder417', '3', '张417', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder418', '3', '张418', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder419', '3', '张419', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder42', '3', '张42', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder420', '3', '张420', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder421', '3', '张421', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder422', '3', '张422', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder423', '3', '张423', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder424', '3', '张424', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder425', '3', '张425', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder426', '3', '张426', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder427', '3', '张427', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder428', '3', '张428', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder429', '3', '张429', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder43', '3', '张43', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder430', '3', '张430', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder431', '3', '张431', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder432', '3', '张432', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder433', '3', '张433', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder434', '3', '张434', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder435', '3', '张435', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder436', '3', '张436', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder437', '3', '张437', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder438', '3', '张438', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder439', '3', '张439', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder44', '3', '张44', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder440', '3', '张440', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder441', '3', '张441', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder442', '3', '张442', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder443', '3', '张443', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder444', '3', '张444', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder445', '3', '张445', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder446', '3', '张446', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder447', '3', '张447', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder448', '3', '张448', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder449', '3', '张449', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder45', '3', '张45', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder450', '3', '张450', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder451', '3', '张451', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder452', '3', '张452', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder453', '3', '张453', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder454', '3', '张454', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder455', '3', '张455', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder456', '3', '张456', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder457', '3', '张457', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder458', '3', '张458', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder459', '3', '张459', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder46', '3', '张46', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder460', '3', '张460', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder461', '3', '张461', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder462', '3', '张462', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder463', '3', '张463', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder464', '3', '张464', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder465', '3', '张465', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder466', '3', '张466', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder467', '3', '张467', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder468', '3', '张468', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder469', '3', '张469', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder47', '3', '张47', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder470', '3', '张470', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder471', '3', '张471', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder472', '3', '张472', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder473', '3', '张473', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder474', '3', '张474', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder475', '3', '张475', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder476', '3', '张476', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder477', '3', '张477', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder478', '3', '张478', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder479', '3', '张479', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder48', '3', '张48', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder480', '3', '张480', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder481', '3', '张481', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder482', '3', '张482', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder483', '3', '张483', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder484', '3', '张484', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder485', '3', '张485', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder486', '3', '张486', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder487', '3', '张487', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder488', '3', '张488', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder489', '3', '张489', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder49', '3', '张49', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder490', '3', '张490', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder491', '3', '张491', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder492', '3', '张492', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder493', '3', '张493', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder494', '3', '张494', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder495', '3', '张495', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder496', '3', '张496', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder497', '3', '张497', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder498', '3', '张498', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder499', '3', '张499', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder5', '3', '张5', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder50', '3', '张50', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder500', '3', '张500', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder501', '3', '张501', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder502', '3', '张502', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder503', '3', '张503', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder504', '3', '张504', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder505', '3', '张505', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder506', '3', '张506', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder507', '3', '张507', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder508', '3', '张508', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder509', '3', '张509', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder51', '3', '张51', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder510', '3', '张510', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder511', '3', '张511', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder512', '3', '张512', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder513', '3', '张513', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder514', '3', '张514', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder515', '3', '张515', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder516', '3', '张516', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder517', '3', '张517', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder518', '3', '张518', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder519', '3', '张519', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder52', '3', '张52', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder520', '3', '张520', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder521', '3', '张521', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder522', '3', '张522', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder523', '3', '张523', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder524', '3', '张524', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder525', '3', '张525', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder526', '3', '张526', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder527', '3', '张527', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder528', '3', '张528', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder529', '3', '张529', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder53', '3', '张53', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder530', '3', '张530', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder531', '3', '张531', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder532', '3', '张532', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder533', '3', '张533', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder534', '3', '张534', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder535', '3', '张535', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder536', '3', '张536', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder537', '3', '张537', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder538', '3', '张538', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder539', '3', '张539', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder54', '3', '张54', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder540', '3', '张540', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder541', '3', '张541', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder542', '3', '张542', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder543', '3', '张543', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder544', '3', '张544', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder545', '3', '张545', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder546', '3', '张546', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder547', '3', '张547', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder548', '3', '张548', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder549', '3', '张549', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder55', '3', '张55', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder550', '3', '张550', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder551', '3', '张551', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder552', '3', '张552', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder553', '3', '张553', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder554', '3', '张554', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder555', '3', '张555', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder556', '3', '张556', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder557', '3', '张557', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder558', '3', '张558', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder559', '3', '张559', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder56', '3', '张56', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder560', '3', '张560', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder561', '3', '张561', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder562', '3', '张562', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder563', '3', '张563', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder564', '3', '张564', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder565', '3', '张565', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder566', '3', '张566', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder567', '3', '张567', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder568', '3', '张568', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder569', '3', '张569', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder57', '3', '张57', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder570', '3', '张570', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder571', '3', '张571', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder572', '3', '张572', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder573', '3', '张573', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder574', '3', '张574', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder575', '3', '张575', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder576', '3', '张576', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder577', '3', '张577', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder578', '3', '张578', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder579', '3', '张579', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder58', '3', '张58', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder580', '3', '张580', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder581', '3', '张581', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder582', '3', '张582', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder583', '3', '张583', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder584', '3', '张584', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder585', '3', '张585', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder586', '3', '张586', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder587', '3', '张587', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder588', '3', '张588', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder589', '3', '张589', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder59', '3', '张59', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder590', '3', '张590', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder591', '3', '张591', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder592', '3', '张592', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder593', '3', '张593', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder594', '3', '张594', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder595', '3', '张595', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder596', '3', '张596', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder597', '3', '张597', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder598', '3', '张598', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder599', '3', '张599', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder6', '3', '张6', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder60', '3', '张60', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder600', '3', '张600', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder601', '3', '张601', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder602', '3', '张602', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder603', '3', '张603', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder604', '3', '张604', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder605', '3', '张605', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder606', '3', '张606', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder607', '3', '张607', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder608', '3', '张608', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder609', '3', '张609', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder61', '3', '张61', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder610', '3', '张610', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder611', '3', '张611', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder612', '3', '张612', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder613', '3', '张613', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder614', '3', '张614', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder615', '3', '张615', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder616', '3', '张616', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder617', '3', '张617', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder618', '3', '张618', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder619', '3', '张619', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder62', '3', '张62', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder620', '3', '张620', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder621', '3', '张621', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder622', '3', '张622', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder623', '3', '张623', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder624', '3', '张624', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder625', '3', '张625', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder626', '3', '张626', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder627', '3', '张627', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder628', '3', '张628', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder629', '3', '张629', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder63', '3', '张63', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder630', '3', '张630', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder631', '3', '张631', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder632', '3', '张632', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder633', '3', '张633', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder634', '3', '张634', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder635', '3', '张635', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder636', '3', '张636', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder637', '3', '张637', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder638', '3', '张638', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder639', '3', '张639', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder64', '3', '张64', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder640', '3', '张640', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder641', '3', '张641', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder642', '3', '张642', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder643', '3', '张643', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder644', '3', '张644', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder645', '3', '张645', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder646', '3', '张646', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder647', '3', '张647', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder648', '3', '张648', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder649', '3', '张649', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder65', '3', '张65', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder650', '3', '张650', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder651', '3', '张651', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder652', '3', '张652', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder653', '3', '张653', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder654', '3', '张654', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder655', '3', '张655', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder656', '3', '张656', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder657', '3', '张657', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder658', '3', '张658', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder659', '3', '张659', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder66', '3', '张66', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder660', '3', '张660', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder661', '3', '张661', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder662', '3', '张662', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder663', '3', '张663', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder664', '3', '张664', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder665', '3', '张665', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder666', '3', '张666', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder667', '3', '张667', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder668', '3', '张668', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder669', '3', '张669', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder67', '3', '张67', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder670', '3', '张670', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder671', '3', '张671', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder672', '3', '张672', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder673', '3', '张673', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder674', '3', '张674', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder675', '3', '张675', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder676', '3', '张676', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder677', '3', '张677', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder678', '3', '张678', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder679', '3', '张679', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder68', '3', '张68', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder680', '3', '张680', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder681', '3', '张681', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder682', '3', '张682', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder683', '3', '张683', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder684', '3', '张684', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder685', '3', '张685', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder686', '3', '张686', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder687', '3', '张687', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder688', '3', '张688', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder689', '3', '张689', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder69', '3', '张69', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder690', '3', '张690', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder691', '3', '张691', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder692', '3', '张692', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder693', '3', '张693', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder694', '3', '张694', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder695', '3', '张695', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder696', '3', '张696', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder697', '3', '张697', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder698', '3', '张698', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder699', '3', '张699', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder7', '3', '张7', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder70', '3', '张70', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder700', '3', '张700', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder701', '3', '张701', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder702', '3', '张702', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder703', '3', '张703', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder704', '3', '张704', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder705', '3', '张705', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder706', '3', '张706', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder707', '3', '张707', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder708', '3', '张708', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder709', '3', '张709', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder71', '3', '张71', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder710', '3', '张710', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder711', '3', '张711', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder712', '3', '张712', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder713', '3', '张713', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder714', '3', '张714', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder715', '3', '张715', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder716', '3', '张716', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder717', '3', '张717', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder718', '3', '张718', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder719', '3', '张719', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder72', '3', '张72', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder720', '3', '张720', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder721', '3', '张721', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder722', '3', '张722', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder723', '3', '张723', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder724', '3', '张724', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder725', '3', '张725', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder726', '3', '张726', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder727', '3', '张727', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder728', '3', '张728', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder729', '3', '张729', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder73', '3', '张73', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder730', '3', '张730', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder731', '3', '张731', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder732', '3', '张732', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder733', '3', '张733', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder734', '3', '张734', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder735', '3', '张735', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder736', '3', '张736', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder737', '3', '张737', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder738', '3', '张738', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder739', '3', '张739', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder74', '3', '张74', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder740', '3', '张740', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder741', '3', '张741', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder742', '3', '张742', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder743', '3', '张743', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder744', '3', '张744', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder745', '3', '张745', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder746', '3', '张746', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder747', '3', '张747', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder748', '3', '张748', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder749', '3', '张749', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder75', '3', '张75', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder750', '3', '张750', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder751', '3', '张751', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder752', '3', '张752', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder753', '3', '张753', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder754', '3', '张754', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder755', '3', '张755', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder756', '3', '张756', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder757', '3', '张757', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder758', '3', '张758', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder759', '3', '张759', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder76', '3', '张76', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder760', '3', '张760', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder761', '3', '张761', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder762', '3', '张762', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder763', '3', '张763', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder764', '3', '张764', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder765', '3', '张765', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder766', '3', '张766', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder767', '3', '张767', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder768', '3', '张768', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder769', '3', '张769', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder77', '3', '张77', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder770', '3', '张770', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder771', '3', '张771', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder772', '3', '张772', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder773', '3', '张773', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder774', '3', '张774', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder775', '3', '张775', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder776', '3', '张776', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder777', '3', '张777', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder778', '3', '张778', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder779', '3', '张779', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder78', '3', '张78', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder780', '3', '张780', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder781', '3', '张781', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder782', '3', '张782', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder783', '3', '张783', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder784', '3', '张784', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder785', '3', '张785', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder786', '3', '张786', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder787', '3', '张787', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder788', '3', '张788', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder789', '3', '张789', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder79', '3', '张79', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSERT INTO `t_workorder` VALUES ('corder790', '3', '张790', '100222', '1', '4', '4', '5', null, null, '2017-03-31 10:00:54');
INSE