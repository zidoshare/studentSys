package com.hudongwx.studentsys.controller;

import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.model.Mapping;

/**
 * Created by wu on 2016/12/13.
 */
public class UpAndDownLoadController extends BaseController {
    @Override
    public Mapping init() {
        return mappingService.getMappingByUrl("/up");
    }
}
