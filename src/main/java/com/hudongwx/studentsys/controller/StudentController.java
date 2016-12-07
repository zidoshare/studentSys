package com.hudongwx.studentsys.controller;

import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.exceptions.ServiceException;
import com.hudongwx.studentsys.model.Class;
import com.hudongwx.studentsys.model.*;
import com.hudongwx.studentsys.service.ClassService;
import com.hudongwx.studentsys.service.StatusService;
import com.hudongwx.studentsys.service.StudentService;
import com.hudongwx.studentsys.service.UserService;
import com.hudongwx.studentsys.util.Common;
import com.hudongwx.studentsys.util.ModelKit;
import com.hudongwx.studentsys.util.RenderKit;
import com.jfinal.aop.Before;
import com.jfinal.ext.interceptor.POST;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Page;

import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by wuhongxu on 2016/9/19 0019.
 */
public class StudentController extends BaseController {
    public StudentService studentService;
    public UserService userService;
    public ClassService classService;
    public StatusService statusService;

    @Override
    public void index() {

        if ("pageJump".equals(getPara(0))) {
            pageJump();
            return;
        }
        super.index();
//        List<Student> students = studentService.getAllStudent();
//        setAttr("students", students);
//        List<User> defaultTeacher = userService.getUsersByRole(roleService.getRoleByName(Common.getMainProp().get("defaultTeacher")));
//        setAttr("users", defaultTeacher);
//        List<Class> allClass = classService.getAllClass();
//        setAttr("classes", allClass);
    }

    private void pageJump() {
        setMapping(mappingService.getMappingByUrl("/classManager"));
        fillHeaderAndFooter();
        fillContentParent();
        Integer p = getParaToInt("p", 1);
        Integer classId = getParaToInt("classId");
        Page<Student> studentPageList = studentService.getStudentPageByClassId(classId, p);
        System.out.println("studentPageListSize=" + studentPageList.getList().size() + "classId=" + classId);
        List<Mapping> views = new ArrayList<>();
        Mapping mapping = mappingService.getMappingByUrl("/studentManager/showStudentInfo.ftl");
        views.add(mapping);
        setAttr(Common.LABEL_VIEWS, views);
        setAttr("students", studentPageList);
        fillContentChild();
        render("/index.ftl");
    }


    /**
     * 显示学生详细信息
     */
    public void showStudentInfo() {
        Integer studentId = getParaToInt("studentId");
        Student student = studentService.getStudentById(studentId);
        setAttr("student", student);
        render("/studentManager/studentInfo.ftl");
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
            return ;
        }

        RenderKit.renderError(this);
    }

    private Student rebuildStudentModel(Student stu) {
        System.out.println("stu.getClassId()++++++++++++++>>>>>>" + stu.getClassId());
        long admission = System.currentTimeMillis();
        Class cls = classService.getClassById(stu.getClassId());
        User operater = getCurrentUser(this);
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
        stu.setPhotoUrl("\\images\\favicon.ico");
        stu.setTutorId(cls.getTutorId());
        stu.setTutorName(cls.getTutor());
        stu.setCredit(new BigDecimal(100.00));
        stu.setTestAverage(new BigDecimal(0.0));
        stu.setTrainingEvaluation(new BigDecimal(0.0));
        stu.setAdmission(admission);
        stu.setTrainingGraduationTime(admission + (1000l * 60 * 60 * 24 * 30 * 4));
        stu.setCounselorName(userService.getUserById(stu.getCounselorId()).getUserNickname());
        if ((stu.getSubsidy() != null && stu.getResidualFrequency() != null) || stu.getPaymentMethod().equals("贷款")) {
            BigDecimal subsidyPer = stu.getSubsidy().divide(new BigDecimal(stu.getResidualFrequency()));
            stu.setSubsidyPer(subsidyPer);
        }
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
     * 显示学生详细信息
     */
    public void showUpdateStudentInfo() {
        int index = 0;
        Status sta = null;
        List<Status> statusList = statusService.getStatusByField(Status.STATE_OF_ATTENDING);
        Integer studentId = getParaToInt("studentId");
        Student student = studentService.getStudentById(studentId);
        Status statu = statusService.getStatusById(student.getStatus());
        student.setStatu(statu);

        for (int i=0; i <statusList.size();i++) {
            Status status = statusList.get(i);
            if (status.getStatusName().equals(student.getStatu().getStatusName())) {
                index=i;
                sta=status;
            }
        }
        if (sta!=null){
            statusList.remove(index);
            statusList.add(0,sta);
        }
        setAttr("status", statusList);
        setAttr("student", student);
        render("/studentManager/updateStudentInfo.ftl");
    }

    /**
     * 重修时获取该区域的班级班级
     */
    public void getRepairClassByStudentId(){
        Integer studentId = getParaToInt("studentId");
        Student student = studentService.getStudentById(studentId);
        Integer regionId = student.getRegionId();
        if (regionId==null){
            RenderKit.renderError(this);
            return;
        }
        List<Class> classList = classService.getClassByRegionId(regionId);
        RenderKit.renderSuccess(this,JsonKit.toJson(classList));
    }

    /**
     *更新学生信息[需要前台参数：stu(json数组)]
     */
    public void updateStudentInfo() throws InvocationTargetException, NoSuchMethodException, InstantiationException, IllegalAccessException {
//        String jsonArrayStu = getPara("stu");
//        JSONArray stuArray = JSON.parseArray(jsonArrayStu);
//        for (Object o : stuArray) {
//            JSONObject jsonObject = JSON.parseObject(o.toString());
//            Student stu = new Student();
//            stu.setId(jsonObject.getInteger("id"));
//            stu.setBonus(jsonObject.getBigDecimal("bonus"));
//            studentService._updateStudentById(stu);
//        }
//        RenderKit.renderSuccess(this);
        Student student = ModelKit.injectList(Student.class, this, "list");
        System.out.println(student.toString());
        studentService._updateStudentById(student);
        RenderKit.renderSuccess(this);
    }

    public void getStudent(){
        Integer cid = getParaToInt("classId");
        Integer status = getParaToInt("status");
        if(status==null){
            RenderKit.renderSuccess(this,JsonKit.toJson(studentService.getAllStudentByClassId(cid)));
        }else{
            RenderKit.renderSuccess(this,JsonKit.toJson(studentService.getStudentByClassId(cid,status)));
        }
    }

    public void jumpToAddStudent() {
        setMapping(mappingService.getMappingByUrl("/studentManager/jumpToAddStudent"));
        super.index();
        List<User> counselorList = userService.getUsersByRoleId(roleService.getRoleByName("咨询师"));
        setAttr("counselor", counselorList);
        List<Class> allClass = classService.getAllClass();
        setAttr("cls", allClass);
    }

    public void letGraduate() {
        Integer id = getParaToInt("studentId");
        long l = System.currentTimeMillis();
        User operater = getCurrentUser(this);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Student student = studentService.getStudentById(id);
        student.setStatus(Student.STATUS_GRADUATION);
        student.setEmploymentStatus(Student.EMPLOYMENTSTATUS_UN_EMPLOYED);
        student.setGraduationTime(l);
        student.setOperaterId(operater.getId());
        student.setOperater(operater.getUserNickname());
        student.setIp(operater.getUserLastLoginIp());
        student.setRemark(sdf.format(l)+":"+student.getName() +"已毕业！/");
        studentService._updateStudentById(student);
        RenderKit.renderSuccess(this, "操作成功！");
    }
}
