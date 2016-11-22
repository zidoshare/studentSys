package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.SubsidyHistory;

import java.util.List;

/**
 * Created by wu on 2016/11/21.
 */
public class SubsidyHistoryService extends Service {
    /**
     * 添加申请表历史
     * @param subsidyHistory
     * @return
     */
    public boolean _saveSubsidyHistory(SubsidyHistory subsidyHistory) {
        return subsidyHistory.save();
    }

    /**
     * 删除指定申请历史
     *
     * @param id
     * @return
     */
    public boolean _deleteSubsidyHistoryById(String id) {
        return SubsidyHistory.dao.deleteById(id);
    }

    /**
     * 删除所有申请历史
     *
     * @return
     */
    public boolean _deleteSubsidyHistory() {
        List<SubsidyHistory> subsidyHistorys = SubsidyHistory.dao.find(SubsidyHistory.SEARCH_FROM_SUBSIDY_HISTORY);
        for (SubsidyHistory sh : subsidyHistorys) {
            sh.delete();
        }
        return true;
    }

    /**
     * 更新历史申请信息
     *
     * @param sh
     * @return
     */
    public boolean _updateSubsidyHistory(SubsidyHistory sh) {
        return sh.update();
    }

    /**
     * 查询指定的历史申请信息
     *
     * @param id
     * @return
     */
    public List<SubsidyHistory> _querySubsidyHistoryById(String id) {
        return SubsidyHistory.dao.find(SubsidyHistory.SEARCH_FROM_SUBSIDY_HISTORY + "where id=?", id);
    }

    /**
     * 查询所有历史申请信息
     *
     * @return
     */
    public List<SubsidyHistory> _queryAllSubsidyClassInfo() {
        return SubsidyHistory.dao.find(SubsidyHistory.SEARCH_FROM_SUBSIDY_HISTORY);
    }
}
