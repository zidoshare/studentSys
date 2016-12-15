package com.hudongwx.studentsys.util;

import com.hudongwx.studentsys.model.Class;
import com.hudongwx.studentsys.model.Student;
import com.hudongwx.studentsys.model.User;
import com.hudongwx.studentsys.service.ClassService;
import com.hudongwx.studentsys.service.StudentService;
import com.hudongwx.studentsys.service.UserService;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;

/**
 * Created by wu on 2016/12/13.
 */
public class StudentUtil {

    public static Student rebuildStudentModel(User user, Student stu, UserService userService, ClassService classService, StudentService studentService) {
        long admission = System.currentTimeMillis();
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
//        String photoUrl=Common.PHOTO_URL_PATH+stu.getPhotoUrl();
//        File photoUrlPath=new File(photoUrl);
//        System.out.println(photoUrl+" 存在？？？------------->"+photoUrlPath.exists());
//        if(photoUrlPath.exists()){
//            stu.setPhotoUrl(photoUrl);
//        }else{
//            stu.setPhotoUrl(Common.UP_LOAD_PHOTO_PATH+"\\"+stu.getIdNumber()+".jpg");
//        }
        stu.setTutorId(cls.getTutorId());
        stu.setTutorName(cls.getTutor());
        stu.setCredit(new BigDecimal(100.00));
        stu.setTestAverage(new BigDecimal(0.0));
        stu.setTrainingEvaluation(new BigDecimal(0.0));
        stu.setAdmission(admission);
        stu.setTrainingGraduationTime(admission + (1000l * 60 * 60 * 24 * 30 * 4));
        stu.setCounselorName(userService.getUserById(stu.getCounselorId()).getUserNickname());
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

    public static Student rebuildUpLoadStudentModel(User user, Student stu, UserService userService, ClassService classService, StudentService studentService) {
        long admission = System.currentTimeMillis();
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

}
