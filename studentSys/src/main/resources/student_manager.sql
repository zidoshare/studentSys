/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : student_manager

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2016-09-01 09:02:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `stumanager_class`
-- ----------------------------
DROP TABLE IF EXISTS `stumanager_class`;
CREATE TABLE `stumanager_class` (
  `classId` int(11) NOT NULL AUTO_INCREMENT,
  `className` varchar(255) DEFAULT NULL,
  `headTeacher` varchar(255) DEFAULT NULL COMMENT '讲师',
  `Assistant` varchar(255) DEFAULT NULL COMMENT '科目',
  PRIMARY KEY (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_class
-- ----------------------------
INSERT INTO `stumanager_class` VALUES ('1', '一班', '王老师', '安卓');
INSERT INTO `stumanager_class` VALUES ('2', '二班', '林老师', 'web');

-- ----------------------------
-- Table structure for `stumanager_mapping`
-- ----------------------------
DROP TABLE IF EXISTS `stumanager_mapping`;
CREATE TABLE `stumanager_mapping` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '中文标题（名）',
  `href` varchar(255) DEFAULT NULL COMMENT '对应地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_mapping
-- ----------------------------

-- ----------------------------
-- Table structure for `stumanager_role`
-- ----------------------------
DROP TABLE IF EXISTS `stumanager_role`;
CREATE TABLE `stumanager_role` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL COMMENT '角色名',
  `memberCnt` int(11) NOT NULL COMMENT '角色人数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `classId` int(11) DEFAULT NULL,
  `tutor` int(11) DEFAULT NULL COMMENT '辅导老师',
  `subject` int(11) DEFAULT NULL COMMENT '学习科目',
  `contactInformation` varchar(255) DEFAULT NULL COMMENT '联系方式',
  `admission` date DEFAULT NULL COMMENT '入学时间',
  `credit` int(11) DEFAULT NULL COMMENT '学分',
  `grade` int(11) DEFAULT NULL COMMENT '成绩',
  `state` varchar(255) DEFAULT NULL COMMENT '状态',
  `employment` varchar(255) DEFAULT NULL COMMENT '就业跟踪',
  `createTime` date DEFAULT NULL COMMENT '用户创建时间',
  `ip` varchar(255) DEFAULT NULL COMMENT '最后登录的ip地址',
  `oprater` varchar(255) DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`id`),
  KEY `classId` (`tutor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_student
-- ----------------------------

-- ----------------------------
-- Table structure for `stumanager_user`
-- ----------------------------
DROP TABLE IF EXISTS `stumanager_user`;
CREATE TABLE `stumanager_user` (
  `id` bigint(20) NOT NULL,
  `userAccount` varchar(20) DEFAULT NULL COMMENT '用户账户',
  `userPassword` varchar(20) DEFAULT NULL COMMENT '用户密码',
  `userNickname` varchar(20) DEFAULT NULL COMMENT '用户昵称',
  `userEmail` varchar(40) DEFAULT NULL COMMENT '用户邮箱',
  `userRole` varchar(20) DEFAULT NULL COMMENT '用户角色',
  `userPurikura` varchar(40) DEFAULT NULL COMMENT '用户头像链接',
  `userLastLoginIp` varchar(12) DEFAULT NULL COMMENT '最后登录Ip',
  `userCreateTime` varchar(20) DEFAULT NULL COMMENT '用户创建时间',
  `userUpdateTime` varchar(20) DEFAULT NULL COMMENT '用户更新时间',
  `userPhone` varchar(20) DEFAULT NULL COMMENT '用户联系号码',
  `userAddress` varchar(20) DEFAULT NULL COMMENT '用户地址',
  `userMessage` mediumtext COMMENT '用户个人签名等信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_user
-- ----------------------------
