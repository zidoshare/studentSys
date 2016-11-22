package com.hudongwx.studentsys.controller;

import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.model.Class;
import com.hudongwx.studentsys.model.Mapping;
import com.hudongwx.studentsys.model.Student;
import com.hudongwx.studentsys.model.User;
import com.hudongwx.studentsys.service.*;
import com.hudongwx.studentsys.util.Common;
import com.hudongwx.studentsys.util.RenderKit;
import com.jfinal.aop.Before;
import com.jfinal.ext.interceptor.POST;

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
        List<Student> students = studentService.getAllStudent();
        setAttr("students",students);
        List<User> defaultTeacher = userService.getUsersByRole(roleService.getRoleByName(Common.getMainProp().get("defaultTeacher")));
        setAttr("users",defaultTeacher);
        List<Class> allClass = classService.getAllClass();
        setAttr("classes",allClass);
    }

    /**
     * @return 返回一级菜单的mapping
     */
    @Override
    public Mapping init() {
        return mappingService.getMappingByUrl("/studentManager");
    }

    @Before(POST.class)
    public void addStudent(){
        Student model = getModel(Student.class);
        if(studentService._save(model)){
            RenderKit.renderSuccess(this);
            return ;
        }

        RenderKit.renderError(this);
    }
}
