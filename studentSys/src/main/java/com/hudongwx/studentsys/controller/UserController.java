package com.hudongwx.studentsys.controller;

import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.model.Mapping;
import com.hudongwx.studentsys.model.Role;
import com.hudongwx.studentsys.model.User;
import com.hudongwx.studentsys.service.MappingService;
import com.hudongwx.studentsys.service.RoleService;
import com.hudongwx.studentsys.service.UserService;
import com.hudongwx.studentsys.util.RenderKit;
import com.jfinal.aop.Before;
import com.jfinal.ext.interceptor.POST;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wuhongxu on 2016/8/30 0030.
 */
public class UserController extends BaseController {
    public UserService userService;

    /**
     * @return 返回mapping的title属性
     */
    @Override
    public String init() {
        return "用户管理";
    }

    @Override
    public void index() {
        super.index();
        List<Role> roles = roleService.getRoles();
        setAttr("roles",roles);
        Map<String,List<User>> map = new HashMap<>();
        for(Role role : roles){
            map.put(role.getName(),userService.getUsersByRole(role));
        }
        setAttr("roleMap",map);
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
    @Before(POST.class)
    public void addRole(){
        
    }
}
