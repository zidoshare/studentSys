package com.hudongwx.studentsys.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.exceptions.ServiceException;
import com.hudongwx.studentsys.model.Class;
import com.hudongwx.studentsys.model.Mapping;
import com.hudongwx.studentsys.model.Student;
import com.hudongwx.studentsys.model.User;
import com.hudongwx.studentsys.service.ClassService;
import com.hudongwx.studentsys.service.StudentService;
import com.hudongwx.studentsys.service.UserService;
import com.hudongwx.studentsys.util.RenderKit;
import com.jfinal.aop.Before;
import com.jfinal.ext.interceptor.POST;
import com.jfinal.kit.JsonKit;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by wuhongxu on 2016/9/19 0019.
 */
public class StudentController extends BaseController {
    public StudentService studentService;
    public UserService userService;
    public ClassService classService;

    @Override
    public void index() {
        super.index();
    }

    /**
     * @return 返回一级菜单的mapping
     */
    @Override
    public Mapping init() {
        return mappingService.getMappingByUrl("/studentManager");
    }

    @Before(POST.class)
    public void addStudent() throws ServiceException {
        Student model = getModel(Student.class);
        if (studentService._save(rebuildStudentModel(model))) {
            RenderKit.renderSuccess(this);
            return;
        }

        RenderKit.renderError(this);
    }

    private Student rebuildStudentModel(Student stu) {
        System.out.println("stu.getClassId()++++++++++++++>>>>>>"+stu.getClassId());
        long admission = System.currentTimeMillis();
        Class cls = classService.getClassById(stu.getClassId());
        User operater = getCurrentUser(this);
        List<Student> allStudent = studentService.getAllStudent();
        int id;
        if (allStudent.size() != 0) {
            id = allStudent.get(0).getId()+1;
        }else {
            id=1000;
        }
        stu.setId(id);
        stu.setUserId(id);
        stu.setClassName(cls.getClassName());
        stu.setPhotoUrl("\\images\\favicon.ico");
        stu.setTutorId(cls.getTutorId());
        stu.setTutorName(cls.getTutor());
        stu.setCredit(new BigDecimal(100.00));
        stu.setTestAverage(new BigDecimal(0.0));
        stu.setTrainingEvaluation(new BigDecimal(0.0));
        stu.setAdmission(admission);
        stu.setTrainingGraduationTime(admission + (1000l * 60 * 60 * 24 * 30 * 4));
        stu.setCounselorName(userService.getUserById(stu.getCounselorId()).getUserNickname());
        BigDecimal subsidyPer = stu.getSubsidy().divide(new BigDecimal(stu.getResidualFrequency()));
        stu.setSubsidyPer(subsidyPer);
        stu.setBonus(new BigDecimal(0.00));
        stu.setResidualSubsidyAmount(stu.getSubsidy());
        stu.setRegionId(cls.getRegionId());
        stu.setStatus(Student.STATUS_STUDYING);
        stu.setEmploymentStatus(Student.EMPLOYMENTSTATUS_UN_EMPLOYED);
        stu.setIp(operater.getUserLastLoginIp());
        stu.setOperaterId(operater.getId());
        stu.setOperater(operater.getUserNickname());
        stu.setChecked(Student.STATUS_UN_CHECKED);
        stu.setCreateTime(admission);
        return stu;
    }

    /**
     * 更新学生信息[需要前台参数：stu(json数组)]
     */
    public void updateStudentInfo() {
        String jsonArrayStu = getPara("stu");
        JSONArray stuArray = JSON.parseArray(jsonArrayStu);
        for (Object o : stuArray) {
            JSONObject jsonObject = JSON.parseObject(o.toString());
            Student stu = new Student();
            stu.setId(jsonObject.getIntValue("id"));
            stu.setBonus(jsonObject.getBigDecimal("bonus"));
            studentService._updateStudentById(stu);
        }
        RenderKit.renderSuccess(this);
    }

    public void getStudent() {
        Integer cid = getParaToInt("classId");
        Integer status = getParaToInt("status");
        if (status == null) {
            RenderKit.renderSuccess(this, JsonKit.toJson(studentService.getAllStudentByClassId(cid)));
        } else {
            RenderKit.renderSuccess(this, JsonKit.toJson(studentService.getStudentByClassId(cid, status)));
        }
    }

    public void jumpToAddStudent() {
        setMapping(mappingService.getMappingByUrl("/studentManager/jumpToAddStudent"));
        super.index();
        List<User> counselorList = userService.getUsersByRoleId(roleService.getRoleByName("咨询师"));
        setAttr("counselor",counselorList);
        List<Class> allClass = classService.getAllClass();
        setAttr("cls",allClass);
    }
}
