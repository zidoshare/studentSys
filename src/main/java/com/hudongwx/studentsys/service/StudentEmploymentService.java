package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.Student;
import com.hudongwx.studentsys.model.StudentEmployment;
import com.hudongwx.studentsys.util.Common;
import com.jfinal.plugin.activerecord.Page;

import java.util.List;

/**
 * Created by wu on 2016/11/22.
 */
public class StudentEmploymentService extends Service {
    /**
     * 添加学生就业情况
     *
     * @param oe
     * @return
     */
    public boolean _saveStuEmp(StudentEmployment oe) {
        return oe.save();
    }

    /**
     * 删除指定记录
     *
     * @param id
     * @return
     */
    public boolean _deleteStuEmpById(int id) {
        return StudentEmployment.dao.deleteById(id);
    }

    /**
     * 删除所有记录
     *
     * @return
     */
    public boolean _deleteAllStuEmp() {
        List<StudentEmployment> StudentEmployments = StudentEmployment.dao.find(StudentEmployment.SELECT_FROM_STUDENT_EMPLOYMENT);
        for (StudentEmployment oe : StudentEmployments) {
            oe.delete();
        }
        return true;
    }

    /**
     * 更新就业信息
     *
     * @param se
     * @return
     */
    public boolean _updateStuEmp(StudentEmployment se) {
        return se.update();
    }

    /**
     * 查询指定的就业信息
     *
     * @param stuId
     * @return
     */
    public List<StudentEmployment> getStuEmpByStudentId(Integer stuId) {
        if (stuId == null) {
            return null;
        }
        return StudentEmployment.dao.find(StudentEmployment.SELECT_FROM_STUDENT_EMPLOYMENT + "where studentId=?", stuId);
    }

    /**
     * 查询所有就业追踪信息
     *
     * @return
     */
    public Page<StudentEmployment> getAllStuEmp(Integer currentPage) {
        return StudentEmployment.dao.paginate(currentPage, Common.MAX_PAGE_SIZE, Common.COMMON_SELECT, StudentEmployment.SQL_FROM);
    }

    public Page<StudentEmployment> getUnEmp(Integer currentPage) {
        return StudentEmployment.dao.paginate(currentPage, Common.MAX_PAGE_SIZE, Common.COMMON_SELECT, StudentEmployment.SQL_FROM + " where employmentStatus = ? ", Student.EMPLOYMENTSTATUS_UN_EMPLOYED);
    }

    public Page<StudentEmployment> getEmpExamineApply(Integer currentPage, Integer userId) {
        return StudentEmployment.dao.paginate(currentPage, Common.MAX_PAGE_SIZE, Common.COMMON_SELECT, StudentEmployment.SQL_FROM + " where approveStatus = ? and approverId = ?", Student.EMPLOYMENTSTATUS_IN_APPROVAL, userId);
    }

    public StudentEmployment getStuEmpById(Integer id) {
        if(id==null)
            return null;
        return StudentEmployment.dao.findById(id);
    }
}
