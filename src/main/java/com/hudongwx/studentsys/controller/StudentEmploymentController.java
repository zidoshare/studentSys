package com.hudongwx.studentsys.controller;

import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.model.Mapping;

/**
 * Created by wu on 2016/11/22.
 */
public class StudentEmploymentController extends BaseController {


    @Override
    public void index() {
        super.index();
    }

    @Override
    public Mapping init() {
        return mappingService.getMappingByUrl("/StudentEmploymentManager");
    }

}
