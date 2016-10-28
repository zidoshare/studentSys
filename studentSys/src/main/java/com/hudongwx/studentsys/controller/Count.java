package com.hudongwx.studentsys.controller;

import com.hudongwx.studentsys.model.Class;
import com.hudongwx.studentsys.model.Student;

import java.util.Map;

/**
 * Created by wuhongxu on 2016/10/28 0028.
 */
public class Count {
    private Student student;
    private Class aClass;
    private Map<String, Long> perTypeMap;

    public Map<String, Long> getPerTypeMap() {
        return perTypeMap;
    }

    public void setPerTypeMap(Map<String, Long> perTypeMap) {
        this.perTypeMap = perTypeMap;
    }

    public Class getaClass() {
        return aClass;
    }

    public void setaClass(Class aClass) {
        this.aClass = aClass;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }
}
