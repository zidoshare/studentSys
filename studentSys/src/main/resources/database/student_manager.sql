/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : student_manager

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2016-10-10 16:33:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `stumanager_class`
-- ----------------------------
DROP TABLE IF EXISTS `stumanager_class`;
CREATE TABLE `stumanager_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `className` varchar(10) DEFAULT NULL,
  `headTeacherid` int(40) DEFAULT NULL COMMENT '讲师',
  `Assistant` varchar(10) DEFAULT NULL COMMENT '科目',
  `tutorId` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_class
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
  `url` varchar(40) DEFAULT NULL COMMENT '对应路径',
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
) ENGINE=InnoDB AUTO_INCREMENT=3012 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_mapping
-- ----------------------------
INSERT INTO `stumanager_mapping` VALUES ('2326', '根目录', 'url', '', 'fa', '2327', '0', '0', '10', '0', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('2327', '首页', '/', '', 'fa fa-desktop', '2337', '2328', '2326', '4', '1', '0', '2');
INSERT INTO `stumanager_mapping` VALUES ('2328', '用户管理', '/userManager', '', 'fa fa-users', '2341', '2329', '2326', '2', '1', '0', '2');
INSERT INTO `stumanager_mapping` VALUES ('2329', '学生管理', '/studentManager', '', 'fa fa-calendar', '2343', '2330', '2326', '1', '1', '0', '2');
INSERT INTO `stumanager_mapping` VALUES ('2330', '还款管理', '/repaymentManager', '', 'fa fa-usd', '0', '2331', '2326', '0', '1', '0', '2');
INSERT INTO `stumanager_mapping` VALUES ('2331', '出勤管理', '/attendanceManager', '', 'fa fa-crosshairs', '2344', '2332', '2326', '1', '1', '0', '2');
INSERT INTO `stumanager_mapping` VALUES ('2332', '证书管理', '/certificateManager', '', 'fa fa-book', '0', '2333', '2326', '0', '1', '0', '2');
INSERT INTO `stumanager_mapping` VALUES ('2333', '我的考试', '/test', '', 'fa fa-pencil', '2345', '2334', '2326', '5', '1', '0', '2');
INSERT INTO `stumanager_mapping` VALUES ('2334', '我的调查', '/#', '', 'fa fa-file-text', '2347', '2335', '2326', '5', '1', '0', '2');
INSERT INTO `stumanager_mapping` VALUES ('2335', '通用设置', '/option', '', 'fa fa-gear', '2352', '2336', '2326', '2', '1', '0', '2');
INSERT INTO `stumanager_mapping` VALUES ('2336', '报名学生', '/enrollManager', '', 'fa fa-thumbs-up', '2354', '0', '2326', '1', '1', '0', '2');
INSERT INTO `stumanager_mapping` VALUES ('2337', '全局搜索', '/common/search.ftl', '', 'search', '0', '2338', '2327', '0', '2', '0', '1');
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
INSERT INTO `stumanager_mapping` VALUES ('3000', '题库', '/test/questions', '', 'toQuestions', '3001', '3002', '2333', '1', '2', '0', '3');
INSERT INTO `stumanager_mapping` VALUES ('3001', '中心题库', '/test/questions.ftl', '', 'questions', '3007', '0', '3000', '5', '3', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('3002', '试卷列表', '/test/testList', '', 'testList', '3003', '3004', '2333', '1', '2', '0', '3');
INSERT INTO `stumanager_mapping` VALUES ('3003', '试卷列表', '/test/testList.ftl', '', 'testList', '0', '0', '3002', '0', '3', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('3004', '成绩统计', '/test/count', '', 'toCount', '3005', '0', '2333', '2', '2', '0', '3');
INSERT INTO `stumanager_mapping` VALUES ('3005', '列表', '/test/gradeList.ftl', '', 'count', '0', '3006', '3004', '0', '3', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('3006', '图表', '/test/gradeChart.ftl', '', 'count', '0', '0', '3004', '0', '3', '0', '1');
INSERT INTO `stumanager_mapping` VALUES ('3007', '添加', 'addTestQuestion', '', 'addTestQuestion', '0', '3008', '3001', '0', '4', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('3008', '修改', 'updateTestQuestion', '', 'updateTestQuestion', '0', '3009', '3001', '0', '4', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('3009', '删除', 'deleteTestQuestion', '', 'deleteTestQuestion', '0', '3010', '3001', '0', '4', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('3010', '添加到试卷', 'addToTest', '', 'addToTest', '0', '3011', '3001', '0', '4', '0', '0');
INSERT INTO `stumanager_mapping` VALUES ('3011', '当前试卷管理', 'testManage', '', 'testManage', '0', '0', '3001', '0', '4', '0', '0');

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
INSERT INTO `stumanager_role` VALUES ('78', 'admin', '1', '2326:2327:2328:2329:2330:2331:2332:2333:2334:2335:2336:2337:2338:2339:2340:2341:2342:2343:2344:2345:2346:2347:2348:2349:2350:2351:2352:2353:2354:2355:2356:2357:2358:2359:2360:2361:2362:2363:2364:2365:2366:2367:2368:2369:2370:2371:2372:2373:2374:2375:2376:3000:3001:3002:3003:3004:3005:3006:3007:3008:3009:3010:3011', '1475994030971', 'system');
INSERT INTO `stumanager_role` VALUES ('79', '学生', '1', '2326:2327:2330:2332:2333:2334:2335:2337:2338:2345:2346:2347:2352:2353:2367:2368:2369', '1475994112339', 'admin');
INSERT INTO `stumanager_role` VALUES ('80', '考试系统测试组', '2', '2326:2327:2333:2334:2335:2337:2338:2339:2340:2345:2346:2347:2348:2349:2350:2351:2352:2353:2367:2368:2369:2370:2371:2372:2373:3000:3001:3002:3003:3004:3005:3006:3007:3008:3009:3010:3011', '1476085702915', 'admin');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_student
-- ----------------------------
INSERT INTO `stumanager_student` VALUES ('10', '123', null, '123', '123', null, null, '123456', '1475994191447', null, null, null, null, '1475994191440', '0.0.0.0', null, 'admin', null, null);
INSERT INTO `stumanager_student` VALUES ('11', '1', null, '1', '1', null, null, '1', null, null, null, null, null, '1', '1', null, '1', null, null);

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_test_question
-- ----------------------------
INSERT INTO `stumanager_test_question` VALUES ('1', '123456', '2', '[\"46\",\"678\",\"68\",\"69\"]', '[\"A\",\"B\"]', null, '1476036363095', null, '83');
INSERT INTO `stumanager_test_question` VALUES ('2', '45346789', '1', '[\"453\",\"37869978\"]', '[\"A\"]', null, '1476039962138', null, '83');
INSERT INTO `stumanager_test_question` VALUES ('3', '1234567890', '1', '[\"asd\",\"adsa\"]', '[\"A\"]', null, '1476040919160', null, '83');
INSERT INTO `stumanager_test_question` VALUES ('4', '1234567890', '1', '[\"asd\",\"adsa\"]', '[\"A\"]', null, '1476040980707', null, '83');
INSERT INTO `stumanager_test_question` VALUES ('5', '1234567890', '1', '[\"asd\",\"adsa\"]', '[\"A\"]', null, '1476041102108', null, '83');
INSERT INTO `stumanager_test_question` VALUES ('6', '534453', '1', '[\"452\",\"4536785\"]', '[\"A\"]', null, '1476062461028', null, '83');
INSERT INTO `stumanager_test_question` VALUES ('7', 'dawfergthygrtefdfrgt', '2', '[\"daefregtrhtgrfd\",\"defrgthyjuyhbgf\",\"fgbhyjukjyhtgfvdrgthy\",\"frgthyjukloiujhgvfd\"]', '[\"A\",\"B\"]', null, '1476062670302', null, '83');
INSERT INTO `stumanager_test_question` VALUES ('8', 'dafsrgthrytjgfds', '3', '[]', '[]', 'defrgthyjukijhbgvfcd', '1476062795884', null, '83');
INSERT INTO `stumanager_test_question` VALUES ('9', 'adefsrgthynbgvfcd', '3', '[]', '[]', 'dcvfbgnhjmyhnbgvfcd', '1476062845809', null, '83');
INSERT INTO `stumanager_test_question` VALUES ('10', 'dsvfbgnhjmhngbfv', '3', '[]', '[]', 'fbgfvdc', '1476062958804', null, '83');
INSERT INTO `stumanager_test_question` VALUES ('11', 'sdfgtrbvfcdfgthyyg', '3', '[]', '[]', 'dfrgthyjtgbrvfdcsf', '1476063040020', null, '83');
INSERT INTO `stumanager_test_question` VALUES ('12', 'daefrgthyjuhntgvfds', '3', '[]', '[]', 'cdvgbjmukiumjhgfvdc', '1476063055282', null, '83');
INSERT INTO `stumanager_test_question` VALUES ('13', 'sdfrgrfdfghjfghdfgsdf', '1', '[\"dasfggsdgfs\",\"dafsf\",\"dfsgf\"]', '[\"A\"]', null, '1476063123467', null, '83');
INSERT INTO `stumanager_test_question` VALUES ('14', 'gfdvsaxsdfvgb', '3', '[]', '[]', 'scdvfgbhngfvdax', '1476063949534', null, '83');
INSERT INTO `stumanager_test_question` VALUES ('15', 'dfgbhjuykhtgf', '3', '[]', '[]', 'defrgthyjuyhngbfvd', '1476064002950', null, '83');
INSERT INTO `stumanager_test_question` VALUES ('16', 'dfghyjgfdc', '3', '[]', '[]', 'dcvfbghjukmhngfvdc', '1476064045094', null, '83');
INSERT INTO `stumanager_test_question` VALUES ('17', 'sdfghyjuyhngbfvdcxs', '3', '[]', '[]', 'cdvfghnjmk,imhgbfvc', '1476064082567', null, '83');
INSERT INTO `stumanager_test_question` VALUES ('18', 'sdfvgbhyjyuhngfvdc', '3', '[]', '[]', 'lkjhgfvdfvghjmkl', '1476064100469', null, '83');
INSERT INTO `stumanager_test_question` VALUES ('19', '2563524', '1', '[\"254342\"]', '[\"A\"]', null, '1476064280797', null, '83');
INSERT INTO `stumanager_test_question` VALUES ('20', 'fdsfghyjukhngbfvdc', '3', '[]', '[]', 'dfgthyjukh', '1476064365581', null, '83');
INSERT INTO `stumanager_test_question` VALUES ('21', 'sdfghyjgbfdc', '3', '[]', '[]', 'sdfghnnbvc', '1476064721643', null, '83');
INSERT INTO `stumanager_test_question` VALUES ('22', 'xsdfvgbhnjmhngbfvdcxzscgbh', '4', '[]', '[]', 'dcfvgbhnnbvfcdx', '1476064742243', null, '83');

-- ----------------------------
-- Table structure for `stumanager_test_questionnaire`
-- ----------------------------
DROP TABLE IF EXISTS `stumanager_test_questionnaire`;
CREATE TABLE `stumanager_test_questionnaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testQuestionnaireTitle` varchar(50) NOT NULL,
  `testQuestionnaireScore` int(11) NOT NULL,
  `testQuestionnaireCreateTime` bigint(20) NOT NULL,
  `testQuestionnaireStartTime` int(11) NOT NULL,
  `testQuestionnaireEndTime` int(11) NOT NULL,
  `testQuestionnaireOperaterId` int(11) NOT NULL,
  `testQuestionnaireMessage` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_test_questionnaire
-- ----------------------------

-- ----------------------------
-- Table structure for `stumanager_test_questionnaire_class`
-- ----------------------------
DROP TABLE IF EXISTS `stumanager_test_questionnaire_class`;
CREATE TABLE `stumanager_test_questionnaire_class` (
  `id` int(11) NOT NULL,
  `classId` int(11) NOT NULL,
  `testQuestionnaireId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_test_questionnaire_question
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_test_tag
-- ----------------------------
INSERT INTO `stumanager_test_tag` VALUES ('1', '123', '5');
INSERT INTO `stumanager_test_tag` VALUES ('2', '234', '14');
INSERT INTO `stumanager_test_tag` VALUES ('3', '568', '13');
INSERT INTO `stumanager_test_tag` VALUES ('4', '345354', '7');
INSERT INTO `stumanager_test_tag` VALUES ('5', '257524', '1');
INSERT INTO `stumanager_test_tag` VALUES ('6', 'dwafergtfdfrgthg', '1');
INSERT INTO `stumanager_test_tag` VALUES ('7', 'dvfbghnjmhngbfvdc', '4');
INSERT INTO `stumanager_test_tag` VALUES ('8', 'dfefdfad', '3');
INSERT INTO `stumanager_test_tag` VALUES ('9', '', '1');

-- ----------------------------
-- Table structure for `stumanager_test_tag_question`
-- ----------------------------
DROP TABLE IF EXISTS `stumanager_test_tag_question`;
CREATE TABLE `stumanager_test_tag_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagId` int(11) NOT NULL,
  `testQuestionId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_test_tag_question
-- ----------------------------
INSERT INTO `stumanager_test_tag_question` VALUES ('1', '1', '3');
INSERT INTO `stumanager_test_tag_question` VALUES ('2', '2', '3');
INSERT INTO `stumanager_test_tag_question` VALUES ('3', '1', '4');
INSERT INTO `stumanager_test_tag_question` VALUES ('4', '2', '4');
INSERT INTO `stumanager_test_tag_question` VALUES ('5', '1', '5');
INSERT INTO `stumanager_test_tag_question` VALUES ('6', '2', '5');
INSERT INTO `stumanager_test_tag_question` VALUES ('7', '3', '5');
INSERT INTO `stumanager_test_tag_question` VALUES ('8', '4', '6');
INSERT INTO `stumanager_test_tag_question` VALUES ('9', '5', '6');
INSERT INTO `stumanager_test_tag_question` VALUES ('10', '1', '7');
INSERT INTO `stumanager_test_tag_question` VALUES ('11', '3', '7');
INSERT INTO `stumanager_test_tag_question` VALUES ('12', '4', '7');
INSERT INTO `stumanager_test_tag_question` VALUES ('13', '6', '7');
INSERT INTO `stumanager_test_tag_question` VALUES ('14', '2', '8');
INSERT INTO `stumanager_test_tag_question` VALUES ('15', '3', '8');
INSERT INTO `stumanager_test_tag_question` VALUES ('16', '4', '8');
INSERT INTO `stumanager_test_tag_question` VALUES ('17', '7', '9');
INSERT INTO `stumanager_test_tag_question` VALUES ('18', '2', '10');
INSERT INTO `stumanager_test_tag_question` VALUES ('19', '7', '10');
INSERT INTO `stumanager_test_tag_question` VALUES ('20', '3', '10');
INSERT INTO `stumanager_test_tag_question` VALUES ('21', '2', '11');
INSERT INTO `stumanager_test_tag_question` VALUES ('22', '3', '11');
INSERT INTO `stumanager_test_tag_question` VALUES ('23', '4', '11');
INSERT INTO `stumanager_test_tag_question` VALUES ('24', '7', '12');
INSERT INTO `stumanager_test_tag_question` VALUES ('25', '2', '12');
INSERT INTO `stumanager_test_tag_question` VALUES ('26', '1', '13');
INSERT INTO `stumanager_test_tag_question` VALUES ('27', '3', '13');
INSERT INTO `stumanager_test_tag_question` VALUES ('28', '8', '13');
INSERT INTO `stumanager_test_tag_question` VALUES ('29', '2', '14');
INSERT INTO `stumanager_test_tag_question` VALUES ('30', '3', '14');
INSERT INTO `stumanager_test_tag_question` VALUES ('31', '8', '14');
INSERT INTO `stumanager_test_tag_question` VALUES ('32', '2', '15');
INSERT INTO `stumanager_test_tag_question` VALUES ('33', '8', '15');
INSERT INTO `stumanager_test_tag_question` VALUES ('34', '7', '15');
INSERT INTO `stumanager_test_tag_question` VALUES ('35', '3', '16');
INSERT INTO `stumanager_test_tag_question` VALUES ('36', '4', '16');
INSERT INTO `stumanager_test_tag_question` VALUES ('37', '2', '17');
INSERT INTO `stumanager_test_tag_question` VALUES ('38', '3', '17');
INSERT INTO `stumanager_test_tag_question` VALUES ('39', '2', '18');
INSERT INTO `stumanager_test_tag_question` VALUES ('40', '3', '18');
INSERT INTO `stumanager_test_tag_question` VALUES ('41', '2', '19');
INSERT INTO `stumanager_test_tag_question` VALUES ('42', '3', '19');
INSERT INTO `stumanager_test_tag_question` VALUES ('43', '2', '20');
INSERT INTO `stumanager_test_tag_question` VALUES ('44', '3', '20');
INSERT INTO `stumanager_test_tag_question` VALUES ('45', '4', '20');
INSERT INTO `stumanager_test_tag_question` VALUES ('46', '2', '21');
INSERT INTO `stumanager_test_tag_question` VALUES ('47', '3', '21');
INSERT INTO `stumanager_test_tag_question` VALUES ('48', '4', '21');
INSERT INTO `stumanager_test_tag_question` VALUES ('49', '9', '22');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_test_type
-- ----------------------------
INSERT INTO `stumanager_test_type` VALUES ('1', '单选题', '0', '0', '0', '[\"shortModel\"]');
INSERT INTO `stumanager_test_type` VALUES ('2', '多选题', '0', '0', '0', '[\"shortModel\"]');
INSERT INTO `stumanager_test_type` VALUES ('3', '问答题', '0', '0', '0', '[\"longModel\"]');
INSERT INTO `stumanager_test_type` VALUES ('4', '编程题', '0', '0', '0', '[\"longModel\"]');

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
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stumanager_user
-- ----------------------------
INSERT INTO `stumanager_user` VALUES ('83', 'admin', 'admin', 'admin', null, 'admin', '', null, '1475994030979', null, null, null, null, null);
INSERT INTO `stumanager_user` VALUES ('84', '123', '123', '123', null, '学生', '', null, '1475994127071', null, null, null, null, null);
INSERT INTO `stumanager_user` VALUES ('86', 'kaoshi', '123', '123', null, '考试系统测试组', '', '0.0.0.0', '1475999369854', null, '', null, null, 'admin');
INSERT INTO `stumanager_user` VALUES ('87', 'kaoshi', '123', '234', null, '考试系统测试组', '', '0.0.0.0', '1475999374858', null, '', null, null, 'admin');
