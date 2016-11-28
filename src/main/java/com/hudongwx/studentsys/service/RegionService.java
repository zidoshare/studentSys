package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.Region;

import java.util.List;

/**
 * Created by 2-9 on 2016/11/24.
 */
public class RegionService extends Service {
    public List<Region> getRegionById(int id){
        return Region.dao.find(Region.SEARCH_FROM_REGION + "where id = ?", id);
    }
}
