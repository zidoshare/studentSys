package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.Class;

/**
 * Created by wuhongxu on 2016/9/29 0029.
 */
public class ClassService extends Service {
    public Class getClassById(Integer id){
        return Class.dao.findById(id);
    }
}
