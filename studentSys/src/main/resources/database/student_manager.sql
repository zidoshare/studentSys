/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : student_manager

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2016-10-27 22:45:27
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
  `message` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_attendance
-- ----------------------------
INSERT INTO `stumanager_attendance` VALUES ('1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `stumanager_attendance` VALUES ('2', '2', '2', '2', '2', '2', '2', '2');
INSERT INTO `stumanager_attendance` VALUES ('3', '3', '3', '3', '3', '3', '3', '3');
INSERT INTO `stumanager_attendance` VALUES ('4', '4', '4', '4', '2', '4', '4', '4');

-- ----------------------------
-- Table structure for `stumanager_class`
-- ----------------------------
DROP TABLE IF EXISTS `stumanager_class`;
CREATE TABLE `stumanager_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `className` varchar(10) NOT NULL,
  `headTeacher` varchar(10) NOT NULL COMMENT '讲师',
  `Assistant` varchar(10) DEFAULT NULL COMMENT '科目',
  `tutor` varchar(10) NOT NULL,
  `studentCnt` int(11) NOT NULL DEFAULT '0',
  `classCreateTime` bigint(20) NOT NULL,
  `classUpdateTime` bigint(20) NOT NULL,
  `classOperaterId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_class
-- ----------------------------
INSERT INTO `stumanager_class` VALUES ('13', '123', '123', null, '123', '0', '1476758231001', '1476758231001', '86');
INSERT INTO `stumanager_class` VALUES ('15', '321', '321', null, '321', '0', '1477297664788', '1477297664789', '86');

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
INSERT INTO `stumanager_domain` VALUES ('19', 'domain1', 'domain1', '86', '1477465007079', '1477465007079');
INSERT INTO `stumanager_domain` VALUES ('20', 'domain2', 'domain2', '86', '1477465450008', '1477465450009');

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
INSERT INTO `stumanager_domain_tag` VALUES ('67', '19', '26');
INSERT INTO `stumanager_domain_tag` VALUES ('68', '19', '27');
INSERT INTO `stumanager_domain_tag` VALUES ('69', '19', '28');
INSERT INTO `stumanager_domain_tag` VALUES ('70', '20', '29');
INSERT INTO `stumanager_domain_tag` VALUES ('71', '20', '30');
INSERT INTO `stumanager_domain_tag` VALUES ('72', '20', '27');

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
) ENGINE=InnoDB AUTO_INCREMENT=3854 DEFAULT CHARSET=utf8;

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
INSERT INTO `stumanager_mapping` VALUES ('2025', '已分配试卷', '/test/disList.ftl', '', 'disList', '0', '0', '3002', '0', '3', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('2326', '根目录', 'url', '', 'fa', '2327', '0', '0', '12', '0', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('2327', '首页', '/', '', 'fa fa-desktop', '2337', '2328', '2326', '6', '1', '0', '2');
INSERT INTO `stumanager_mapping` VALUES ('2328', '用户管理', '/userManager', '', 'fa fa-users', '2341', '2329', '2326', '2', '1', '0', '2');
INSERT INTO `stumanager_mapping` VALUES ('2329', '学生管理', '/studentManager', '', 'fa fa-calendar', '2343', '1007', '2326', '1', '1', '0', '2');
INSERT INTO `stumanager_mapping` VALUES ('2330', '还款管理', '/repaymentManager', '', 'fa fa-usd', '0', '3851', '2326', '0', '1', '0', '2');
INSERT INTO `stumanager_mapping` VALUES ('2331', '出勤管理', '/attendanceManager/attendance', '', 'fa fa-crosshairs', '2344', '2332', '2326', '1', '1', '0', '2');
INSERT INTO `stumanager_mapping` VALUES ('2332', '证书管理', '/certificateManager', '', 'fa fa-book', '0', '2333', '2326', '0', '1', '0', '2');
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
INSERT INTO `stumanager_mapping` VALUES ('2344', '考勤信息列表', '/attendanceManager/attendanceList.ftl', '', 'attendanceList', '2364', '0', '2331', '3', '2', '0', '1');
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
INSERT INTO `stumanager_mapping` VALUES ('2364', '添加', 'addAttendance', '', 'addAttendance', '0', '2365', '2344', '0', '3', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('2365', '修改', 'updateAttendance', '', 'updateAttendance', '0', '2366', '2344', '0', '3', '0', '0');
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
INSERT INTO `stumanager_mapping` VALUES ('3851', '我的考勤', '/attendanceManager/personalAttendance', '', 'fa fa-crosshairs', '3852', '2331', '2326', '2', '1', '0', '2');
INSERT INTO `stumanager_mapping` VALUES ('3852', '考勤信息列表', '/attendanceManager/personalAttendanceList.ftl', '', 'personalAttendanceList', '0', '3853', '3851', '0', '2', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('3853', '考勤信息图表', '/attendanceManager/personalAttendanceChart.ftl', '', 'personalAttendanceChart', '0', '0', '3851', '0', '2', '0', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_role
-- ----------------------------
INSERT INTO `stumanager_role` VALUES ('78', 'admin', '1', '1999:2000:2326:2327:2328:2329:2330:2331:2332:2333:2334:2335:2336:2337:2338:2339:2340:2341:2342:2343:2344:2345:2346:2347:2348:2349:2350:2351:2352:2353:2354:2355:2356:2357:2358:2359:2360:2361:2362:2363:2364:2365:2366:2367:2368:2369:2370:2371:2372:2373:2374:2375:2376:3000:3001:3002:3003:3004:3005:3006:3007:3008:3009', '1476254934638', 'admin');
INSERT INTO `stumanager_role` VALUES ('79', '学生', '77', '2000:2326:2327:2333:2334:2335:2337:2340:2345:2346:2347:2352:2353:2367:2368:2369', '1476174127857', 'admin');
INSERT INTO `stumanager_role` VALUES ('80', '考试系统测试组', '2', '105:106:107:108:109:1007:1008:1009:1010:1011:1035:1036:2000:2025:2326:2327:2331:2333:2334:2335:2337:2338:2339:2340:2344:2345:2346:2347:2348:2349:2350:2351:2352:2353:2367:2368:2369:2370:2371:2372:2373:3000:3001:3002:3003:3004:3005:3006:3007:3008:3009:3020:3021:3022:3851:3852:3853', '1477536521750', 'admin');

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
) ENGINE=InnoDB AUTO_INCREMENT=1078 DEFAULT CHARSET=utf8;

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
INSERT INTO `stumanager_student` VALUES ('1077', '123', null, '123', '123', null, null, '123456', null, null, null, null, null, '0', '0.0.0.0', null, 'admin', null, '84');

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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_test_question
-- ----------------------------
INSERT INTO `stumanager_test_question` VALUES ('35', '第一道题', '1', '[\"adwaefa\",\"daefeg\",\"fdrgthe\"]', '[\"0\",\"1\",\"2\"]', null, '1477468037514', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('36', '第二道题', '3', '[]', '[]', '123456789', '1477471399744', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('37', '第三道题', '4', '[]', '[]', '111111111111111111111111111111111', '1477471486594', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('38', '第四道题', '2', '[\"daefef\",\"dfgrethryr\"]', '[\"0\",\"1\"]', null, '1477471552552', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('39', '第五道题', '2', '[\"daefrg\"]', '[\"0\"]', null, '1477473475542', null, '83', '0', null);
INSERT INTO `stumanager_test_question` VALUES ('40', '第六道题', '3', '[]', '[]', '大娃娃打我打我打我打我打我', '1477474578670', null, '83', '0', '165468498497');

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_test_questionnaire
-- ----------------------------
INSERT INTO `stumanager_test_questionnaire` VALUES ('24', '123456', '[[1,2,3,4],[[35],[38,39],[36,40],[37]]]', '50', '1477470040029', '86', '123456', '1477474828869');

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
  `testQuestionnaireTempTime` bigint(11) NOT NULL DEFAULT '5000000000000' COMMENT '用于标记时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1124 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_test_questionnaire_class
-- ----------------------------
INSERT INTO `stumanager_test_questionnaire_class` VALUES ('1122', '13', '24', '1477470056000', '1477473656000', '5000000000000');
INSERT INTO `stumanager_test_questionnaire_class` VALUES ('1123', '13', '24', '1477474834000', '1477478434000', '5000000000000');

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
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_test_questionnaire_question
-- ----------------------------
INSERT INTO `stumanager_test_questionnaire_question` VALUES ('85', '24', '35', '10', '1');
INSERT INTO `stumanager_test_questionnaire_question` VALUES ('86', '24', '38', '5', '1');
INSERT INTO `stumanager_test_questionnaire_question` VALUES ('87', '24', '39', '20', '1');
INSERT INTO `stumanager_test_questionnaire_question` VALUES ('88', '24', '36', '5', '1');
INSERT INTO `stumanager_test_questionnaire_question` VALUES ('89', '24', '40', '5', '1');
INSERT INTO `stumanager_test_questionnaire_question` VALUES ('90', '24', '37', '5', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_test_reply
-- ----------------------------
INSERT INTO `stumanager_test_reply` VALUES ('12', '1123', '{\"24S35\":[\"0\"],\"24S38\":[\"1\"],\"24S39\":[\"0\"],\"24S36\":[\"578578373\"],\"24S40\":[\"732532583\"],\"24S37\":[\"368865353753\"]}', '1077', '0', '{\"24S40\":0,\"24S35\":0,\"24S37\":0,\"24S36\":0,\"24S39\":20,\"24S38\":0}', '20');

-- ----------------------------
-- Table structure for `stumanager_test_tag`
-- ----------------------------
DROP TABLE IF EXISTS `stumanager_test_tag`;
CREATE TABLE `stumanager_test_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagName` varchar(20) NOT NULL,
  `questionCnt` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_test_tag
-- ----------------------------
INSERT INTO `stumanager_test_tag` VALUES ('26', 'tag1', '5');
INSERT INTO `stumanager_test_tag` VALUES ('27', 'tag2', '2');
INSERT INTO `stumanager_test_tag` VALUES ('28', 'tag3', '1');
INSERT INTO `stumanager_test_tag` VALUES ('29', 'tag4', '1');
INSERT INTO `stumanager_test_tag` VALUES ('30', 'tag5', '2');
INSERT INTO `stumanager_test_tag` VALUES ('31', 'gerftg', '3');
INSERT INTO `stumanager_test_tag` VALUES ('32', 'jyhjtguktukgy', '4');
INSERT INTO `stumanager_test_tag` VALUES ('33', 'gvaargs', '1');
INSERT INTO `stumanager_test_tag` VALUES ('34', '1561', '3');
INSERT INTO `stumanager_test_tag` VALUES ('35', 'regthg', '1');

-- ----------------------------
-- Table structure for `stumanager_test_tag_question`
-- ----------------------------
DROP TABLE IF EXISTS `stumanager_test_tag_question`;
CREATE TABLE `stumanager_test_tag_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagId` int(11) NOT NULL,
  `testQuestionId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_test_tag_question
-- ----------------------------
INSERT INTO `stumanager_test_tag_question` VALUES ('74', '31', '32');
INSERT INTO `stumanager_test_tag_question` VALUES ('75', '32', '32');
INSERT INTO `stumanager_test_tag_question` VALUES ('76', '33', '32');
INSERT INTO `stumanager_test_tag_question` VALUES ('77', '29', '32');
INSERT INTO `stumanager_test_tag_question` VALUES ('78', '26', '32');
INSERT INTO `stumanager_test_tag_question` VALUES ('79', '32', '33');
INSERT INTO `stumanager_test_tag_question` VALUES ('80', '26', '33');
INSERT INTO `stumanager_test_tag_question` VALUES ('81', '34', '34');
INSERT INTO `stumanager_test_tag_question` VALUES ('82', '26', '34');
INSERT INTO `stumanager_test_tag_question` VALUES ('83', '31', '34');
INSERT INTO `stumanager_test_tag_question` VALUES ('84', '32', '34');
INSERT INTO `stumanager_test_tag_question` VALUES ('85', '34', '35');
INSERT INTO `stumanager_test_tag_question` VALUES ('86', '27', '35');
INSERT INTO `stumanager_test_tag_question` VALUES ('87', '26', '35');
INSERT INTO `stumanager_test_tag_question` VALUES ('88', '32', '36');
INSERT INTO `stumanager_test_tag_question` VALUES ('89', '31', '36');
INSERT INTO `stumanager_test_tag_question` VALUES ('90', '30', '36');
INSERT INTO `stumanager_test_tag_question` VALUES ('91', '30', '37');
INSERT INTO `stumanager_test_tag_question` VALUES ('92', '35', '38');
INSERT INTO `stumanager_test_tag_question` VALUES ('93', '34', '39');
INSERT INTO `stumanager_test_tag_question` VALUES ('94', '27', '39');
INSERT INTO `stumanager_test_tag_question` VALUES ('95', '26', '40');
INSERT INTO `stumanager_test_tag_question` VALUES ('96', '28', '40');
INSERT INTO `stumanager_test_tag_question` VALUES ('97', '36', '41');

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
) ENGINE=InnoDB AUTO_INCREMENT=1077 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_user
-- ----------------------------
INSERT INTO `stumanager_user` VALUES ('83', 'admin', 'admin', 'admin', null, 'admin', '', null, '1475994030979', null, null, null, null, null);
INSERT INTO `stumanager_user` VALUES ('84', '123', '123', '123', null, '学生', '', null, '1475994127071', null, null, null, null, null);
INSERT INTO `stumanager_user` VALUES ('86', 'kaoshi', '123', '123', null, '考试系统测试组', '', '0.0.0.0', '1475999369854', null, '', null, null, 'admin');
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
