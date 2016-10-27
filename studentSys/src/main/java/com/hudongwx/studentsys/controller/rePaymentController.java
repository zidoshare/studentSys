package com.hudongwx.studentsys.controller;

import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.model.Mapping;

/**
 * Created by wuhongxu on 2016/9/21 0021.
 */
public class RepaymentController extends BaseController {

    /**
     * @return 返回一级菜单的mapping
     */
    @Override
    public Mapping init() {
        return mappingService.getMappingByUrl("/repaymentManager");
    }
}
