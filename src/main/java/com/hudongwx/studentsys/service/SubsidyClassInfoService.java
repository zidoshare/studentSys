package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.SubsidyClassinfo;

import java.util.List;

/**
 * Created by wu on 2016/11/21.
 */
public class SubsidyClassInfoService extends Service {
    /**
     * 添加申请班级
     *
     * @param subsidyClassinfo
     * @return
     */
    public boolean _saveSubsidyClassInfo(SubsidyClassinfo subsidyClassinfo) {
        return subsidyClassinfo.save();
    }

    /**
     * 删除指定申请班级
     *
     * @param id
     * @return
     */
    public boolean _deleteSubsidyClassInfoById(String id) {
        return SubsidyClassinfo.dao.deleteById(id);
    }

    /**
     * 删除所有班级申请
     *
     * @return
     */
    public boolean _deleteAllSubsidyClassInfo() {
        List<SubsidyClassinfo> subsidyClassinfos = SubsidyClassinfo.dao.find(SubsidyClassinfo.SEARCH_FROM_SUBSIDY_CLASSINFO);
        for (SubsidyClassinfo sc : subsidyClassinfos) {
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
    public boolean _updateSubsidyClassInfo(SubsidyClassinfo sc) {
        return sc.update();
    }

    /**
     * 查询指定的班级申请信息
     *
     * @param classid
     * @return
     */
    public List<SubsidyClassinfo> getSubsidyClassInfoById(String classid) {
        return SubsidyClassinfo.dao.find(SubsidyClassinfo.SEARCH_FROM_SUBSIDY_CLASSINFO + "where classId=?", classid);
    }

    /**
     * 查询指定区域班级申请信息
     *
     * @param area
     * @return
     */
    public List<SubsidyClassinfo> getSubsidyClassInfoByArea(String area) {
        return SubsidyClassinfo.dao.find(SubsidyClassinfo.SEARCH_FROM_SUBSIDY_CLASSINFO + "where area like ?", area);
    }


    /**
     * 查询所有班级申请信息
     *
     * @return
     */
    public List<SubsidyClassinfo> getAllSubsidyClassInfo() {
        return SubsidyClassinfo.dao.find(SubsidyClassinfo.SEARCH_FROM_SUBSIDY_CLASSINFO);
    }
}
