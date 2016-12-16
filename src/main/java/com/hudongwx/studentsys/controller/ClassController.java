package com.hudongwx.studentsys.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.model.Class;
import com.hudongwx.studentsys.model.Mapping;
import com.hudongwx.studentsys.model.Student;
import com.hudongwx.studentsys.service.ClassService;
import com.hudongwx.studentsys.service.StudentService;
import com.hudongwx.studentsys.service.UserService;
import com.hudongwx.studentsys.util.Common;
import com.hudongwx.studentsys.util.RenderKit;
import com.jfinal.aop.Before;
import com.jfinal.ext.interceptor.POST;
import com.jfinal.plugin.activerecord.Page;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by wuhongxu on 2016/10/17 0017.
 */
public class ClassController extends BaseController {
    public ClassService classService;
    public StudentService studentService;
    public UserService userService;


    public void index() {

        super.index();
        List<Mapping> views = new ArrayList<>();
        Mapping mapping = mappingService.getMappingByUrl("/classManager/classList.ftl");
        views.add(mapping);
        setAttr(Common.LABEL_VIEWS, views);

        Integer p = getParaToInt("p", 1);
        Page<Class> allClass = classService.getAllClass(p);
        setAttr("classes", allClass);
    }


    /**
     * @return 返回一级菜单的mapping
     */
    @Override
    public Mapping init() {
        return mappingService.getMappingByUrl("/classManager");
    }

    @Before(POST.class)
    public void addClass() {
        Class model = getModel(Class.class);
        boolean flag;
        if (model.getId() == null)
            flag = model.save();
        else {
            flag = model.update();
        }

        if (!flag) {
            RenderKit.renderError(this, "保存班级失败");
            return;
        }
        RenderKit.renderSuccess(this, "保存班级成功");
    }

    public void getClassStudents() {
        Integer classId = getParaToInt("classId");
        List<Student> studentByClassId = studentService.getStudentByClassId(classId,Student.STATUS_STUDYING);

    }

    @Before(POST.class)
    public void deleteClass() {
        Integer id = getParaToInt(0);
        if (id == null) {
            RenderKit.renderError(this, "该班级不存在或已被删除");
            return;
        }
        Class aClass = classService.getClassById(id);
        if (aClass == null) {
            RenderKit.renderError(this, "该班级不存在或已被删除");
            return;
        }
        aClass.delete();
        RenderKit.renderSuccess(this, "删除成功");
    }

    public void letGraduate() {
        String jsonStuIdList = getPara("classStuIdList");
        int clsId = getParaToInt("clsId");
        System.out.println(jsonStuIdList);
        JSONArray jsonStuIdArray = JSON.parseArray(jsonStuIdList);
        boolean allComplete = true;
        for (Object o : jsonStuIdArray) {
            if (o == null)
                continue;
            int id = Integer.valueOf(o.toString());
            Student student = studentService.getUnEmpStudentById(id);
            if (student != null) {
                student.setStatus(Student.STATUS_GRADUATION);
                student.setEmploymentStatus(Student.EMPLOYMENTSTATUS_UN_EMPLOYED);
                student.setRemark("毕业啦！");
                boolean b = studentService._updateStudentById(student);
                if (!b) {
                    allComplete = false;
                }
            }
        }
        Class aClass = classService.getClassById(clsId);
        boolean b = true;
        boolean isG = false;
        if (aClass != null) {
            if (aClass.getStatus() == Class.CLASS_STATUS_GRADUATED) {
                isG = true;
            }
            aClass.setStatus(Class.CLASS_STATUS_GRADUATED);
            aClass.setRemark("毕业班！");
            b = classService._updateClass(aClass);
        }
        if (allComplete && b) {
            if (isG) {
                RenderKit.renderError(this, "该班级已经毕业，不建议反复提交！");
            } else {
                RenderKit.renderSuccess(this, "操作成功！");
            }
        } else {
            RenderKit.renderError(this, "操作存在异常！");
        }

    }

}
