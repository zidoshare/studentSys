package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.SubsidyApplication;
import com.hudongwx.studentsys.util.Common;
import com.hudongwx.studentsys.util.PageinateKit;
import com.jfinal.plugin.activerecord.Page;

import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by wu on 2016/11/19.
 */
public class SubsidyApplicationService extends Service {
    StatusService statusService;
    /**
     * 添加申请表
     *
     * @param subsidyApplication
     * @return
     */
    public boolean _saveApplication(SubsidyApplication subsidyApplication) {
        return subsidyApplication.save();
    }

    /**
     * 删除指定申请人指定表
     *
     * @param applicantid
     * @return
     */
    public boolean _deleteSubsidyApplicationByAid(String applicantid, String title) {
        SubsidyApplication sa;
        if (title != null && !title.equals("")) {
            List<SubsidyApplication> applications = SubsidyApplication.dao.find(SubsidyApplication.SEARCH_FROM_SUBSIDY_APPLICATION + " applicantId=? and title like ? ", new Object[]{applicantid, title});
            sa = applications.get(0);
            return sa.delete();
        }
        return false;
    }

    /**
     * 删除所有表
     *
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
     * 删除指定班级id的申请表
     *
     * @return
     */
    public boolean _deleteSubsidyApplicationByClassId(int classId) {
        List<SubsidyApplication> subsidyApplications = SubsidyApplication.dao.find(SubsidyApplication.SEARCH_FROM_SUBSIDY_APPLICATION + "where classId = ?", classId);
        for (SubsidyApplication sa : subsidyApplications) {
            sa.delete();
        }
        return true;
    }

    /**
     * 删除所有表
     *
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
     *
     * @param sa
     * @return
     */
    public boolean _updateSubsidyApplication(SubsidyApplication sa) {
        return sa.update();
    }

    public List<SubsidyApplication> getAllApplications() {
        return SubsidyApplication.dao.find(SubsidyApplication.SEARCH_FROM_SUBSIDY_APPLICATION);
    }



    /**
     * 通过申请人id查询申请表信息
     *
     * @param applicantid
     * @return
     */
    public List<SubsidyApplication> getSubsidyApplicationByApplicantId(int applicantid) {
        return SubsidyApplication.dao.find(SubsidyApplication.SEARCH_FROM_SUBSIDY_APPLICATION + "where applicantId=?", applicantid);
    }

    /**
     * 通过申请人id查询申请表信息
     *
     * @param applicantid currentPage
     * @return
     */
    public Page<SubsidyApplication> getSubsidyApplicationByApplicantId(int applicantid, int currentPage) {
        return SubsidyApplication.dao.paginate(currentPage, Common.MAX_PAGE_SIZE, Common.COMMON_SELECT, SubsidyApplication.SQL_FROM + "where applicantId=?", applicantid);
    }

    /**
     * 通过申请人id查询申请表信息
     *
     * @param userid
     * @return
     */
    public List<SubsidyApplication> getSubsidyApplicationByUserId(int userid) {
        return SubsidyApplication.dao.find(SubsidyApplication.SEARCH_FROM_SUBSIDY_APPLICATION + "where approverId=? and approveStatus=10 and approverId is NULL", userid);
    }

    public List<SubsidyApplication> getApplicationHistoryByApplicantId(int applicantId) {
        return SubsidyApplication.dao.find(SubsidyApplication.SEARCH_FROM_SUBSIDY_APPLICATION + "where applicantId = ? and (approveStatus=10 or approveStatus=8 ) and approverId is not NULL ");
    }

    public SubsidyApplication getApplicationHistoryByApplicationDate(Long applicationDate) {
        return SubsidyApplication.dao.find(SubsidyApplication.SEARCH_FROM_SUBSIDY_APPLICATION + "where applicationDate = ? and approveStatus= 9 ",applicationDate).get(0);
    }

    public Page<SubsidyApplication> getSubsidyApplicationHistoryByUserId(int pageNummber,int userId) {
        Page<SubsidyApplication> paginate = SubsidyApplication.dao.paginate(pageNummber, Common.MAX_PAGE_SIZE, Common.COMMON_SELECT, SubsidyApplication.SQL_FROM + "where ( approveStatus = 8 or  approveStatus = 10 ) and applicantId = ?", userId);
        return PageinateKit.ClonePage(paginate,
                paginate.getList().stream().map(sa -> {
                    sa.setStatus(statusService.getStatusById(sa.getApproveStatus()));return sa;
                }).collect(Collectors.toList()));
    }
}
