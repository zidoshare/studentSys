package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.ObtainEmployment;

import java.util.List;

/**
 * Created by wu on 2016/11/22.
 */
public class ObtainEmploymentService extends Service {
    /**
     * 添加学生就业情况
     * @param oe
     * @return
     */
    public boolean _saveObtainEmployment(ObtainEmployment oe) {
        return oe.save();
    }

    /**
     * 删除指定记录
     *
     * @param id
     * @return
     */
    public boolean _deleteObtainEmploymentById(String id) {
        return ObtainEmployment.dao.deleteById(id);
    }

    /**
     * 删除所有记录
     *
     * @return
     */
    public boolean _deleteAllObtainEmployment() {
        List<ObtainEmployment> obtainEmployments = ObtainEmployment.dao.find(ObtainEmployment.SEARCH_FROM_OBTAIN_EMPLOYMENT);
        for (ObtainEmployment oe : obtainEmployments) {
            oe.delete();
        }
        return true;
    }

    /**
     * 更新就业信息
     *
     * @param oe
     * @return
     */
    public boolean _updateObtainEmployment(ObtainEmployment oe) {
        return oe.update();
    }

    /**
     * 查询指定的就业信息
     *
     * @param id
     * @return
     */
    public List<ObtainEmployment> getObtainEmploymentById(String id) {
        return ObtainEmployment.dao.find(ObtainEmployment.SEARCH_FROM_OBTAIN_EMPLOYMENT + "where id=?", id);
    }

    /**
     * 查询所有就业追踪信息
     *
     * @return
     */
    public List<ObtainEmployment> _queryAllObtainEmploymentInfo() {
        return ObtainEmployment.dao.find(ObtainEmployment.SEARCH_FROM_OBTAIN_EMPLOYMENT);
    }

}
