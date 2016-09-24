/*
Navicat MySQL Data Transfer

Source Server         : 公司数据库
Source Server Version : 50631
Source Host           : 192.168.6.250:3306
Source Database       : surveys_sys

Target Server Type    : MYSQL
Target Server Version : 50631
File Encoding         : 65001

Date: 2016-09-14 10:32:31
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
) ENGINE=InnoDB AUTO_INCREMENT=1515649 DEFAULT CHARSET=utf8mb4;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of surveys_t_questionnaire
-- ----------------------------
INSERT INTO `surveys_t_questionnaire` VALUES ('5', '0524班', '1473651290000', '11', '讲师', '1473655800000', null);
INSERT INTO `surveys_t_questionnaire` VALUES ('8', '0524班', '1473651681000', '11', '辅导', '1473655821000', null);
INSERT INTO `surveys_t_questionnaire` VALUES ('9', '0524', '1473664275000', '讲师', '讲师', '1473923475000', null);
INSERT INTO `surveys_t_questionnaire` VALUES ('10', '0524', '1473664275000', '讲师', '辅导', '1473923475000', null);
INSERT INTO `surveys_t_questionnaire` VALUES ('11', '0525', '1473923816000', '11', '11', '1474010216000', null);
INSERT INTO `surveys_t_questionnaire` VALUES ('12', '0525', '1473924297000', '11', '22', '1474010697000', null);
INSERT INTO `surveys_t_questionnaire` VALUES ('13', '0526', '1473933600000', '无', '讲师', '1473934800000', null);
INSERT INTO `surveys_t_questionnaire` VALUES ('14', '0526', '1473933600000', '无', '辅导', '1473934820000', null);
INSERT INTO `surveys_t_questionnaire` VALUES ('15', '0527', '1473933600000', '无', '辅导', '1473934800000', null);
INSERT INTO `surveys_t_questionnaire` VALUES ('16', '0527', '1473933600000', '无', '讲师', '1473933600000', null);
INSERT INTO `surveys_t_questionnaire` VALUES ('17', '0527', '1473937399000', '11', '11', '1474196599000', null);
INSERT INTO `surveys_t_questionnaire` VALUES ('18', '0527', '1473937399000', '11', '22', '1474196599000', null);
INSERT INTO `surveys_t_questionnaire` VALUES ('19', '0525', '1473937500000', 'wds', 'wds', '1474196497000', null);
INSERT INTO `surveys_t_questionnaire` VALUES ('20', '0526', '1473816450000', '11', '11', '1474162050000', null);
INSERT INTO `surveys_t_questionnaire` VALUES ('21', '0526', '1473816526000', '11', '22', '1474162126000', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of surveys_t_questionnaire_result
-- ----------------------------
INSERT INTO `surveys_t_questionnaire_result` VALUES ('47', '0:0:0:0:0:0:0:1', '21', '[{\"21T-1T22\":\"T5\"},{\"21T-1T23\":\"T8\"},{\"21T-1T24\":\"T2\"},{\"21T-1T25\":\"T10\"},{\"21T-1T26\":\"T5\"},{\"21T-1T27\":\"T8\"},{\"21T-1T28\":\"T2\"},{\"21T-1T29\":\"T8\"},{\"21T-1T30\":\"T2\"},{\"21T-1T31\":\"T5\"},{\"score\":\"97\"}]', '[{\"21T-1T22\":\"T5\"},{\"21T-1T23\":\"T8\"},{\"21T-1T24\":\"T2\"},{\"21T-1T25\":\"T10\"},{\"21T-1T26\":\"T5\"},{\"21T-1T27\":\"T8\"},{\"21T-1T28\":\"T2\"},{\"21T-1T29\":\"T8\"},{\"21T-1T30\":\"T2\"},{\"21T-1T31\":\"T5\"},{\"score\":\"97\"}]');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('48', '0:0:0:0:0:0:0:1', '20', '[{\"20T20T4\":\"T6\"},{\"20T20T5\":\"T6\"},{\"20T20T6\":\"T6\"},{\"20T21T9\":\"T6\"},{\"20T21T10\":\"T6\"},{\"20T21T11\":\"T6\"},{\"20T21T12\":\"T6\"},{\"20T22T13\":\"T6\"},{\"20T22T14\":\"T6\"},{\"20T22T15\":\"T6\"},{\"20T22T16\":\"T6\"},{\"20T23T17\":\"T6\"},{\"20T23T18\":\"T6\"},{\"20T23T19\":\"T6\"},{\"20T23T20\":\"T6\"},{\"score\":\"90\"}]', '14');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('49', '192.168.6.245', '20', '[{\"20T20T4\":\"T2\"},{\"20T20T5\":\"T4\"},{\"20T20T6\":\"T4\"},{\"20T21T9\":\"T6\"},{\"20T21T10\":\"T2\"},{\"20T21T11\":\"T4\"},{\"20T21T12\":\"T4\"},{\"20T22T13\":\"T6\"},{\"20T22T14\":\"T6\"},{\"20T22T15\":\"T2\"},{\"20T22T16\":\"T4\"},{\"20T23T17\":\"T2\"},{\"20T23T18\":\"T4\"},{\"20T23T19\":\"T0\"},{\"20T23T20\":\"T4\"},{\"score\":\"54\"}]', '123');
INSERT INTO `surveys_t_questionnaire_result` VALUES ('50', '192.168.6.245', '21', '[{\"21T-1T22\":\"T2\"},{\"21T-1T23\":\"T2\"},{\"21T-1T24\":\"T10\"},{\"21T-1T25\":\"T0\"},{\"21T-1T26\":\"T10\"},{\"21T-1T27\":\"T8\"},{\"21T-1T28\":\"T8\"},{\"21T-1T29\":\"T5\"},{\"21T-1T30\":\"T5\"},{\"21T-1T31\":\"T5\"},{\"score\":\"109\"}]', '12314324');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of surveys_t_questions
-- ----------------------------
INSERT INTO `surveys_t_questions` VALUES ('4', '20', '0', '1.教师授课时，能够列举工作中的一些相关案例来帮助学员感受实际工作环境？', 'A 合理恰当的列举，让我觉得受益匪浅，仿佛置身于实际工作环境中。&B 联系实际的举例，帮助我对问题的理解&C 列举一些意义不大的例子，对学习有帮助，但有点浪费时间。&D 只讲授课程本身的内容，不举实际的例子。', '6&4&2&0');
INSERT INTO `surveys_t_questions` VALUES ('5', '20', '0', '2.教师授课时，对课程中的概念的解释是否正确，没有歧义？', 'A 老师非常专业，对所有的概念都能够精确的理解和解释。&B 老师比较内行，能够比较准确的解释概念。&C 老师能够解释一般的概念，但是对有些比较偏僻的概念有盲点。&D 老师好像很多东西自己都不太清楚。', '6&4&2&0');
INSERT INTO `surveys_t_questions` VALUES ('6', '20', '0', '3.教师在指导过程中，对开发平台，工具的使用熟练吗？', 'A 非常熟练，让人羡慕。&B 比较熟练，能够正常演示和教学。&C 可以接受，有时候需要思考。&D 有些迟钝，感觉总是在尝试。', '6&4&2&0');
INSERT INTO `surveys_t_questions` VALUES ('9', '21', '0', '1．教师在讲授一个较难的问题的时候，是否能够深入浅出，让你明白？', 'A 对疑难问题的讲解非常到位。&B 能够讲的明白。&C 讲的还可以，要非常卖力才能理解&D 不知所云。', '6&4&2&0');
INSERT INTO `surveys_t_questions` VALUES ('10', '21', '0', '2．当你在操作过程中遇到问题，老师能否在容忍的时间内将问题解决好？', 'A 非常迅速的解决问题。&B 能够在几分钟内搞定。&C 虽然有点慢，但是还是可以当时解决的。&D 很多时候，老师要考虑很久才能给出解释。', '6&4&2&0');
INSERT INTO `surveys_t_questions` VALUES ('11', '21', '0', '3．教师在讲授或者指导过程中能让同学积极参与，讨论吗？', 'A 大家总是非常热情，积极参与。&B 气氛还可以，大部分同学都能积极参与讨论。&C 个别同学才喜欢和老师讨论问题。&D 自己做自己的，谁也不爱交流。', '6&4&2&0');
INSERT INTO `surveys_t_questions` VALUES ('12', '21', '0', '4．你能否跟上老师的讲解思路？', 'A 跟老师能够同步理解问题。&B 能跟上老师的思路。&C 虽然勉强，还是可以明白的。&D 乱七八糟的想法，不可理解。', '6&4&2&0');
INSERT INTO `surveys_t_questions` VALUES ('13', '22', '0', '1．当有的小组或者成员不能完成项目，老师能积极解决该问题不影响进度吗？', 'A 解决的非常好，既保证了大部分同学的进度，又给落后的小组或成员补偿的机会。&B 还可以，可以保证大部分同学的进度。&C 只注意解决问题，忽略了教学进度。&D 也跟不上进度，也没解决问题。', '6&4&2&0');
INSERT INTO `surveys_t_questions` VALUES ('14', '22', '0', '2．当个别学员对平台，老师或者其他同学有不满表示时，老师能有效解决吗？', 'A 老师能够合理的解释，让同学理解。&B 虽然不理解，也要给老师面子。&C 老师不给与正面的解释，不了了之。&D 老师态度很不好，不喜欢这样的意见。', '6&4&2&0');
INSERT INTO `surveys_t_questions` VALUES ('15', '22', '0', '3．遇到需要协调的问题，你愿意找授课老师解决吗？', 'A 当然要找，老师帮助很大。&B 看情况了，有必要才找。&C 实在没办法了，只有去找老师了。&D 找了也没用，还不如不找。', '6&4&2&0');
INSERT INTO `surveys_t_questions` VALUES ('16', '22', '0', '4．老师是否经常不能按照计划完成当天的教学任务？', 'A能够很好的保证上课时间，按照正常的教学时间上下课；&B 基本正常&C 有一些时候不能完成授课任务。&D 总是不能按期完成教学任务。', '6&4&2&0');
INSERT INTO `surveys_t_questions` VALUES ('17', '23', '0', '1、老师的言谈，举止，着装符合大众心目中的教师标准吗？', 'A 老师就该是这个样子的。&B 还不错。&C 还有些距离。&D 不太像个老师。', '6&4&2&0');
INSERT INTO `surveys_t_questions` VALUES ('18', '23', '0', '2、老师对学生的作业是否认真批改？', 'A 及时，认真批改。&B 批改，有时候出现错误或者时间太长。&C 抽查批改作业。&D 不改作业，也不留作业。', '6&4&2&0');
INSERT INTO `surveys_t_questions` VALUES ('19', '23', '0', '3、老师给出的测评成绩是否比较符合事实？', 'A 我认为比较准确。&B 我认为可以接受。&C 勉强。&D 老师就是主观主义，不看事实。', '6&4&2&0');
INSERT INTO `surveys_t_questions` VALUES ('20', '23', '0', '4、老师备课准备的如何？', 'A  备课认真。&B  还可以。&C  有时候不备课。&D  根本不备课。', '6&4&2&0');
INSERT INTO `surveys_t_questions` VALUES ('22', '-1', '0', '1、礼仪着装、精神面貌。', 'A.非常好&B、比较好&C、一般 &D、较不好&E、不好', '10&8&5&2&0');
INSERT INTO `surveys_t_questions` VALUES ('23', '-1', '0', '2、表达能力（语速、吐字清晰度）。', 'A.非常好&B、比较好&C、一般 &D、较不好&E、不好', '10&8&5&2&0');
INSERT INTO `surveys_t_questions` VALUES ('24', '-1', '0', '3、有耐心、循循善诱。', 'A.非常好&B、比较好&C、一般 &D、较不好&E、不好', '10&8&5&2&0');
INSERT INTO `surveys_t_questions` VALUES ('25', '-1', '0', '4、专业知识扎实。', 'A.非常好&B、比较好&C、一般 &D、较不好&E、不好', '10&8&5&2&0');
INSERT INTO `surveys_t_questions` VALUES ('26', '-1', '0', '5、生动、幽默、有良好的辅导技巧。', 'A.非常好&B、比较好&C、一般 &D、较不好&E、不好', '10&8&5&2&0');
INSERT INTO `surveys_t_questions` VALUES ('27', '-1', '0', '6、关注学员的反应并及时调整。', 'A.非常好&B、比较好&C、一般 &D、较不好&E、不好', '10&8&5&2&0');
INSERT INTO `surveys_t_questions` VALUES ('28', '-1', '0', '7、辅导内容层次是否清晰、是否衔接。', 'A.非常好&B、比较好&C、一般 &D、较不好&E、不好', '10&8&5&2&0');
INSERT INTO `surveys_t_questions` VALUES ('29', '-1', '0', '8、在辅导过程中能引进更多的知识和信息。', 'A.非常好&B、比较好&C、一般 &D、较不好&E、不好', '10&8&5&2&0');
INSERT INTO `surveys_t_questions` VALUES ('30', '-1', '0', '9、能有效鼓励学员参加活动和互动，调节课堂气氛。', 'A.非常好&B、比较好&C、一般 &D、较不好&E、不好', '10&8&5&2&0');
INSERT INTO `surveys_t_questions` VALUES ('31', '-1', '0', '10、对学员提出的问题积极回应，回答准确。', 'A.非常好&B、比较好&C、一般 &D、较不好&E、不好', '10&8&5&2&0');

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
) ENGINE=InnoDB AUTO_INCREMENT=363 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of surveys_t_questions_questionnaire
-- ----------------------------
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('55', '4', '4', '1473651238326');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('56', '4', '5', '1473651238333');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('57', '4', '6', '1473651238342');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('58', '4', '9', '1473651238362');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('59', '4', '10', '1473651238497');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('60', '4', '11', '1473651238697');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('61', '4', '12', '1473651238707');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('62', '4', '13', '1473651238711');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('63', '4', '14', '1473651238729');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('64', '4', '15', '1473651238733');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('65', '4', '16', '1473651238735');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('66', '4', '17', '1473651238738');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('67', '4', '18', '1473651238744');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('68', '4', '19', '1473651238752');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('69', '4', '20', '1473651238754');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('70', '4', '22', '1473651238757');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('71', '4', '23', '1473651238759');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('72', '4', '24', '1473651238761');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('73', '4', '25', '1473651238764');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('74', '4', '26', '1473651238766');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('75', '4', '27', '1473651238769');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('76', '4', '28', '1473651238771');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('77', '4', '29', '1473651238773');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('78', '4', '30', '1473651238775');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('79', '4', '31', '1473651238778');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('80', '5', '4', '1473651374448');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('81', '5', '5', '1473651374453');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('82', '5', '6', '1473651374455');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('83', '5', '9', '1473651374456');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('84', '5', '10', '1473651374457');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('85', '5', '11', '1473651374459');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('86', '5', '12', '1473651374461');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('87', '5', '13', '1473651374463');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('88', '5', '14', '1473651374466');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('89', '5', '15', '1473651374469');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('90', '5', '16', '1473651374472');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('91', '5', '17', '1473651374474');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('92', '5', '18', '1473651374476');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('93', '5', '19', '1473651374480');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('94', '5', '20', '1473651374482');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('95', '5', '22', '1473651374484');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('96', '5', '23', '1473651374490');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('97', '5', '24', '1473651374492');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('98', '5', '25', '1473651374495');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('99', '5', '26', '1473651374497');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('100', '5', '27', '1473651374499');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('101', '5', '28', '1473651374503');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('102', '5', '29', '1473651374524');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('103', '5', '30', '1473651374530');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('104', '5', '31', '1473651374539');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('105', '6', '4', '1473651418402');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('106', '6', '5', '1473651418480');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('107', '6', '6', '1473651418483');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('108', '6', '9', '1473651418485');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('109', '6', '10', '1473651418487');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('110', '6', '11', '1473651418490');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('111', '6', '12', '1473651418492');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('112', '6', '13', '1473651418494');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('113', '6', '14', '1473651418498');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('114', '6', '15', '1473651418507');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('115', '6', '16', '1473651418509');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('116', '6', '17', '1473651418512');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('117', '6', '18', '1473651418514');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('118', '6', '19', '1473651418517');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('119', '6', '20', '1473651418520');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('120', '6', '22', '1473651418527');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('121', '6', '23', '1473651418532');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('122', '6', '24', '1473651418535');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('123', '6', '25', '1473651418537');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('124', '6', '26', '1473651418539');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('125', '6', '27', '1473651418542');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('126', '6', '28', '1473651418545');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('127', '6', '29', '1473651418548');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('128', '6', '30', '1473651418552');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('129', '6', '31', '1473651418555');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('130', '7', '22', '1473651596458');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('131', '7', '23', '1473651596514');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('132', '7', '24', '1473651596520');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('133', '7', '25', '1473651596597');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('134', '7', '26', '1473651596647');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('135', '7', '27', '1473651596656');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('136', '7', '28', '1473651596710');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('137', '7', '29', '1473651596749');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('138', '7', '30', '1473651596778');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('139', '7', '31', '1473651596852');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('140', '8', '22', '1473651704772');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('141', '8', '23', '1473651704777');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('142', '8', '24', '1473651704780');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('143', '8', '25', '1473651704781');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('144', '8', '26', '1473651704783');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('145', '8', '27', '1473651704785');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('146', '8', '28', '1473651704787');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('147', '8', '29', '1473651704798');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('148', '8', '30', '1473651704800');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('149', '8', '31', '1473651704929');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('150', '9', '4', '1473664320669');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('151', '9', '5', '1473664320674');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('152', '9', '6', '1473664320677');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('153', '9', '9', '1473664320682');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('154', '9', '10', '1473664320684');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('155', '9', '11', '1473664320686');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('156', '9', '12', '1473664320704');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('157', '9', '13', '1473664320718');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('158', '9', '14', '1473664320720');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('159', '9', '15', '1473664320722');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('160', '9', '16', '1473664320725');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('161', '9', '17', '1473664320731');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('162', '9', '18', '1473664320735');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('163', '9', '19', '1473664320737');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('164', '9', '20', '1473664320739');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('165', '10', '4', '1473664329106');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('166', '10', '5', '1473664329110');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('167', '10', '6', '1473664329136');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('168', '10', '9', '1473664329157');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('169', '10', '10', '1473664329188');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('170', '10', '11', '1473664329213');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('171', '10', '12', '1473664329260');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('172', '10', '13', '1473664329272');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('173', '10', '14', '1473664329283');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('174', '10', '15', '1473664329289');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('175', '10', '16', '1473664329303');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('176', '10', '17', '1473664329316');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('177', '10', '18', '1473664329320');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('178', '10', '19', '1473664329326');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('179', '10', '20', '1473664329335');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('180', '11', '4', '1473923831965');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('181', '11', '5', '1473923831980');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('182', '11', '6', '1473923831983');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('183', '11', '9', '1473923831984');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('184', '11', '10', '1473923831992');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('185', '11', '11', '1473923831994');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('186', '11', '12', '1473923832024');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('187', '11', '13', '1473923832044');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('188', '11', '14', '1473923832050');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('189', '11', '15', '1473923832052');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('190', '11', '16', '1473923832054');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('191', '11', '17', '1473923832058');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('192', '11', '18', '1473923832070');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('193', '11', '19', '1473923832076');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('194', '11', '20', '1473923832078');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('195', '11', '22', '1473923832080');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('196', '11', '23', '1473923832083');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('197', '11', '24', '1473923832085');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('198', '11', '25', '1473923832087');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('199', '11', '26', '1473923832089');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('200', '11', '27', '1473923832114');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('201', '11', '28', '1473923832116');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('202', '11', '29', '1473923832120');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('203', '11', '30', '1473923832122');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('204', '11', '31', '1473923832123');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('205', '12', '4', '1473924312530');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('206', '12', '5', '1473924312536');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('207', '12', '6', '1473924312538');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('208', '12', '9', '1473924312541');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('209', '12', '10', '1473924312544');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('210', '12', '11', '1473924312546');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('211', '12', '12', '1473924312570');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('212', '12', '13', '1473924312571');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('213', '12', '14', '1473924312573');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('214', '12', '15', '1473924312575');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('215', '12', '16', '1473924312576');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('216', '12', '17', '1473924312580');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('217', '12', '18', '1473924312582');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('218', '12', '19', '1473924312584');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('219', '12', '20', '1473924312585');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('220', '12', '22', '1473924312592');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('221', '12', '23', '1473924312593');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('222', '12', '24', '1473924312595');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('223', '12', '25', '1473924312597');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('224', '12', '26', '1473924312599');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('225', '12', '27', '1473924312602');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('226', '12', '28', '1473924312603');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('227', '12', '29', '1473924312606');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('228', '12', '30', '1473924312607');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('229', '12', '31', '1473924312609');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('230', '13', '4', '1473932827631');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('231', '13', '5', '1473932827633');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('232', '13', '6', '1473932827636');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('233', '13', '9', '1473932827637');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('234', '13', '10', '1473932827638');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('235', '13', '11', '1473932827639');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('236', '13', '12', '1473932827640');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('237', '13', '13', '1473932827642');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('238', '13', '14', '1473932827643');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('239', '13', '15', '1473932827647');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('240', '13', '16', '1473932827649');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('241', '13', '17', '1473932827652');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('242', '13', '18', '1473932827653');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('243', '13', '19', '1473932827655');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('244', '13', '20', '1473932827656');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('245', '14', '22', '1473932868436');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('246', '14', '23', '1473932868442');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('247', '14', '24', '1473932868444');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('248', '14', '25', '1473932868448');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('249', '14', '26', '1473932868451');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('250', '14', '27', '1473932868453');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('251', '14', '28', '1473932868456');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('252', '14', '29', '1473932868458');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('253', '14', '30', '1473932868462');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('254', '14', '31', '1473932868463');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('255', '15', '22', '1473932909000');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('256', '15', '23', '1473932909003');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('257', '15', '24', '1473932909005');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('258', '15', '25', '1473932909007');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('259', '15', '26', '1473932909010');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('260', '15', '27', '1473932909026');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('261', '15', '28', '1473932909028');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('262', '15', '29', '1473932909031');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('263', '15', '30', '1473932909035');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('264', '15', '31', '1473932909039');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('265', '16', '4', '1473932946684');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('266', '16', '5', '1473932946686');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('267', '16', '6', '1473932946689');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('268', '16', '9', '1473932946702');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('269', '16', '10', '1473932946703');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('270', '16', '11', '1473932946706');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('271', '16', '12', '1473932946708');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('272', '16', '13', '1473932946712');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('273', '16', '14', '1473932946714');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('274', '16', '15', '1473932946718');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('275', '16', '16', '1473932946721');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('276', '16', '17', '1473932946723');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('277', '16', '18', '1473932946727');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('278', '16', '19', '1473932946729');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('279', '16', '20', '1473932946731');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('280', '17', '4', '1473937416830');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('281', '17', '5', '1473937416833');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('282', '17', '6', '1473937416835');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('283', '17', '9', '1473937416838');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('284', '17', '10', '1473937416840');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('285', '17', '11', '1473937416846');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('286', '17', '12', '1473937416857');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('287', '17', '13', '1473937416860');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('288', '17', '14', '1473937416862');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('289', '17', '15', '1473937416867');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('290', '17', '16', '1473937416938');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('291', '17', '17', '1473937416940');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('292', '17', '18', '1473937416948');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('293', '17', '19', '1473937416952');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('294', '17', '20', '1473937416956');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('295', '17', '22', '1473937416959');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('296', '17', '23', '1473937416962');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('297', '17', '24', '1473937416966');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('298', '17', '25', '1473937416969');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('299', '17', '26', '1473937416970');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('300', '17', '27', '1473937416973');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('301', '17', '28', '1473937416977');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('302', '17', '29', '1473937416978');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('303', '17', '30', '1473937416980');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('304', '17', '31', '1473937417054');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('305', '18', '4', '1473937430648');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('306', '18', '5', '1473937430656');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('307', '18', '6', '1473937430659');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('308', '18', '9', '1473937430660');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('309', '18', '10', '1473937430662');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('310', '18', '11', '1473937430663');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('311', '18', '12', '1473937430664');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('312', '18', '13', '1473937430668');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('313', '18', '14', '1473937430670');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('314', '18', '15', '1473937430671');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('315', '18', '16', '1473937430673');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('316', '18', '17', '1473937430675');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('317', '18', '18', '1473937430676');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('318', '18', '19', '1473937430678');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('319', '18', '20', '1473937430679');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('320', '18', '22', '1473937430680');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('321', '18', '23', '1473937430683');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('322', '18', '24', '1473937430685');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('323', '18', '25', '1473937430686');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('324', '18', '26', '1473937430689');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('325', '18', '27', '1473937430691');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('326', '18', '28', '1473937430693');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('327', '18', '29', '1473937430695');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('328', '18', '30', '1473937430696');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('329', '18', '31', '1473937430700');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('330', '19', '4', '1473937552687');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('331', '19', '5', '1473937552698');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('332', '19', '6', '1473937552702');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('333', '19', '9', '1473937552704');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('334', '19', '10', '1473937552706');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('335', '19', '11', '1473937552709');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('336', '19', '12', '1473937552711');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('337', '19', '13', '1473937552712');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('338', '20', '4', '1473816497161');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('339', '20', '5', '1473816497173');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('340', '20', '6', '1473816497201');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('341', '20', '9', '1473816497251');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('342', '20', '10', '1473816497262');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('343', '20', '11', '1473816497276');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('344', '20', '12', '1473816497284');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('345', '20', '13', '1473816497286');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('346', '20', '14', '1473816497288');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('347', '20', '15', '1473816497290');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('348', '20', '16', '1473816497292');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('349', '20', '17', '1473816497295');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('350', '20', '18', '1473816497299');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('351', '20', '19', '1473816497306');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('352', '20', '20', '1473816497312');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('353', '21', '22', '1473816535698');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('354', '21', '23', '1473816535989');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('355', '21', '24', '1473816536550');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('356', '21', '25', '1473816536572');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('357', '21', '26', '1473816536575');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('358', '21', '27', '1473816536578');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('359', '21', '28', '1473816536581');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('360', '21', '29', '1473816536586');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('361', '21', '30', '1473816536590');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('362', '21', '31', '1473816536602');
