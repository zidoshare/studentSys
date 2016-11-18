/*
Navicat MySQL Data Transfer

Source Server         : 公司数据库
Source Server Version : 50631
Source Host           : 192.168.6.250:3306
Source Database       : surveys_sys

Target Server Type    : MYSQL
Target Server Version : 50631
File Encoding         : 65001

Date: 2016-11-18 17:10:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `surveys_t_question_big_type`
-- ----------------------------
DROP TABLE IF EXISTS `surveys_t_question_big_type`;
CREATE TABLE `surveys_t_question_big_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `sort_flag` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of surveys_t_question_big_type
-- ----------------------------
INSERT INTO `surveys_t_question_big_type` VALUES ('-1', '', '32767');
INSERT INTO `surveys_t_question_big_type` VALUES ('20', '一、教师专业知识', '1');
INSERT INTO `surveys_t_question_big_type` VALUES ('21', '二、教师授课技巧', '2');
INSERT INTO `surveys_t_question_big_type` VALUES ('22', '三、教师调控能力', '3');
INSERT INTO `surveys_t_question_big_type` VALUES ('23', '四、教师职业态度', '4');

-- ----------------------------
-- Table structure for `surveys_t_questionnaire`
-- ----------------------------
DROP TABLE IF EXISTS `surveys_t_questionnaire`;
CREATE TABLE `surveys_t_questionnaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(10) DEFAULT NULL,
  `date` varchar(20) NOT NULL,
  `class_chief` varchar(6) DEFAULT NULL,
  `to_user` varchar(6) NOT NULL,
  `end_time` varchar(14) DEFAULT NULL,
  `note` varchar(150) DEFAULT '',
  `createTime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `maxScore` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of surveys_t_questionnaire
-- ----------------------------
INSERT INTO `surveys_t_questionnaire` VALUES ('51', '互动160824班', '1479092400000', '张杰', '张杰', '1479096000000', null, null, '90');
INSERT INTO `surveys_t_questionnaire` VALUES ('53', '互动160824班', '1479092400000', '张杰', '吴开权', '1479096000000', null, null, '100');
INSERT INTO `surveys_t_questionnaire` VALUES ('54', '互动160921班', '1479096000000', '赵源', '赵源', '1479099600000', null, null, '90');
INSERT INTO `surveys_t_questionnaire` VALUES ('55', '互动161031班', '1479092400000', '陈乔祎', '陈乔祎', '1479096000000', null, null, '90');
INSERT INTO `surveys_t_questionnaire` VALUES ('56', '互动161031班', '1479092400000', '陈乔祎', '邹鹏', '1479096000000', null, null, '100');
INSERT INTO `surveys_t_questionnaire` VALUES ('57', '互动160719班', '1479092400000', '刘美奇', '马吉', '1479096000000', null, null, '100');

-- ----------------------------
-- Table structure for `surveys_t_questionnaire_result`
-- ----------------------------
DROP TABLE IF EXISTS `surveys_t_questionnaire_result`;
CREATE TABLE `surveys_t_questionnaire_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` varchar(20) NOT NULL,
  `id_questionnaire` int(11) DEFAULT NULL,
  `questions_reply` text,
  `comment` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of surveys_t_questionnaire_result
-- ----------------------------
INSERT INTO `surveys_t_questionnaire_result` VALUES ('3', '陈半谷', '51', '[{\"51T20T4\":\"T6\"},{\"51T20T5\":\"T6\"},{\"51T20T6\":\"T6\"},{\"51T21T9\":\"T6\"},{\"51T21T10\":\"T6\"},{\"51T21T11\":\"T6\"},{\"51T21T12\":\"T6\"},{\"51T22T13\":\"T6\"},{\"51T22T14\":\"T6\"},{\"51T22T15\":\"T6\"},{\"51T22T16\":\"T6\"},{\"51T23T17\":\"T6\"},{\"51T23T18\":\"T6\"},{\"51T23T19\":\"T6\"},{\"51T23T20\":\"T6\"},{\"score\":\"90\"}]', '强啊 辛巴克！\n命令窗玩儿得俏啊！');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('4', '付文豪', '51', '[{\"51T20T4\":\"T6\"},{\"51T20T5\":\"T6\"},{\"51T20T6\":\"T6\"},{\"51T21T9\":\"T6\"},{\"51T21T10\":\"T6\"},{\"51T21T11\":\"T6\"},{\"51T21T12\":\"T6\"},{\"51T22T13\":\"T6\"},{\"51T22T14\":\"T6\"},{\"51T22T15\":\"T6\"},{\"51T22T16\":\"T6\"},{\"51T23T17\":\"T6\"},{\"51T23T18\":\"T6\"},{\"51T23T19\":\"T6\"},{\"51T23T20\":\"T6\"},{\"score\":\"90\"}]', '1.讲课挺有趣的\n2.车开的不错\n3.讲课认真负责\n4.例子举的很到位');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('5', '陈半谷', '53', '[{\"53T-1T22\":\"T10\"},{\"53T-1T23\":\"T10\"},{\"53T-1T24\":\"T10\"},{\"53T-1T25\":\"T10\"},{\"53T-1T26\":\"T10\"},{\"53T-1T27\":\"T10\"},{\"53T-1T28\":\"T10\"},{\"53T-1T29\":\"T10\"},{\"53T-1T30\":\"T10\"},{\"53T-1T31\":\"T10\"},{\"score\":\"100\"}]', '老吴可以的！');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('6', '张义武', '51', '[{\"51T20T4\":\"T6\"},{\"51T20T5\":\"T6\"},{\"51T20T6\":\"T6\"},{\"51T21T9\":\"T6\"},{\"51T21T10\":\"T6\"},{\"51T21T11\":\"T6\"},{\"51T21T12\":\"T6\"},{\"51T22T13\":\"T6\"},{\"51T22T14\":\"T6\"},{\"51T22T15\":\"T6\"},{\"51T22T16\":\"T6\"},{\"51T23T17\":\"T6\"},{\"51T23T18\":\"T6\"},{\"51T23T19\":\"T6\"},{\"51T23T20\":\"T6\"},{\"score\":\"90\"}]', '讲课很全面，也很仔细，尤其是对格式的要求。');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('7', '黎翔', '51', '[{\"51T20T4\":\"T6\"},{\"51T20T5\":\"T6\"},{\"51T20T6\":\"T6\"},{\"51T21T9\":\"T6\"},{\"51T21T10\":\"T6\"},{\"51T21T11\":\"T6\"},{\"51T21T12\":\"T4\"},{\"51T22T13\":\"T6\"},{\"51T22T14\":\"T6\"},{\"51T22T15\":\"T6\"},{\"51T22T16\":\"T6\"},{\"51T23T17\":\"T6\"},{\"51T23T18\":\"T6\"},{\"51T23T19\":\"T6\"},{\"51T23T20\":\"T6\"},{\"score\":\"88\"}]', '老师讲课认真，负责任,希望能继续保持认真负责的态度，非常不错。');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('8', '王才渊', '51', '[{\"51T20T4\":\"T6\"},{\"51T20T5\":\"T6\"},{\"51T20T6\":\"T6\"},{\"51T21T9\":\"T6\"},{\"51T21T10\":\"T6\"},{\"51T21T11\":\"T6\"},{\"51T21T12\":\"T6\"},{\"51T22T13\":\"T6\"},{\"51T22T14\":\"T6\"},{\"51T22T15\":\"T6\"},{\"51T22T16\":\"T6\"},{\"51T23T17\":\"T6\"},{\"51T23T18\":\"T6\"},{\"51T23T19\":\"T6\"},{\"51T23T20\":\"T6\"},{\"score\":\"90\"}]', '张老师讲课节奏鲜明，说的也比较透彻，对时间的把握很紧凑很有规律。');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('9', '李啸峰', '51', '[{\"51T20T4\":\"T6\"},{\"51T20T5\":\"T6\"},{\"51T20T6\":\"T6\"},{\"51T21T9\":\"T6\"},{\"51T21T10\":\"T6\"},{\"51T21T11\":\"T6\"},{\"51T21T12\":\"T6\"},{\"51T22T13\":\"T6\"},{\"51T22T14\":\"T6\"},{\"51T22T15\":\"T6\"},{\"51T22T16\":\"T6\"},{\"51T23T17\":\"T6\"},{\"51T23T18\":\"T6\"},{\"51T23T19\":\"T6\"},{\"51T23T20\":\"T6\"},{\"score\":\"90\"}]', '张老师很有责任感，时间观念强，对我们要求相对比较严格');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('10', '张义武', '53', '[{\"53T-1T22\":\"T10\"},{\"53T-1T23\":\"T10\"},{\"53T-1T24\":\"T10\"},{\"53T-1T25\":\"T10\"},{\"53T-1T26\":\"T10\"},{\"53T-1T27\":\"T10\"},{\"53T-1T28\":\"T10\"},{\"53T-1T29\":\"T10\"},{\"53T-1T30\":\"T10\"},{\"53T-1T31\":\"T10\"},{\"score\":\"100\"}]', '请参见上个月的评价，谢谢老师，懒得打！又没有换辅导员！');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('11', '陶浩', '51', '[{\"51T20T4\":\"T6\"},{\"51T20T5\":\"T4\"},{\"51T20T6\":\"T6\"},{\"51T21T9\":\"T4\"},{\"51T21T10\":\"T6\"},{\"51T21T11\":\"T6\"},{\"51T21T12\":\"T4\"},{\"51T22T13\":\"T6\"},{\"51T22T14\":\"T6\"},{\"51T22T15\":\"T6\"},{\"51T22T16\":\"T6\"},{\"51T23T17\":\"T6\"},{\"51T23T18\":\"T6\"},{\"51T23T19\":\"T6\"},{\"51T23T20\":\"T6\"},{\"score\":\"84\"}]', '张杰老师讲的比较详细，对于重要的知识都是讲解的比较着重，而且还给予我们足够的时间来练习，对于一些我们不了解或者不知道的知识都是认真的讲解，只不过在某些内容上有时候内容过快，有时间没有消化吸收。');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('12', '付文豪', '53', '[{\"53T-1T22\":\"T10\"},{\"53T-1T23\":\"T10\"},{\"53T-1T24\":\"T10\"},{\"53T-1T25\":\"T10\"},{\"53T-1T26\":\"T10\"},{\"53T-1T27\":\"T10\"},{\"53T-1T28\":\"T10\"},{\"53T-1T29\":\"T10\"},{\"53T-1T30\":\"T10\"},{\"53T-1T31\":\"T10\"},{\"score\":\"100\"}]', '1.还是一如既往的认真负责\n2.能够积极帮助大家解决问题\n3.态度非常好\n4.遇到了有不懂的问题，能够带领我们解决');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('13', '黎翔', '53', '[{\"53T-1T22\":\"T10\"},{\"53T-1T23\":\"T10\"},{\"53T-1T24\":\"T10\"},{\"53T-1T25\":\"T10\"},{\"53T-1T26\":\"T10\"},{\"53T-1T27\":\"T10\"},{\"53T-1T28\":\"T10\"},{\"53T-1T29\":\"T10\"},{\"53T-1T30\":\"T10\"},{\"53T-1T31\":\"T10\"},{\"score\":\"100\"}]', '吴老师非常有耐心，态度热情友好，值得我们学习，能帮助同学们解决编程中遇到的问题。');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('14', '任传岗', '51', '[{\"51T20T4\":\"T6\"},{\"51T20T5\":\"T6\"},{\"51T20T6\":\"T6\"},{\"51T21T9\":\"T6\"},{\"51T21T10\":\"T6\"},{\"51T21T11\":\"T6\"},{\"51T21T12\":\"T6\"},{\"51T22T13\":\"T6\"},{\"51T22T14\":\"T6\"},{\"51T22T15\":\"T6\"},{\"51T22T16\":\"T6\"},{\"51T23T17\":\"T6\"},{\"51T23T18\":\"T6\"},{\"51T23T19\":\"T6\"},{\"51T23T20\":\"T6\"},{\"score\":\"90\"}]', '讲师很负责任，很照顾大多数同学的学习进程，讲课思路也很清晰，很有逻辑感；好评！！');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('15', '叶林峰', '51', '[{\"51T20T4\":\"T6\"},{\"51T20T5\":\"T6\"},{\"51T20T6\":\"T6\"},{\"51T21T9\":\"T6\"},{\"51T21T10\":\"T6\"},{\"51T21T11\":\"T6\"},{\"51T21T12\":\"T4\"},{\"51T22T13\":\"T6\"},{\"51T22T14\":\"T6\"},{\"51T22T15\":\"T6\"},{\"51T22T16\":\"T6\"},{\"51T23T17\":\"T6\"},{\"51T23T18\":\"T6\"},{\"51T23T19\":\"T6\"},{\"51T23T20\":\"T6\"},{\"score\":\"88\"}]', '张老师上课安排很紧凑，讲解条理清晰。虽然有时候讲解知识点简单，但是希望能记得录像');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('16', '李啸峰', '53', '[{\"53T-1T22\":\"T10\"},{\"53T-1T23\":\"T10\"},{\"53T-1T24\":\"T10\"},{\"53T-1T25\":\"T10\"},{\"53T-1T26\":\"T10\"},{\"53T-1T27\":\"T10\"},{\"53T-1T28\":\"T10\"},{\"53T-1T29\":\"T10\"},{\"53T-1T30\":\"T10\"},{\"53T-1T31\":\"T10\"},{\"score\":\"100\"}]', '老吴给我们搞的这个辅导啊！excited！');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('17', '吴豪', '51', '[{\"51T20T4\":\"T6\"},{\"51T20T5\":\"T6\"},{\"51T20T6\":\"T6\"},{\"51T21T9\":\"T6\"},{\"51T21T10\":\"T6\"},{\"51T21T11\":\"T6\"},{\"51T21T12\":\"T6\"},{\"51T22T13\":\"T6\"},{\"51T22T14\":\"T6\"},{\"51T22T15\":\"T6\"},{\"51T22T16\":\"T6\"},{\"51T23T17\":\"T6\"},{\"51T23T18\":\"T6\"},{\"51T23T19\":\"T6\"},{\"51T23T20\":\"T6\"},{\"score\":\"90\"}]', '好很好非常好');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('18', '吴豪', '53', '[{\"53T-1T22\":\"T10\"},{\"53T-1T23\":\"T10\"},{\"53T-1T24\":\"T10\"},{\"53T-1T25\":\"T10\"},{\"53T-1T26\":\"T10\"},{\"53T-1T27\":\"T10\"},{\"53T-1T28\":\"T10\"},{\"53T-1T29\":\"T10\"},{\"53T-1T30\":\"T10\"},{\"53T-1T31\":\"T10\"},{\"score\":\"100\"}]', '好很好非常哪个好');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('19', '降初', '51', '[{\"51T20T4\":\"T6\"},{\"51T20T5\":\"T6\"},{\"51T20T6\":\"T6\"},{\"51T21T9\":\"T6\"},{\"51T21T10\":\"T6\"},{\"51T21T11\":\"T6\"},{\"51T21T12\":\"T6\"},{\"51T22T13\":\"T6\"},{\"51T22T14\":\"T6\"},{\"51T22T15\":\"T6\"},{\"51T22T16\":\"T6\"},{\"51T23T17\":\"T6\"},{\"51T23T18\":\"T6\"},{\"51T23T19\":\"T6\"},{\"51T23T20\":\"T6\"},{\"score\":\"90\"}]', '讲课很认真，讲得非常仔细。\n对每个同学照顾的非常到位。');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('20', '王飞', '55', '[{\"55T20T4\":\"T4\"},{\"55T20T5\":\"T4\"},{\"55T20T6\":\"T4\"},{\"55T21T9\":\"T4\"},{\"55T21T10\":\"T6\"},{\"55T21T11\":\"T4\"},{\"55T21T12\":\"T6\"},{\"55T22T13\":\"T4\"},{\"55T22T14\":\"T6\"},{\"55T22T15\":\"T6\"},{\"55T22T16\":\"T4\"},{\"55T23T17\":\"T4\"},{\"55T23T18\":\"T6\"},{\"55T23T19\":\"T4\"},{\"55T23T20\":\"T4\"},{\"score\":\"70\"}]', 'QAQ');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('21', '陶浩', '53', '[{\"53T-1T22\":\"T10\"},{\"53T-1T23\":\"T10\"},{\"53T-1T24\":\"T10\"},{\"53T-1T25\":\"T8\"},{\"53T-1T26\":\"T8\"},{\"53T-1T27\":\"T10\"},{\"53T-1T28\":\"T10\"},{\"53T-1T29\":\"T10\"},{\"53T-1T30\":\"T10\"},{\"53T-1T31\":\"T10\"},{\"score\":\"96\"}]', '吴开权老师还是一如既往的，对待我们认真负责，我们有问题咨询的时候都特别的负责认真，让人十分感激，同时，对于我们上课的情况又十分清楚了解，时不时走动，对我们进行督促');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('22', '叶林峰', '53', '[{\"53T-1T22\":\"T10\"},{\"53T-1T23\":\"T10\"},{\"53T-1T24\":\"T10\"},{\"53T-1T25\":\"T10\"},{\"53T-1T26\":\"T10\"},{\"53T-1T27\":\"T10\"},{\"53T-1T28\":\"T10\"},{\"53T-1T29\":\"T10\"},{\"53T-1T30\":\"T10\"},{\"53T-1T31\":\"T10\"},{\"score\":\"100\"}]', '再次希望吴老师在周末给大家一起进行一次知识难点讲解！');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('23', '降初', '53', '[{\"53T-1T22\":\"T10\"},{\"53T-1T23\":\"T10\"},{\"53T-1T24\":\"T10\"},{\"53T-1T25\":\"T10\"},{\"53T-1T26\":\"T10\"},{\"53T-1T27\":\"T10\"},{\"53T-1T28\":\"T10\"},{\"53T-1T29\":\"T10\"},{\"53T-1T30\":\"T10\"},{\"53T-1T31\":\"T10\"},{\"score\":\"100\"}]', '责任心强。\n对学生有耐心。\n工作积极。\n老师界的楷模。');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('24', '曾传标', '51', '[{\"51T20T4\":\"T6\"},{\"51T20T5\":\"T6\"},{\"51T20T6\":\"T6\"},{\"51T21T9\":\"T4\"},{\"51T21T10\":\"T6\"},{\"51T21T11\":\"T4\"},{\"51T21T12\":\"T4\"},{\"51T22T13\":\"T6\"},{\"51T22T14\":\"T6\"},{\"51T22T15\":\"T6\"},{\"51T22T16\":\"T6\"},{\"51T23T17\":\"T6\"},{\"51T23T18\":\"T6\"},{\"51T23T19\":\"T6\"},{\"51T23T20\":\"T6\"},{\"score\":\"84\"}]', '勉强能跟上老师的步伐。有些时候是理解的慢。');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('25', '任传岗', '53', '[{\"53T-1T22\":\"T10\"},{\"53T-1T23\":\"T10\"},{\"53T-1T24\":\"T10\"},{\"53T-1T25\":\"T10\"},{\"53T-1T26\":\"T10\"},{\"53T-1T27\":\"T10\"},{\"53T-1T28\":\"T10\"},{\"53T-1T29\":\"T10\"},{\"53T-1T30\":\"T10\"},{\"53T-1T31\":\"T10\"},{\"score\":\"100\"}]', '好评，吴老师辅导很给力');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('26', '唐棋', '51', '[{\"51T20T4\":\"T6\"},{\"51T20T5\":\"T6\"},{\"51T20T6\":\"T6\"},{\"51T21T9\":\"T6\"},{\"51T21T10\":\"T6\"},{\"51T21T11\":\"T6\"},{\"51T21T12\":\"T6\"},{\"51T22T13\":\"T6\"},{\"51T22T14\":\"T6\"},{\"51T22T15\":\"T6\"},{\"51T22T16\":\"T6\"},{\"51T23T17\":\"T6\"},{\"51T23T18\":\"T6\"},{\"51T23T19\":\"T6\"},{\"51T23T20\":\"T6\"},{\"score\":\"90\"}]', '讲师讲课生动而形象，能有效地调动上课气氛');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('27', '曾传标', '53', '[{\"53T-1T22\":\"T10\"},{\"53T-1T23\":\"T10\"},{\"53T-1T24\":\"T10\"},{\"53T-1T25\":\"T8\"},{\"53T-1T26\":\"T8\"},{\"53T-1T27\":\"T10\"},{\"53T-1T28\":\"T10\"},{\"53T-1T29\":\"T10\"},{\"53T-1T30\":\"T8\"},{\"53T-1T31\":\"T10\"},{\"score\":\"94\"}]', '总体来说，老吴是很给力的！');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('28', '曾朝愉', '55', '[{\"55T20T4\":\"T6\"},{\"55T20T5\":\"T6\"},{\"55T20T6\":\"T6\"},{\"55T21T9\":\"T6\"},{\"55T21T10\":\"T6\"},{\"55T21T11\":\"T6\"},{\"55T21T12\":\"T6\"},{\"55T22T13\":\"T6\"},{\"55T22T14\":\"T6\"},{\"55T22T15\":\"T6\"},{\"55T22T16\":\"T6\"},{\"55T23T17\":\"T6\"},{\"55T23T18\":\"T6\"},{\"55T23T19\":\"T6\"},{\"55T23T20\":\"T6\"},{\"score\":\"90\"}]', '就喜欢你这么污的老师，再污点儿，嘻嘻，，');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('29', '卢福川', '57', '[{\"57T-1T22\":\"T10\"},{\"57T-1T23\":\"T10\"},{\"57T-1T24\":\"T10\"},{\"57T-1T25\":\"T10\"},{\"57T-1T26\":\"T10\"},{\"57T-1T27\":\"T10\"},{\"57T-1T28\":\"T10\"},{\"57T-1T29\":\"T10\"},{\"57T-1T30\":\"T10\"},{\"57T-1T31\":\"T10\"},{\"score\":\"100\"}]', '...');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('30', '唐棋', '53', '[{\"53T-1T22\":\"T10\"},{\"53T-1T23\":\"T10\"},{\"53T-1T24\":\"T10\"},{\"53T-1T25\":\"T10\"},{\"53T-1T26\":\"T10\"},{\"53T-1T27\":\"T10\"},{\"53T-1T28\":\"T10\"},{\"53T-1T29\":\"T10\"},{\"53T-1T30\":\"T10\"},{\"53T-1T31\":\"T10\"},{\"score\":\"100\"}]', '吴老师负责到位，积极而准确地回答学员的相关');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('31', '王才渊', '53', '[{\"53T-1T22\":\"T10\"},{\"53T-1T23\":\"T10\"},{\"53T-1T24\":\"T10\"},{\"53T-1T25\":\"T10\"},{\"53T-1T26\":\"T10\"},{\"53T-1T27\":\"T10\"},{\"53T-1T28\":\"T10\"},{\"53T-1T29\":\"T10\"},{\"53T-1T30\":\"T10\"},{\"53T-1T31\":\"T10\"},{\"score\":\"100\"}]', '吴老师认真负责，能积极帮组需要帮组的同学，快速解决问题。');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('32', '刘朝', '57', '[{\"57T-1T22\":\"T10\"},{\"57T-1T23\":\"T10\"},{\"57T-1T24\":\"T10\"},{\"57T-1T25\":\"T10\"},{\"57T-1T26\":\"T10\"},{\"57T-1T27\":\"T10\"},{\"57T-1T28\":\"T10\"},{\"57T-1T29\":\"T10\"},{\"57T-1T30\":\"T10\"},{\"57T-1T31\":\"T10\"},{\"score\":\"100\"}]', '很好\n');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('33', '姚涛', '57', '[{\"57T-1T22\":\"T10\"},{\"57T-1T23\":\"T10\"},{\"57T-1T24\":\"T10\"},{\"57T-1T25\":\"T10\"},{\"57T-1T26\":\"T10\"},{\"57T-1T27\":\"T10\"},{\"57T-1T28\":\"T10\"},{\"57T-1T29\":\"T10\"},{\"57T-1T30\":\"T10\"},{\"57T-1T31\":\"T10\"},{\"score\":\"100\"}]', '非常好，助教就应该是这样');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('34', '李忠原', '57', '[{\"57T-1T22\":\"T10\"},{\"57T-1T23\":\"T10\"},{\"57T-1T24\":\"T10\"},{\"57T-1T25\":\"T10\"},{\"57T-1T26\":\"T10\"},{\"57T-1T27\":\"T10\"},{\"57T-1T28\":\"T10\"},{\"57T-1T29\":\"T10\"},{\"57T-1T30\":\"T10\"},{\"57T-1T31\":\"T10\"},{\"score\":\"100\"}]', '好好好！深得我心！！！');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('35', '李耀', '55', '[{\"55T20T4\":\"T6\"},{\"55T20T5\":\"T6\"},{\"55T20T6\":\"T6\"},{\"55T21T9\":\"T6\"},{\"55T21T10\":\"T6\"},{\"55T21T11\":\"T4\"},{\"55T21T12\":\"T6\"},{\"55T22T13\":\"T6\"},{\"55T22T14\":\"T6\"},{\"55T22T15\":\"T6\"},{\"55T22T16\":\"T6\"},{\"55T23T17\":\"T6\"},{\"55T23T18\":\"T6\"},{\"55T23T19\":\"T6\"},{\"55T23T20\":\"T6\"},{\"score\":\"88\"}]', '陈桥祎老师技术高超，猛的一P，思路清晰，讲解清楚。');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('36', '孙建雄', '57', '[{\"57T-1T22\":\"T10\"},{\"57T-1T23\":\"T10\"},{\"57T-1T24\":\"T10\"},{\"57T-1T25\":\"T10\"},{\"57T-1T26\":\"T10\"},{\"57T-1T27\":\"T10\"},{\"57T-1T28\":\"T10\"},{\"57T-1T29\":\"T10\"},{\"57T-1T30\":\"T10\"},{\"57T-1T31\":\"T10\"},{\"score\":\"100\"}]', '好');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('37', '袁军', '55', '[{\"55T20T4\":\"T4\"},{\"55T20T5\":\"T6\"},{\"55T20T6\":\"T6\"},{\"55T21T9\":\"T6\"},{\"55T21T10\":\"T6\"},{\"55T21T11\":\"T6\"},{\"55T21T12\":\"T6\"},{\"55T22T13\":\"T6\"},{\"55T22T14\":\"T6\"},{\"55T22T15\":\"T6\"},{\"55T22T16\":\"T6\"},{\"55T23T17\":\"T6\"},{\"55T23T18\":\"T6\"},{\"55T23T19\":\"T6\"},{\"55T23T20\":\"T6\"},{\"score\":\"88\"}]', '老师讲课很好。');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('38', '段鹏', '57', '[{\"57T-1T22\":\"T10\"},{\"57T-1T23\":\"T10\"},{\"57T-1T24\":\"T10\"},{\"57T-1T25\":\"T10\"},{\"57T-1T26\":\"T10\"},{\"57T-1T27\":\"T10\"},{\"57T-1T28\":\"T10\"},{\"57T-1T29\":\"T10\"},{\"57T-1T30\":\"T10\"},{\"57T-1T31\":\"T10\"},{\"score\":\"100\"}]', 'good');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('39', '吕金泉', '57', '[{\"57T-1T22\":\"T10\"},{\"57T-1T23\":\"T10\"},{\"57T-1T24\":\"T10\"},{\"57T-1T25\":\"T10\"},{\"57T-1T26\":\"T10\"},{\"57T-1T27\":\"T10\"},{\"57T-1T28\":\"T10\"},{\"57T-1T29\":\"T10\"},{\"57T-1T30\":\"T10\"},{\"57T-1T31\":\"T10\"},{\"score\":\"100\"}]', '专业知识较强，能解决我遇到的问题');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('40', '李耀', '56', '[{\"56T-1T22\":\"T10\"},{\"56T-1T23\":\"T10\"},{\"56T-1T24\":\"T10\"},{\"56T-1T25\":\"T10\"},{\"56T-1T26\":\"T10\"},{\"56T-1T27\":\"T10\"},{\"56T-1T28\":\"T10\"},{\"56T-1T29\":\"T10\"},{\"56T-1T30\":\"T10\"},{\"56T-1T31\":\"T10\"},{\"score\":\"100\"}]', '邹鹏老师技术熟练，猛的一P，有问必答，启迪思路，讲解清晰');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('41', '易杰', '57', '[{\"57T-1T22\":\"T10\"},{\"57T-1T23\":\"T10\"},{\"57T-1T24\":\"T10\"},{\"57T-1T25\":\"T10\"},{\"57T-1T26\":\"T10\"},{\"57T-1T27\":\"T10\"},{\"57T-1T28\":\"T10\"},{\"57T-1T29\":\"T10\"},{\"57T-1T30\":\"T10\"},{\"57T-1T31\":\"T10\"},{\"score\":\"100\"}]', '马老师积极处理我们学习过程中的各种问题。');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('42', '王家兴', '57', '[{\"57T-1T22\":\"T10\"},{\"57T-1T23\":\"T10\"},{\"57T-1T24\":\"T10\"},{\"57T-1T25\":\"T10\"},{\"57T-1T26\":\"T10\"},{\"57T-1T27\":\"T10\"},{\"57T-1T28\":\"T10\"},{\"57T-1T29\":\"T10\"},{\"57T-1T30\":\"T10\"},{\"57T-1T31\":\"T10\"},{\"score\":\"100\"}]', '在马老师的带领下，手速越来越快，我指的是敲代码速度越来越快了。');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('43', '袁军', '56', '[{\"56T-1T22\":\"T10\"},{\"56T-1T23\":\"T10\"},{\"56T-1T24\":\"T10\"},{\"56T-1T25\":\"T10\"},{\"56T-1T26\":\"T10\"},{\"56T-1T27\":\"T10\"},{\"56T-1T28\":\"T10\"},{\"56T-1T29\":\"T10\"},{\"56T-1T30\":\"T10\"},{\"56T-1T31\":\"T10\"},{\"score\":\"100\"}]', '辅导员工作认真，及时帮助我们解决学习上的问题。');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('44', '曾朝愉', '56', '[{\"56T-1T22\":\"T10\"},{\"56T-1T23\":\"T10\"},{\"56T-1T24\":\"T10\"},{\"56T-1T25\":\"T10\"},{\"56T-1T26\":\"T10\"},{\"56T-1T27\":\"T10\"},{\"56T-1T28\":\"T10\"},{\"56T-1T29\":\"T10\"},{\"56T-1T30\":\"T10\"},{\"56T-1T31\":\"T10\"},{\"score\":\"100\"}]', '有问必答，猛的一P,');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('45', '黎民忠', '57', '[{\"57T-1T22\":\"T10\"},{\"57T-1T23\":\"T10\"},{\"57T-1T24\":\"T10\"},{\"57T-1T25\":\"T10\"},{\"57T-1T26\":\"T10\"},{\"57T-1T27\":\"T10\"},{\"57T-1T28\":\"T10\"},{\"57T-1T29\":\"T10\"},{\"57T-1T30\":\"T10\"},{\"57T-1T31\":\"T10\"},{\"score\":\"100\"}]', '在马老师的代领下,手速越来越快了,\n');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('46', '赖彦希', '55', '[{\"55T20T4\":\"T6\"},{\"55T20T5\":\"T6\"},{\"55T20T6\":\"T6\"},{\"55T21T9\":\"T6\"},{\"55T21T10\":\"T6\"},{\"55T21T11\":\"T6\"},{\"55T21T12\":\"T2\"},{\"55T22T13\":\"T6\"},{\"55T22T14\":\"T6\"},{\"55T22T15\":\"T6\"},{\"55T22T16\":\"T6\"},{\"55T23T17\":\"T6\"},{\"55T23T18\":\"T6\"},{\"55T23T19\":\"T6\"},{\"55T23T20\":\"T6\"},{\"score\":\"86\"}]', '挺喜欢的一个老师，讲课也讲的很细，把知识点一点一点的分开讲，直到让人理解，很好。');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('47', '赵卫卫', '55', '[{\"55T20T4\":\"T6\"},{\"55T20T5\":\"T6\"},{\"55T20T6\":\"T6\"},{\"55T21T9\":\"T6\"},{\"55T21T10\":\"T6\"},{\"55T21T11\":\"T6\"},{\"55T21T12\":\"T4\"},{\"55T22T13\":\"T6\"},{\"55T22T14\":\"T6\"},{\"55T22T15\":\"T6\"},{\"55T22T16\":\"T6\"},{\"55T23T17\":\"T6\"},{\"55T23T18\":\"T6\"},{\"55T23T19\":\"T6\"},{\"55T23T20\":\"T6\"},{\"score\":\"88\"}]', '老师的教学风格我很喜欢，能很快的适应教学过程，能跟上老师上课的进度。在课堂上学习到的知识远比在学校学到的要多。我很喜欢周老师，希望以后跟着老师学到更多的知识。');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('48', '李斐斐', '55', '[{\"55T20T4\":\"T6\"},{\"55T20T5\":\"T4\"},{\"55T20T6\":\"T6\"},{\"55T21T9\":\"T6\"},{\"55T21T10\":\"T6\"},{\"55T21T11\":\"T6\"},{\"55T21T12\":\"T6\"},{\"55T22T13\":\"T6\"},{\"55T22T14\":\"T6\"},{\"55T22T15\":\"T6\"},{\"55T22T16\":\"T6\"},{\"55T23T17\":\"T6\"},{\"55T23T18\":\"T6\"},{\"55T23T19\":\"T6\"},{\"55T23T20\":\"T6\"},{\"score\":\"88\"}]', '挺好的，节奏不错');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('49', '任珂平', '55', '[{\"55T20T4\":\"T6\"},{\"55T20T5\":\"T6\"},{\"55T20T6\":\"T6\"},{\"55T21T9\":\"T4\"},{\"55T21T10\":\"T6\"},{\"55T21T11\":\"T4\"},{\"55T21T12\":\"T4\"},{\"55T22T13\":\"T6\"},{\"55T22T14\":\"T6\"},{\"55T22T15\":\"T6\"},{\"55T22T16\":\"T6\"},{\"55T23T17\":\"T4\"},{\"55T23T18\":\"T6\"},{\"55T23T19\":\"T6\"},{\"55T23T20\":\"T4\"},{\"score\":\"80\"}]', '好评');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('50', '任珂平', '56', '[{\"56T-1T22\":\"T8\"},{\"56T-1T23\":\"T8\"},{\"56T-1T24\":\"T8\"},{\"56T-1T25\":\"T8\"},{\"56T-1T26\":\"T8\"},{\"56T-1T27\":\"T10\"},{\"56T-1T28\":\"T8\"},{\"56T-1T29\":\"T5\"},{\"56T-1T30\":\"T10\"},{\"56T-1T31\":\"T10\"},{\"score\":\"83\"}]', '不错');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('51', '赖彦希', '56', '[{\"56T-1T22\":\"T10\"},{\"56T-1T23\":\"T8\"},{\"56T-1T24\":\"T10\"},{\"56T-1T25\":\"T8\"},{\"56T-1T26\":\"T10\"},{\"56T-1T27\":\"T10\"},{\"56T-1T28\":\"T10\"},{\"56T-1T29\":\"T10\"},{\"56T-1T30\":\"T10\"},{\"56T-1T31\":\"T10\"},{\"score\":\"96\"}]', '很积极的为同学解答各种不同的问题。');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('52', '李斐斐', '56', '[{\"56T-1T22\":\"T10\"},{\"56T-1T23\":\"T10\"},{\"56T-1T24\":\"T10\"},{\"56T-1T25\":\"T8\"},{\"56T-1T26\":\"T10\"},{\"56T-1T27\":\"T10\"},{\"56T-1T28\":\"T10\"},{\"56T-1T29\":\"T10\"},{\"56T-1T30\":\"T10\"},{\"56T-1T31\":\"T10\"},{\"score\":\"98\"}]', '有问题能及时解决，在解决问题时能额外扩展一些知识，赞！！');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('53', '祝逸翔', '55', '[{\"55T20T4\":\"T6\"},{\"55T20T5\":\"T6\"},{\"55T20T6\":\"T6\"},{\"55T21T9\":\"T6\"},{\"55T21T10\":\"T6\"},{\"55T21T11\":\"T4\"},{\"55T21T12\":\"T2\"},{\"55T22T13\":\"T6\"},{\"55T22T14\":\"T6\"},{\"55T22T15\":\"T6\"},{\"55T22T16\":\"T6\"},{\"55T23T17\":\"T6\"},{\"55T23T18\":\"T0\"},{\"55T23T19\":\"T6\"},{\"55T23T20\":\"T6\"},{\"score\":\"78\"}]', '这老师很棒哦');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('54', '牟国清', '55', '[{\"55T20T4\":\"T6\"},{\"55T20T5\":\"T6\"},{\"55T20T6\":\"T4\"},{\"55T21T9\":\"T6\"},{\"55T21T10\":\"T6\"},{\"55T21T11\":\"T4\"},{\"55T21T12\":\"T4\"},{\"55T22T13\":\"T4\"},{\"55T22T14\":\"T6\"},{\"55T22T15\":\"T6\"},{\"55T22T16\":\"T4\"},{\"55T23T17\":\"T4\"},{\"55T23T18\":\"T6\"},{\"55T23T19\":\"T6\"},{\"55T23T20\":\"T6\"},{\"score\":\"78\"}]', '老师讲的很好，知识点讲的也很到位，很敬仰。但是自己太笨，希望老师多多帮助我！');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('55', '赵卫卫', '56', '[{\"56T-1T22\":\"T10\"},{\"56T-1T23\":\"T10\"},{\"56T-1T24\":\"T10\"},{\"56T-1T25\":\"T10\"},{\"56T-1T26\":\"T10\"},{\"56T-1T27\":\"T10\"},{\"56T-1T28\":\"T10\"},{\"56T-1T29\":\"T10\"},{\"56T-1T30\":\"T8\"},{\"56T-1T31\":\"T10\"},{\"score\":\"98\"}]', '平时对同学很负责，积极为有疑惑的同学答疑解惑。');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('56', '祝逸翔', '56', '[{\"56T-1T22\":\"T10\"},{\"56T-1T23\":\"T8\"},{\"56T-1T24\":\"T10\"},{\"56T-1T25\":\"T10\"},{\"56T-1T26\":\"T5\"},{\"56T-1T27\":\"T8\"},{\"56T-1T28\":\"T10\"},{\"56T-1T29\":\"T10\"},{\"56T-1T30\":\"T5\"},{\"56T-1T31\":\"T10\"},{\"score\":\"86\"}]', '这辅导老师也还不错哦');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('57', '牟国清', '56', '[{\"56T-1T22\":\"T10\"},{\"56T-1T23\":\"T8\"},{\"56T-1T24\":\"T10\"},{\"56T-1T25\":\"T8\"},{\"56T-1T26\":\"T10\"},{\"56T-1T27\":\"T10\"},{\"56T-1T28\":\"T8\"},{\"56T-1T29\":\"T8\"},{\"56T-1T30\":\"T10\"},{\"56T-1T31\":\"T10\"},{\"score\":\"92\"}]', '这个辅导老师不错，赞一个！');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('58', '王飞', '56', '[{\"56T-1T22\":\"T8\"},{\"56T-1T23\":\"T8\"},{\"56T-1T24\":\"T8\"},{\"56T-1T25\":\"T8\"},{\"56T-1T26\":\"T8\"},{\"56T-1T27\":\"T8\"},{\"56T-1T28\":\"T8\"},{\"56T-1T29\":\"T8\"},{\"56T-1T30\":\"T8\"},{\"56T-1T31\":\"T8\"},{\"score\":\"80\"}]', '0.0');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('59', '姜鑫鹏', '57', '[{\"57T-1T22\":\"T10\"},{\"57T-1T23\":\"T10\"},{\"57T-1T24\":\"T10\"},{\"57T-1T25\":\"T10\"},{\"57T-1T26\":\"T10\"},{\"57T-1T27\":\"T10\"},{\"57T-1T28\":\"T10\"},{\"57T-1T29\":\"T10\"},{\"57T-1T30\":\"T10\"},{\"57T-1T31\":\"T10\"},{\"score\":\"100\"}]', '技术过硬，六的很，好评');

-- ----------------------------
-- Table structure for `surveys_t_questions`
-- ----------------------------
DROP TABLE IF EXISTS `surveys_t_questions`;
CREATE TABLE `surveys_t_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `big_type_id` int(11) DEFAULT '-1',
  `type` smallint(6) DEFAULT NULL,
  `title` varchar(200) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `option_score` text,
  `createTime` int(11) NOT NULL DEFAULT '0',
  `updateTime` int(11) DEFAULT NULL,
  `answer` varchar(100) DEFAULT NULL,
  `maxScore` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of surveys_t_questions
-- ----------------------------
INSERT INTO `surveys_t_questions` VALUES ('4', '20', '0', '1.教师授课时，能够列举工作中的一些相关案例来帮助学员感受实际工作环境？', 'A 合理恰当的列举，让我觉得受益匪浅，仿佛置身于实际工作环境中。&B 联系实际的举例，帮助我对问题的理解&C 列举一些意义不大的例子，对学习有帮助，但有点浪费时间。&D 只讲授课程本身的内容，不举实际的例子。', '6&4&2&0', '0', null, null, '6');
INSERT INTO `surveys_t_questions` VALUES ('5', '20', '0', '2.教师授课时，对课程中的概念的解释是否正确，没有歧义？', 'A 老师非常专业，对所有的概念都能够精确的理解和解释。&B 老师比较内行，能够比较准确的解释概念。&C 老师能够解释一般的概念，但是对有些比较偏僻的概念有盲点。&D 老师好像很多东西自己都不太清楚。', '6&4&2&0', '0', null, null, '6');
INSERT INTO `surveys_t_questions` VALUES ('6', '20', '0', '3.教师在指导过程中，对开发平台，工具的使用熟练吗？', 'A 非常熟练，让人羡慕。&B 比较熟练，能够正常演示和教学。&C 可以接受，有时候需要思考。&D 有些迟钝，感觉总是在尝试。', '6&4&2&0', '0', null, null, '6');
INSERT INTO `surveys_t_questions` VALUES ('9', '21', '0', '1．教师在讲授一个较难的问题的时候，是否能够深入浅出，让你明白？', 'A 对疑难问题的讲解非常到位。&B 能够讲的明白。&C 讲的还可以，要非常卖力才能理解&D 不知所云。', '6&4&2&0', '0', null, null, '6');
INSERT INTO `surveys_t_questions` VALUES ('10', '21', '0', '2．当你在操作过程中遇到问题，老师能否在容忍的时间内将问题解决好？', 'A 非常迅速的解决问题。&B 能够在几分钟内搞定。&C 虽然有点慢，但是还是可以当时解决的。&D 很多时候，老师要考虑很久才能给出解释。', '6&4&2&0', '0', null, null, '6');
INSERT INTO `surveys_t_questions` VALUES ('11', '21', '0', '3．教师在讲授或者指导过程中能让同学积极参与，讨论吗？', 'A 大家总是非常热情，积极参与。&B 气氛还可以，大部分同学都能积极参与讨论。&C 个别同学才喜欢和老师讨论问题。&D 自己做自己的，谁也不爱交流。', '6&4&2&0', '0', null, null, '6');
INSERT INTO `surveys_t_questions` VALUES ('12', '21', '0', '4．你能否跟上老师的讲解思路？', 'A 跟老师能够同步理解问题。&B 能跟上老师的思路。&C 虽然勉强，还是可以明白的。&D 乱七八糟的想法，不可理解。', '6&4&2&0', '0', null, null, '6');
INSERT INTO `surveys_t_questions` VALUES ('13', '22', '0', '1．当有的小组或者成员不能完成项目，老师能积极解决该问题不影响进度吗？', 'A 解决的非常好，既保证了大部分同学的进度，又给落后的小组或成员补偿的机会。&B 还可以，可以保证大部分同学的进度。&C 只注意解决问题，忽略了教学进度。&D 也跟不上进度，也没解决问题。', '6&4&2&0', '0', '0', null, '6');
INSERT INTO `surveys_t_questions` VALUES ('14', '22', '0', '2．当个别学员对平台，老师或者其他同学有不满表示时，老师能有效解决吗？', 'A 老师能够合理的解释，让同学理解。&B 虽然不理解，也要给老师面子。&C 老师不给与正面的解释，不了了之。&D 老师态度很不好，不喜欢这样的意见。', '6&4&2&0', '0', '0', null, '6');
INSERT INTO `surveys_t_questions` VALUES ('15', '22', '0', '3．遇到需要协调的问题，你愿意找授课老师解决吗？', 'A 当然要找，老师帮助很大。&B 看情况了，有必要才找。&C 实在没办法了，只有去找老师了。&D 找了也没用，还不如不找。', '6&4&2&0', '0', '0', null, '6');
INSERT INTO `surveys_t_questions` VALUES ('16', '22', '0', '4．老师是否经常不能按照计划完成当天的教学任务？', 'A能够很好的保证上课时间，按照正常的教学时间上下课；&B 基本正常&C 有一些时候不能完成授课任务。&D 总是不能按期完成教学任务。', '6&4&2&0', '0', '0', null, '6');
INSERT INTO `surveys_t_questions` VALUES ('17', '23', '0', '1、老师的言谈，举止，着装符合大众心目中的教师标准吗？', 'A 老师就该是这个样子的。&B 还不错。&C 还有些距离。&D 不太像个老师。', '6&4&2&0', '0', '0', null, '6');
INSERT INTO `surveys_t_questions` VALUES ('18', '23', '0', '2、老师对学生的作业是否认真批改？', 'A 及时，认真批改。&B 批改，有时候出现错误或者时间太长。&C 抽查批改作业。&D 不改作业，也不留作业。', '6&4&2&0', '0', '0', null, '6');
INSERT INTO `surveys_t_questions` VALUES ('19', '23', '0', '3、老师给出的测评成绩是否比较符合事实？', 'A 我认为比较准确。&B 我认为可以接受。&C 勉强。&D 老师就是主观主义，不看事实。', '6&4&2&0', '0', '0', null, '6');
INSERT INTO `surveys_t_questions` VALUES ('20', '23', '0', '4、老师备课准备的如何？', 'A  备课认真。&B  还可以。&C  有时候不备课。&D  根本不备课。', '6&4&2&0', '0', '0', null, '6');
INSERT INTO `surveys_t_questions` VALUES ('22', '-1', '0', '1、礼仪着装、精神面貌。', 'A.非常好&B、比较好&C、一般 &D、较不好&E、不好', '10&8&5&2&0', '0', '0', null, '10');
INSERT INTO `surveys_t_questions` VALUES ('23', '-1', '0', '2、表达能力（语速、吐字清晰度）。', 'A.非常好&B、比较好&C、一般 &D、较不好&E、不好', '10&8&5&2&0', '0', '0', null, '10');
INSERT INTO `surveys_t_questions` VALUES ('24', '-1', '0', '3、有耐心、循循善诱。', 'A.非常好&B、比较好&C、一般 &D、较不好&E、不好', '10&8&5&2&0', '0', '0', null, '10');
INSERT INTO `surveys_t_questions` VALUES ('25', '-1', '0', '4、专业知识扎实。', 'A.非常好&B、比较好&C、一般 &D、较不好&E、不好', '10&8&5&2&0', '0', '0', null, '10');
INSERT INTO `surveys_t_questions` VALUES ('26', '-1', '0', '5、生动、幽默、有良好的辅导技巧。', 'A.非常好&B、比较好&C、一般 &D、较不好&E、不好', '10&8&5&2&0', '0', '0', null, '10');
INSERT INTO `surveys_t_questions` VALUES ('27', '-1', '0', '6、关注学员的反应并及时调整。', 'A.非常好&B、比较好&C、一般 &D、较不好&E、不好', '10&8&5&2&0', '0', '0', null, '10');
INSERT INTO `surveys_t_questions` VALUES ('28', '-1', '0', '7、辅导内容层次是否清晰、是否衔接。', 'A.非常好&B、比较好&C、一般 &D、较不好&E、不好', '10&8&5&2&0', '0', '0', null, '10');
INSERT INTO `surveys_t_questions` VALUES ('29', '-1', '0', '8、在辅导过程中能引进更多的知识和信息。', 'A.非常好&B、比较好&C、一般 &D、较不好&E、不好', '10&8&5&2&0', '0', '0', null, '10');
INSERT INTO `surveys_t_questions` VALUES ('30', '-1', '0', '9、能有效鼓励学员参加活动和互动，调节课堂气氛。', 'A.非常好&B、比较好&C、一般 &D、较不好&E、不好', '10&8&5&2&0', '0', '0', null, '10');
INSERT INTO `surveys_t_questions` VALUES ('31', '-1', '0', '10、对学员提出的问题积极回应，回答准确。', 'A.非常好&B、比较好&C、一般 &D、较不好&E、不好', '10&8&5&2&0', '0', '0', null, '10');

-- ----------------------------
-- Table structure for `surveys_t_questions_questionnaire`
-- ----------------------------
DROP TABLE IF EXISTS `surveys_t_questions_questionnaire`;
CREATE TABLE `surveys_t_questions_questionnaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_questionnaire` int(11) DEFAULT NULL,
  `id_questions` int(11) DEFAULT NULL,
  `create_date` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=878 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of surveys_t_questions_questionnaire
-- ----------------------------
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('788', '51', '4', '1479090197283');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('789', '51', '5', '1479090197313');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('790', '51', '6', '1479090197313');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('791', '51', '9', '1479090197353');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('792', '51', '10', '1479090197354');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('793', '51', '11', '1479090197355');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('794', '51', '12', '1479090197356');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('795', '51', '13', '1479090197356');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('796', '51', '14', '1479090197365');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('797', '51', '15', '1479090197371');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('798', '51', '16', '1479090197371');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('799', '51', '17', '1479090197371');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('800', '51', '18', '1479090197444');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('801', '51', '19', '1479090197444');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('802', '51', '20', '1479090197445');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('803', '52', '4', '1479090210315');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('804', '52', '5', '1479090210315');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('805', '52', '6', '1479090210316');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('806', '52', '9', '1479090210318');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('807', '52', '10', '1479090210318');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('808', '52', '11', '1479090210319');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('809', '52', '12', '1479090210319');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('810', '52', '13', '1479090210320');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('811', '52', '14', '1479090210322');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('812', '52', '15', '1479090210322');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('813', '52', '16', '1479090210323');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('814', '52', '17', '1479090210323');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('815', '52', '18', '1479090210324');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('816', '52', '19', '1479090210324');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('817', '52', '20', '1479090210325');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('818', '53', '22', '1479090249679');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('819', '53', '23', '1479090249680');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('820', '53', '24', '1479090249681');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('821', '53', '25', '1479090249691');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('822', '53', '26', '1479090249691');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('823', '53', '27', '1479090249691');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('824', '53', '28', '1479090249692');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('825', '53', '29', '1479090249692');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('826', '53', '30', '1479090249692');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('827', '53', '31', '1479090249693');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('828', '54', '4', '1479090294065');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('829', '54', '5', '1479090294070');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('830', '54', '6', '1479090294070');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('831', '54', '9', '1479090294071');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('832', '54', '10', '1479090294071');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('833', '54', '11', '1479090294073');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('834', '54', '12', '1479090294074');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('835', '54', '13', '1479090294076');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('836', '54', '14', '1479090294077');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('837', '54', '15', '1479090294078');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('838', '54', '16', '1479090294078');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('839', '54', '17', '1479090294084');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('840', '54', '18', '1479090294085');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('841', '54', '19', '1479090294085');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('842', '54', '20', '1479090294086');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('843', '55', '4', '1479090429799');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('844', '55', '5', '1479090429800');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('845', '55', '6', '1479090429801');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('846', '55', '9', '1479090429802');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('847', '55', '10', '1479090429802');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('848', '55', '11', '1479090429804');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('849', '55', '12', '1479090429804');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('850', '55', '13', '1479090429805');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('851', '55', '14', '1479090429805');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('852', '55', '15', '1479090429805');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('853', '55', '16', '1479090429806');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('854', '55', '17', '1479090429806');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('855', '55', '18', '1479090429806');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('856', '55', '19', '1479090429807');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('857', '55', '20', '1479090429808');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('858', '56', '22', '1479090457514');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('859', '56', '23', '1479090457530');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('860', '56', '24', '1479090457530');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('861', '56', '25', '1479090457531');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('862', '56', '26', '1479090457531');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('863', '56', '27', '1479090457531');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('864', '56', '28', '1479090457532');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('865', '56', '29', '1479090457534');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('866', '56', '30', '1479090457535');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('867', '56', '31', '1479090457535');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('868', '57', '22', '1479090532239');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('869', '57', '23', '1479090532240');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('870', '57', '24', '1479090532240');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('871', '57', '25', '1479090532240');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('872', '57', '26', '1479090532241');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('873', '57', '27', '1479090532241');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('874', '57', '28', '1479090532241');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('875', '57', '29', '1479090532242');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('876', '57', '30', '1479090532242');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('877', '57', '31', '1479090532244');
