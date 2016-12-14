package com.hudongwx.studentsys.controller;

import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.model.*;
import com.hudongwx.studentsys.service.StudentEmploymentService;
import com.hudongwx.studentsys.service.StudentService;
import com.hudongwx.studentsys.service.StudentTrackInfoService;
import com.hudongwx.studentsys.service.UserService;
import com.hudongwx.studentsys.util.RenderKit;
import com.jfinal.aop.Before;
import com.jfinal.ext.interceptor.POST;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Page;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by wu on 2016/11/22.
 */
public class StudentEmploymentController extends BaseController {

    public StudentEmploymentService studentEmploymentService;
    public StudentService studentService;
    public StudentTrackInfoService studentTrackInfoService;
    public UserService userService;

    @Override
    public void index() {
        super.index();
    }

    @Override
    public Mapping init() {
        return mappingService.getMappingByUrl("/StudentEmploymentManager");
    }

    /****************************就业信息*******************************/
    /**
     * 添加追踪记录[需要前台的参数：oe(json数据类型的追踪信息)]
     */
    @Before(POST.class)
    public void addStuEmpInfo() {
        String obtainEmployment = getPara("oe");
        //// TODO: 2016/11/21 待获取json数据
    }

    /**
     * 删除指定的记录[需要前台的参数：seid(区域id)]
     */
    public void deleteStuEmpInfo() {
        Integer seid = getParaToInt("seid");
        if (seid == null) {
            RenderKit.renderError(this);
        } else {
            boolean b = studentEmploymentService._deleteStuEmpById(seid);
            if (b) {
                RenderKit.renderSuccess(this);
            } else {
                RenderKit.renderError(this, "刪除失败！");
            }
        }
    }

    /**
     * 删除所有记录
     */
    public void deleteAllStuEmpInfo() {
        studentEmploymentService._deleteAllStuEmp();
    }

    /**
     * 修改记录状态
     */
    public boolean updateStuEmpInfo() {
        String obtainEmployment = getPara("se");
        StudentEmployment se = new StudentEmployment();
        //// TODO: 2016/11/21 获取json修改数据
        return studentEmploymentService._updateStuEmp(se);
    }

    /**
     * 获取指定id的就业信息
     */
    public void getStuEmpInfo() {
        Integer seId = getParaToInt("seId");
        if (seId == null) {
            RenderKit.renderError(this);
        } else {
            List<StudentEmployment> seList = studentEmploymentService.getStuEmpById(seId);
            if (seList.size() != 0) {
                RenderKit.renderSuccess(this, JsonKit.toJson(seList));
            } else {
                RenderKit.renderError(this, "你查询的信息不存在或已删除！");
            }
        }
    }

    /********************************
     * 未就业
     *******************************/

    public void unEmployed() {
        unEmployinit();
        StudentEmployment model = getModel(StudentEmployment.class);

    }

    private void unEmployinit() {
        setMapping(mappingService.getMappingByUrl("/studentEmploymentManager/unEmployed"));
        super.index();
        Integer p = getParaToInt("p", 1);
        Page<Student> UnEmpStuP = studentService.getUnEmpStu(p);
        setAttr("uesp", UnEmpStuP);
        List<Role> roleList = roleService.getRoleByMapping(mappingService.getMappingByUrl("/approvalManager"));
        List<User> userList = new ArrayList<>();
        if (roleList.size() != 0) {
            for (Role role : roleList) {
                List<User> users = userService.getUsersByRoleId(role);
                for (User user1 : users) {
                    userList.add(user1);
                }
            }
        }
        for (User user : userList) {

            System.out.println("userList.size()--------------------------->"+user.getId()+" && "+user.getUserNickname());
        }
        setAttr("roles", userList);
    }

    public void Employed() {
        setMapping(mappingService.getMappingByUrl("/studentEmploymentManager/Employed"));
        super.index();
        Integer p = getParaToInt("p", 1);
        Page<Student> EmpStuP = studentService.getEmployedStu(p);
        setAttr("esp", EmpStuP);
    }

    public void employmentApply() {
        StudentEmployment se =getModel(StudentEmployment.class);

//        Integer stuId = getParaToInt("stuId");
//        Integer etId = getParaToInt("etId");
//        long l = System.currentTimeMillis();
//        User operater = getCurrentUser(this);
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//        Student student = studentService.getStudentById(stuId);
//        student.setStatus(Student.STATUS_GRADUATION);
//        student.setEmploymentStatus(Student.EMPLOYMENTSTATUS_IN_APPROVAL);
//        student.setEmploymentTutorId(etId);
//        student.setOperaterId(operater.getId());
//        student.setOperater(operater.getUserNickname());
//        student.setIp(operater.getUserLastLoginIp());
//        String remark = student.getRemark();
//        studentService._updateStudentById(student);
//        RenderKit.renderSuccess(this, "操作成功！");
    }

    /**********************************就业追踪**************************************/
    public void getTrackInfo() {
        List<StudentTrackInfo> trackInfoList = studentTrackInfoService.getStuTrackInfo(getParaToInt("stuId"));
        if(trackInfoList.size()==0){
            RenderKit.renderError(this,"无相关追踪信息！");
        }else{
            RenderKit.renderSuccess(this,JsonKit.toJson(trackInfoList));
        }
    }

    public void addTrackInfo() throws InvocationTargetException, NoSuchMethodException, InstantiationException, IllegalAccessException {
        StudentTrackInfo sti=getModel(StudentTrackInfo.class);
                sti.setTrackTime(System.currentTimeMillis());
        User user = getCurrentUser(this);
        sti.setOperaterId(user.getId());
        sti.setOperater(user.getUserNickname());
        studentTrackInfoService._saveStudentTrackInfo(sti);
        RenderKit.renderSuccess(this,"追踪状态更新成功！");
    }
}
