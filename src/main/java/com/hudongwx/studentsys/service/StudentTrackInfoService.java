package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.exceptions.ServiceException;
import com.hudongwx.studentsys.model.StudentTrackInfo;

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
        List<StudentTrackInfo> sti=StudentTrackInfo.dao.find(StudentTrackInfo.SELECT_FROM_STUDENT_TRACK_INFO+"where targetId = ? and status = ? order by trackTime desc",stuId,StudentTrackInfo.EMP_TRACK);
        return sti;
    }

    public boolean _saveStudentTrackInfo(StudentTrackInfo sti){
        return sti.save();
    }
}
