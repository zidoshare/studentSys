package com.hudongwx.studentSys.controller;

import com.hudongwx.studentSys.common.BaseController;
import com.hudongwx.studentSys.exceptions.ServiceException;
import com.hudongwx.studentSys.model.User;
import com.hudongwx.studentSys.service.UserService;
import com.hudongwx.studentSys.util.RenderKit;
import com.jfinal.aop.Before;
import com.jfinal.ext.interceptor.POST;
import com.jfinal.plugin.ehcache.CacheName;

/**
 * Created by wuhongxu on 2016/8/30 0030.
 */
public class UserController extends BaseController {
    UserService userService;
    @CacheName("60time")
    public void index(){
        fillHeaderAndFooter();
        render("login.ftl");
    }
    @Before(POST.class)
    public void login(){
        RenderKit.renderSuccess(this,"登录成功");
    }
    public void register(){
        fillHeaderAndFooter();
        render("login.ftl");
    }
}
