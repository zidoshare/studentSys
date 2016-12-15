package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.exceptions.ServiceException;
import com.hudongwx.studentsys.model.StudentTrackInfo;
import com.hudongwx.studentsys.util.Common;
import com.jfinal.plugin.activerecord.Page;

import java.util.List;

/**
 * Created by wu on 2016/12/8.
 */
public class StudentTrackInfoService extends Service {
    public List<StudentTrackInfo> getStuTrackInfo(Integer stuId){
        if(stuId==null){
            try {
                throw new ServiceException("学生id不能为空！");
            } catch (ServiceException e) {
                e.printStackTrace();
            }
        }
        List<StudentTrackInfo> sti=StudentTrackInfo.dao.find(StudentTrackInfo.SELECT_FROM_STUDENT_TRACK_INFO+"where targetId = ? order by trackTime desc ",stuId);
        return sti;
    }

    public Page<StudentTrackInfo> getPageStuTrackInfo(Integer nowPage, Integer stuId){
        if(stuId==null){
            try {
                throw new ServiceException("学生id不能为空！");
            } catch (ServiceException e) {
                e.printStackTrace();
            }
        }
        Page<StudentTrackInfo> sti=StudentTrackInfo.dao.paginate(nowPage, Common.MAX_PAGE_SIZE,Common.COMMON_SELECT,StudentTrackInfo.SQL_FROM+"where targetId = ? order by trackTime desc ",stuId);
        return sti;
    }

    public boolean _saveStudentTrackInfo(StudentTrackInfo sti){
        return sti.save();
    }
}
