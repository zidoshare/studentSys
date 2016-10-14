/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : surveys_sys

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2016-10-14 16:08:32
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of surveys_t_questionnaire
-- ----------------------------
INSERT INTO `surveys_t_questionnaire` VALUES ('39', '互动160621班', '1476264600000', '刘美奇', '刘美奇', '1476268200000', null, null, '0');
INSERT INTO `surveys_t_questionnaire` VALUES ('40', '互动160719班', '1476264600000', '张杰', '张杰', '1476268200000', null, null, '0');
INSERT INTO `surveys_t_questionnaire` VALUES ('41', '互动160824班', '1476264600000', '陈乔祎', '陈乔祎', '1476268200000', null, null, '0');
INSERT INTO `surveys_t_questionnaire` VALUES ('42', '互动160921班', '1476264600000', '赵乾', '赵乾', '1476268200000', null, null, '0');
INSERT INTO `surveys_t_questionnaire` VALUES ('43', '互动160921班', '1476264600000', '赵乾', '邹鹏', '1476268200000', null, null, '0');
INSERT INTO `surveys_t_questionnaire` VALUES ('44', '互动160719班', '1476264600000', '张杰', '马吉', '1476268200000', null, null, '0');
INSERT INTO `surveys_t_questionnaire` VALUES ('45', '互动160824班', '1476264600000', '陈乔祎', '吴开权', '1476268200000', null, null, '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of surveys_t_questionnaire_result
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=698 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of surveys_t_questions_questionnaire
-- ----------------------------
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('608', '39', '4', '1476253987622');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('609', '39', '5', '1476253987650');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('610', '39', '6', '1476253987650');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('611', '39', '9', '1476253987675');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('612', '39', '10', '1476253987676');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('613', '39', '11', '1476253987695');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('614', '39', '12', '1476253987707');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('615', '39', '13', '1476253987707');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('616', '39', '14', '1476253987716');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('617', '39', '15', '1476253987727');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('618', '39', '16', '1476253987727');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('619', '39', '17', '1476253987728');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('620', '39', '18', '1476253987728');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('621', '39', '19', '1476253987728');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('622', '39', '20', '1476253987742');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('623', '40', '4', '1476254016466');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('624', '40', '5', '1476254016467');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('625', '40', '6', '1476254016467');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('626', '40', '9', '1476254016468');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('627', '40', '10', '1476254016468');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('628', '40', '11', '1476254016468');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('629', '40', '12', '1476254016469');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('630', '40', '13', '1476254016494');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('631', '40', '14', '1476254016522');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('632', '40', '15', '1476254016538');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('633', '40', '16', '1476254016544');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('634', '40', '17', '1476254016545');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('635', '40', '18', '1476254016565');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('636', '40', '19', '1476254016566');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('637', '40', '20', '1476254016566');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('638', '41', '4', '1476254051062');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('639', '41', '5', '1476254051062');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('640', '41', '6', '1476254051063');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('641', '41', '9', '1476254051075');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('642', '41', '10', '1476254051076');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('643', '41', '11', '1476254051083');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('644', '41', '12', '1476254051104');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('645', '41', '13', '1476254051104');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('646', '41', '14', '1476254051105');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('647', '41', '15', '1476254051105');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('648', '41', '16', '1476254051106');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('649', '41', '17', '1476254051106');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('650', '41', '18', '1476254051106');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('651', '41', '19', '1476254051106');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('652', '41', '20', '1476254051107');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('653', '42', '4', '1476254075196');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('654', '42', '5', '1476254075217');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('655', '42', '6', '1476254075217');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('656', '42', '9', '1476254075235');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('657', '42', '10', '1476254075244');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('658', '42', '11', '1476254075245');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('659', '42', '12', '1476254075245');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('660', '42', '13', '1476254075269');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('661', '42', '14', '1476254075315');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('662', '42', '15', '1476254075315');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('663', '42', '16', '1476254075337');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('664', '42', '17', '1476254075338');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('665', '42', '18', '1476254075338');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('666', '42', '19', '1476254075338');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('667', '42', '20', '1476254075338');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('668', '43', '22', '1476254174419');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('669', '43', '23', '1476254174419');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('670', '43', '24', '1476254174419');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('671', '43', '25', '1476254174420');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('672', '43', '26', '1476254174446');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('673', '43', '27', '1476254174446');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('674', '43', '28', '1476254174447');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('675', '43', '29', '1476254174447');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('676', '43', '30', '1476254174447');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('677', '43', '31', '1476254174448');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('678', '44', '22', '1476254242970');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('679', '44', '23', '1476254242970');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('680', '44', '24', '1476254242988');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('681', '44', '25', '1476254243003');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('682', '44', '26', '1476254243004');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('683', '44', '27', '1476254243013');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('684', '44', '28', '1476254243041');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('685', '44', '29', '1476254243042');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('686', '44', '30', '1476254243043');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('687', '44', '31', '1476254243043');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('688', '45', '22', '1476254272847');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('689', '45', '23', '1476254272847');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('690', '45', '24', '1476254272861');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('691', '45', '25', '1476254272861');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('692', '45', '26', '1476254272861');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('693', '45', '27', '1476254272866');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('694', '45', '28', '1476254272949');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('695', '45', '29', '1476254272950');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('696', '45', '30', '1476254272966');
INSERT INTO `surveys_t_questions_questionnaire` VALUES ('697', '45', '31', '1476254272967');

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
