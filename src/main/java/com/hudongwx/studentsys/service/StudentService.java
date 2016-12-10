package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.exceptions.ServiceException;
import com.hudongwx.studentsys.model.Class;
import com.hudongwx.studentsys.model.Student;
import com.hudongwx.studentsys.model.StudentEmployment;
import com.hudongwx.studentsys.model.User;
import com.hudongwx.studentsys.util.Common;
import com.hudongwx.studentsys.util.PageinateKit;
import com.hudongwx.studentsys.util.StrPlusKit;
import com.jfinal.plugin.activerecord.Page;

import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by wuhongxu on 2016/9/3 0003.
 */
public class StudentService extends Service {
    public StatusService statusService;
    public StudentEmploymentService studentEmploymentService;

    public Student getStudentById(Integer id) {
        if (id == null)
            return null;
        Student student = Student.dao.findById(id);
        return student;
    }

    public Student getUnEmpStudentById(Integer id) {
        if (id == null)
            return null;
        List<Student> studentList = Student.dao.find(Student.SEARCH_FROM_STUDENT + "where id = ? and (employmentStatus not like ? or employmentStatus is NULL) ", id, Student.EMPLOYMENTSTATUS_EMPLOYED);
        if (studentList.isEmpty())
            return null;
        return studentList.get(0);
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

    public List<Student> getStudentsByName(String name) {
        return Student.dao.find(Student.SEARCH_FROM_STUDENT + "where name = ?", name);
    }

    public List<Student> findStudentByKey(String key) {
        key = "%" + key + "%";
        return Student.dao.find(Student.SEARCH_FROM_STUDENT + "where name like ?", key);
    }

    public List<Student> getAllStudent() {
        return Student.dao.find(Student.SEARCH_FROM_STUDENT + Common.ORDER_BY_ID_DESC);
    }

    public Page<Student> getStudentPageByClassId(int classId, int currentPage) {
        Page<Student> paginate = Student.dao.paginate(currentPage, Common.MAX_PAGE_SIZE, Common.COMMON_SELECT, Student.SQL_FROM + "where classId = ?", classId);
        return PageinateKit.ClonePage(paginate,
                paginate.getList().stream().map(sa -> {
                    sa.setStatu(statusService.getStatusById(sa.getStatus()));
                    return sa;
                }).collect(Collectors.toList()));
    }

    public Page<Student> getAllStudent(int currentPage) {
        return Student.dao.paginate(currentPage, Common.MAX_PAGE_SIZE, Common.COMMON_SELECT, Student.SQL_FROM + Common.ORDER_BY_ID_DESC);
    }

    public boolean _save(Student model) throws ServiceException {
        packingStudent(model);
        return model.save();
    }

    private void packingStudent(Student student) throws ServiceException {
        if (StrPlusKit.isEmpty(student.getName()))
            throw new ServiceException("name can not be null");
        if (StrPlusKit.isEmpty(student.getClassName()))
            throw new ServiceException("class can not be null");
        if (StrPlusKit.isEmpty(student.getTutorName()))
            student.setTutorName(Common.getMainProp().get("defaultTutor"));
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

    public List<Student> getStudentByClassId(int classId, int defaultStatus) {
        return Student.dao.find(Student.SEARCH_FROM_STUDENT + "where classId = ? and status = ? ", new Object[]{classId, defaultStatus});
    }

    public List<Student> getStudentByClassId(int classId) {
        return Student.dao.find(Student.SEARCH_FROM_STUDENT + "where classId = ? and status = 1 ", classId);
    }

    public List<Student> getAllStudentByClassId(Integer classId) {
        if (classId == null) {
            try {
                throw new ServiceException("班级id不能为空");
            } catch (ServiceException e) {
                e.printStackTrace();
            }
        }
        return Student.dao.find(Student.SEARCH_FROM_STUDENT + "where classId = ? ", classId);
    }

    public boolean _updateStudentById(Student student) {
        if (student.getId() == null) {
            try {
                throw new ServiceException("学生id不能为空");
            } catch (ServiceException e) {
                e.printStackTrace();
            }
        }
        return student.update();
    }

    public Page<Student> getUnEmpStu(int currentPage) {
        return Student.dao.paginate(currentPage, Common.MAX_PAGE_SIZE, Common.COMMON_SELECT, Student.SQL_FROM + Common.SQL_WHERE + "status = ? and employmentStatus = ? " + Common.ORDER_BY_ID_DESC, Student.STATUS_GRADUATION, Student.EMPLOYMENTSTATUS_UN_EMPLOYED);
    }

    public Page<Student> getEmployedStu(int currentPage) {
        Page<Student> pStudentList = Student.dao.paginate(currentPage, Common.MAX_PAGE_SIZE, Common.COMMON_SELECT, Student.SQL_FROM + Common.SQL_WHERE + "status = ? and employmentStatus = ? " + Common.ORDER_BY_ID_DESC, Student.STATUS_GRADUATION, Student.EMPLOYMENTSTATUS_EMPLOYED);
        return PageinateKit.ClonePage(pStudentList,
                pStudentList.getList().stream().map(student -> {
                    StudentEmployment se = studentEmploymentService.getStuEmpByStudentId(student.getId());
                    student.setStudentEmployment(se);
                    return student;
                }).collect(Collectors.toList()));
    }
}
