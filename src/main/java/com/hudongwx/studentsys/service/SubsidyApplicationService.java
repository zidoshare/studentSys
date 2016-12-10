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
    RegionService regionService;

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
        return SubsidyApplication.dao.find(SubsidyApplication.SEARCH_FROM_SUBSIDY_APPLICATION + "where applicantId = ? ", applicantid);
    }

    /**
     * 通过申请人id查询申请表信息
     *
     * @param applicantid currentPage
     * @return
     */
    public Page<SubsidyApplication> getSubsidyApplicationByApplicantId(int applicantid, int currentPage) {
        return SubsidyApplication.dao.paginate(currentPage, Common.MAX_PAGE_SIZE, Common.COMMON_SELECT, SubsidyApplication.SQL_FROM + "where applicantId = ?  and approveStatus = 9 ", applicantid);
    }

    /**
     * 通过申请人id查询申请表信息
     *
     * @param approveId currentPage
     * @return
     */
    public Page<SubsidyApplication> getSubsidyApplicationByApproveId(Integer approveId, Integer currentPage) {
        Page<SubsidyApplication> paginate = SubsidyApplication.dao.paginate(currentPage, Common.MAX_PAGE_SIZE, Common.COMMON_SELECT, SubsidyApplication.SQL_FROM + "where approverId = ?  and approveStatus = ?", new Object[]{approveId, SubsidyApplication.APPROVE_WAITTING});
        return PageinateKit.ClonePage(paginate,
                paginate.getList().stream().map(sa -> {
                    sa.setRegion(regionService.getRegionById(sa.getRegionId()));
                    sa.setStatus(statusService.getStatusById(sa.getApproveStatus()));
                    return sa;
                }).collect(Collectors.toList()));
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

    public List<SubsidyApplication> getSubApplicationByApplicationDate(Long applicationDate) {
        return SubsidyApplication.dao.find(SubsidyApplication.SEARCH_FROM_SUBSIDY_APPLICATION + "where applicationDate = ? and approveStatus= 9 ", applicationDate);
    }

    public List<SubsidyApplication> getApplicationByClassIdAndDate(Integer classId, Long applicationDate) {
        return SubsidyApplication.dao.find(SubsidyApplication.SEARCH_FROM_SUBSIDY_APPLICATION + "where classId = ? and applicationDate = ? and approveStatus = " + SubsidyApplication.APPROVE_BEFORE, classId, applicationDate);
    }

    public Page<SubsidyApplication> getSubsidyApplicationHistoryByUserId(int pageNumber, int userId, long startTime, long endTime) {
        Page<SubsidyApplication> paginate;
        if (startTime == 0 || endTime == 0 || startTime == endTime) {
            paginate = SubsidyApplication.dao.paginate(pageNumber, Common.MAX_PAGE_SIZE_10, Common.COMMON_SELECT, SubsidyApplication.SQL_FROM + "where ( approveStatus = ? or  approveStatus = ? or approveStatus = ? ) and applicantId = ? ", SubsidyApplication.APPROVE_WAITTING, SubsidyApplication.APPROVE_NO, SubsidyApplication.APPROVE_YES, userId);
        } else {
            paginate = SubsidyApplication.dao.paginate(pageNumber, Common.MAX_PAGE_SIZE_10, Common.COMMON_SELECT, SubsidyApplication.SQL_FROM + "where ( approveStatus = ? or  approveStatus = ? or approveStatus = ? ) and applicantId = ? and (applicationDate between ? and ?)", SubsidyApplication.APPROVE_WAITTING, SubsidyApplication.APPROVE_NO, SubsidyApplication.APPROVE_YES, userId, startTime, endTime);
        }
        if (paginate == null)
            return null;
        return PageinateKit.ClonePage(paginate,
                paginate.getList().stream().map(sa -> {
                    sa.setStatus(statusService.getStatusById(sa.getApproveStatus()));
                    return sa;
                }).collect(Collectors.toList()));
    }
}
