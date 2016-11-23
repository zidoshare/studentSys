package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.Class;
import com.hudongwx.studentsys.model.Student;
import com.hudongwx.studentsys.util.Common;
import com.jfinal.plugin.activerecord.Page;

import java.util.List;

/**
 * Created by wuhongxu on 2016/9/29 0029.
 */
public class ClassService extends Service {
    public Class getClassById(Integer id) {
        return Class.dao.findById(id);
    }

    public Class getClassByClassName(String className) {
        return Class.dao.findFirst(Class.SEARCH_FROM_CLASS + "where className = ?", className);
    }

    public Class getClassByStudent(Student stu) {
        return getClassByClassName(stu.getClassName());
    }

    public List<Class> getAllClass() {
        return Class.dao.find(Class.SEARCH_FROM_CLASS);
    }

    public Page<Class> getAllClass(Integer currentPage) {
        return Class.dao.paginate(currentPage, Common.MAX_PAGE_SIZE, Common.COMMON_SELECT, Class.SQL_FROM);
    }

    public List<Class> getClassInfoByArea(String area) {
        return Class.dao.find(Class.SEARCH_FROM_CLASS + "where area like ?", area);
    }
}
