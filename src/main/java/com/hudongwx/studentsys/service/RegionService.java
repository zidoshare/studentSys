package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.Region;
import com.hudongwx.studentsys.util.Common;

import java.util.List;

/**
 * Created by 2-9 on 2016/11/24.
 */
public class RegionService extends Service {
    public Region getRegionById(int id) {
        return Region.dao.findFirstByCache(Common.CACHE_60TIME_LABEL, "regionName" + id, Region.SEARCH_FROM_REGION + "where id = ?", id);
    }

    public List<Region> getAllRegions() {
        List<Region> regionList = Region.dao.find(Region.SEARCH_FROM_REGION);
        if (regionList.isEmpty())
            return null;
        return regionList;
    }
}
