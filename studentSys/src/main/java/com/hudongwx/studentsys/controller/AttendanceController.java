package com.hudongwx.studentsys.controller;

import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.model.Mapping;
import com.hudongwx.studentsys.service.MappingService;
import com.hudongwx.studentsys.service.RoleService;
import com.hudongwx.studentsys.util.Common;

import java.util.List;

/**
 * Created by wuhongxu on 2016/9/21 0021.
 */
public class AttendanceController extends BaseController {

    /**
     * @return  返回一级菜单的mapping
     */
    @Override
    public Mapping init() {
        return mappingService.getMappingByUrl("/attendanceManager");
    }

    public void index(){
        super.index();

    }
}
