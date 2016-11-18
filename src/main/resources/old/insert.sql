/*
添加一个学生需要添加两个表

需要添加的两个表的内容：
  user:
    `userAccount` varchar(20) DEFAULT NULL COMMENT '用户账户',
    `userPassword` varchar(20) DEFAULT NULL COMMENT '用户密码',
    `userNickname` varchar(20) DEFAULT NULL COMMENT '用户昵称', 【昵称必须与学生的名字相同】
    `userRole` varchar(20) DEFAULT NULL COMMENT '用户角色', 【直接写'学生'】
    `userCreateTime` bigint(20) DEFAULT NULL COMMENT '用户创建时间', 【创建时间为毫秒数】
  student:
    `name` varchar(255) DEFAULT NULL,【名字必须与用户的昵称相同】
    `className` varchar(20) DEFAULT NULL COMMENT '班级名称',
    `tutor` varchar(20) DEFAULT NULL COMMENT '辅导老师名字',
    `createTime` bigint(20) DEFAULT NULL COMMENT '用户创建时间', 【创建时间为毫秒数】
*/
INSERT INTO stumanager_user(userAccount,userPassword,userNickname,userRole,userCreateTime) VALUES (1,1,1,1,1)

INSERT INTO stumanager_student(name,className,tutor,contactInformation,createTime) VALUES(1,1,1,1,1)