package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.TrainingProject;

import java.util.List;

/**
 * Created by wu on 2016/12/14.
 */
public class TrainingProjectService extends Service {

    public boolean _saveProjectInfo(TrainingProject tp){
        if(tp==null)
            return false;
        return tp.save();
    }

    public List<TrainingProject> getProjectInfoByStudentId(Integer stuId){
        if(stuId==null)
            return null;
        List<TrainingProject> projectList = TrainingProject.dao.find(TrainingProject.SEARCH_ALL + "where studentId = ?", stuId);
        if(projectList.isEmpty())
            return null;
        return projectList;
    }
}
