/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : student_manager

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2016-09-19 17:54:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `stumanager_class`
-- ----------------------------
DROP TABLE IF EXISTS `stumanager_class`;
CREATE TABLE `stumanager_class` (
  `classId` int(11) NOT NULL AUTO_INCREMENT,
  `className` varchar(10) DEFAULT NULL,
  `headTeacherId` bigint(40) DEFAULT NULL COMMENT '讲师',
  `Assistant` varchar(10) DEFAULT NULL COMMENT '科目',
  `tutorId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_class
-- ----------------------------
INSERT INTO `stumanager_class` VALUES ('1', '一班', '15314', '安卓', null);
INSERT INTO `stumanager_class` VALUES ('2', '二班', '1344', 'web', null);

-- ----------------------------
-- Table structure for `stumanager_employee`
-- ----------------------------
DROP TABLE IF EXISTS `stumanager_employee`;
CREATE TABLE `stumanager_employee` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL COMMENT '姓名',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `status` varchar(20) DEFAULT NULL COMMENT '身份，如咨询师等，默认将用户角色与身份设置对等',
  `sex` varchar(2) DEFAULT NULL COMMENT '性别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_employee
-- ----------------------------

-- ----------------------------
-- Table structure for `stumanager_mapping`
-- ----------------------------
DROP TABLE IF EXISTS `stumanager_mapping`;
CREATE TABLE `stumanager_mapping` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) DEFAULT NULL COMMENT '标题',
  `url` varchar(40) DEFAULT NULL COMMENT '对应路径',
  `icon` varchar(30) DEFAULT NULL COMMENT '图标',
  `leftChildId` bigint(20) DEFAULT '0' COMMENT '左儿子Id',
  `nextSiblingId` bigint(20) DEFAULT '0' COMMENT '下一个兄弟Id',
  `parentId` bigint(20) DEFAULT '0' COMMENT '父亲Id',
  `childCount` int(11) NOT NULL DEFAULT '0' COMMENT '孩子数量',
  `degree` int(11) NOT NULL DEFAULT '0' COMMENT '深度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `stumanager_role`
-- ----------------------------
DROP TABLE IF EXISTS `stumanager_role`;
CREATE TABLE `stumanager_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名',
  `memberCnt` int(11) NOT NULL COMMENT '角色人数',
  `treeData` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_role
-- ----------------------------

-- ----------------------------
-- Table structure for `stumanager_student`
-- ----------------------------
DROP TABLE IF EXISTS `stumanager_student`;
CREATE TABLE `stumanager_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `classId` bigint(11) DEFAULT NULL,
  `tutorId` bigint(11) DEFAULT NULL COMMENT '辅导老师',
  `subject` bigint(11) DEFAULT NULL COMMENT '学习科目',
  `contactInformation` varchar(255) DEFAULT NULL COMMENT '联系方式',
  `admission` date DEFAULT NULL COMMENT '入学时间',
  `credit` int(11) DEFAULT NULL COMMENT '学分',
  `grade` int(11) DEFAULT NULL COMMENT '成绩',
  `state` varchar(255) DEFAULT NULL COMMENT '状态',
  `employment` varchar(255) DEFAULT NULL COMMENT '就业跟踪',
  `createTime` bigint(20) DEFAULT NULL COMMENT '用户创建时间',
  `ip` varchar(20) DEFAULT NULL COMMENT '最后登录的ip地址',
  `opraterId` bigint(20) DEFAULT NULL COMMENT '操作人',
  `consultantId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `classId` (`tutorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_student
-- ----------------------------

-- ----------------------------
-- Table structure for `stumanager_user`
-- ----------------------------
DROP TABLE IF EXISTS `stumanager_user`;
CREATE TABLE `stumanager_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `userAccount` varchar(20) DEFAULT NULL COMMENT '用户账户',
  `userPassword` varchar(20) DEFAULT NULL COMMENT '用户密码',
  `userNickname` varchar(20) DEFAULT NULL COMMENT '用户昵称',
  `userEmail` varchar(40) DEFAULT NULL COMMENT '用户邮箱',
  `userRole` varchar(20) DEFAULT NULL COMMENT '用户角色',
  `userPurikura` varchar(40) DEFAULT NULL COMMENT '用户头像链接',
  `userLastLoginIp` varchar(12) DEFAULT NULL COMMENT '最后登录Ip',
  `userCreateTime` bigint(20) DEFAULT NULL COMMENT '用户创建时间',
  `userUpdateTime` bigint(20) DEFAULT NULL COMMENT '用户更新时间',
  `userPhone` varchar(20) DEFAULT NULL COMMENT '用户联系号码',
  `userAddress` varchar(20) DEFAULT NULL COMMENT '用户地址',
  `userMessage` mediumtext COMMENT '用户个人签名等信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_user
-- ----------------------------
