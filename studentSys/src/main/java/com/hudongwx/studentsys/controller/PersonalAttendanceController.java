package com.hudongwx.studentsys.controller;

import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.model.Mapping;
import com.hudongwx.studentsys.util.Common;
import com.hudongwx.studentsys.util.StrPlusKit;

import java.util.Date;
import java.util.List;

/**
 * Created by wuhongxu on 2016/10/27 0027.
 */
public class PersonalAttendanceController extends BaseController {

    /**
     * @return 返回一级菜单的mapping
     */
    @Override
    public Mapping init() {
        return mappingService.getMappingByUrl("/personalAttendanceManager");
    }

    public void index() {
        super.index();
        List<Mapping> views = getAttr(Common.LABEL_VIEWS);
        //分发view,因为个人的会重复使用
        for (Mapping view : views) {
            if (view.getIcon().equals("personalAttendanceList")) {
                attendanceList();
            } else {
                attendanceChart();
            }
        }
    }

    public void attendanceList() {
        String className = getPara("list_class");
        Long start_time_list = getParaToLong("start_time_list");
        Long end_time_list = getParaToLong("end_time_list");

        if(start_time_list == null || end_time_list == null){

        }
        if(StrPlusKit.isEmpty(className)){
            //不限
        }
    }

    public void attendanceChart() {

    }
}
