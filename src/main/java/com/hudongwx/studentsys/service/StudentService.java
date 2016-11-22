package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.exceptions.ServiceException;
import com.hudongwx.studentsys.model.Class;
import com.hudongwx.studentsys.model.Student;
import com.hudongwx.studentsys.model.User;
import com.hudongwx.studentsys.util.Common;
import com.hudongwx.studentsys.util.StrPlusKit;
import com.jfinal.plugin.activerecord.Page;

import java.util.List;

/**
 * Created by wuhongxu on 2016/9/3 0003.
 */
public class StudentService extends Service {
    public Student getStudentById(Integer id) {
        if (id == null)
            return null;
        Student student = Student.dao.findById(id);
        return student;
    }

    public Student getStudentByUser(User user) {
        if (user == null)
            return null;
        return getStudentByName(user.getUserNickname());
        /*Integer id = user.getId();
        List<Student> students = Student.dao.find(Student.SEARCH_FROM_STUDENT + "where userId = id");
        if(students.isEmpty())
            return null;
        return students.get(0);*/
    }

    public Student getStudentByName(String name) {
        if (StrPlusKit.isEmpty(name))
            return null;
        List<Student> students = Student.dao.find(Student.SEARCH_FROM_STUDENT + "where name = ?", name);
        if (students.isEmpty())
            return null;
        return students.get(0);
    }

    public List<Student> getStudentsByName(String name){
        return Student.dao.find(Student.SEARCH_FROM_STUDENT + "where name = ?", name);
    }

    public List<Student> findStudentByKey(String key){
        key = "%"+key+"%";
        return Student.dao.find(Student.SEARCH_FROM_STUDENT + "where name like ?", key);
    }

    public List<Student> getAllStudent() {
        return Student.dao.find(Student.SEARCH_FROM_STUDENT + Common.ORDER_BY_ID_DESC);
    }

    public Page<Student> getAllStudent(int currentPage) {
        return Student.dao.paginate(currentPage, Common.MAX_PAGE_SIZE, Common.COMMON_SELECT, Student.SQL_FROM + Common.ORDER_BY_ID_DESC);
    }

    public boolean _save(Student model) {
        try {
            packingStudent(model);
            return model.save();
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        return false;
    }

    private void packingStudent(Student student) throws ServiceException {
        if (StrPlusKit.isEmpty(student.getName()))
            throw new ServiceException("name can not be null");
        if (StrPlusKit.isEmpty(student.getClassName()))
            throw new ServiceException("class can not be null");
        if (StrPlusKit.isEmpty(student.getTutor()))
            student.setTutor(Common.getMainProp().get("defaultTutor"));
        if (StrPlusKit.isEmpty(student.getContactInformation()))
            student.setContactInformation(Common.getMainProp().get("defaultContactInformation"));
        if (null == student.getAdmission()) {
            student.setAdmission(System.currentTimeMillis());
        }
    }

    public List<Student> getStudentByClass(Class aClass) {
        return Student.dao.find(Student.SEARCH_FROM_STUDENT + "where className = ?" + Common.ORDER_BY_ID_DESC, aClass.getClassName());
    }

    public Page<Student> getStudentByClass(int currentPage, Class aClass) {
        return Student.dao.paginate(currentPage, Common.MAX_PAGE_SIZE, Common.COMMON_SELECT, Student.SQL_FROM + Common.SQL_WHERE + "className = ?" + Common.ORDER_BY_ID_DESC, aClass.getClassName());
    }
}
