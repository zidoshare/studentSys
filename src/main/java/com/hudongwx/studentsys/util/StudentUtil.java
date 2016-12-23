package com.hudongwx.studentsys.util;

import com.hudongwx.studentsys.exceptions.ServiceException;
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
        //处理补助
        dealSubsidyInfo(stu);
        stu.setBonus(new BigDecimal(0.00));
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
        //处理补助
        dealSubsidyInfo(stu);
        stu.setBonus(new BigDecimal(0.00));
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

    private static void dealSubsidyInfo(Student stu) {
        if ((stu.getResidualSubsidyAmount() != null && stu.getResidualFrequency() != null) && stu.getPaymentMethod().equals("贷款")) {
            BigDecimal rf = new BigDecimal(stu.getResidualFrequency());
            if (rf == null || rf.intValue() == 0)
                rf = new BigDecimal(1);
            BigDecimal subsidyPer = stu.getResidualSubsidyAmount().divide((rf), 2, RoundingMode.HALF_DOWN);
            stu.setSubsidyPer(subsidyPer);
            stu.setSubsidy(stu.getSubsidyPer().multiply(rf));
        }
    }

    public static void createAndSaveUserAccount(User op, Student stu, UserService userService, RoleService roleService) {
        User user = new User();
        List<User> userList = userService.getAllUser();
        int id;
        if (userList.size() != 0) {
            id = userList.get(0).getId() + 1;
        } else {
            id = 1000;
        }
        user.setId(id);
        user.setUserAccount(stu.getContactInformation());
        user.setUserPassword("123456");
        user.setUserNickname(stu.getName());
        Role role = roleService.getRoleByName("学生");
        if (role != null) {
            user.setRoleId(role.getId());
        }
        user.setUserRole("学生");
        user.setUserPhone(stu.getContactInformation());
        user.setUserEmail(stu.getEmail());
        user.setUserAddress(stu.getPresentAddress());
        String pUrl = stu.getPhotoUrl();
        if (pUrl == null || pUrl.equals(""))
            pUrl = null;
        user.setUserPurikura(pUrl);
        user.setUserMessage(null);
        user.setUserLastLoginIp(op.getUserLastLoginIp());
        long t = System.currentTimeMillis();
        user.setUserCreateTime(t);
        user.setUserUpdateTime(t);
        user.setOperater(op.getUserNickname());
        try {
            userService._saveUser(user);
        } catch (ServiceException e) {
            e.printStackTrace();
        }
    }

}
