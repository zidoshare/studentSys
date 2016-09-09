-- 题库大分类(1单选,2多选,3判断,4简答,5编程)
CREATE TABLE testing_t_question_big_type(
  id int PRIMARY KEY AUTO_INCREMENT,  -- id
  name VARCHAR(100) UNIQUE NOT NULL DEFAULT '', -- 分类名称
  sort_flag smallint not null default 0 , -- 排序标示
   is_enable SMALLINT DEFAULT 1 -- 是否启用0不能使用(0,1)
);

-- 题的分类标签
create TABLE  testing_t_questions_tag(
  id int PRIMARY KEY AUTO_INCREMENT, -- 题对应的标签名称,例如io,字符串,时间
  name VARCHAR(50) NOT NULL DEFAULT '', -- 题每次
   is_enable SMALLINT DEFAULT 1 -- 是否启用0不能使用(0,1)
);

--问题库表
CREATE TABLE testing_t_questions(
  id int PRIMARY KEY AUTO_INCREMENT, -- 问题id
  big_type_id int DEFAULT -1,-- 对应的题大分类id
  title VARCHAR(200) NOT NULL DEFAULT '', -- 问题标题
  tag_id VARCHAR(200) NOT NULL, -- 对应标签id,对应多个使用分割号:[1,2,10]
  content TEXT  not null, -- 问题json格式
  score  SMALLINT NOT  NULL DEFAULT 0,-- 分数
  answer VARCHAR(20), -- 题对应的答案,多个用逗号分割
  create_time VARCHAR(14), -- 题创建时间
  creater_id int, -- 创建者id
  is_enable SMALLINT DEFAULT 1 -- 是否启用0不能使用(0,1)
);

-- 试卷表
CREATE TABLE testing_t_questionnaire(
    id int PRIMARY KEY AUTO_INCREMENT, -- 问卷id
    class_id int NOT NULL ,-- 对应的班级id
    start_time VARCHAR(15) NOT NULL , -- 开始考试时间
    end_time varchar(14), -- 考试结束时间
    creat_time VARCHAR(14), -- 创建时间
    title VARCHAR (50), -- 试卷标题
    total_score SMALLINT ,-- 试卷总分
    note VARCHAR (50),-- 试卷备注
    join_number SMALLINT ,-- 考试人数
    submit_numer SMALLINT ,-- 已经提交的人数
    aver_score SMALLINT -- 考试平均分
);
-- 问卷和问题联合表
CREATE TABLE testing_t_questions_questionnaire(
  id INT PRIMARY KEY AUTO_INCREMENT,
  id_questionnaire int, -- 问卷id
  id_questions int -- 问题id
);

-- 试卷回答表
CREATE TABLE testing_t_questionnaire_result(
  id int PRIMARY KEY AUTO_INCREMENT,
  id_user int NOT NULL ,-- 用户id
  id_questionnaire int, -- 问卷id
  questions_reply text -- 问题回答[{100,2},{10,2323}]
);

-- 成绩表
CREATE TABLE testing_t_questionnaire_result(
  id int PRIMARY KEY AUTO_INCREMENT,
  id_user int NOT NULL ,-- 用户id
  id_questionnaire int, -- 问卷id
  questions_reply text, -- [{题编号,得分}]
  total_score SMALLINT  -- 总分
);




