package com.hudongwx.studentsys.controller;

import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.model.User;
import com.hudongwx.studentsys.service.UserService;
import com.hudongwx.studentsys.util.RenderKit;
import com.jfinal.aop.Before;
import com.jfinal.ext.interceptor.POST;

/**
 * Created by wuhongxu on 2016/8/30 0030.
 */
public class UserController extends BaseController {
    UserService userService;
    public void index(){
        fillHeaderAndFooter();
        render("login.ftl");
    }
    @Before(POST.class)
    public void login(){
        String account = getPara("account");
        String password = getPara("password");

        User user = userService.validate(account, password);
        if(null != user)
            setSessionAttr("user",user);

        RenderKit.renderSuccess(this,"登录成功,"+account+" "+password);

    }
    public void register(){
        fillHeaderAndFooter();
        render("login.ftl");
    }
}
