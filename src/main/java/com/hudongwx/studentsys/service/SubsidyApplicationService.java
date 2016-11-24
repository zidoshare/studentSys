package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.SubsidyApplication;

import java.util.List;

/**
 * Created by wu on 2016/11/19.
 */
public class SubsidyApplicationService extends Service {

    /**
     * 添加申请表
     * @param subsidyApplication
     * @return
     */
    public boolean _saveApplication(SubsidyApplication subsidyApplication) {
        return subsidyApplication.save();
    }

    /**
     * 删除指定申请人指定表
     * @param applicantid
     * @return
     */
    public boolean _deleteSubsidyApplicationByAid(String applicantid, String title) {
        SubsidyApplication sa;
        if(title!=null&&!title.equals("")){
            List<SubsidyApplication> applications = SubsidyApplication.dao.find(SubsidyApplication.SEARCH_FROM_SUBSIDY_APPLICATION + " applicantId=? and title like ? ", new Object[]{applicantid, title});
            sa = applications.get(0);
            return sa.delete();
        }
        return false;
    }

    /**
     * 删除所有表
     * @return
     */
    public boolean _deleteAllSubsidyApplication() {
        List<SubsidyApplication> subsidyApplications = SubsidyApplication.dao.find(SubsidyApplication.SEARCH_FROM_SUBSIDY_APPLICATION);
        for (SubsidyApplication sa : subsidyApplications) {
            sa.delete();
        }
        return true;
    }

    /**
     * 删除所有表
     * @return
     */
    public boolean _deleteSubsidyApplication() {
        List<SubsidyApplication> subsidyApplications = SubsidyApplication.dao.find(SubsidyApplication.SEARCH_FROM_SUBSIDY_APPLICATION);
        for (SubsidyApplication sa : subsidyApplications) {
            sa.delete();
        }
        return true;
    }

    /**
     * 更新表数据
     * @param sa
     * @return
     */
    public boolean _updateSubsidyApplication(SubsidyApplication sa) {
        return sa.update();
    }

    /**
     * 通过申请人id查询申请表信息
     * @param applicantid
     * @return
     */
    public List<SubsidyApplication> getSubsidyApplicationByApplicantId(int applicantid) {
        return SubsidyApplication.dao.find(SubsidyApplication.SEARCH_FROM_SUBSIDY_APPLICATION + "where applicantId=?", applicantid);
    }

    /**
     * 通过申请人id查询申请表信息
     * @param userid
     * @return
     */
    public List<SubsidyApplication> getSubsidyApplicationByUserId(int userid) {
        return SubsidyApplication.dao.find(SubsidyApplication.SEARCH_FROM_SUBSIDY_APPLICATION + "where approverId=?", userid);
    }

}
