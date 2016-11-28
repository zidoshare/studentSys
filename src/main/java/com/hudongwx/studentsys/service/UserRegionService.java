package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.UserRegion;

import java.util.List;

/**
 * Created by wu on 2016/11/22.
 */
public class UserRegionService extends Service {
    /**
     * 保存账号区域信息
     *
     * @param ur
     * @return
     */
    public boolean _saveRoleRegion(UserRegion ur) {
        return ur.save();
    }

    public boolean _deleteRoleRegionById(String id) {
        List<UserRegion> userRegions = UserRegion.dao.find(UserRegion.SELECT_FROM_USERREGION + "id=?", id);
        for (UserRegion ur : userRegions) {
            ur.delete();
        }
        return true;
    }

    public List<UserRegion> getUserRegionInfoByUserId(int userid) {
        return UserRegion.dao.find(UserRegion.SELECT_FROM_USERREGION + "where userId=?", userid);
    }
}
