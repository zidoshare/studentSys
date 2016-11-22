package com.hudongwx.studentsys.controller;

import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.model.Mapping;

/**
 * Created by 2-9 on 2016/11/21.
 */
public class ApprovalController extends BaseController {

    @Override
    public void index() {
        super.index();
    }

    @Override
    public Mapping init() {

        return mappingService.getMappingByUrl("/approvalManager");
    }


}
