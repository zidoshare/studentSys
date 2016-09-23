package com.hudongwx.studentsys.controller;

import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.model.Mapping;
import com.hudongwx.studentsys.model.User;
import com.hudongwx.studentsys.service.MappingService;
import com.hudongwx.studentsys.service.RoleService;
import com.hudongwx.studentsys.service.UserService;
import com.hudongwx.studentsys.util.RenderKit;
import com.jfinal.aop.Before;
import com.jfinal.ext.interceptor.POST;

/**
 * Created by wuhongxu on 2016/8/30 0030.
 */
public class UserController extends BaseController {
    UserService userService;

    /**
     * @return 返回mapping的title属性
     */
    @Override
    public String init() {
        return "用户管理";
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
    public void showLogin(){
        fillHeaderAndFooter();
        render("login.ftl");
    }

}
