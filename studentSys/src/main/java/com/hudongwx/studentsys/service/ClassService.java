package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.Class;
import com.hudongwx.studentsys.model.Student;

import java.util.List;

/**
 * Created by wuhongxu on 2016/9/29 0029.
 */
public class ClassService extends Service {
    public Class getClassById(Integer id){
        return Class.dao.findById(id);
    }
    public Class getClassByClassName(String className){
        return Class.dao.findFirst(Class.SEARCH_FROM_CLASS+"where className = ?",className);
    }
    public Class getClassByStudent(Student stu){
        return getClassByClassName(stu.getClassName());
    }
    public List<Class> getAllClass() {
        return Class.dao.find(Class.SEARCH_FROM_CLASS);
    }
}
