-- 题库大分类
CREATE TABLE surveys_t_question_big_type(
  id int PRIMARY KEY AUTO_INCREMENT,  -- id
  name VARCHAR(15) NOT NULL DEFAULT '', -- 分类名称
  sort_flag smallint not null default 1 -- 排序标示
);

-- 问题库表
CREATE TABLE surveys_t_questions(
  id int PRIMARY KEY AUTO_INCREMENT, -- 问题id
  big_type_id int DEFAULT -1,-- 对应的题大分类id
  type SMALLINT,-- 题型0单选,1多选,2简答
  title VARCHAR(200) NOT NULL DEFAULT '', -- 问题标题
  content TEXT  not null, -- 问题json格式
  option_score  text -- 选项对应的分数
);

-- 问卷调查表
CREATE TABLE surveys_t_questionnaire(
    id int PRIMARY KEY AUTO_INCREMENT, -- 问卷id
    class_name VARCHAR(10), -- 班级名称 20160621
    date VARCHAR(20) NOT NULL , -- 问卷调查时间
    class_chief VARCHAR (6) , -- 班主任
    to_user VARCHAR(6) NOT NULL, -- 被调查者
    end_time varchar(14), -- 调查结束时间
    note varchar(150) DEFAULT ''-- 调查表说明
);


-- 问卷和问题联合表
CREATE TABLE surveys_t_questions_questionnaire(
  id INT PRIMARY KEY AUTO_INCREMENT,
  id_questionnaire int, -- 问卷id
  id_questions int, -- 问题id
  create_date varchar(14) -- 创建时间毫秒数
);


-- 问卷调查回答表
CREATE TABLE surveys_t_questionnaire_result(
  id int PRIMARY KEY AUTO_INCREMENT,
  id_user VARCHAR(20) NOT NULL ,-- 用户id
  id_questionnaire int, -- 问卷id
  questions_reply text, -- 问题回答[{100,2},{10,2323}]
  comment VARCHAR(200) -- 评论200字以内
);




