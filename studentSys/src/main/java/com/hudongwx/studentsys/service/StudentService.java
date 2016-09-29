package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.Student;
import com.hudongwx.studentsys.model.User;
import com.hudongwx.studentsys.util.StrPlusKit;

import java.util.List;

/**
 * Created by wuhongxu on 2016/9/3 0003.
 */
public class StudentService extends Service {
    public Student getStudentById(Integer id){
        if(id == null)
            return null;
        Student student = Student.dao.findById(id);
        return student;
    }
    public Student getStudentByUser(User user){
        if(user == null)
            return null;
        return getStudentByName(user.getUserNickname());
    }
    public Student getStudentByName(String name){
        if(StrPlusKit.isEmpty(name))
            return null;
        List<Student> students = Student.dao.find(Student.SEARCH_FROM_STUDENT + "where name = ?", name);
        if(students.isEmpty())
            return null;
        return students.get(0);
    }
}
