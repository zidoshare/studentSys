package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.SubsidyClassInfo;

import java.util.List;

/**
 * Created by wu on 2016/11/21.
 */
public class SubsidyClassInfoService extends Service {
    /**
     * 添加申请班级
     *
     * @param subsidyClassInfo
     * @return
     */
    public boolean _saveSubsidyClassInfo(SubsidyClassInfo subsidyClassInfo) {
        return subsidyClassInfo.save();
    }

    /**
     * 删除指定申请班级
     *
     * @param classId
     * @return
     */
    public void _deleteSubsidyClassInfoByClassId(int classId) {
        List<SubsidyClassInfo> classInfos = SubsidyClassInfo.dao.find(SubsidyClassInfo.SEARCH_FROM_SUBSIDY_CLASSINFO + "where classId = ?", classId);
        for (SubsidyClassInfo classInfo : classInfos) {
            classInfo.delete();
        }
    }

    /**
     * 删除所有班级申请
     *
     * @return
     */
    public boolean _deleteAllSubsidyClassInfo() {
        List<SubsidyClassInfo> subsidyClassInfos = SubsidyClassInfo.dao.find(SubsidyClassInfo.SEARCH_FROM_SUBSIDY_CLASSINFO);
        for (SubsidyClassInfo sc : subsidyClassInfos) {
            sc.delete();
        }
        return true;
    }

    /**
     * 更新班级申请信息
     *
     * @param sc
     * @return
     */
    public boolean _updateSubsidyClassInfo(SubsidyClassInfo sc) {
        return sc.update();
    }

    /**
     * 查询指定的班级申请信息
     *
     * @param classid
     * @return
     */
    public List<SubsidyClassInfo> getSubsidyClassInfoById(String classid) {
        return SubsidyClassInfo.dao.find(SubsidyClassInfo.SEARCH_FROM_SUBSIDY_CLASSINFO + "where classId=?", classid);
    }

    /**
     * 查询指定区域班级申请信息
     *
     * @param area
     * @return
     */
    public List<SubsidyClassInfo> getSubsidyClassInfoByArea(String area) {
        return SubsidyClassInfo.dao.find(SubsidyClassInfo.SEARCH_FROM_SUBSIDY_CLASSINFO + "where area like ?", area);
    }

    /**
     * 查询指定区域班级申请信息
     *
     * @param applicationDate
     * @return
     */
    public List<SubsidyClassInfo> getSubsidyClassInfoByApplicationDate(Long applicationDate) {
        return SubsidyClassInfo.dao.find(SubsidyClassInfo.SEARCH_FROM_SUBSIDY_CLASSINFO + "where applicationDate = ?", applicationDate);
    }


    /**
     * 查询所有班级申请信息
     *
     * @return
     */
    public List<SubsidyClassInfo> getAllSubsidyClassInfo() {
        return SubsidyClassInfo.dao.find(SubsidyClassInfo.SEARCH_FROM_SUBSIDY_CLASSINFO);
    }

    public List<SubsidyClassInfo>getSciGroupByDateAndChecked(Long date ,int checkedStatus){
        return SubsidyClassInfo.dao.find(SubsidyClassInfo.SEARCH_FROM_SUBSIDY_CLASSINFO+"where applicationDate = ? and checked = ?",new Object[]{date,checkedStatus});
    }
}
