/*student表 13个数据，其中qq、Major、salary、company字段可以为空*/
/*
字段：
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
个别id选择范围：
	classid:
		0621 id:1
		0719 id:2
		0824 id:3
		0921 id:4
	method:
		现金1 id:1
		现金2 id:2
		现金3 id:3
*/

insert into stu_student(id,studentName,studentClassId,studentPhone,studentQq,studentIDCard,studentPayMethod,studentEducation,studentGraduateSchool,studentGraduateTime,studentMajor,studentSalary,studentCompany) VALUES (1,1,1,1,1,1,1,1,1,1,1,1,1);

