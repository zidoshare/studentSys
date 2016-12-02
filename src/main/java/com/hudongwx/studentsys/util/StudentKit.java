package com.hudongwx.studentsys.util;

import com.hudongwx.studentsys.model.Student;
import com.hudongwx.studentsys.service.StudentService;

import java.util.List;

/**
 * Created by wu on 2016/12/2.
 */
public class StudentKit {
    public static StudentService studentService;

    /**
     * 创建id
     * @return
     */
    public static int createId() {
        int max = 0;
        List<Student> allStudent = studentService.getAllStudent();
        if (allStudent.size() != 0) {
            max = allStudent.get(0).getId();
        }else {
            max=1000;
        }
        return (max + 1);
    }
}
