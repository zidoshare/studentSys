package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.Region;

import java.util.List;

/**
 * Created by wu on 2016/11/24.
 */
public class RegionService extends Service {

    /**
     * 添加区域信息
     *
     * @param r
     * @return
     */
    public boolean _saveRegion(Region r) {
        return r.save();
    }

    /**
     * 删除所有区域信息
     */
    public void _deleteAllRegion() {
        List<Region> regions = Region.dao.find(Region.SEARCH_REGION);
        for (Region r : regions) {
            r.delete();
        }
    }

    /**
     * 修改区域信息
     *
     * @param r
     * @return
     */
    public boolean _updateRegion(Region r) {
        return r.update();
    }

    /**
     * 删除指定id的区域信息
     *
     * @param id
     * @return
     */
    public boolean _deleteRegionById(int id) {
        return Region.dao.find(Region.SEARCH_REGION + "where id = ?", id).get(0).delete();
    }

    /**
     * 通过id获取地域信息
     *
     * @param id
     * @return
     */
    public List<Region> getRegionById(int id) {
        return Region.dao.find(Region.SEARCH_REGION + "where id= ?", id);
    }
}
