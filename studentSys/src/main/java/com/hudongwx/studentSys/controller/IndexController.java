package com.hudongwx.studentsys.controller;

import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.service.MappingService;
import com.hudongwx.studentsys.service.RoleService;

/**
 * Created by wuhongxu on 2016/9/2 0002.
 */
public class IndexController extends BaseController{
    MappingService mappingService;
    RoleService roleService;
    public void index(){
        fillHeaderAndFooter();

//        fillContent(roleService);
        fillTest(mappingService);
        render("index.ftl");
    }
}
