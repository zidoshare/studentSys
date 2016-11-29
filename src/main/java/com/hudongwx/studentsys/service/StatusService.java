package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.Status;
import com.hudongwx.studentsys.util.Common;

/**
 * Created by 2-9 on 2016/11/28.
 */
public class StatusService extends Service{
    public Status getStatusById(int id){
        return Status.dao.findFirstByCache(Common.CACHE_60TIME_LABEL,"StatusName"+id,Status.SEARCH_FROM_STATUS + "where id = ?", id);
    }
}
