package com.hudongwx.studentsys.util;

import com.hudongwx.studentsys.model.Class;
import com.hudongwx.studentsys.model.Role;
import com.hudongwx.studentsys.model.Student;
import com.hudongwx.studentsys.model.User;
import com.hudongwx.studentsys.service.ClassService;
import com.hudongwx.studentsys.service.RoleService;
import com.hudongwx.studentsys.service.StudentService;
import com.hudongwx.studentsys.service.UserService;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;

import static java.lang.System.currentTimeMillis;

/**
 * Created by wu on 2016/12/13.
 */
public class StudentUtil {

    public static Student rebuildStudentModel(User user, Student stu, UserService userService, ClassService classService, StudentService studentService) {
        long admission = currentTimeMillis();
        Class cls = classService.getClassById(stu.getClassId());
        List<Student> allStudent = studentService.getAllStudent();
        int id;
        if (allStudent.size() != 0) {
            id = allStudent.get(0).getId() + 1;
        } else {
            id = 1000;
        }
        stu.setId(id);
        stu.setUserId(id);
        stu.setClassName(cls.getClassName());
        stu.setTutorId(cls.getTutorId());
        stu.setTutorName(cls.getTutor());
        stu.setCredit(new BigDecimal(100.00));
        stu.setTestAverage(new BigDecimal(0.0));
        stu.setTrainingEvaluation(new BigDecimal(0.0));
        stu.setAdmission(admission);
        stu.setTrainingGraduationTime(admission + (1000l * 60 * 60 * 24 * 30 * 4));
        stu.setCounselorName(userService.getUserById(stu.getCounselorId()).getUserNickname());
        if ((stu.getSubsidy() != null && stu.getResidualFrequency() != null) && stu.getPaymentMethod().equals("贷款")) {
            BigDecimal subsidyPer = stu.getSubsidy().divide(new BigDecimal(stu.getResidualFrequency()), 2, RoundingMode.HALF_DOWN);
            stu.setSubsidyPer(subsidyPer);
        }
        stu.setBonus(new BigDecimal(0.00));
        stu.setResidualSubsidyAmount(stu.getSubsidy());
        stu.setRegionId(cls.getRegionId());
        stu.setStatus(Student.STATUS_STUDYING);
        stu.setEmploymentStatus(Student.EMPLOYMENTSTATUS_UN_EMPLOYED);
        stu.setIp(user.getUserLastLoginIp());
        stu.setOperaterId(user.getId());
        stu.setOperater(user.getUserNickname());
        stu.setChecked(Student.STATUS_UN_CHECKED);
        stu.setCreateTime(admission);
        return stu;
    }

    public static Student rebuildUpLoadStudentModel(User user, Student stu, UserService userService, ClassService classService, StudentService studentService) {
        long admission = currentTimeMillis();
        Class cls = classService.getClassByClassName(stu.getClassName());
        User counselor = userService.getUserBycounselor(stu);
        List<Student> allStudent = studentService.getAllStudent();
        int id;
        if (allStudent.size() != 0) {
            id = allStudent.get(0).getId() + 1;
        } else {
            id = 1000;
        }
        stu.setId(id);
        stu.setClassId(cls.getId());
        stu.setUserId(id);
        if (counselor != null)
            stu.setCounselorId(counselor.getId());
//        stu.setPhotoUrl("");
        stu.setTutorId(cls.getTutorId());
        stu.setTutorName(cls.getTutor());
        stu.setCredit(new BigDecimal(100.00));
        stu.setTestAverage(new BigDecimal(0.0));
        stu.setTrainingEvaluation(new BigDecimal(0.0));
        stu.setAdmission(admission);
        stu.setTrainingGraduationTime(admission + (1000l * 60 * 60 * 24 * 30 * 4));
        if ((stu.getSubsidy() != null && stu.getResidualFrequency() != null) || stu.getPaymentMethod().equals("贷款")) {
            BigDecimal subsidyPer = stu.getSubsidy().divide(new BigDecimal(stu.getResidualFrequency()), 2, RoundingMode.HALF_DOWN);
            stu.setSubsidyPer(subsidyPer);
        }
        stu.setBonus(new BigDecimal(0.00));
        stu.setResidualSubsidyAmount(stu.getSubsidy());
        stu.setRegionId(cls.getRegionId());
        stu.setStatus(Student.STATUS_STUDYING);
        stu.setEmploymentStatus(Student.EMPLOYMENTSTATUS_UN_EMPLOYED);
        stu.setIp(user.getUserLastLoginIp());
        stu.setOperaterId(user.getId());
        stu.setOperater(user.getUserNickname());
        stu.setChecked(Student.STATUS_UN_CHECKED);
        stu.setCreateTime(admission);
        return stu;
    }

    public static void createAcount(User op, Student stu, UserService userService, RoleService roleService) {
        User user = new User();
        user.setUserAccount(stu.getEmergencyContact());
        user.setUserPassword("123456");
        user.setUserNickname(stu.getName());
        Role role = roleService.getRoleByName("学生");
        if(role!=null){
            user.setRoleId(role.getId());
        }
        user.setUserRole("学生");
        user.setUserPhone(stu.getContactInformation());
        user.setUserEmail(stu.getEmail());
        user.setUserAddress(stu.getPresentAddress());
        user.setUserPurikura(stu.getPhotoUrl());
        user.setUserMessage(null);
        user.setUserLastLoginIp(op.getUserLastLoginIp());
        long t = System.currentTimeMillis();
        user.setUserCreateTime(t);
        user.setUserUpdateTime(t);
        user.setOperater(op.getUserNickname());
    }

}
