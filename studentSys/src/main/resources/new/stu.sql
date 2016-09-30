/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : stu

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2016-09-30 16:31:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `stu_class`
-- ----------------------------
DROP TABLE IF EXISTS `stu_class`;
CREATE TABLE `stu_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `className` varchar(10) NOT NULL COMMENT '班级名',
  `classTutorId` varchar(30) NOT NULL COMMENT '辅导Id,用数组格式[id1,id2,id3...]',
  `classTeacherId` varchar(30) NOT NULL COMMENT '讲师id，用数组格式[id1,id2,id3...]',
  `classStartTime` bigint(20) NOT NULL COMMENT '开班日期（毫秒数）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_class
-- ----------------------------
INSERT INTO `stu_class` VALUES ('1', '0621', '[]', '[]', '0');
INSERT INTO `stu_class` VALUES ('2', '0719', '[]', '[]', '0');
INSERT INTO `stu_class` VALUES ('3', '0824', '[]', '[]', '0');
INSERT INTO `stu_class` VALUES ('4', '0921', '[]', '[]', '0');

-- ----------------------------
-- Table structure for `stu_method`
-- ----------------------------
DROP TABLE IF EXISTS `stu_method`;
CREATE TABLE `stu_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL COMMENT '缴费方式名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_method
-- ----------------------------
INSERT INTO `stu_method` VALUES ('1', '现金1');
INSERT INTO `stu_method` VALUES ('2', '现金2');
INSERT INTO `stu_method` VALUES ('3', '现金3');

-- ----------------------------
-- Table structure for `stu_student`
-- ----------------------------
DROP TABLE IF EXISTS `stu_student`;
CREATE TABLE `stu_student` (
  `id` int(11) NOT NULL COMMENT '学生id',
  `studentName` varchar(10) NOT NULL COMMENT '学生姓名',
  `studentClassId` int(11) NOT NULL COMMENT '班级id',
  `studentPhone` varchar(20) NOT NULL COMMENT '学生联系方式（手机号）',
  `studentQq` varchar(15) DEFAULT NULL COMMENT '学生qq',
  `studentIDCard` varchar(20) NOT NULL COMMENT '身份证号',
  `studentPayMethod` varchar(10) NOT NULL COMMENT '缴费方式',
  `studentEducation` varchar(10) NOT NULL COMMENT '学历',
  `studentGraduateSchool` varchar(20) NOT NULL COMMENT '毕业院校',
  `studentGraduateTime` bigint(20) NOT NULL COMMENT '毕业时间（1970年的标准毫秒数）',
  `studentMajor` varchar(20) DEFAULT NULL COMMENT '专业（可为空）',
  `studentSalary` int(11) DEFAULT NULL COMMENT '就业薪资（可为空）',
  `studentCompany` varchar(20) DEFAULT NULL COMMENT '就业公司（可为空）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_student
-- ----------------------------
