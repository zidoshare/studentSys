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
    public boolean _saveSubsidyApplication(SubsidyApplication subsidyApplication) {
        return subsidyApplication.save();
    }

    /**
     * 删除指定表
     * @param id
     * @return
     */
    public boolean _deleteSubsidyApplicationById(String id) {
        return SubsidyApplication.dao.deleteById(id);
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
     * 更新表数据
     * @param sa
     * @return
     */
    public boolean _updateSubsidyApplication(SubsidyApplication sa) {
        return sa.update();
    }

    /**
     * 查询申请表信息
     * @param keywords
     * @return
     */
    public List<SubsidyApplication> _querySubsidyApplicationByTitle(String keywords) {
        String title = "%" + keywords + "%";
        return SubsidyApplication.dao.find(SubsidyApplication.SEARCH_FROM_SUBSIDY_APPLICATION + "where title like ?", title);
    }


}
