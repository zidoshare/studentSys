package com.hudongwx.studentSys.controller;

import com.hudongwx.studentSys.common.BaseController;
import com.hudongwx.studentSys.model.Mapping;
import com.hudongwx.studentSys.service.MappingService;

/**
 * Created by wuhongxu on 2016/9/2 0002.
 */
public class IndexController extends BaseController{
    MappingService mappingService;
    public void index(){
        fillHeaderAndFooter();

        fillSide(mappingService);

        render("index.ftl");
    }
}
