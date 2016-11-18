/*
Navicat MySQL Data Transfer

Source Server         : 公司数据库
Source Server Version : 50631
Source Host           : 192.168.6.250:3306
Source Database       : student_manager

Target Server Type    : MYSQL
Target Server Version : 50631
File Encoding         : 65001

Date: 2016-11-18 17:10:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `stumanager_attendance`
-- ----------------------------
DROP TABLE IF EXISTS `stumanager_attendance`;
CREATE TABLE `stumanager_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentId` int(11) NOT NULL,
  `classId` int(11) NOT NULL,
  `createTime` bigint(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `time` bigint(20) NOT NULL,
  `operaterId` int(11) NOT NULL,
  `message` varchar(200) DEFAULT '暂无',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_attendance
-- ----------------------------

-- ----------------------------
-- Table structure for `stumanager_certificate`
-- ----------------------------
DROP TABLE IF EXISTS `stumanager_certificate`;
CREATE TABLE `stumanager_certificate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentId` int(11) NOT NULL,
  `enrollTime` bigint(20) DEFAULT NULL,
  `endTime` bigint(20) DEFAULT NULL,
  `addTime` bigint(20) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_certificate
-- ----------------------------

-- ----------------------------
-- Table structure for `stumanager_class`
-- ----------------------------
DROP TABLE IF EXISTS `stumanager_class`;
CREATE TABLE `stumanager_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `className` varchar(10) NOT NULL COMMENT '班级名字',
  `headTeacher` varchar(10) NOT NULL COMMENT '讲师',
  `Assistant` varchar(10) DEFAULT NULL COMMENT '科目',
  `tutor` varchar(10) NOT NULL,
  `studentCnt` int(11) NOT NULL DEFAULT '0',
  `classCreateTime` bigint(20) NOT NULL,
  `classUpdateTime` bigint(20) NOT NULL,
  `classOperaterId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_class
-- ----------------------------
INSERT INTO `stumanager_class` VALUES ('16', '互动160524班', 'a', null, 'a', '0', '1477629945119', '1477629945119', '86');
INSERT INTO `stumanager_class` VALUES ('17', '互动160621班', 'a', null, '吴开权', '0', '1477629973127', '1477629973127', '86');
INSERT INTO `stumanager_class` VALUES ('18', '互动160719班', 'a', null, '马吉', '0', '1477630004385', '1477630004385', '86');
INSERT INTO `stumanager_class` VALUES ('19', '互动160824班', 'a', null, '吴开权', '0', '1477630029710', '1477630029711', '86');
INSERT INTO `stumanager_class` VALUES ('20', '互动160921班', 'a', null, '邹朋', '0', '1477630053932', '1477630053932', '86');
INSERT INTO `stumanager_class` VALUES ('24', '互动161031班', 'a', null, '邹朋', '0', '1478942463999', '1478942463999', '1078');
INSERT INTO `stumanager_class` VALUES ('27', 'adasda', 'asda', null, 'asdas', '0', '1479379380659', '1479379380659', '1078');
INSERT INTO `stumanager_class` VALUES ('28', 'a', 'asda', null, 'asda', '0', '1479379385256', '1479379385256', '1078');

-- ----------------------------
-- Table structure for `stumanager_domain`
-- ----------------------------
DROP TABLE IF EXISTS `stumanager_domain`;
CREATE TABLE `stumanager_domain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domainTitle` varchar(20) NOT NULL,
  `domainMessage` varchar(250) DEFAULT NULL,
  `domainOperaterId` int(11) NOT NULL,
  `domainCreateTime` bigint(20) NOT NULL,
  `domainUpdateTime` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of stumanager_domain
-- ----------------------------

-- ----------------------------
-- Table structure for `stumanager_domain_tag`
-- ----------------------------
DROP TABLE IF EXISTS `stumanager_domain_tag`;
CREATE TABLE `stumanager_domain_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domainId` int(11) NOT NULL,
  `tagId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of stumanager_domain_tag
-- ----------------------------

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
  `url` varchar(100) DEFAULT NULL COMMENT '对应路径',
  `message` varchar(100) DEFAULT '' COMMENT '一个基本信息',
  `icon` varchar(30) DEFAULT NULL COMMENT '图标',
  `leftChildId` int(20) DEFAULT '0' COMMENT '左儿子Id',
  `nextSiblingId` int(20) DEFAULT '0' COMMENT '下一个兄弟Id',
  `parentId` int(20) DEFAULT '0' COMMENT '父亲Id',
  `childCount` int(11) NOT NULL DEFAULT '0' COMMENT '孩子数量',
  `degree` int(11) NOT NULL DEFAULT '0' COMMENT '深度',
  `visitCnt` int(11) NOT NULL DEFAULT '0' COMMENT '访问次数，用于统计',
  `function` int(11) NOT NULL DEFAULT '0' COMMENT '职能，0：功能，1：视图模块，2：菜单，3：二级菜单，以后多级菜单，依次类推',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3855 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_mapping
-- ----------------------------
INSERT INTO `stumanager_mapping` VALUES ('105', '标签分类管理', '/test/tagManager', '', 'tagManager', '106', '3002', '2333', '1', '2', '0', '3');
INSERT INTO `stumanager_mapping` VALUES ('106', '大分类列表', '/test/domainList.ftl', '', 'domainList', '107', '0', '105', '3', '3', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('107', '添加', 'addDomain', '', 'addDomain', '0', '108', '106', '0', '4', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('108', '修改', 'updateDomain', '', 'updateDomain', '0', '109', '106', '0', '4', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('109', '删除', 'deleteDomain', '', 'deleteDomain', '0', '0', '106', '0', '4', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('237', '提交阅卷信息', 'updateReply', '', 'updateReply', '0', '0', '3005', '0', '4', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('1007', '班级管理', '/classManager', '', 'fa fa-flag', '1008', '2330', '2326', '1', '1', '0', '2');
INSERT INTO `stumanager_mapping` VALUES ('1008', '班级列表', '/classManager/classList.ftl', '', 'classList', '1009', '0', '1007', '3', '2', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('1009', '添加', 'addClass', '', 'addClass', '0', '1010', '1008', '0', '3', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('1010', '编辑', 'updateClass', '', 'updateClass', '0', '1011', '1008', '0', '3', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('1011', '删除', 'deleteClass', '', 'deleteClass', '0', '0', '1008', '0', '3', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('1035', '开启提交', 'delayTest', '', 'delayTest', '0', '1036', '3005', '0', '4', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('1036', '关闭提交', 'closeTest', '', 'closeTest', '0', '237', '3005', '0', '4', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('1999', '数据管理', '/common/dataManager.ftl', '', 'dataManager', '0', '2000', '2327', '0', '2', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('2000', '导航', '/common/routs.ftl', '', 'routs', '0', '2338', '2327', '0', '2', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('2004', '证书管理', '/certificateManager/certificateList.ftl', '', 'certificateList', '2005', '0', '2332', '3', '2', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('2005', '添加', 'addCertificate', '', 'addCertificate', '0', '2006', '2004', '0', '3', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('2006', '修改', 'updateCertificate', '', 'updateCertificate', '0', '2007', '2004', '0', '3', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('2007', '删除', 'deleteCertificate', '', 'deleteCertificate', '0', '0', '2004', '0', '3', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('2025', '已分配试卷', '/test/disList.ftl', '', 'disList', '0', '0', '3002', '0', '3', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('2326', '根目录', 'url', '', 'fa', '2327', '0', '0', '12', '0', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('2327', '首页', '/', '', 'fa fa-desktop', '2337', '2328', '2326', '6', '1', '0', '2');
INSERT INTO `stumanager_mapping` VALUES ('2328', '用户管理', '/userManager', '', 'fa fa-users', '2341', '2329', '2326', '2', '1', '0', '2');
INSERT INTO `stumanager_mapping` VALUES ('2329', '学生管理', '/studentManager', '', 'fa fa-calendar', '2343', '1007', '2326', '1', '1', '0', '2');
INSERT INTO `stumanager_mapping` VALUES ('2330', '还款管理', '/repaymentManager', '', 'fa fa-usd', '3700', '3851', '2326', '1', '1', '0', '2');
INSERT INTO `stumanager_mapping` VALUES ('2331', '出勤管理', '/attendanceManager/attendance', '', 'fa fa-crosshairs', '2344', '2332', '2326', '2', '1', '0', '2');
INSERT INTO `stumanager_mapping` VALUES ('2332', '证书管理', '/certificateManager', '', 'fa fa-book', '2004', '2333', '2326', '1', '1', '0', '2');
INSERT INTO `stumanager_mapping` VALUES ('2333', '我的考试', '/test', '', 'fa fa-pencil', '2345', '2334', '2326', '6', '1', '0', '2');
INSERT INTO `stumanager_mapping` VALUES ('2334', '我的调查', '/#', '', 'fa fa-file-text', '2347', '2335', '2326', '5', '1', '0', '2');
INSERT INTO `stumanager_mapping` VALUES ('2335', '通用设置', '/option', '', 'fa fa-gear', '2352', '2336', '2326', '2', '1', '0', '2');
INSERT INTO `stumanager_mapping` VALUES ('2336', '报名学生', '/enrollManager', '', 'fa fa-thumbs-up', '2354', '0', '2326', '1', '1', '0', '2');
INSERT INTO `stumanager_mapping` VALUES ('2337', '全局搜索', '/common/search.ftl', '', 'search', '0', '1999', '2327', '0', '2', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('2338', '快捷操作', '/common/fastOprator.ftl', '', 'fast', '0', '2339', '2327', '0', '2', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('2339', '最新报名', '/common/newest.ftl', '', 'newest', '0', '2340', '2327', '0', '2', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('2340', '统计', '/common/statistics.ftl', '', 'statistics', '0', '0', '2327', '0', '2', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('2341', '用户列表', '/userManager/userList.ftl', '', 'userList', '2355', '2342', '2328', '3', '2', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('2342', '角色列表', '/userManager/roleList.ftl', '', 'roleList', '2358', '0', '2328', '3', '2', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('2343', '学生信息列表', '/studentManager/studentList.ftl', '', 'studentList', '2361', '0', '2329', '3', '2', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('2344', '考勤信息列表', '/attendanceManager/attendanceList.ftl', '', 'attendanceList', '2364', '3854', '2331', '3', '2', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('2345', '考试历史', '/test/history', '', 'testHistory', '2367', '2346', '2333', '1', '2', '0', '3');
INSERT INTO `stumanager_mapping` VALUES ('2346', '参加考试', '/test/to', '', 'toTest', '2368', '3000', '2333', '1', '2', '0', '3');
INSERT INTO `stumanager_mapping` VALUES ('2347', '调查列表', '/surveys/surveyList', '', 'toSurveying', '2369', '2348', '2334', '1', '2', '0', '3');
INSERT INTO `stumanager_mapping` VALUES ('2348', '添加大类型', '/surveys/inputBigType', '', 'toInputBigType', '2370', '2349', '2334', '1', '2', '0', '3');
INSERT INTO `stumanager_mapping` VALUES ('2349', '添加问题', '/surveys/inputQuestion', '', 'toInputQuestion', '2371', '2350', '2334', '1', '2', '0', '3');
INSERT INTO `stumanager_mapping` VALUES ('2350', '组卷', '/surveys/inputQuestionnaire', '', 'toInputQuestionnaire', '2372', '2351', '2334', '1', '2', '0', '3');
INSERT INTO `stumanager_mapping` VALUES ('2351', '查看调查结果', '/surveys/checkResult', '', 'toCheckResult', '2373', '0', '2334', '1', '2', '0', '3');
INSERT INTO `stumanager_mapping` VALUES ('2352', '修改头像', '/option/updatePurikura.ftl', '', 'updatePurikura', '0', '2353', '2335', '0', '2', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('2353', '修改密码', '/option/updatePassword.ftl', '', 'updatePassword', '0', '0', '2335', '0', '2', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('2354', '报名学生列表', '/enrollManager/enroll.ftl', '', 'enrollList', '2374', '0', '2336', '3', '2', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('2355', '添加', 'addUser', '', 'addUser', '0', '2356', '2341', '0', '3', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('2356', '编辑', 'updateUser', '', 'updateUser', '0', '2357', '2341', '0', '3', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('2357', '删除', 'deleteUser', '', 'deleteUser', '0', '0', '2341', '0', '3', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('2358', '添加', 'addRole', '', 'addRole', '0', '2359', '2342', '0', '3', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('2359', '编辑', 'updateRole', '', 'updateRole', '0', '2360', '2342', '0', '3', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('2360', '删除', 'deleteRole', '', 'deleteRole', '0', '0', '2342', '0', '3', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('2361', '添加', 'addStudent', '', 'addStudent', '0', '2362', '2343', '0', '3', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('2362', '修改', 'updateStudent', '', 'updateStudent', '0', '2363', '2343', '0', '3', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('2363', '删除', 'deleteStudent', '', 'deleteStudent', '0', '0', '2343', '0', '3', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('2364', '添加详情', 'addAttendance', '', 'addAttendance', '0', '2365', '2344', '0', '3', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('2365', '查看详情', 'updateAttendance', '', 'updateAttendance', '0', '2366', '2344', '0', '3', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('2366', '删除', 'deleteStudent', '', 'deleteStudent', '0', '0', '2344', '0', '3', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('2367', '考试历史', '/test/historyList.ftl', '', 'historyList', '0', '0', '2345', '0', '3', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('2368', '正在进行的考试', '/test/testing.ftl', '', 'testing', '0', '0', '2346', '0', '3', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('2369', '正在进行的调查', '/surveys/surveying.ftl', '', 'surveying', '0', '0', '2347', '0', '3', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('2370', '添加大类型', '/surveys/inputBigType.ftl', '', 'inputBigType', '0', '0', '2348', '0', '3', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('2371', '添加问题', '/surveys/inputQuestion.ftl', '', 'inputQuestion', '0', '0', '2349', '0', '3', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('2372', '组卷', '/surveys/inputQuestionnaire.ftl', '', 'inputQuestionnaire', '0', '0', '2350', '0', '3', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('2373', '查看调查结果', '/surveys/checkResult.ftl', '', 'checkResult', '0', '0', '2351', '0', '3', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('2374', '添加报名学生', 'addEnroll', '', 'addEnroll', '0', '2375', '2354', '0', '3', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('2375', '修改', 'updateEnroll', '', 'updateEnroll', '0', '2376', '2354', '0', '3', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('2376', '删除', 'deleteEnroll', '', 'deleteEnroll', '0', '0', '2354', '0', '3', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('3000', '题库', '/test/questions', '', 'toQuestions', '3001', '105', '2333', '1', '2', '0', '3');
INSERT INTO `stumanager_mapping` VALUES ('3001', '中心题库', '/test/questions.ftl', '', 'questions', '3007', '0', '3000', '3', '3', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('3002', '试卷列表', '/test/testList', '', 'testList', '3003', '3004', '2333', '2', '2', '0', '3');
INSERT INTO `stumanager_mapping` VALUES ('3003', '试卷列表', '/test/testList.ftl', '', 'testList', '3020', '2025', '3002', '3', '3', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('3004', '成绩统计', '/test/count', '', 'toCount', '3005', '0', '2333', '2', '2', '0', '3');
INSERT INTO `stumanager_mapping` VALUES ('3005', '试卷列表', '/test/gradeList.ftl', '', 'count', '1035', '3006', '3004', '3', '3', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('3006', '统计图表', '/test/gradeChart.ftl', '', 'count', '0', '0', '3004', '0', '3', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('3007', '添加', 'addTestQuestion', '', 'addTestQuestion', '0', '3008', '3001', '0', '4', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('3008', '修改', 'updateTestQuestion', '', 'updateTestQuestion', '0', '3009', '3001', '0', '4', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('3009', '删除', 'deleteTestQuestion', '', 'deleteTestQuestion', '0', '0', '3001', '0', '4', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('3020', '添加试卷', 'addTestQuestionnaire', '', 'addTestQuestionnaire', '0', '3021', '3003', '0', '4', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('3021', '修改', 'updateTestQuestionnaire', '', 'updateTestQuestionnaire', '0', '3022', '3003', '0', '4', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('3022', '删除', 'deleteQuestionnaire', '', 'deleteTestQuestionnaire', '0', '0', '3003', '0', '4', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('3700', '还款管理', '/repaymentManager/repaymentList.ftl', '', 'repaymentList', '3701', '0', '2330', '3', '2', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('3701', '添加', 'addRepayment', '', 'addRepayment', '0', '3702', '3700', '0', '3', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('3702', '修改', 'updateRepayment', '', 'updateRepayment', '0', '3703', '3700', '0', '3', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('3703', '删除', 'deleteRepayment', '', 'deleteRepayment', '0', '0', '3700', '0', '3', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('3851', '我的考勤', '/attendanceManager/personalAttendance', '', 'fa fa-crosshairs', '3852', '2331', '2326', '2', '1', '0', '2');
INSERT INTO `stumanager_mapping` VALUES ('3852', '考勤信息列表', '/attendanceManager/personalAttendanceList.ftl', '', 'personalAttendanceList', '0', '3853', '3851', '0', '2', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('3853', '考勤信息图表', '/attendanceManager/personalAttendanceChart.ftl', '', 'personalAttendanceChart', '0', '0', '3851', '0', '2', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('3854', '考勤信息图表', '/attendanceManager/attendanceChart.ftl', '', 'attendanceChart', '0', '0', '2331', '0', '2', '0', '1');

-- ----------------------------
-- Table structure for `stumanager_repayment`
-- ----------------------------
DROP TABLE IF EXISTS `stumanager_repayment`;
CREATE TABLE `stumanager_repayment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentId` int(11) NOT NULL,
  `enrollTime` bigint(20) NOT NULL,
  `type` int(20) NOT NULL,
  `message` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_repayment
-- ----------------------------

-- ----------------------------
-- Table structure for `stumanager_repayment_type`
-- ----------------------------
DROP TABLE IF EXISTS `stumanager_repayment_type`;
CREATE TABLE `stumanager_repayment_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(20) NOT NULL,
  `message` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_repayment_type
-- ----------------------------
INSERT INTO `stumanager_repayment_type` VALUES ('1', '分期', '分期');
INSERT INTO `stumanager_repayment_type` VALUES ('2', '一次性', '一次性');

-- ----------------------------
-- Table structure for `stumanager_role`
-- ----------------------------
DROP TABLE IF EXISTS `stumanager_role`;
CREATE TABLE `stumanager_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名',
  `memberCnt` int(11) NOT NULL COMMENT '角色人数',
  `treeData` mediumtext,
  `createTime` bigint(20) DEFAULT NULL,
  `operater` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_role
-- ----------------------------
INSERT INTO `stumanager_role` VALUES ('78', 'admin', '1', '1999:2000:2326:2327:2328:2329:2337:2338:2339:2340:2341:2342:2343:2355:2356:2357:2358:2359:2360:2361:2362:2363', '1477718192050', 'admin');
INSERT INTO `stumanager_role` VALUES ('79', '学生', '77', '2000:2326:2327:2333:2334:2335:2337:2340:2345:2346:2347:2352:2353:2367:2368:2369', '1476174127857', 'admin');
INSERT INTO `stumanager_role` VALUES ('82', '教师临时账号', '1', '105:106:107:108:109:237:1007:1008:1009:1010:1011:1035:1036:2000:2025:2326:2327:2331:2333:2334:2337:2338:2339:2340:2344:2348:2349:2350:2351:2364:2365:2366:2370:2371:2372:2373:3000:3001:3002:3003:3004:3005:3006:3007:3008:3009:3020:3021:3022:3854', '1479090117207', 'admin');

-- ----------------------------
-- Table structure for `stumanager_student`
-- ----------------------------
DROP TABLE IF EXISTS `stumanager_student`;
CREATE TABLE `stumanager_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `classId` int(11) DEFAULT NULL,
  `className` varchar(20) DEFAULT NULL,
  `tutor` varchar(20) DEFAULT NULL,
  `tutorId` int(11) DEFAULT NULL COMMENT '辅导老师',
  `subject` int(11) DEFAULT NULL COMMENT '学习科目',
  `contactInformation` varchar(255) DEFAULT '' COMMENT '联系方式',
  `admission` bigint(20) DEFAULT NULL COMMENT '入学时间',
  `credit` int(11) DEFAULT NULL COMMENT '学分',
  `grade` int(11) DEFAULT NULL COMMENT '成绩',
  `state` varchar(255) DEFAULT NULL COMMENT '状态',
  `employment` varchar(255) DEFAULT NULL COMMENT '就业跟踪',
  `createTime` bigint(20) DEFAULT NULL COMMENT '用户创建时间',
  `ip` varchar(20) DEFAULT '0.0.0.0' COMMENT '最后登录的ip地址',
  `operaterId` int(11) DEFAULT NULL COMMENT '操作人',
  `operater` varchar(20) DEFAULT 'admin',
  `consultantId` int(20) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `classId` (`tutorId`)
) ENGINE=InnoDB AUTO_INCREMENT=1092 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_student
-- ----------------------------
INSERT INTO `stumanager_student` VALUES ('1001', '唐廷超', null, '互动160524班', '邬红旭', null, null, '18708172148', null, null, null, null, null, '1476104822118', '0.0.0.0', null, 'admin', null, '1001');
INSERT INTO `stumanager_student` VALUES ('1002', '李群锋', null, '互动160524班', '邬红旭', null, null, '15576782772', null, null, null, null, null, '1476104822573', '0.0.0.0', null, 'admin', null, '1002');
INSERT INTO `stumanager_student` VALUES ('1003', '郭松林', null, '互动160524班', '邬红旭', null, null, '18631123385', null, null, null, null, null, '1476104822585', '0.0.0.0', null, 'admin', null, '1003');
INSERT INTO `stumanager_student` VALUES ('1004', '杨露', null, '互动160524班', '邬红旭', null, null, '18782232826', null, null, null, null, null, '1476104822587', '0.0.0.0', null, 'admin', null, '1004');
INSERT INTO `stumanager_student` VALUES ('1005', '蒋佳才', null, '互动160524班', '邬红旭', null, null, '18030608096', null, null, null, null, null, '1476104822588', '0.0.0.0', null, 'admin', null, '1005');
INSERT INTO `stumanager_student` VALUES ('1006', '武诣宏', null, '互动160524班', '邬红旭', null, null, '18081034195', null, null, null, null, null, '1476104822590', '0.0.0.0', null, 'admin', null, '1006');
INSERT INTO `stumanager_student` VALUES ('1007', '吕才宏', null, '互动160621班', '吴开权', null, null, '13683431424', null, null, null, null, null, '1476104822591', '0.0.0.0', null, 'admin', null, '1007');
INSERT INTO `stumanager_student` VALUES ('1008', '蔡炯', null, '互动160621班', '吴开权', null, null, '13540542887', null, null, null, null, null, '1476104822592', '0.0.0.0', null, 'admin', null, '1008');
INSERT INTO `stumanager_student` VALUES ('1009', '陈佳磊', null, '互动160621班', '吴开权', null, null, '18398605299', null, null, null, null, null, '1476104822594', '0.0.0.0', null, 'admin', null, '1009');
INSERT INTO `stumanager_student` VALUES ('1010', '黄康', null, '互动160621班', '吴开权', null, null, '13982185735', null, null, null, null, null, '1476104822595', '0.0.0.0', null, 'admin', null, '1010');
INSERT INTO `stumanager_student` VALUES ('1011', '韩枫', null, '互动160621班', '吴开权', null, null, '13699607283', null, null, null, null, null, '1476104822596', '0.0.0.0', null, 'admin', null, '1011');
INSERT INTO `stumanager_student` VALUES ('1012', '李佳树', null, '互动160621班', '吴开权', null, null, '18349263790', null, null, null, null, null, '1476104822599', '0.0.0.0', null, 'admin', null, '1012');
INSERT INTO `stumanager_student` VALUES ('1013', '卢凯', null, '互动160621班', '吴开权', null, null, '18200203436', null, null, null, null, null, '1476104822601', '0.0.0.0', null, 'admin', null, '1013');
INSERT INTO `stumanager_student` VALUES ('1014', '刘旭', null, '互动160621班', '吴开权', null, null, '15928110162', null, null, null, null, null, '1476104822605', '0.0.0.0', null, 'admin', null, '1014');
INSERT INTO `stumanager_student` VALUES ('1015', '张丰', null, '互动160621班', '吴开权', null, null, '18227583795', null, null, null, null, null, '1476104822606', '0.0.0.0', null, 'admin', null, '1015');
INSERT INTO `stumanager_student` VALUES ('1016', '田小辉', null, '互动160621班', '吴开权', null, null, '15708420080', null, null, null, null, null, '1476104822608', '0.0.0.0', null, 'admin', null, '1016');
INSERT INTO `stumanager_student` VALUES ('1017', '叶开', null, '互动160621班', '吴开权', null, null, '18408238639', null, null, null, null, null, '1476104822610', '0.0.0.0', null, 'admin', null, '1017');
INSERT INTO `stumanager_student` VALUES ('1018', '邱强', null, '互动160621班', '吴开权', null, null, '18380448697', null, null, null, null, null, '1476104822615', '0.0.0.0', null, 'admin', null, '1018');
INSERT INTO `stumanager_student` VALUES ('1019', '王从文', null, '互动160621班', '吴开权', null, null, '15070873243', null, null, null, null, null, '1476104822616', '0.0.0.0', null, 'admin', null, '1019');
INSERT INTO `stumanager_student` VALUES ('1020', '曾力', null, '互动160621班', '吴开权', null, null, '18583948156', null, null, null, null, null, '1476104822617', '0.0.0.0', null, 'admin', null, '1020');
INSERT INTO `stumanager_student` VALUES ('1021', '舒强', null, '互动160621班', '吴开权', null, null, '18380447421', null, null, null, null, null, '1476104822619', '0.0.0.0', null, 'admin', null, '1021');
INSERT INTO `stumanager_student` VALUES ('1022', '孙磊', null, '互动160621班', '吴开权', null, null, '13540195068', null, null, null, null, null, '1476104822620', '0.0.0.0', null, 'admin', null, '1022');
INSERT INTO `stumanager_student` VALUES ('1023', '何敬轩', null, '互动160621班', '吴开权', null, null, '15108384620', null, null, null, null, null, '1476104822621', '0.0.0.0', null, 'admin', null, '1023');
INSERT INTO `stumanager_student` VALUES ('1024', '孙磊1', null, '互动160621班', '吴开权', null, null, '18584053968', null, null, null, null, null, '1476104822622', '0.0.0.0', null, 'admin', null, '1024');
INSERT INTO `stumanager_student` VALUES ('1025', '黄晨', null, '互动160621班', '吴开权', null, null, '15281075743', null, null, null, null, null, '1476104822624', '0.0.0.0', null, 'admin', null, '1025');
INSERT INTO `stumanager_student` VALUES ('1026', '李建君', null, '互动160621班', '吴开权', null, null, '15828672627', null, null, null, null, null, '1476104822625', '0.0.0.0', null, 'admin', null, '1026');
INSERT INTO `stumanager_student` VALUES ('1027', '唐志豪', null, '互动160621班', '吴开权', null, null, '18180714905', null, null, null, null, null, '1476104822652', '0.0.0.0', null, 'admin', null, '1027');
INSERT INTO `stumanager_student` VALUES ('1028', '姚永科', null, '互动160621班', '吴开权', null, null, '15528152447', null, null, null, null, null, '1476104822653', '0.0.0.0', null, 'admin', null, '1028');
INSERT INTO `stumanager_student` VALUES ('1029', '黄文彬', null, '互动160621班', '吴开权', null, null, '18208142097', null, null, null, null, null, '1476104822654', '0.0.0.0', null, 'admin', null, '1029');
INSERT INTO `stumanager_student` VALUES ('1030', '陈虎', null, '互动160621班', '吴开权', null, null, '13730650634', null, null, null, null, null, '1476104822656', '0.0.0.0', null, 'admin', null, '1030');
INSERT INTO `stumanager_student` VALUES ('1031', '何映飞', null, '互动160621班', '吴开权', null, null, '18728839138', null, null, null, null, null, '1476104822657', '0.0.0.0', null, 'admin', null, '1031');
INSERT INTO `stumanager_student` VALUES ('1032', '高磊', null, '互动160621班', '吴开权', null, null, '18080451244', null, null, null, null, null, '1476104822659', '0.0.0.0', null, 'admin', null, '1032');
INSERT INTO `stumanager_student` VALUES ('1033', '林萌', null, '互动160621班', '吴开权', null, null, '15386652410', null, null, null, null, null, '1476104822662', '0.0.0.0', null, 'admin', null, '1033');
INSERT INTO `stumanager_student` VALUES ('1034', '沈磊', null, '互动160621班', '吴开权', null, null, '18781974479', null, null, null, null, null, '1476104822664', '0.0.0.0', null, 'admin', null, '1034');
INSERT INTO `stumanager_student` VALUES ('1035', '陈渊', null, '互动160621班', '吴开权', null, null, '18106114060', null, null, null, null, null, '1476104822665', '0.0.0.0', null, 'admin', null, '1035');
INSERT INTO `stumanager_student` VALUES ('1036', '段鹏', null, '互动160719班', '马吉', null, null, '18161224506', null, null, null, null, null, '1476104822669', '0.0.0.0', null, 'admin', null, '1036');
INSERT INTO `stumanager_student` VALUES ('1037', '黎民忠', null, '互动160719班', '马吉', null, null, '18227810752', null, null, null, null, null, '1476104822674', '0.0.0.0', null, 'admin', null, '1037');
INSERT INTO `stumanager_student` VALUES ('1038', '卢福川', null, '互动160719班', '马吉', null, null, '18111029527', null, null, null, null, null, '1476104822680', '0.0.0.0', null, 'admin', null, '1038');
INSERT INTO `stumanager_student` VALUES ('1039', '孙建雄', null, '互动160719班', '马吉', null, null, '15883979776', null, null, null, null, null, '1476104822682', '0.0.0.0', null, 'admin', null, '1039');
INSERT INTO `stumanager_student` VALUES ('1040', '姜鑫鹏', null, '互动160719班', '马吉', null, null, '13730638251', null, null, null, null, null, '1476104822683', '0.0.0.0', null, 'admin', null, '1040');
INSERT INTO `stumanager_student` VALUES ('1041', '姚涛', null, '互动160719班', '马吉', null, null, '13388124102', null, null, null, null, null, '1476104822686', '0.0.0.0', null, 'admin', null, '1041');
INSERT INTO `stumanager_student` VALUES ('1042', '王家兴', null, '互动160719班', '马吉', null, null, '18215587363', null, null, null, null, null, '1476104822687', '0.0.0.0', null, 'admin', null, '1042');
INSERT INTO `stumanager_student` VALUES ('1043', '易杰', null, '互动160719班', '马吉', null, null, '15184481369', null, null, null, null, null, '1476104822688', '0.0.0.0', null, 'admin', null, '1043');
INSERT INTO `stumanager_student` VALUES ('1044', '李忠原', null, '互动160719班', '马吉', null, null, '15281025582', null, null, null, null, null, '1476104822698', '0.0.0.0', null, 'admin', null, '1044');
INSERT INTO `stumanager_student` VALUES ('1045', '谭佳敏', null, '互动160719班', '马吉', null, null, '18200396402', null, null, null, null, null, '1476104822701', '0.0.0.0', null, 'admin', null, '1045');
INSERT INTO `stumanager_student` VALUES ('1046', '吕金泉', null, '互动160719班', '马吉', null, null, '18482105738', null, null, null, null, null, '1476104822702', '0.0.0.0', null, 'admin', null, '1046');
INSERT INTO `stumanager_student` VALUES ('1047', '刘朝', null, '互动160719班', '马吉', null, null, '18780097106', null, null, null, null, null, '1476104822715', '0.0.0.0', null, 'admin', null, '1047');
INSERT INTO `stumanager_student` VALUES ('1048', '刘萌', null, '互动160719班', '马吉', null, null, '18215673679', null, null, null, null, null, '1476104822716', '0.0.0.0', null, 'admin', null, '1048');
INSERT INTO `stumanager_student` VALUES ('1049', '黎翔', null, '互动160824班', '吴开权', null, null, '15884592322', null, null, null, null, null, '1476104822717', '0.0.0.0', null, 'admin', null, '1049');
INSERT INTO `stumanager_student` VALUES ('1050', '刘元', null, '互动160824班', '吴开权', null, null, '13980454445', null, null, null, null, null, '1476104822718', '0.0.0.0', null, 'admin', null, '1050');
INSERT INTO `stumanager_student` VALUES ('1051', '胡明', null, '互动160824班', '吴开权', null, null, '15284015158', null, null, null, null, null, '1476104822719', '0.0.0.0', null, 'admin', null, '1051');
INSERT INTO `stumanager_student` VALUES ('1052', '任传岗', null, '互动160824班', '吴开权', null, null, '18349154702', null, null, null, null, null, '1476104822721', '0.0.0.0', null, 'admin', null, '1052');
INSERT INTO `stumanager_student` VALUES ('1053', '张义武', null, '互动160824班', '吴开权', null, null, '18349349371', null, null, null, null, null, '1476104822722', '0.0.0.0', null, 'admin', null, '1053');
INSERT INTO `stumanager_student` VALUES ('1054', '陈半谷', null, '互动160824班', '吴开权', null, null, '15882020825', null, null, null, null, null, '1476104822723', '0.0.0.0', null, 'admin', null, '1054');
INSERT INTO `stumanager_student` VALUES ('1055', '唐棋', null, '互动160824班', '吴开权', null, null, '15708323405', null, null, null, null, null, '1476104822724', '0.0.0.0', null, 'admin', null, '1055');
INSERT INTO `stumanager_student` VALUES ('1056', '李啸峰', null, '互动160824班', '吴开权', null, null, '18200107027', null, null, null, null, null, '1476104822726', '0.0.0.0', null, 'admin', null, '1056');
INSERT INTO `stumanager_student` VALUES ('1057', '徐宏杰', null, '互动160824班', '吴开权', null, null, '18910706446', null, null, null, null, null, '1476104822732', '0.0.0.0', null, 'admin', null, '1057');
INSERT INTO `stumanager_student` VALUES ('1058', '降初', null, '互动160824班', '吴开权', null, null, '18782492547', null, null, null, null, null, '1476104822733', '0.0.0.0', null, 'admin', null, '1058');
INSERT INTO `stumanager_student` VALUES ('1059', '付文豪', null, '互动160824班', '吴开权', null, null, '13088028025', null, null, null, null, null, '1476104822735', '0.0.0.0', null, 'admin', null, '1059');
INSERT INTO `stumanager_student` VALUES ('1060', '赵芮', null, '互动160824班', '吴开权', null, null, '18280228720', null, null, null, null, null, '1476104822736', '0.0.0.0', null, 'admin', null, '1060');
INSERT INTO `stumanager_student` VALUES ('1061', '叶林峰', null, '互动160824班', '吴开权', null, null, '13882123157', null, null, null, null, null, '1476104822737', '0.0.0.0', null, 'admin', null, '1061');
INSERT INTO `stumanager_student` VALUES ('1062', '吴豪', null, '互动160824班', '吴开权', null, null, '18302815357', null, null, null, null, null, '1476104822738', '0.0.0.0', null, 'admin', null, '1062');
INSERT INTO `stumanager_student` VALUES ('1063', '曾传标', null, '互动160824班', '吴开权', null, null, '18798643934', null, null, null, null, null, '1476104822739', '0.0.0.0', null, 'admin', null, '1063');
INSERT INTO `stumanager_student` VALUES ('1064', '王才渊', null, '互动160824班', '吴开权', null, null, '15760679957', null, null, null, null, null, '1476104822741', '0.0.0.0', null, 'admin', null, '1064');
INSERT INTO `stumanager_student` VALUES ('1065', '陶浩', null, '互动160824班', '吴开权', null, null, '13699060456', null, null, null, null, null, '1476104822742', '0.0.0.0', null, 'admin', null, '1065');
INSERT INTO `stumanager_student` VALUES ('1066', '吴雨轩', null, '互动160921班', '邹朋', null, null, '13657582555', null, null, null, null, null, '1476104822747', '0.0.0.0', null, 'admin', null, '1066');
INSERT INTO `stumanager_student` VALUES ('1067', '王俊力', null, '互动160921班', '邹朋', null, null, '15982453370', null, null, null, null, null, '1476104822749', '0.0.0.0', null, 'admin', null, '1067');
INSERT INTO `stumanager_student` VALUES ('1068', '田秦', null, '互动160921班', '邹朋', null, null, '18699767332', null, null, null, null, null, '1476104822750', '0.0.0.0', null, 'admin', null, '1068');
INSERT INTO `stumanager_student` VALUES ('1069', '邓宏伟', null, '互动160921班', '邹朋', null, null, '18728897244', null, null, null, null, null, '1476104822751', '0.0.0.0', null, 'admin', null, '1069');
INSERT INTO `stumanager_student` VALUES ('1070', '梁德强', null, '互动160921班', '邹朋', null, null, '18782067209', null, null, null, null, null, '1476104822753', '0.0.0.0', null, 'admin', null, '1070');
INSERT INTO `stumanager_student` VALUES ('1071', '张月', null, '互动160921班', '邹朋', null, null, '13551240694', null, null, null, null, null, '1476104822754', '0.0.0.0', null, 'admin', null, '1071');
INSERT INTO `stumanager_student` VALUES ('1072', '钟彩斌', null, '互动160921班', '邹朋', null, null, '18580428242', null, null, null, null, null, '1476104822755', '0.0.0.0', null, 'admin', null, '1072');
INSERT INTO `stumanager_student` VALUES ('1073', '邓金山', null, '互动160921班', '邹朋', null, null, '18111420282', null, null, null, null, null, '1476104822757', '0.0.0.0', null, 'admin', null, '1073');
INSERT INTO `stumanager_student` VALUES ('1074', '何中华', null, '互动160921班', '邹朋', null, null, '18382265497', null, null, null, null, null, '1476104822758', '0.0.0.0', null, 'admin', null, '1074');
INSERT INTO `stumanager_student` VALUES ('1075', '陈泗好', null, '互动160921班', '邹朋', null, null, '13678203476', null, null, null, null, null, '1476104822759', '0.0.0.0', null, 'admin', null, '1075');
INSERT INTO `stumanager_student` VALUES ('1076', '刘辉阳', null, '互动160921班', '邹朋', null, null, '15928040671', null, null, null, null, null, '1476104822761', '0.0.0.0', null, 'admin', null, '1076');
INSERT INTO `stumanager_student` VALUES ('1080', '祝逸翔', null, '互动161031班', '邹朋', null, null, '13699428133', null, null, null, null, null, '1478941990811', '0.0.0.0', null, 'admin', null, '1080');
INSERT INTO `stumanager_student` VALUES ('1081', '李斐斐', null, '互动161031班', '邹朋', null, null, '15928668512', null, null, null, null, null, '1478941990819', '0.0.0.0', null, 'admin', null, '1081');
INSERT INTO `stumanager_student` VALUES ('1082', '袁军', null, '互动161031班', '邹朋', null, null, '15982324957', null, null, null, null, null, '1478941990820', '0.0.0.0', null, 'admin', null, '1082');
INSERT INTO `stumanager_student` VALUES ('1083', '粟彬洋', null, '互动161031班', '邹朋', null, null, '15982357680', null, null, null, null, null, '1478941990822', '0.0.0.0', null, 'admin', null, '1083');
INSERT INTO `stumanager_student` VALUES ('1084', '赵卫卫', null, '互动161031班', '邹朋', null, null, '13036673778', null, null, null, null, null, '1478941990824', '0.0.0.0', null, 'admin', null, '1084');
INSERT INTO `stumanager_student` VALUES ('1085', '周游力', null, '互动161031班', '邹朋', null, null, '17781838550', null, null, null, null, null, '1478941990826', '0.0.0.0', null, 'admin', null, '1085');
INSERT INTO `stumanager_student` VALUES ('1086', '牟国清', null, '互动161031班', '邹朋', null, null, '13980793537', null, null, null, null, null, '1478941990827', '0.0.0.0', null, 'admin', null, '1086');
INSERT INTO `stumanager_student` VALUES ('1087', '赖彦希', null, '互动161031班', '邹朋', null, null, '18208177189', null, null, null, null, null, '1478941990829', '0.0.0.0', null, 'admin', null, '1087');
INSERT INTO `stumanager_student` VALUES ('1088', '李耀', null, '互动161031班', '邹朋', null, null, '18782200651', null, null, null, null, null, '1478941990832', '0.0.0.0', null, 'admin', null, '1088');
INSERT INTO `stumanager_student` VALUES ('1089', '曾朝愉', null, '互动161031班', '邹朋', null, null, '18183220660', null, null, null, null, null, '1478941990833', '0.0.0.0', null, 'admin', null, '1089');
INSERT INTO `stumanager_student` VALUES ('1090', '任珂平', null, '互动161031班', '邹朋', null, null, '13518134579', null, null, null, null, null, '1478941990835', '0.0.0.0', null, 'admin', null, '1090');
INSERT INTO `stumanager_student` VALUES ('1091', '王飞', null, '互动161031班', '邹朋', null, null, '18180711696', null, null, null, null, null, '1478941990837', '0.0.0.0', null, 'admin', null, '1091');

-- ----------------------------
-- Table structure for `stumanager_student_copy`
-- ----------------------------
DROP TABLE IF EXISTS `stumanager_student_copy`;
CREATE TABLE `stumanager_student_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `classId` int(11) DEFAULT NULL,
  `className` varchar(20) DEFAULT NULL,
  `tutor` varchar(20) DEFAULT NULL,
  `tutorId` int(11) DEFAULT NULL COMMENT '辅导老师',
  `subject` int(11) DEFAULT NULL COMMENT '学习科目',
  `contactInformation` varchar(255) DEFAULT '' COMMENT '联系方式',
  `admission` bigint(20) DEFAULT NULL COMMENT '入学时间',
  `credit` int(11) DEFAULT NULL COMMENT '学分',
  `grade` int(11) DEFAULT NULL COMMENT '成绩',
  `state` varchar(255) DEFAULT NULL COMMENT '状态',
  `employment` varchar(255) DEFAULT NULL COMMENT '就业跟踪',
  `createTime` bigint(20) DEFAULT NULL COMMENT '用户创建时间',
  `ip` varchar(20) DEFAULT '0.0.0.0' COMMENT '最后登录的ip地址',
  `operaterId` int(11) DEFAULT NULL COMMENT '操作人',
  `operater` varchar(20) DEFAULT 'admin',
  `consultantId` int(20) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `classId` (`tutorId`)
) ENGINE=InnoDB AUTO_INCREMENT=1092 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_student_copy
-- ----------------------------
INSERT INTO `stumanager_student_copy` VALUES ('1001', '唐廷超', null, '互动160524班', '邬红旭', null, null, '18708172148', null, null, null, null, null, '1476104822118', '0.0.0.0', null, 'admin', null, '1001');
INSERT INTO `stumanager_student_copy` VALUES ('1002', '李群锋', null, '互动160524班', '邬红旭', null, null, '15576782772', null, null, null, null, null, '1476104822573', '0.0.0.0', null, 'admin', null, '1002');
INSERT INTO `stumanager_student_copy` VALUES ('1003', '郭松林', null, '互动160524班', '邬红旭', null, null, '18631123385', null, null, null, null, null, '1476104822585', '0.0.0.0', null, 'admin', null, '1003');
INSERT INTO `stumanager_student_copy` VALUES ('1004', '杨露', null, '互动160524班', '邬红旭', null, null, '18782232826', null, null, null, null, null, '1476104822587', '0.0.0.0', null, 'admin', null, '1004');
INSERT INTO `stumanager_student_copy` VALUES ('1005', '蒋佳才', null, '互动160524班', '邬红旭', null, null, '18030608096', null, null, null, null, null, '1476104822588', '0.0.0.0', null, 'admin', null, '1005');
INSERT INTO `stumanager_student_copy` VALUES ('1006', '武诣宏', null, '互动160524班', '邬红旭', null, null, '18081034195', null, null, null, null, null, '1476104822590', '0.0.0.0', null, 'admin', null, '1006');
INSERT INTO `stumanager_student_copy` VALUES ('1007', '吕才宏', null, '互动160621班', '吴开权', null, null, '13683431424', null, null, null, null, null, '1476104822591', '0.0.0.0', null, 'admin', null, '1007');
INSERT INTO `stumanager_student_copy` VALUES ('1008', '蔡炯', null, '互动160621班', '吴开权', null, null, '13540542887', null, null, null, null, null, '1476104822592', '0.0.0.0', null, 'admin', null, '1008');
INSERT INTO `stumanager_student_copy` VALUES ('1009', '陈佳磊', null, '互动160621班', '吴开权', null, null, '18398605299', null, null, null, null, null, '1476104822594', '0.0.0.0', null, 'admin', null, '1009');
INSERT INTO `stumanager_student_copy` VALUES ('1010', '黄康', null, '互动160621班', '吴开权', null, null, '13982185735', null, null, null, null, null, '1476104822595', '0.0.0.0', null, 'admin', null, '1010');
INSERT INTO `stumanager_student_copy` VALUES ('1011', '韩枫', null, '互动160621班', '吴开权', null, null, '13699607283', null, null, null, null, null, '1476104822596', '0.0.0.0', null, 'admin', null, '1011');
INSERT INTO `stumanager_student_copy` VALUES ('1012', '李佳树', null, '互动160621班', '吴开权', null, null, '18349263790', null, null, null, null, null, '1476104822599', '0.0.0.0', null, 'admin', null, '1012');
INSERT INTO `stumanager_student_copy` VALUES ('1013', '卢凯', null, '互动160621班', '吴开权', null, null, '18200203436', null, null, null, null, null, '1476104822601', '0.0.0.0', null, 'admin', null, '1013');
INSERT INTO `stumanager_student_copy` VALUES ('1014', '刘旭', null, '互动160621班', '吴开权', null, null, '15928110162', null, null, null, null, null, '1476104822605', '0.0.0.0', null, 'admin', null, '1014');
INSERT INTO `stumanager_student_copy` VALUES ('1015', '张丰', null, '互动160621班', '吴开权', null, null, '18227583795', null, null, null, null, null, '1476104822606', '0.0.0.0', null, 'admin', null, '1015');
INSERT INTO `stumanager_student_copy` VALUES ('1016', '田小辉', null, '互动160621班', '吴开权', null, null, '15708420080', null, null, null, null, null, '1476104822608', '0.0.0.0', null, 'admin', null, '1016');
INSERT INTO `stumanager_student_copy` VALUES ('1017', '叶开', null, '互动160621班', '吴开权', null, null, '18408238639', null, null, null, null, null, '1476104822610', '0.0.0.0', null, 'admin', null, '1017');
INSERT INTO `stumanager_student_copy` VALUES ('1018', '邱强', null, '互动160621班', '吴开权', null, null, '18380448697', null, null, null, null, null, '1476104822615', '0.0.0.0', null, 'admin', null, '1018');
INSERT INTO `stumanager_student_copy` VALUES ('1019', '王从文', null, '互动160621班', '吴开权', null, null, '15070873243', null, null, null, null, null, '1476104822616', '0.0.0.0', null, 'admin', null, '1019');
INSERT INTO `stumanager_student_copy` VALUES ('1020', '曾力', null, '互动160621班', '吴开权', null, null, '18583948156', null, null, null, null, null, '1476104822617', '0.0.0.0', null, 'admin', null, '1020');
INSERT INTO `stumanager_student_copy` VALUES ('1021', '舒强', null, '互动160621班', '吴开权', null, null, '18380447421', null, null, null, null, null, '1476104822619', '0.0.0.0', null, 'admin', null, '1021');
INSERT INTO `stumanager_student_copy` VALUES ('1022', '孙磊', null, '互动160621班', '吴开权', null, null, '13540195068', null, null, null, null, null, '1476104822620', '0.0.0.0', null, 'admin', null, '1022');
INSERT INTO `stumanager_student_copy` VALUES ('1023', '何敬轩', null, '互动160621班', '吴开权', null, null, '15108384620', null, null, null, null, null, '1476104822621', '0.0.0.0', null, 'admin', null, '1023');
INSERT INTO `stumanager_student_copy` VALUES ('1024', '孙磊1', null, '互动160621班', '吴开权', null, null, '18584053968', null, null, null, null, null, '1476104822622', '0.0.0.0', null, 'admin', null, '1024');
INSERT INTO `stumanager_student_copy` VALUES ('1025', '黄晨', null, '互动160621班', '吴开权', null, null, '15281075743', null, null, null, null, null, '1476104822624', '0.0.0.0', null, 'admin', null, '1025');
INSERT INTO `stumanager_student_copy` VALUES ('1026', '李建君', null, '互动160621班', '吴开权', null, null, '15828672627', null, null, null, null, null, '1476104822625', '0.0.0.0', null, 'admin', null, '1026');
INSERT INTO `stumanager_student_copy` VALUES ('1027', '唐志豪', null, '互动160621班', '吴开权', null, null, '18180714905', null, null, null, null, null, '1476104822652', '0.0.0.0', null, 'admin', null, '1027');
INSERT INTO `stumanager_student_copy` VALUES ('1028', '姚永科', null, '互动160621班', '吴开权', null, null, '15528152447', null, null, null, null, null, '1476104822653', '0.0.0.0', null, 'admin', null, '1028');
INSERT INTO `stumanager_student_copy` VALUES ('1029', '黄文彬', null, '互动160621班', '吴开权', null, null, '18208142097', null, null, null, null, null, '1476104822654', '0.0.0.0', null, 'admin', null, '1029');
INSERT INTO `stumanager_student_copy` VALUES ('1030', '陈虎', null, '互动160621班', '吴开权', null, null, '13730650634', null, null, null, null, null, '1476104822656', '0.0.0.0', null, 'admin', null, '1030');
INSERT INTO `stumanager_student_copy` VALUES ('1031', '何映飞', null, '互动160621班', '吴开权', null, null, '18728839138', null, null, null, null, null, '1476104822657', '0.0.0.0', null, 'admin', null, '1031');
INSERT INTO `stumanager_student_copy` VALUES ('1032', '高磊', null, '互动160621班', '吴开权', null, null, '18080451244', null, null, null, null, null, '1476104822659', '0.0.0.0', null, 'admin', null, '1032');
INSERT INTO `stumanager_student_copy` VALUES ('1033', '林萌', null, '互动160621班', '吴开权', null, null, '15386652410', null, null, null, null, null, '1476104822662', '0.0.0.0', null, 'admin', null, '1033');
INSERT INTO `stumanager_student_copy` VALUES ('1034', '沈磊', null, '互动160621班', '吴开权', null, null, '18781974479', null, null, null, null, null, '1476104822664', '0.0.0.0', null, 'admin', null, '1034');
INSERT INTO `stumanager_student_copy` VALUES ('1035', '陈渊', null, '互动160621班', '吴开权', null, null, '18106114060', null, null, null, null, null, '1476104822665', '0.0.0.0', null, 'admin', null, '1035');
INSERT INTO `stumanager_student_copy` VALUES ('1036', '段鹏', null, '互动160719班', '马吉', null, null, '18161224506', null, null, null, null, null, '1476104822669', '0.0.0.0', null, 'admin', null, '1036');
INSERT INTO `stumanager_student_copy` VALUES ('1037', '黎民忠', null, '互动160719班', '马吉', null, null, '18227810752', null, null, null, null, null, '1476104822674', '0.0.0.0', null, 'admin', null, '1037');
INSERT INTO `stumanager_student_copy` VALUES ('1038', '卢福川', null, '互动160719班', '马吉', null, null, '18111029527', null, null, null, null, null, '1476104822680', '0.0.0.0', null, 'admin', null, '1038');
INSERT INTO `stumanager_student_copy` VALUES ('1039', '孙建雄', null, '互动160719班', '马吉', null, null, '15883979776', null, null, null, null, null, '1476104822682', '0.0.0.0', null, 'admin', null, '1039');
INSERT INTO `stumanager_student_copy` VALUES ('1040', '姜鑫鹏', null, '互动160719班', '马吉', null, null, '13730638251', null, null, null, null, null, '1476104822683', '0.0.0.0', null, 'admin', null, '1040');
INSERT INTO `stumanager_student_copy` VALUES ('1041', '姚涛', null, '互动160719班', '马吉', null, null, '13388124102', null, null, null, null, null, '1476104822686', '0.0.0.0', null, 'admin', null, '1041');
INSERT INTO `stumanager_student_copy` VALUES ('1042', '王家兴', null, '互动160719班', '马吉', null, null, '18215587363', null, null, null, null, null, '1476104822687', '0.0.0.0', null, 'admin', null, '1042');
INSERT INTO `stumanager_student_copy` VALUES ('1043', '易杰', null, '互动160719班', '马吉', null, null, '15184481369', null, null, null, null, null, '1476104822688', '0.0.0.0', null, 'admin', null, '1043');
INSERT INTO `stumanager_student_copy` VALUES ('1044', '李忠原', null, '互动160719班', '马吉', null, null, '15281025582', null, null, null, null, null, '1476104822698', '0.0.0.0', null, 'admin', null, '1044');
INSERT INTO `stumanager_student_copy` VALUES ('1045', '谭佳敏', null, '互动160719班', '马吉', null, null, '18200396402', null, null, null, null, null, '1476104822701', '0.0.0.0', null, 'admin', null, '1045');
INSERT INTO `stumanager_student_copy` VALUES ('1046', '吕金泉', null, '互动160719班', '马吉', null, null, '18482105738', null, null, null, null, null, '1476104822702', '0.0.0.0', null, 'admin', null, '1046');
INSERT INTO `stumanager_student_copy` VALUES ('1047', '刘朝', null, '互动160719班', '马吉', null, null, '18780097106', null, null, null, null, null, '1476104822715', '0.0.0.0', null, 'admin', null, '1047');
INSERT INTO `stumanager_student_copy` VALUES ('1048', '刘萌', null, '互动160719班', '马吉', null, null, '18215673679', null, null, null, null, null, '1476104822716', '0.0.0.0', null, 'admin', null, '1048');
INSERT INTO `stumanager_student_copy` VALUES ('1049', '黎翔', null, '互动160824班', '吴开权', null, null, '15884592322', null, null, null, null, null, '1476104822717', '0.0.0.0', null, 'admin', null, '1049');
INSERT INTO `stumanager_student_copy` VALUES ('1050', '刘元', null, '互动160824班', '吴开权', null, null, '13980454445', null, null, null, null, null, '1476104822718', '0.0.0.0', null, 'admin', null, '1050');
INSERT INTO `stumanager_student_copy` VALUES ('1051', '胡明', null, '互动160824班', '吴开权', null, null, '15284015158', null, null, null, null, null, '1476104822719', '0.0.0.0', null, 'admin', null, '1051');
INSERT INTO `stumanager_student_copy` VALUES ('1052', '任传岗', null, '互动160824班', '吴开权', null, null, '18349154702', null, null, null, null, null, '1476104822721', '0.0.0.0', null, 'admin', null, '1052');
INSERT INTO `stumanager_student_copy` VALUES ('1053', '张义武', null, '互动160824班', '吴开权', null, null, '18349349371', null, null, null, null, null, '1476104822722', '0.0.0.0', null, 'admin', null, '1053');
INSERT INTO `stumanager_student_copy` VALUES ('1054', '陈半谷', null, '互动160824班', '吴开权', null, null, '15882020825', null, null, null, null, null, '1476104822723', '0.0.0.0', null, 'admin', null, '1054');
INSERT INTO `stumanager_student_copy` VALUES ('1055', '唐棋', null, '互动160824班', '吴开权', null, null, '15708323405', null, null, null, null, null, '1476104822724', '0.0.0.0', null, 'admin', null, '1055');
INSERT INTO `stumanager_student_copy` VALUES ('1056', '李啸峰', null, '互动160824班', '吴开权', null, null, '18200107027', null, null, null, null, null, '1476104822726', '0.0.0.0', null, 'admin', null, '1056');
INSERT INTO `stumanager_student_copy` VALUES ('1057', '徐宏杰', null, '互动160824班', '吴开权', null, null, '18910706446', null, null, null, null, null, '1476104822732', '0.0.0.0', null, 'admin', null, '1057');
INSERT INTO `stumanager_student_copy` VALUES ('1058', '降初', null, '互动160824班', '吴开权', null, null, '18782492547', null, null, null, null, null, '1476104822733', '0.0.0.0', null, 'admin', null, '1058');
INSERT INTO `stumanager_student_copy` VALUES ('1059', '付文豪', null, '互动160824班', '吴开权', null, null, '13088028025', null, null, null, null, null, '1476104822735', '0.0.0.0', null, 'admin', null, '1059');
INSERT INTO `stumanager_student_copy` VALUES ('1060', '赵芮', null, '互动160824班', '吴开权', null, null, '18280228720', null, null, null, null, null, '1476104822736', '0.0.0.0', null, 'admin', null, '1060');
INSERT INTO `stumanager_student_copy` VALUES ('1061', '叶林峰', null, '互动160824班', '吴开权', null, null, '13882123157', null, null, null, null, null, '1476104822737', '0.0.0.0', null, 'admin', null, '1061');
INSERT INTO `stumanager_student_copy` VALUES ('1062', '吴豪', null, '互动160824班', '吴开权', null, null, '18302815357', null, null, null, null, null, '1476104822738', '0.0.0.0', null, 'admin', null, '1062');
INSERT INTO `stumanager_student_copy` VALUES ('1063', '曾传标', null, '互动160824班', '吴开权', null, null, '18798643934', null, null, null, null, null, '1476104822739', '0.0.0.0', null, 'admin', null, '1063');
INSERT INTO `stumanager_student_copy` VALUES ('1064', '王才渊', null, '互动160824班', '吴开权', null, null, '15760679957', null, null, null, null, null, '1476104822741', '0.0.0.0', null, 'admin', null, '1064');
INSERT INTO `stumanager_student_copy` VALUES ('1065', '陶浩', null, '互动160824班', '吴开权', null, null, '13699060456', null, null, null, null, null, '1476104822742', '0.0.0.0', null, 'admin', null, '1065');
INSERT INTO `stumanager_student_copy` VALUES ('1066', '吴雨轩', null, '互动160921班', '邹朋', null, null, '13657582555', null, null, null, null, null, '1476104822747', '0.0.0.0', null, 'admin', null, '1066');
INSERT INTO `stumanager_student_copy` VALUES ('1067', '王俊力', null, '互动160921班', '邹朋', null, null, '15982453370', null, null, null, null, null, '1476104822749', '0.0.0.0', null, 'admin', null, '1067');
INSERT INTO `stumanager_student_copy` VALUES ('1068', '田秦', null, '互动160921班', '邹朋', null, null, '18699767332', null, null, null, null, null, '1476104822750', '0.0.0.0', null, 'admin', null, '1068');
INSERT INTO `stumanager_student_copy` VALUES ('1069', '邓宏伟', null, '互动160921班', '邹朋', null, null, '18728897244', null, null, null, null, null, '1476104822751', '0.0.0.0', null, 'admin', null, '1069');
INSERT INTO `stumanager_student_copy` VALUES ('1070', '梁德强', null, '互动160921班', '邹朋', null, null, '18782067209', null, null, null, null, null, '1476104822753', '0.0.0.0', null, 'admin', null, '1070');
INSERT INTO `stumanager_student_copy` VALUES ('1071', '张月', null, '互动160921班', '邹朋', null, null, '13551240694', null, null, null, null, null, '1476104822754', '0.0.0.0', null, 'admin', null, '1071');
INSERT INTO `stumanager_student_copy` VALUES ('1072', '钟彩斌', null, '互动160921班', '邹朋', null, null, '18580428242', null, null, null, null, null, '1476104822755', '0.0.0.0', null, 'admin', null, '1072');
INSERT INTO `stumanager_student_copy` VALUES ('1073', '邓金山', null, '互动160921班', '邹朋', null, null, '18111420282', null, null, null, null, null, '1476104822757', '0.0.0.0', null, 'admin', null, '1073');
INSERT INTO `stumanager_student_copy` VALUES ('1074', '何中华', null, '互动160921班', '邹朋', null, null, '18382265497', null, null, null, null, null, '1476104822758', '0.0.0.0', null, 'admin', null, '1074');
INSERT INTO `stumanager_student_copy` VALUES ('1075', '陈泗好', null, '互动160921班', '邹朋', null, null, '13678203476', null, null, null, null, null, '1476104822759', '0.0.0.0', null, 'admin', null, '1075');
INSERT INTO `stumanager_student_copy` VALUES ('1076', '刘辉阳', null, '互动160921班', '邹朋', null, null, '15928040671', null, null, null, null, null, '1476104822761', '0.0.0.0', null, 'admin', null, '1076');
INSERT INTO `stumanager_student_copy` VALUES ('1080', '祝逸翔', null, '互动161031班', '邹朋', null, null, '13699428133', null, null, null, null, null, '1478941990811', '0.0.0.0', null, 'admin', null, '1080');
INSERT INTO `stumanager_student_copy` VALUES ('1081', '李斐斐', null, '互动161031班', '邹朋', null, null, '15928668512', null, null, null, null, null, '1478941990819', '0.0.0.0', null, 'admin', null, '1081');
INSERT INTO `stumanager_student_copy` VALUES ('1082', '袁军', null, '互动161031班', '邹朋', null, null, '15982324957', null, null, null, null, null, '1478941990820', '0.0.0.0', null, 'admin', null, '1082');
INSERT INTO `stumanager_student_copy` VALUES ('1083', '粟彬洋', null, '互动161031班', '邹朋', null, null, '15982357680', null, null, null, null, null, '1478941990822', '0.0.0.0', null, 'admin', null, '1083');
INSERT INTO `stumanager_student_copy` VALUES ('1084', '赵卫卫', null, '互动161031班', '邹朋', null, null, '13036673778', null, null, null, null, null, '1478941990824', '0.0.0.0', null, 'admin', null, '1084');
INSERT INTO `stumanager_student_copy` VALUES ('1085', '周游力', null, '互动161031班', '邹朋', null, null, '17781838550', null, null, null, null, null, '1478941990826', '0.0.0.0', null, 'admin', null, '1085');
INSERT INTO `stumanager_student_copy` VALUES ('1086', '牟国清', null, '互动161031班', '邹朋', null, null, '13980793537', null, null, null, null, null, '1478941990827', '0.0.0.0', null, 'admin', null, '1086');
INSERT INTO `stumanager_student_copy` VALUES ('1087', '赖彦希', null, '互动161031班', '邹朋', null, null, '18208177189', null, null, null, null, null, '1478941990829', '0.0.0.0', null, 'admin', null, '1087');
INSERT INTO `stumanager_student_copy` VALUES ('1088', '李耀', null, '互动161031班', '邹朋', null, null, '18782200651', null, null, null, null, null, '1478941990832', '0.0.0.0', null, 'admin', null, '1088');
INSERT INTO `stumanager_student_copy` VALUES ('1089', '曾朝愉', null, '互动161031班', '邹朋', null, null, '18183220660', null, null, null, null, null, '1478941990833', '0.0.0.0', null, 'admin', null, '1089');
INSERT INTO `stumanager_student_copy` VALUES ('1090', '任珂平', null, '互动161031班', '邹朋', null, null, '13518134579', null, null, null, null, null, '1478941990835', '0.0.0.0', null, 'admin', null, '1090');
INSERT INTO `stumanager_student_copy` VALUES ('1091', '王飞', null, '互动161031班', '邹朋', null, null, '18180711696', null, null, null, null, null, '1478941990837', '0.0.0.0', null, 'admin', null, '1091');

-- ----------------------------
-- Table structure for `stumanager_student_copy1`
-- ----------------------------
DROP TABLE IF EXISTS `stumanager_student_copy1`;
CREATE TABLE `stumanager_student_copy1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `classId` int(11) DEFAULT NULL,
  `className` varchar(20) DEFAULT NULL,
  `tutor` varchar(20) DEFAULT NULL,
  `tutorId` int(11) DEFAULT NULL COMMENT '辅导老师',
  `subject` int(11) DEFAULT NULL COMMENT '学习科目',
  `contactInformation` varchar(255) DEFAULT '' COMMENT '联系方式',
  `admission` bigint(20) DEFAULT NULL COMMENT '入学时间',
  `credit` int(11) DEFAULT NULL COMMENT '学分',
  `grade` int(11) DEFAULT NULL COMMENT '成绩',
  `state` varchar(255) DEFAULT NULL COMMENT '状态',
  `employment` varchar(255) DEFAULT NULL COMMENT '就业跟踪',
  `createTime` bigint(20) DEFAULT NULL COMMENT '用户创建时间',
  `ip` varchar(20) DEFAULT '0.0.0.0' COMMENT '最后登录的ip地址',
  `operaterId` int(11) DEFAULT NULL COMMENT '操作人',
  `operater` varchar(20) DEFAULT 'admin',
  `consultantId` int(20) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `classId` (`tutorId`)
) ENGINE=InnoDB AUTO_INCREMENT=1092 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_student_copy1
-- ----------------------------
INSERT INTO `stumanager_student_copy1` VALUES ('1001', '唐廷超', null, '互动160524班', '邬红旭', null, null, '18708172148', null, null, null, null, null, '1476104822118', '0.0.0.0', null, 'admin', null, '1001');
INSERT INTO `stumanager_student_copy1` VALUES ('1002', '李群锋', null, '互动160524班', '邬红旭', null, null, '15576782772', null, null, null, null, null, '1476104822573', '0.0.0.0', null, 'admin', null, '1002');
INSERT INTO `stumanager_student_copy1` VALUES ('1003', '郭松林', null, '互动160524班', '邬红旭', null, null, '18631123385', null, null, null, null, null, '1476104822585', '0.0.0.0', null, 'admin', null, '1003');
INSERT INTO `stumanager_student_copy1` VALUES ('1004', '杨露', null, '互动160524班', '邬红旭', null, null, '18782232826', null, null, null, null, null, '1476104822587', '0.0.0.0', null, 'admin', null, '1004');
INSERT INTO `stumanager_student_copy1` VALUES ('1005', '蒋佳才', null, '互动160524班', '邬红旭', null, null, '18030608096', null, null, null, null, null, '1476104822588', '0.0.0.0', null, 'admin', null, '1005');
INSERT INTO `stumanager_student_copy1` VALUES ('1006', '武诣宏', null, '互动160524班', '邬红旭', null, null, '18081034195', null, null, null, null, null, '1476104822590', '0.0.0.0', null, 'admin', null, '1006');
INSERT INTO `stumanager_student_copy1` VALUES ('1007', '吕才宏', null, '互动160621班', '吴开权', null, null, '13683431424', null, null, null, null, null, '1476104822591', '0.0.0.0', null, 'admin', null, '1007');
INSERT INTO `stumanager_student_copy1` VALUES ('1008', '蔡炯', null, '互动160621班', '吴开权', null, null, '13540542887', null, null, null, null, null, '1476104822592', '0.0.0.0', null, 'admin', null, '1008');
INSERT INTO `stumanager_student_copy1` VALUES ('1009', '陈佳磊', null, '互动160621班', '吴开权', null, null, '18398605299', null, null, null, null, null, '1476104822594', '0.0.0.0', null, 'admin', null, '1009');
INSERT INTO `stumanager_student_copy1` VALUES ('1010', '黄康', null, '互动160621班', '吴开权', null, null, '13982185735', null, null, null, null, null, '1476104822595', '0.0.0.0', null, 'admin', null, '1010');
INSERT INTO `stumanager_student_copy1` VALUES ('1011', '韩枫', null, '互动160621班', '吴开权', null, null, '13699607283', null, null, null, null, null, '1476104822596', '0.0.0.0', null, 'admin', null, '1011');
INSERT INTO `stumanager_student_copy1` VALUES ('1012', '李佳树', null, '互动160621班', '吴开权', null, null, '18349263790', null, null, null, null, null, '1476104822599', '0.0.0.0', null, 'admin', null, '1012');
INSERT INTO `stumanager_student_copy1` VALUES ('1013', '卢凯', null, '互动160621班', '吴开权', null, null, '18200203436', null, null, null, null, null, '1476104822601', '0.0.0.0', null, 'admin', null, '1013');
INSERT INTO `stumanager_student_copy1` VALUES ('1014', '刘旭', null, '互动160621班', '吴开权', null, null, '15928110162', null, null, null, null, null, '1476104822605', '0.0.0.0', null, 'admin', null, '1014');
INSERT INTO `stumanager_student_copy1` VALUES ('1015', '张丰', null, '互动160621班', '吴开权', null, null, '18227583795', null, null, null, null, null, '1476104822606', '0.0.0.0', null, 'admin', null, '1015');
INSERT INTO `stumanager_student_copy1` VALUES ('1016', '田小辉', null, '互动160621班', '吴开权', null, null, '15708420080', null, null, null, null, null, '1476104822608', '0.0.0.0', null, 'admin', null, '1016');
INSERT INTO `stumanager_student_copy1` VALUES ('1017', '叶开', null, '互动160621班', '吴开权', null, null, '18408238639', null, null, null, null, null, '1476104822610', '0.0.0.0', null, 'admin', null, '1017');
INSERT INTO `stumanager_student_copy1` VALUES ('1018', '邱强', null, '互动160621班', '吴开权', null, null, '18380448697', null, null, null, null, null, '1476104822615', '0.0.0.0', null, 'admin', null, '1018');
INSERT INTO `stumanager_student_copy1` VALUES ('1019', '王从文', null, '互动160621班', '吴开权', null, null, '15070873243', null, null, null, null, null, '1476104822616', '0.0.0.0', null, 'admin', null, '1019');
INSERT INTO `stumanager_student_copy1` VALUES ('1020', '曾力', null, '互动160621班', '吴开权', null, null, '18583948156', null, null, null, null, null, '1476104822617', '0.0.0.0', null, 'admin', null, '1020');
INSERT INTO `stumanager_student_copy1` VALUES ('1021', '舒强', null, '互动160621班', '吴开权', null, null, '18380447421', null, null, null, null, null, '1476104822619', '0.0.0.0', null, 'admin', null, '1021');
INSERT INTO `stumanager_student_copy1` VALUES ('1022', '孙磊', null, '互动160621班', '吴开权', null, null, '13540195068', null, null, null, null, null, '1476104822620', '0.0.0.0', null, 'admin', null, '1022');
INSERT INTO `stumanager_student_copy1` VALUES ('1023', '何敬轩', null, '互动160621班', '吴开权', null, null, '15108384620', null, null, null, null, null, '1476104822621', '0.0.0.0', null, 'admin', null, '1023');
INSERT INTO `stumanager_student_copy1` VALUES ('1024', '孙磊1', null, '互动160621班', '吴开权', null, null, '18584053968', null, null, null, null, null, '1476104822622', '0.0.0.0', null, 'admin', null, '1024');
INSERT INTO `stumanager_student_copy1` VALUES ('1025', '黄晨', null, '互动160621班', '吴开权', null, null, '15281075743', null, null, null, null, null, '1476104822624', '0.0.0.0', null, 'admin', null, '1025');
INSERT INTO `stumanager_student_copy1` VALUES ('1026', '李建君', null, '互动160621班', '吴开权', null, null, '15828672627', null, null, null, null, null, '1476104822625', '0.0.0.0', null, 'admin', null, '1026');
INSERT INTO `stumanager_student_copy1` VALUES ('1027', '唐志豪', null, '互动160621班', '吴开权', null, null, '18180714905', null, null, null, null, null, '1476104822652', '0.0.0.0', null, 'admin', null, '1027');
INSERT INTO `stumanager_student_copy1` VALUES ('1028', '姚永科', null, '互动160621班', '吴开权', null, null, '15528152447', null, null, null, null, null, '1476104822653', '0.0.0.0', null, 'admin', null, '1028');
INSERT INTO `stumanager_student_copy1` VALUES ('1029', '黄文彬', null, '互动160621班', '吴开权', null, null, '18208142097', null, null, null, null, null, '1476104822654', '0.0.0.0', null, 'admin', null, '1029');
INSERT INTO `stumanager_student_copy1` VALUES ('1030', '陈虎', null, '互动160621班', '吴开权', null, null, '13730650634', null, null, null, null, null, '1476104822656', '0.0.0.0', null, 'admin', null, '1030');
INSERT INTO `stumanager_student_copy1` VALUES ('1031', '何映飞', null, '互动160621班', '吴开权', null, null, '18728839138', null, null, null, null, null, '1476104822657', '0.0.0.0', null, 'admin', null, '1031');
INSERT INTO `stumanager_student_copy1` VALUES ('1032', '高磊', null, '互动160621班', '吴开权', null, null, '18080451244', null, null, null, null, null, '1476104822659', '0.0.0.0', null, 'admin', null, '1032');
INSERT INTO `stumanager_student_copy1` VALUES ('1033', '林萌', null, '互动160621班', '吴开权', null, null, '15386652410', null, null, null, null, null, '1476104822662', '0.0.0.0', null, 'admin', null, '1033');
INSERT INTO `stumanager_student_copy1` VALUES ('1034', '沈磊', null, '互动160621班', '吴开权', null, null, '18781974479', null, null, null, null, null, '1476104822664', '0.0.0.0', null, 'admin', null, '1034');
INSERT INTO `stumanager_student_copy1` VALUES ('1035', '陈渊', null, '互动160621班', '吴开权', null, null, '18106114060', null, null, null, null, null, '1476104822665', '0.0.0.0', null, 'admin', null, '1035');
INSERT INTO `stumanager_student_copy1` VALUES ('1036', '段鹏', null, '互动160719班', '马吉', null, null, '18161224506', null, null, null, null, null, '1476104822669', '0.0.0.0', null, 'admin', null, '1036');
INSERT INTO `stumanager_student_copy1` VALUES ('1037', '黎民忠', null, '互动160719班', '马吉', null, null, '18227810752', null, null, null, null, null, '1476104822674', '0.0.0.0', null, 'admin', null, '1037');
INSERT INTO `stumanager_student_copy1` VALUES ('1038', '卢福川', null, '互动160719班', '马吉', null, null, '18111029527', null, null, null, null, null, '1476104822680', '0.0.0.0', null, 'admin', null, '1038');
INSERT INTO `stumanager_student_copy1` VALUES ('1039', '孙建雄', null, '互动160719班', '马吉', null, null, '15883979776', null, null, null, null, null, '1476104822682', '0.0.0.0', null, 'admin', null, '1039');
INSERT INTO `stumanager_student_copy1` VALUES ('1040', '姜鑫鹏', null, '互动160719班', '马吉', null, null, '13730638251', null, null, null, null, null, '1476104822683', '0.0.0.0', null, 'admin', null, '1040');
INSERT INTO `stumanager_student_copy1` VALUES ('1041', '姚涛', null, '互动160719班', '马吉', null, null, '13388124102', null, null, null, null, null, '1476104822686', '0.0.0.0', null, 'admin', null, '1041');
INSERT INTO `stumanager_student_copy1` VALUES ('1042', '王家兴', null, '互动160719班', '马吉', null, null, '18215587363', null, null, null, null, null, '1476104822687', '0.0.0.0', null, 'admin', null, '1042');
INSERT INTO `stumanager_student_copy1` VALUES ('1043', '易杰', null, '互动160719班', '马吉', null, null, '15184481369', null, null, null, null, null, '1476104822688', '0.0.0.0', null, 'admin', null, '1043');
INSERT INTO `stumanager_student_copy1` VALUES ('1044', '李忠原', null, '互动160719班', '马吉', null, null, '15281025582', null, null, null, null, null, '1476104822698', '0.0.0.0', null, 'admin', null, '1044');
INSERT INTO `stumanager_student_copy1` VALUES ('1045', '谭佳敏', null, '互动160719班', '马吉', null, null, '18200396402', null, null, null, null, null, '1476104822701', '0.0.0.0', null, 'admin', null, '1045');
INSERT INTO `stumanager_student_copy1` VALUES ('1046', '吕金泉', null, '互动160719班', '马吉', null, null, '18482105738', null, null, null, null, null, '1476104822702', '0.0.0.0', null, 'admin', null, '1046');
INSERT INTO `stumanager_student_copy1` VALUES ('1047', '刘朝', null, '互动160719班', '马吉', null, null, '18780097106', null, null, null, null, null, '1476104822715', '0.0.0.0', null, 'admin', null, '1047');
INSERT INTO `stumanager_student_copy1` VALUES ('1048', '刘萌', null, '互动160719班', '马吉', null, null, '18215673679', null, null, null, null, null, '1476104822716', '0.0.0.0', null, 'admin', null, '1048');
INSERT INTO `stumanager_student_copy1` VALUES ('1049', '黎翔', null, '互动160824班', '吴开权', null, null, '15884592322', null, null, null, null, null, '1476104822717', '0.0.0.0', null, 'admin', null, '1049');
INSERT INTO `stumanager_student_copy1` VALUES ('1050', '刘元', null, '互动160824班', '吴开权', null, null, '13980454445', null, null, null, null, null, '1476104822718', '0.0.0.0', null, 'admin', null, '1050');
INSERT INTO `stumanager_student_copy1` VALUES ('1051', '胡明', null, '互动160824班', '吴开权', null, null, '15284015158', null, null, null, null, null, '1476104822719', '0.0.0.0', null, 'admin', null, '1051');
INSERT INTO `stumanager_student_copy1` VALUES ('1052', '任传岗', null, '互动160824班', '吴开权', null, null, '18349154702', null, null, null, null, null, '1476104822721', '0.0.0.0', null, 'admin', null, '1052');
INSERT INTO `stumanager_student_copy1` VALUES ('1053', '张义武', null, '互动160824班', '吴开权', null, null, '18349349371', null, null, null, null, null, '1476104822722', '0.0.0.0', null, 'admin', null, '1053');
INSERT INTO `stumanager_student_copy1` VALUES ('1054', '陈半谷', null, '互动160824班', '吴开权', null, null, '15882020825', null, null, null, null, null, '1476104822723', '0.0.0.0', null, 'admin', null, '1054');
INSERT INTO `stumanager_student_copy1` VALUES ('1055', '唐棋', null, '互动160824班', '吴开权', null, null, '15708323405', null, null, null, null, null, '1476104822724', '0.0.0.0', null, 'admin', null, '1055');
INSERT INTO `stumanager_student_copy1` VALUES ('1056', '李啸峰', null, '互动160824班', '吴开权', null, null, '18200107027', null, null, null, null, null, '1476104822726', '0.0.0.0', null, 'admin', null, '1056');
INSERT INTO `stumanager_student_copy1` VALUES ('1057', '徐宏杰', null, '互动160824班', '吴开权', null, null, '18910706446', null, null, null, null, null, '1476104822732', '0.0.0.0', null, 'admin', null, '1057');
INSERT INTO `stumanager_student_copy1` VALUES ('1058', '降初', null, '互动160824班', '吴开权', null, null, '18782492547', null, null, null, null, null, '1476104822733', '0.0.0.0', null, 'admin', null, '1058');
INSERT INTO `stumanager_student_copy1` VALUES ('1059', '付文豪', null, '互动160824班', '吴开权', null, null, '13088028025', null, null, null, null, null, '1476104822735', '0.0.0.0', null, 'admin', null, '1059');
INSERT INTO `stumanager_student_copy1` VALUES ('1060', '赵芮', null, '互动160824班', '吴开权', null, null, '18280228720', null, null, null, null, null, '1476104822736', '0.0.0.0', null, 'admin', null, '1060');
INSERT INTO `stumanager_student_copy1` VALUES ('1061', '叶林峰', null, '互动160824班', '吴开权', null, null, '13882123157', null, null, null, null, null, '1476104822737', '0.0.0.0', null, 'admin', null, '1061');
INSERT INTO `stumanager_student_copy1` VALUES ('1062', '吴豪', null, '互动160824班', '吴开权', null, null, '18302815357', null, null, null, null, null, '1476104822738', '0.0.0.0', null, 'admin', null, '1062');
INSERT INTO `stumanager_student_copy1` VALUES ('1063', '曾传标', null, '互动160824班', '吴开权', null, null, '18798643934', null, null, null, null, null, '1476104822739', '0.0.0.0', null, 'admin', null, '1063');
INSERT INTO `stumanager_student_copy1` VALUES ('1064', '王才渊', null, '互动160824班', '吴开权', null, null, '15760679957', null, null, null, null, null, '1476104822741', '0.0.0.0', null, 'admin', null, '1064');
INSERT INTO `stumanager_student_copy1` VALUES ('1065', '陶浩', null, '互动160824班', '吴开权', null, null, '13699060456', null, null, null, null, null, '1476104822742', '0.0.0.0', null, 'admin', null, '1065');
INSERT INTO `stumanager_student_copy1` VALUES ('1066', '吴雨轩', null, '互动160921班', '邹朋', null, null, '13657582555', null, null, null, null, null, '1476104822747', '0.0.0.0', null, 'admin', null, '1066');
INSERT INTO `stumanager_student_copy1` VALUES ('1067', '王俊力', null, '互动160921班', '邹朋', null, null, '15982453370', null, null, null, null, null, '1476104822749', '0.0.0.0', null, 'admin', null, '1067');
INSERT INTO `stumanager_student_copy1` VALUES ('1068', '田秦', null, '互动160921班', '邹朋', null, null, '18699767332', null, null, null, null, null, '1476104822750', '0.0.0.0', null, 'admin', null, '1068');
INSERT INTO `stumanager_student_copy1` VALUES ('1069', '邓宏伟', null, '互动160921班', '邹朋', null, null, '18728897244', null, null, null, null, null, '1476104822751', '0.0.0.0', null, 'admin', null, '1069');
INSERT INTO `stumanager_student_copy1` VALUES ('1070', '梁德强', null, '互动160921班', '邹朋', null, null, '18782067209', null, null, null, null, null, '1476104822753', '0.0.0.0', null, 'admin', null, '1070');
INSERT INTO `stumanager_student_copy1` VALUES ('1071', '张月', null, '互动160921班', '邹朋', null, null, '13551240694', null, null, null, null, null, '1476104822754', '0.0.0.0', null, 'admin', null, '1071');
INSERT INTO `stumanager_student_copy1` VALUES ('1072', '钟彩斌', null, '互动160921班', '邹朋', null, null, '18580428242', null, null, null, null, null, '1476104822755', '0.0.0.0', null, 'admin', null, '1072');
INSERT INTO `stumanager_student_copy1` VALUES ('1073', '邓金山', null, '互动160921班', '邹朋', null, null, '18111420282', null, null, null, null, null, '1476104822757', '0.0.0.0', null, 'admin', null, '1073');
INSERT INTO `stumanager_student_copy1` VALUES ('1074', '何中华', null, '互动160921班', '邹朋', null, null, '18382265497', null, null, null, null, null, '1476104822758', '0.0.0.0', null, 'admin', null, '1074');
INSERT INTO `stumanager_student_copy1` VALUES ('1075', '陈泗好', null, '互动160921班', '邹朋', null, null, '13678203476', null, null, null, null, null, '1476104822759', '0.0.0.0', null, 'admin', null, '1075');
INSERT INTO `stumanager_student_copy1` VALUES ('1076', '刘辉阳', null, '互动160921班', '邹朋', null, null, '15928040671', null, null, null, null, null, '1476104822761', '0.0.0.0', null, 'admin', null, '1076');
INSERT INTO `stumanager_student_copy1` VALUES ('1080', '祝逸翔', null, '互动161031班', '邹朋', null, null, '13699428133', null, null, null, null, null, '1478941990811', '0.0.0.0', null, 'admin', null, '1080');
INSERT INTO `stumanager_student_copy1` VALUES ('1081', '李斐斐', null, '互动161031班', '邹朋', null, null, '15928668512', null, null, null, null, null, '1478941990819', '0.0.0.0', null, 'admin', null, '1081');
INSERT INTO `stumanager_student_copy1` VALUES ('1082', '袁军', null, '互动161031班', '邹朋', null, null, '15982324957', null, null, null, null, null, '1478941990820', '0.0.0.0', null, 'admin', null, '1082');
INSERT INTO `stumanager_student_copy1` VALUES ('1083', '粟彬洋', null, '互动161031班', '邹朋', null, null, '15982357680', null, null, null, null, null, '1478941990822', '0.0.0.0', null, 'admin', null, '1083');
INSERT INTO `stumanager_student_copy1` VALUES ('1084', '赵卫卫', null, '互动161031班', '邹朋', null, null, '13036673778', null, null, null, null, null, '1478941990824', '0.0.0.0', null, 'admin', null, '1084');
INSERT INTO `stumanager_student_copy1` VALUES ('1085', '周游力', null, '互动161031班', '邹朋', null, null, '17781838550', null, null, null, null, null, '1478941990826', '0.0.0.0', null, 'admin', null, '1085');
INSERT INTO `stumanager_student_copy1` VALUES ('1086', '牟国清', null, '互动161031班', '邹朋', null, null, '13980793537', null, null, null, null, null, '1478941990827', '0.0.0.0', null, 'admin', null, '1086');
INSERT INTO `stumanager_student_copy1` VALUES ('1087', '赖彦希', null, '互动161031班', '邹朋', null, null, '18208177189', null, null, null, null, null, '1478941990829', '0.0.0.0', null, 'admin', null, '1087');
INSERT INTO `stumanager_student_copy1` VALUES ('1088', '李耀', null, '互动161031班', '邹朋', null, null, '18782200651', null, null, null, null, null, '1478941990832', '0.0.0.0', null, 'admin', null, '1088');
INSERT INTO `stumanager_student_copy1` VALUES ('1089', '曾朝愉', null, '互动161031班', '邹朋', null, null, '18183220660', null, null, null, null, null, '1478941990833', '0.0.0.0', null, 'admin', null, '1089');
INSERT INTO `stumanager_student_copy1` VALUES ('1090', '任珂平', null, '互动161031班', '邹朋', null, null, '13518134579', null, null, null, null, null, '1478941990835', '0.0.0.0', null, 'admin', null, '1090');
INSERT INTO `stumanager_student_copy1` VALUES ('1091', '王飞', null, '互动161031班', '邹朋', null, null, '18180711696', null, null, null, null, null, '1478941990837', '0.0.0.0', null, 'admin', null, '1091');

-- ----------------------------
-- Table structure for `stumanager_test_question`
-- ----------------------------
DROP TABLE IF EXISTS `stumanager_test_question`;
CREATE TABLE `stumanager_test_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testQuestionTitle` text NOT NULL,
  `testQuestionTypeId` int(11) NOT NULL,
  `testQuestionContent` text COMMENT '数组格式存储，[a,b,c,d]',
  `testQuestionShortAnswer` varchar(30) DEFAULT NULL COMMENT '答案，选择题使用此字段，使用[a,b,c]格式',
  `testQuestionLongAnswer` text COMMENT '问答题或编程题使用此答案字段',
  `testQuestionCreateTime` bigint(15) NOT NULL,
  `testQuestionUpdateTime` bigint(15) DEFAULT NULL,
  `testQuestionOperaterId` int(20) NOT NULL DEFAULT '83',
  `testQuestionDefaultScore` int(11) NOT NULL DEFAULT '0',
  `testQuestionMessage` text COMMENT '题目备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_test_question
-- ----------------------------
INSERT INTO `stumanager_test_question` VALUES ('44', '名为HelloWorld.java的Java应用程序如下：&nbsp;<br>public&nbsp;class&nbsp;HelloWorld{&nbsp;&nbsp;<br>	public&nbsp;static&nbsp;void&nbsp;main(String&nbsp;args[])&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;&nbsp;<br>		System.out.println(\"Hello&nbsp;World!\");&nbsp;&nbsp;&nbsp;&nbsp;	<br>	}&nbsp;<br>}&nbsp;&nbsp;<br>将这个程序放在C:\\Test下，然后在命令行窗口中，进入到C:\\Test路径执行如下指令：&nbsp;javac&nbsp;HelloWorld.java将得到（&nbsp;）结果。&nbsp;&nbsp;', '1', '[\"编译出错\",\"编译成功，生成名为HelloWorld.class的文件\",\"编译成功，生成名为helloworld.class的文件\",\"找不到名为helloworld.java的文件\"]', '[\"1\"]', null, '1478252844471', null, '83', '0', '暂无');
INSERT INTO `stumanager_test_question` VALUES ('45', '在当前的java实现中，每个文件编译之后就是一个以（）为后缀的文件', '1', '[\"java\",\"class\",\"doc\",\"exe\"]', '[\"1\"]', null, '1478246169137', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('46', '下列属于条件运算符的是：', '1', '[\"+\",\"?:\",\"&&\",\">>\"]', '[\"1\"]', null, '1478246206709', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('47', '已知i为整形变量，关于一元运算++i和i++，下列说法正确的是：', '1', '[\"++i运算将出错\",\"在任何情况下运行结果都一样\",\"在任何情况下运行结果都不一样\",\"在任何情况下变量i的值都增加1\"]', '[\"3\"]', null, '1478246240756', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('48', '在java语句中：37.2%10的运算结果为：', '1', '[\"7.2\",\"7\",\"3\",\"0.2\"]', '[\"0\"]', null, '1478246270083', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('49', '在java语句中，运算符&&实现', '1', '[\"逻辑或\",\"逻辑与\",\"逻辑非\",\"逻辑相等\"]', '[\"1\"]', null, '1478246297673', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('50', '下列数据类型，必须进行强制转换的是：', '1', '[\"byte&nbsp;—>&nbsp;int\",\"short&nbsp;—>&nbsp;long\",\"float&nbsp;—>&nbsp;double\",\"int&nbsp;—>&nbsp;char\"]', '[\"3\"]', null, '1478246352123', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('51', '下面哪一个不是合法的标识符？', '1', '[\"x$\",\"π\",\"1X\",\"XYZ\"]', '[\"2\"]', null, '1478246402784', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('52', 'int&nbsp;类型数据占用多少位？', '1', '[\"32\",\"64\",\"16\",\"20&nbsp;\"]', '[\"0\"]', null, '1478246451099', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('53', 'Java&nbsp;Application程序中有且只能有一个main方法，该方法头的书写合法的是。', '1', '[\"public&nbsp;static&nbsp;void&nbsp;main()\",\"public&nbsp;static&nbsp;void&nbsp;main(String[]&nbsp;args)\",\"public&nbsp;static&nbsp;int&nbsp;main(String[]&nbsp;arg)\",\"public&nbsp;void&nbsp;main(String&nbsp;arg[]&nbsp;)&nbsp;\"]', '[\"1\"]', null, '1478246502393', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('54', 'public&nbsp;class&nbsp;TestDemo&nbsp;{<br>&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;static&nbsp;void&nbsp;main(String[]&nbsp;args)&nbsp;{<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;char&nbsp;chA=\'A\',chB=\'b\';<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(chA+27&nbsp;<&nbsp;chB)<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;++chB;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(\"\\\"\"+chB+\"\\\"\");<br>&nbsp;&nbsp;&nbsp;&nbsp;}<br>}', '1', '[\"A\",\"a\",\"B\",\"c\"]', '[\"3\"]', null, '1479118532646', null, '83', '0', '暂无');
INSERT INTO `stumanager_test_question` VALUES ('55', 'java程序中程序运行入口方法main的签名正确的有&nbsp;&nbsp;_________&nbsp;&nbsp;。', '2', '[\"public&nbsp;static&nbsp;void&nbsp;main(String&nbsp;args[])&nbsp;\",\"static&nbsp;public&nbsp;void&nbsp;main(String[]&nbsp;args)&nbsp;\",\"public&nbsp;void&nbsp;static&nbsp;main(String[]&nbsp;args)&nbsp;\",\"public&nbsp;void&nbsp;main(String&nbsp;args[])&nbsp;\"]', '[\"0\",\"1\"]', null, '1478246713002', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('57', '编译java程序的命令是&nbsp;__&nbsp;;运行java程序的命令是&nbsp;&nbsp;__&nbsp;&nbsp;。', '1', '[\"顺序1、2\",\"顺序2、1\"]', '[\"1\"]', null, '1478246887255', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('59', 'byte变量的取值范围是&nbsp;&nbsp;_______&nbsp;&nbsp;。', '1', '[\"0&nbsp;-&nbsp;65535&nbsp;\",\"&nbsp;-128&nbsp;–&nbsp;127&nbsp;\",\"-256&nbsp;–&nbsp;255&nbsp;\",\"0&nbsp;-&nbsp;32767\"]', '[\"1\"]', null, '1478247933504', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('60', '设int&nbsp;x&nbsp;=&nbsp;1&nbsp;,&nbsp;y&nbsp;=&nbsp;2&nbsp;,&nbsp;z&nbsp;=&nbsp;3&nbsp;;&nbsp;则表达式&nbsp;&nbsp;y＋＝z－－/＋＋x&nbsp;&nbsp;的值是(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)。', '1', '[\"3.5&nbsp;\",\"3\",\"4\",\"5\"]', '[\"1\"]', null, '1478247966950', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('61', '以下不是java关键字的有&nbsp;&nbsp;______', '1', '[\"super\",\"this\",\"NULL\",\"&nbsp;true\"]', '[\"2\"]', null, '1478248005141', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('63', '以下正确的有&nbsp;&nbsp;_________&nbsp;&nbsp;。', '2', '[\"int&nbsp;i&nbsp;=&nbsp;32;&nbsp;\",\"float&nbsp;f&nbsp;=&nbsp;45.3;&nbsp;\",\"double&nbsp;d=3.2;\",\"byte&nbsp;b&nbsp;=&nbsp;231;\"]', '[\"0\",\"2\"]', null, '1478248134062', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('64', '下面集合定义正确的有&nbsp;&nbsp;_____&nbsp;&nbsp;。', '2', '[\"String&nbsp;strs[]&nbsp;=&nbsp;{&nbsp;\'a\'&nbsp;\'b\'&nbsp;\'c\'};&nbsp;\",\"String[]&nbsp;strs&nbsp;=&nbsp;{\\\"a\\\",&nbsp;\\\"b\\\",&nbsp;\\\"c\\\"};&nbsp;\",\"String[]&nbsp;strs&nbsp;=&nbsp;new&nbsp;String{\\\"a\\\"&nbsp;\\\"b\\\"&nbsp;\\\"c\\\"};&nbsp;\",\"String&nbsp;strs[]&nbsp;=&nbsp;new&nbsp;String[]{\\\"a\\\",&nbsp;\\\"b\\\",&nbsp;\\\"c\\\"};&nbsp;\",\"String[]&nbsp;strs&nbsp;=&nbsp;new&nbsp;String[3]{\\\"a\\\",&nbsp;\\\"b\\\",&nbsp;\\\"c\\\"};&nbsp;\"]', '[\"1\",\"3\"]', null, '1478248180125', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('65', '关于break和continue语句，下面说法错误的有（  ）。', '1', '[\"break只能用于循环语句中。 switch\",\" continue只能用于循环语句中。 \",\"在循环语句中，break语句将终止循环；而continue是略过当前循环中剩余的语\\n句进入下一次循环。 \",\"在循环语句中，continue语句将终止循环；而break是略过当前循环中剩余的语\\n句进入下一次循环。\"]', '[\"2\"]', null, '1478249717088', null, '83', '0', '暂无');
INSERT INTO `stumanager_test_question` VALUES ('66', 'class&nbsp;TEXT{<br/>	Public&nbsp;static&nbsp;void&nbsp;main(String[]&nbsp;args){<br/>		Int&nbsp;a=10;<br/>		Int&nbsp;b;<br/>		Int&nbsp;c;<br/>		If(a>50){<br/>		b&nbsp;=&nbsp;9;<br/>}<br/>c&nbsp;=&nbsp;b&nbsp;+&nbsp;a;<br/>	System.out.println(c);<br/>}<br/>}<br/>输出&nbsp;c&nbsp;的结果是什么？_________.<br/>', '1', '[\"编译出错。\",\"10\",\"0\",\"19\"]', '[\"0\"]', null, '1478248298099', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('67', '请简述java编程语言中的数据类型，有哪些？', '3', '[]', '[]', '暂无', '1478249996753', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('68', '谈谈你对数组的理解。', '3', '[]', '[]', '暂无', '1478250014384', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('69', '简述java中的运算符.', '3', '[]', '[]', '暂无', '1478250028392', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('70', '简述一下&nbsp;break,&nbsp;continue,return的用法.', '3', '[]', '[]', '暂无', '1478250040760', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('71', '								9*9=81	<br>							8*9=72	8*8=64	<br>						7*9=63	7*8=56	7*7=49	<br>					6*9=54	6*8=48	6*7=42	6*6=36	<br>				5*9=45	5*8=40	5*7=35	5*6=30	5*5=25	<br>			4*9=36	4*8=32	4*7=28	4*6=24	4*5=20	4*4=16	<br>		3*9=27	3*8=24	3*7=21	3*6=18	3*5=15	3*4=12	3*3=9	<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2*9=18	2*8=16	2*7=14	2*6=12	2*5=10	2*4=8	2*3=6	2*2=4	<br>1*9=9	1*8=8	1*7=7	1*6=6	1*5=5	1*4=4	1*3=3	1*2=2	1*1=1	<br>********************************************************************<br>1*9=9	1*8=8	1*7=7	1*6=6	1*5=5	1*4=4	1*3=3	1*2=2	1*1=1	<br>	2*9=18	2*8=16	2*7=14	2*6=12	2*5=10	2*4=8	2*3=6	2*2=4	<br>		3*9=27	3*8=24	3*7=21	3*6=18	3*5=15	3*4=12	3*3=9	<br>			4*9=36	4*8=32	4*7=28	4*6=24	4*5=20	4*4=16	<br>				5*9=45	5*8=40	5*7=35	5*6=30	5*5=25	<br>					6*9=54	6*8=48	6*7=42	6*6=36	<br>						7*9=63	7*8=56	7*7=49	<br>							8*9=72	8*8=64	<br>								9*9=81	<br>1*1=1	<br>2*1=2	2*2=4	<br>3*1=3	3*2=6	3*3=9	<br>4*1=4	4*2=8	4*3=12	4*4=16	<br>5*1=5	5*2=10	5*3=15	5*4=20	5*5=25	<br>6*1=6	6*2=12	6*3=18	6*4=24	6*5=30	6*6=36	<br>7*1=7	7*2=14	7*3=21	7*4=28	7*5=35	7*6=42	7*7=49	<br>8*1=8	8*2=16	8*3=24	8*4=32	8*5=40	8*6=48	8*7=56	8*8=64	<br>9*1=9	9*2=18	9*3=27	9*4=36	9*5=45	9*6=54	9*7=63	9*8=72	9*9=81	<br>********************************************************************<br>9*1=9	9*2=18	9*3=27	9*4=36	9*5=45	9*6=54	9*7=63	9*8=72	9*9=81	<br>8*1=8	8*2=16	8*3=24	8*4=32	8*5=40	8*6=48	8*7=56	8*8=64	<br>7*1=7	7*2=14	7*3=21	7*4=28	7*5=35	7*6=42	7*7=49	<br>6*1=6	6*2=12	6*3=18	6*4=24	6*5=30	6*6=36	<br>5*1=5	5*2=10	5*3=15	5*4=20	5*5=25	<br>4*1=4	4*2=8	4*3=12	4*4=16	<br>3*1=3	3*2=6	3*3=9	<br>2*1=2	2*2=4	<br>1*1=1	', '4', '[]', '[]', '暂无', '1478254171657', null, '83', '0', '暂无');
INSERT INTO `stumanager_test_question` VALUES ('72', '求质数的两种方法', '4', '[]', '[]', '暂无', '1478250114673', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('73', '已知数组：int[]&nbsp;arr={45,5,12,8,16,6,30,25,17,15};<br/>要求：将给定的数组中大于平均值的数放入新的数组中。', '4', '[]', '[]', '暂无', '1478250132224', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('74', '下面那些事Thread类的方法（）', '2', '[\"start()\",\"run()\",\"exit()\",\"getPriority()\"]', '[\"0\",\"1\",\"3\"]', null, '1479123898023', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('75', '下面哪个流类属于面向字符的输入流( &nbsp;)', '1', '[\"BufferedWriter\",\"FileInputStream\",\"ObjectInputStream\",\"InputStreamReader\"]', '[\"3\"]', null, '1479123992246', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('76', 'java.io包的file类是（）', '1', '[\"字符流类\",\"字节流类\",\"对象流类\",\"非流类\"]', '[\"3\"]', null, '1479124066570', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('77', '新建一个流对象，下面哪个选项的代码是错误的？（）', '1', '[\"new&nbsp;BufferedWriter(new&nbsp;FileWriter(\\\"a.txt\\\"));\",\"new&nbsp;BufferedReader(new&nbsp;FileInputStream(\\\"a.dat\\\"));\",\"new&nbsp;GZIPOutputStream(new&nbsp;FileOutputStream(\\\"a.zip\\\"));\",\"new&nbsp;ObjectInputStream(new&nbsp;FileInputStream(\\\"a.dat\\\"));\"]', '[\"1\"]', null, '1479124124567', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('78', '下面程序的运行结果：（）<br>public&nbsp;static&nbsp;void&nbsp;main(String&nbsp;args[])&nbsp;{<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Thread&nbsp;t&nbsp;=&nbsp;new&nbsp;Thread()&nbsp;{<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;void&nbsp;run()&nbsp;{<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pong();<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t.run();<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.print(\"ping\");<br>&nbsp;&nbsp;&nbsp;&nbsp;}<br>&nbsp;&nbsp;&nbsp;&nbsp;static&nbsp;void&nbsp;pong()&nbsp;{<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.print(\"pong\");<br>&nbsp;&nbsp;&nbsp;&nbsp;}', '1', '[\"pingpong\",\"pongping\",\"pingpong和pongping都有可能\",\"都不输出\"]', '[\"1\"]', null, '1479124190311', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('79', '线程生命周期中正确的状态是 （）', '1', '[\"新建状态、运行状态和终止状态\",\"新建状态、运行状态、阻塞状态和终止状态\",\"新建状态、可运行状态、运行状态、阻塞状态和终止状态\",\"新建状态、可运行状态、运行状态、恢复状态和终止状态\"]', '[\"2\"]', null, '1479124246146', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('80', '下列哪个类不能直接创建对象？（  ） ', '1', '[\"InputStream\",\"FileInputStream\",\"BufferedInputStream\",\"DataInputStream\"]', '[\"0\"]', null, '1479124311153', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('81', '8、为了获取远程主机的文件内容，当创建URL对象后，需要使用哪个方法获取信息（  ）', '1', '[\"getPort()\",\"getHost()\",\"openStream()\",\"openConnection()\"]', '[\"2\"]', null, '1479124383501', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('82', '使用UDP套接字通信时，哪个方法用于接收数据 （   ）', '1', '[\"read()\",\"receive()\",\"accept()\",\"Listen()\"]', '[\"1\"]', null, '1479124430785', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('83', '为了得到当前正在运行的线程，可使用下列哪个方法？（ ）', '1', '[\"getName()\",\"Thread.CurrentThread()\",\"sleep()\",\"run()\"]', '[\"1\"]', null, '1479124482347', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('84', '下列有关线程的叙述中正确的一项是（）', '1', '[\"一旦一个线程被创建，它就立即开始运行\",\"使用start()方法可以使一个线程成为可运行的，但是它不一定立即开始运行\",\"当一个线程因为抢占机制而停止运行时，它被放在可运行队列的前面\",\"一个线程可能因为不同的原因而终止并进入终止状态\"]', '[\"1\"]', null, '1479124531493', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('85', 'Java网络程序位于TCP/IP参考模型的哪一层？（）', '1', '[\"网络层互联层\",\"应用层\",\"传输层网络\",\"主机-网络层\"]', '[\"1\"]', null, '1479124623855', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('86', '当客户端执行以下程序代码时： Socket socket=new Socket(\"angel\",80); <br>如果远程服务器angel不存在，会出现什么情况？（）', '1', '[\"构造方法抛出UnknownHostException异常。\",\"客户端一直等待连接，直到连接超时，从而抛出SocketTimeoutException。\",\"构造方法返回一个Socket对象，但它不与任何服务器连接\",\"主机-网络层\"]', '[\"0\"]', null, '1479124697677', null, '83', '0', null);

-- ----------------------------
-- Table structure for `stumanager_test_questionnaire`
-- ----------------------------
DROP TABLE IF EXISTS `stumanager_test_questionnaire`;
CREATE TABLE `stumanager_test_questionnaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testQuestionnaireTitle` varchar(50) NOT NULL,
  `testQuestionnaireTypeList` varchar(200) NOT NULL COMMENT '[[{id:分类id1,name:分类1},{id:分类id2,name:分类2},{id:分类id3,name:分类3}],[[分类id1题目1,分类id1题目2],[分类id2题目1,分类id2题目2],[分类id3题目1]]]',
  `testQuestionnaireScore` int(11) NOT NULL,
  `testQuestionnaireCreateTime` bigint(20) NOT NULL,
  `testQuestionnaireOperaterId` int(11) NOT NULL,
  `testQuestionnaireMessage` varchar(200) DEFAULT NULL,
  `testQuestionnaireUpdateTime` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_test_questionnaire
-- ----------------------------
INSERT INTO `stumanager_test_questionnaire` VALUES ('28', 'Java前四章阶段小测试', '[[1,2,3,4],[[66,65,61,60,59,57,54,53,52,51,50,49,48,47,46,45,44],[64,63,55],[70,68,69,67],[73,72,71]]]', '100', '1478250258664', '1078', 'Java前四章阶段小测试', '1479116432291');

-- ----------------------------
-- Table structure for `stumanager_test_questionnaire_class`
-- ----------------------------
DROP TABLE IF EXISTS `stumanager_test_questionnaire_class`;
CREATE TABLE `stumanager_test_questionnaire_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classId` int(11) NOT NULL,
  `testQuestionnaireId` int(11) NOT NULL,
  `testQuestionnaireStartTime` bigint(11) NOT NULL,
  `testQuestionnaireEndTime` bigint(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1145 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_test_questionnaire_class
-- ----------------------------

-- ----------------------------
-- Table structure for `stumanager_test_questionnaire_question`
-- ----------------------------
DROP TABLE IF EXISTS `stumanager_test_questionnaire_question`;
CREATE TABLE `stumanager_test_questionnaire_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testQuestionnaireId` int(11) NOT NULL,
  `testQuestionId` int(11) NOT NULL,
  `testQuestionScore` int(11) NOT NULL,
  `testQuestionIsVisible` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_test_questionnaire_question
-- ----------------------------
INSERT INTO `stumanager_test_questionnaire_question` VALUES ('152', '28', '44', '2', '1');
INSERT INTO `stumanager_test_questionnaire_question` VALUES ('153', '28', '45', '2', '1');
INSERT INTO `stumanager_test_questionnaire_question` VALUES ('154', '28', '46', '2', '1');
INSERT INTO `stumanager_test_questionnaire_question` VALUES ('155', '28', '47', '2', '1');
INSERT INTO `stumanager_test_questionnaire_question` VALUES ('156', '28', '48', '2', '1');
INSERT INTO `stumanager_test_questionnaire_question` VALUES ('157', '28', '49', '2', '1');
INSERT INTO `stumanager_test_questionnaire_question` VALUES ('158', '28', '50', '2', '1');
INSERT INTO `stumanager_test_questionnaire_question` VALUES ('159', '28', '51', '2', '1');
INSERT INTO `stumanager_test_questionnaire_question` VALUES ('160', '28', '52', '2', '1');
INSERT INTO `stumanager_test_questionnaire_question` VALUES ('161', '28', '53', '2', '1');
INSERT INTO `stumanager_test_questionnaire_question` VALUES ('162', '28', '54', '2', '1');
INSERT INTO `stumanager_test_questionnaire_question` VALUES ('163', '28', '57', '2', '1');
INSERT INTO `stumanager_test_questionnaire_question` VALUES ('164', '28', '59', '2', '1');
INSERT INTO `stumanager_test_questionnaire_question` VALUES ('165', '28', '60', '2', '1');
INSERT INTO `stumanager_test_questionnaire_question` VALUES ('166', '28', '61', '2', '1');
INSERT INTO `stumanager_test_questionnaire_question` VALUES ('167', '28', '65', '2', '1');
INSERT INTO `stumanager_test_questionnaire_question` VALUES ('168', '28', '66', '2', '1');
INSERT INTO `stumanager_test_questionnaire_question` VALUES ('169', '28', '55', '2', '1');
INSERT INTO `stumanager_test_questionnaire_question` VALUES ('170', '28', '63', '2', '1');
INSERT INTO `stumanager_test_questionnaire_question` VALUES ('171', '28', '64', '2', '1');
INSERT INTO `stumanager_test_questionnaire_question` VALUES ('172', '28', '67', '6', '1');
INSERT INTO `stumanager_test_questionnaire_question` VALUES ('173', '28', '68', '6', '1');
INSERT INTO `stumanager_test_questionnaire_question` VALUES ('174', '28', '69', '6', '1');
INSERT INTO `stumanager_test_questionnaire_question` VALUES ('175', '28', '70', '6', '1');
INSERT INTO `stumanager_test_questionnaire_question` VALUES ('176', '28', '71', '12', '1');
INSERT INTO `stumanager_test_questionnaire_question` VALUES ('177', '28', '72', '12', '1');
INSERT INTO `stumanager_test_questionnaire_question` VALUES ('178', '28', '73', '12', '1');

-- ----------------------------
-- Table structure for `stumanager_test_reply`
-- ----------------------------
DROP TABLE IF EXISTS `stumanager_test_reply`;
CREATE TABLE `stumanager_test_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testQuestionnaireClassId` int(11) NOT NULL,
  `answers` text NOT NULL,
  `studentId` int(11) NOT NULL,
  `correcting` int(11) NOT NULL DEFAULT '0' COMMENT '批改状态',
  `scoreSituation` text COMMENT '得分情况',
  `score` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_test_reply
-- ----------------------------

-- ----------------------------
-- Table structure for `stumanager_test_tag`
-- ----------------------------
DROP TABLE IF EXISTS `stumanager_test_tag`;
CREATE TABLE `stumanager_test_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagName` varchar(20) NOT NULL,
  `questionCnt` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_test_tag
-- ----------------------------
INSERT INTO `stumanager_test_tag` VALUES ('37', '线程', '5');
INSERT INTO `stumanager_test_tag` VALUES ('38', 'IO', '4');
INSERT INTO `stumanager_test_tag` VALUES ('39', 'URL', '4');

-- ----------------------------
-- Table structure for `stumanager_test_tag_question`
-- ----------------------------
DROP TABLE IF EXISTS `stumanager_test_tag_question`;
CREATE TABLE `stumanager_test_tag_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagId` int(11) NOT NULL,
  `testQuestionId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_test_tag_question
-- ----------------------------
INSERT INTO `stumanager_test_tag_question` VALUES ('160', '37', '74');
INSERT INTO `stumanager_test_tag_question` VALUES ('161', '38', '75');
INSERT INTO `stumanager_test_tag_question` VALUES ('162', '38', '76');
INSERT INTO `stumanager_test_tag_question` VALUES ('163', '38', '77');
INSERT INTO `stumanager_test_tag_question` VALUES ('164', '37', '78');
INSERT INTO `stumanager_test_tag_question` VALUES ('165', '37', '79');
INSERT INTO `stumanager_test_tag_question` VALUES ('166', '38', '80');
INSERT INTO `stumanager_test_tag_question` VALUES ('167', '39', '81');
INSERT INTO `stumanager_test_tag_question` VALUES ('168', '39', '82');
INSERT INTO `stumanager_test_tag_question` VALUES ('169', '37', '83');
INSERT INTO `stumanager_test_tag_question` VALUES ('170', '37', '84');
INSERT INTO `stumanager_test_tag_question` VALUES ('171', '39', '85');
INSERT INTO `stumanager_test_tag_question` VALUES ('172', '39', '86');

-- ----------------------------
-- Table structure for `stumanager_test_type`
-- ----------------------------
DROP TABLE IF EXISTS `stumanager_test_type`;
CREATE TABLE `stumanager_test_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(20) NOT NULL,
  `typeQuestionCnt` int(11) NOT NULL DEFAULT '0',
  `typeCreateTime` bigint(11) NOT NULL,
  `typeUpdateTime` bigint(11) NOT NULL,
  `typeLimit` varchar(50) DEFAULT '["shortModel","longModel"]' COMMENT '限制出现模块,目前只支持["shortModel","longModel"]，分别指选择和问答（编程题也是问答）',
  `testQuestionIsVisible` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_test_type
-- ----------------------------
INSERT INTO `stumanager_test_type` VALUES ('1', '单选题', '0', '0', '0', '[\"shortModel\"]', '1');
INSERT INTO `stumanager_test_type` VALUES ('2', '多选题', '0', '0', '0', '[\"shortModel\"]', '1');
INSERT INTO `stumanager_test_type` VALUES ('3', '问答题', '0', '0', '0', '[\"longModel\"]', '1');
INSERT INTO `stumanager_test_type` VALUES ('4', '编程题', '0', '0', '0', '[\"longModel\"]', '1');

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
  `userLastLoginIp` varchar(12) DEFAULT '0.0.0.0' COMMENT '最后登录Ip',
  `userCreateTime` bigint(20) DEFAULT NULL COMMENT '用户创建时间',
  `userUpdateTime` bigint(20) DEFAULT NULL COMMENT '用户更新时间',
  `userPhone` varchar(20) DEFAULT '' COMMENT '用户联系号码',
  `userAddress` varchar(20) DEFAULT NULL COMMENT '用户地址',
  `userMessage` mediumtext COMMENT '用户个人签名等信息',
  `operater` varchar(20) DEFAULT 'admin' COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1092 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_user
-- ----------------------------
INSERT INTO `stumanager_user` VALUES ('83', 'admin', 'admin', 'admin', null, 'admin', '', null, '1475994030979', null, null, null, null, null);
INSERT INTO `stumanager_user` VALUES ('1001', '18708172148', 'tangtingchao', '唐廷超', null, '学生', null, '0.0.0.0', '1476104823159', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1002', '15576782772', 'liqunfeng', '李群锋', null, '学生', null, '0.0.0.0', '1476104823161', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1003', '18631123385', 'guosonglin', '郭松林', null, '学生', null, '0.0.0.0', '1476104823163', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1004', '18782232826', 'yanglu', '杨露', null, '学生', null, '0.0.0.0', '1476104823164', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1005', '18030608096', 'jiangjiacai', '蒋佳才', null, '学生', null, '0.0.0.0', '1476104823166', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1006', '18081034195', 'wuyihong', '武诣宏', null, '学生', null, '0.0.0.0', '1476104823168', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1007', '13683431424', 'lvcaihong', '吕才宏', null, '学生', null, '0.0.0.0', '1476104823170', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1008', '13540542887', 'caijiong', '蔡炯', null, '学生', null, '0.0.0.0', '1476104823171', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1009', '18398605299', 'chenjialei', '陈佳磊', null, '学生', null, '0.0.0.0', '1476104823172', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1010', '13982185735', 'huangkang', '黄康', null, '学生', null, '0.0.0.0', '1476104823173', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1011', '13699607283', 'hanfeng', '韩枫', null, '学生', null, '0.0.0.0', '1476104823175', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1012', '18349263790', 'lijiashu', '李佳树', null, '学生', null, '0.0.0.0', '1476104823176', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1013', '18200203436', 'lukai', '卢凯', null, '学生', null, '0.0.0.0', '1476104823177', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1014', '15928110162', 'liuxu', '刘旭', null, '学生', null, '0.0.0.0', '1476104823180', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1015', '18227583795', 'zhangfeng', '张丰', null, '学生', null, '0.0.0.0', '1476104823181', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1016', '15708420080', 'tianxiaohui', '田小辉', null, '学生', null, '0.0.0.0', '1476104823182', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1017', '18408238639', 'yekai', '叶开', null, '学生', null, '0.0.0.0', '1476104823184', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1018', '18380448697', 'qiuqiang', '邱强', null, '学生', null, '0.0.0.0', '1476104823185', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1019', '15070873243', 'wangcongwen', '王从文', null, '学生', null, '0.0.0.0', '1476104823186', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1020', '18583948156', 'zengli', '曾力', null, '学生', null, '0.0.0.0', '1476104823187', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1021', '18380447421', 'shuqiang', '舒强', null, '学生', null, '0.0.0.0', '1476104823188', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1022', '13540195068', 'sunlei', '孙磊', null, '学生', null, '0.0.0.0', '1476104823190', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1023', '15108384620', 'hejingxuan', '何敬轩', null, '学生', null, '0.0.0.0', '1476104823191', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1024', '18584053968', 'sunlei1', '孙磊1', null, '学生', null, '0.0.0.0', '1476104823193', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1025', '15281075743', 'huangchen', '黄晨', null, '学生', null, '0.0.0.0', '1476104823194', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1026', '15828672627', 'lijianjun', '李建君', null, '学生', null, '0.0.0.0', '1476104823195', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1027', '18180714905', 'tangzhihao', '唐志豪', null, '学生', null, '0.0.0.0', '1476104823198', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1028', '15528152447', 'yaoyongke', '姚永科', null, '学生', null, '0.0.0.0', '1476104823199', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1029', '18208142097', 'huangwenbin', '黄文彬', null, '学生', null, '0.0.0.0', '1476104823200', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1030', '13730650634', 'chenhu', '陈虎', null, '学生', null, '0.0.0.0', '1476104823202', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1031', '18728839138', 'heyingfei', '何映飞', null, '学生', null, '0.0.0.0', '1476104823203', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1032', '18080451244', 'gaolei', '高磊', null, '学生', null, '0.0.0.0', '1476104823204', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1033', '15386652410', 'linmeng', '林萌', null, '学生', null, '0.0.0.0', '1476104823206', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1034', '18781974479', 'shenlei', '沈磊', null, '学生', null, '0.0.0.0', '1476104823251', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1035', '18106114060', 'chenyuan', '陈渊', null, '学生', null, '0.0.0.0', '1476104823253', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1036', '18161224506', 'duanpeng', '段鹏', null, '学生', null, '0.0.0.0', '1476104823254', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1037', '18227810752', 'liminzhong', '黎民忠', null, '学生', null, '0.0.0.0', '1476104823255', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1038', '18111029527', 'lufuchuan', '卢福川', null, '学生', null, '0.0.0.0', '1476104823256', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1039', '15883979776', 'sunjianxiong', '孙建雄', null, '学生', null, '0.0.0.0', '1476104823257', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1040', '13730638251', 'jiangxinpeng', '姜鑫鹏', null, '学生', null, '0.0.0.0', '1476104823259', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1041', '13388124102', 'yaotao', '姚涛', null, '学生', null, '0.0.0.0', '1476104823260', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1042', '18215587363', 'wangjiaxing', '王家兴', null, '学生', null, '0.0.0.0', '1476104823261', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1043', '15184481369', 'yijie', '易杰', null, '学生', null, '0.0.0.0', '1476104823262', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1044', '15281025582', 'lizhongyuan', '李忠原', null, '学生', null, '0.0.0.0', '1476104823264', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1045', '18200396402', 'tanjiamin', '谭佳敏', null, '学生', null, '0.0.0.0', '1476104823265', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1046', '18482105738', 'lvjinquan', '吕金泉', null, '学生', null, '0.0.0.0', '1476104823266', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1047', '18780097106', 'liuchao', '刘朝', null, '学生', null, '0.0.0.0', '1476104823267', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1048', '18215673679', 'liumeng', '刘萌', null, '学生', null, '0.0.0.0', '1476104823269', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1049', '15884592322', 'lixiang', '黎翔', null, '学生', null, '0.0.0.0', '1476104823270', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1050', '13980454445', 'liuyuan', '刘元', null, '学生', null, '0.0.0.0', '1476104823272', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1051', '15284015158', 'huming', '胡明', null, '学生', null, '0.0.0.0', '1476104823273', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1052', '18349154702', 'renchuangang', '任传岗', null, '学生', null, '0.0.0.0', '1476104823275', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1053', '18349349371', 'zhangyiwu', '张义武', null, '学生', null, '0.0.0.0', '1476104823276', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1054', '15882020825', 'chenbangu', '陈半谷', null, '学生', null, '0.0.0.0', '1476104823277', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1055', '15708323405', 'tangqi', '唐棋', null, '学生', null, '0.0.0.0', '1476104823278', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1056', '18200107027', 'lixiaofeng', '李啸峰', null, '学生', null, '0.0.0.0', '1476104823279', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1057', '18910706446', 'xuhongjie', '徐宏杰', null, '学生', null, '0.0.0.0', '1476104823280', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1058', '18782492547', 'jiangchu', '降初', null, '学生', null, '0.0.0.0', '1476104823281', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1059', '13088028025', 'fuwenhao', '付文豪', null, '学生', null, '0.0.0.0', '1476104823282', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1060', '18280228720', 'zhaorui', '赵芮', null, '学生', null, '0.0.0.0', '1476104823283', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1061', '13882123157', 'yelinfeng', '叶林峰', null, '学生', null, '0.0.0.0', '1476104823284', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1062', '18302815357', 'wuhao', '吴豪', null, '学生', null, '0.0.0.0', '1476104823297', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1063', '18798643934', 'zengchuanbiao', '曾传标', null, '学生', null, '0.0.0.0', '1476104823298', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1064', '15760679957', 'wangcaiyuan', '王才渊', null, '学生', null, '0.0.0.0', '1476104823299', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1065', '13699060456', 'taohao', '陶浩', null, '学生', null, '0.0.0.0', '1476104823300', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1066', '13657582555', 'wuyuxuan', '吴雨轩', null, '学生', null, '0.0.0.0', '1476104823301', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1067', '15982453370', 'wangjunli', '王俊力', null, '学生', null, '0.0.0.0', '1476104823302', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1068', '18699767332', 'tianqin', '田秦', null, '学生', null, '0.0.0.0', '1476104823304', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1069', '18728897244', 'denghongwei', '邓宏伟', null, '学生', null, '0.0.0.0', '1476104823305', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1070', '18782067209', 'liangdeqiang', '梁德强', null, '学生', null, '0.0.0.0', '1476104823306', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1071', '13551240694', 'zhangyue', '张月', null, '学生', null, '0.0.0.0', '1476104823307', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1072', '18580428242', 'zhongcaibin', '钟彩斌', null, '学生', null, '0.0.0.0', '1476104823308', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1073', '18111420282', 'dengjinshan', '邓金山', null, '学生', null, '0.0.0.0', '1476104823309', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1074', '18382265497', 'hezhonghua', '何中华', null, '学生', null, '0.0.0.0', '1476104823311', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1075', '13678203476', 'chensihao', '陈泗好', null, '学生', null, '0.0.0.0', '1476104823312', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1076', '15928040671', 'liuhuiyang', '刘辉阳', null, '学生', null, '0.0.0.0', '1476104823313', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1078', 'teacher', 'teacher', '教师临时账号', null, '教师临时账号', '', '0.0.0.0', '1478244405179', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1080', '13699428133', 'zhurongxiang', '祝逸翔', null, '学生', null, '0.0.0.0', '1478941990306', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1081', '15928668512', 'lifeifei', '李斐斐', null, '学生', null, '0.0.0.0', '1478941990731', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1082', '15982324957', 'yuanjun', '袁军', null, '学生', null, '0.0.0.0', '1478941990732', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1083', '15982357680', 'subinyang', '粟彬洋', null, '学生', null, '0.0.0.0', '1478941990734', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1084', '13036673778', 'zhaoweiwei', '赵卫卫', null, '学生', null, '0.0.0.0', '1478941990737', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1085', '17781838550', 'zhouyouli', '周游力', null, '学生', null, '0.0.0.0', '1478941990739', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1086', '13980793537', 'muguoqing', '牟国清', null, '学生', null, '0.0.0.0', '1478941990740', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1087', '18208177189', 'laiyanxi', '赖彦希', null, '学生', null, '0.0.0.0', '1478941990742', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1088', '18782200651', 'liyao', '李耀', null, '学生', null, '0.0.0.0', '1478941990745', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1089', '18183220660', 'zengchaoyu', '曾朝愉', null, '学生', null, '0.0.0.0', '1478941990746', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1090', '13518134579', 'renkeping', '任珂平', null, '学生', null, '0.0.0.0', '1478941990747', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('1091', '18180711696', 'wangfei', '王飞', null, '学生', null, '0.0.0.0', '1478941990749', null, '', null, null, 'admin');
