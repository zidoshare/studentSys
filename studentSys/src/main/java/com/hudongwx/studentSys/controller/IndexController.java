package com.hudongwx.studentSys.controller;

import com.hudongwx.studentSys.common.BaseController;
import com.hudongwx.studentSys.service.MappingService;
import com.hudongwx.studentSys.service.RoleService;

/**
 * Created by wuhongxu on 2016/9/2 0002.
 */
public class IndexController extends BaseController{
    MappingService mappingService;
    RoleService roleService;
    public void index(){
        fillHeaderAndFooter();

        fillContent(roleService);

        render("index.ftl");
    }
}
