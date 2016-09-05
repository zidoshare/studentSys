package com.hudongwx.studentSys.common;

import com.hudongwx.studentSys.RequestHandler;
import com.hudongwx.studentSys.controller.IndexController;
import com.hudongwx.studentSys.controller.UserController;
import com.hudongwx.studentSys.exceptions.ServiceException;
import com.hudongwx.studentSys.model.Mapping;
import com.hudongwx.studentSys.model.Role;
import com.hudongwx.studentSys.model.User;
import com.hudongwx.studentSys.model._MappingKit;
import com.hudongwx.studentSys.service.MappingService;
import com.hudongwx.studentSys.service.RoleService;
import com.hudongwx.studentSys.service.UserService;
import com.hudongwx.studentSys.util.ArrayTree;
import com.hudongwx.studentSys.util.Common;
import com.hudongwx.studentSys.util.LangConfig;
import com.hudongwx.studentSys.util.TreeNode;
import com.jfinal.config.*;
import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;
import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.tx.TxByMethodRegex;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;

import java.util.List;

/**
 * Created by wuhongxu on 2016/8/29 0029.
 */
public class MainConfig extends JFinalConfig{
    private Log log = Log.getLog(MainConfig.class);
    public void configConstant(Constants me) {
        me.setDevMode(Common.getMainProp().getBoolean("devMode"));
        //初始化语言配置
        LangConfig.init();

        //配置错误页面
        me.setError403View("/error/403.html");
        me.setError404View("/error/404.html");
        me.setError500View("/error/500.html");
    }

    private void initMapping() {
        log.info("初始化映射");
        MappingService ms = new MappingService();
        UserService us = new UserService();
        List<User> admins = us.getAdmin();
        if(null != admins && !admins.isEmpty()){
            return ;
        }
        //建立mapping
        ArrayTree<Mapping> tree = new ArrayTree<>();
        Mapping r = new Mapping();
        r.setIcon("fa");
        r.setTitle("根目录");
        r.setUrl("url");
        tree.initTree(r);
        Mapping root = tree.root();
        Mapping mapping = new Mapping();
        mapping.setIcon("fa fa-desktop");
        mapping.setTitle("首页");
        mapping.setUrl("#");
        tree.insertChild(mapping, root, null);

        mapping = new Mapping();
        mapping.setIcon("fa fa-desktop");
        mapping.setTitle("学生管理");
        mapping.setUrl("#");
        tree.insertChild(mapping, root, null);

        mapping = new Mapping();
        mapping.setIcon("fa fa-desktop");
        mapping.setTitle("用户管理");
        mapping.setUrl("#");
        tree.insertChild(mapping, root, null);

        ms._saveMappings(tree.getTree());

        //建立admin
        User admin = new User();
        admin.setUserNickname("admin");
        admin.setUserRole("admin");
        admin.setUserAccount("admin");
        admin.setUserPassword("admin");
        us._saveUser(admin);
    }

    public void configRoute(Routes me) {
        me.add("/user",UserController.class);
        me.add("/", IndexController.class,"/common");
    }

    public void configPlugin(Plugins me) {
        Prop dataBaseProp = PropKit.use("local.properties");
        C3p0Plugin c3p0Plugin = new C3p0Plugin(dataBaseProp.get("jdbcUrl"),dataBaseProp.get("user"),dataBaseProp.get("password"));
        me.add(c3p0Plugin);

        ActiveRecordPlugin activeRecordPlugin = new ActiveRecordPlugin(c3p0Plugin);
        activeRecordPlugin.setShowSql(true);
        _MappingKit.mapping(activeRecordPlugin);
        me.add(activeRecordPlugin);

        //加载缓存插件ehcache
        me.add(new EhCachePlugin());
    }

    public void configInterceptor(Interceptors me) {
        //对增删改操作开启事务
        me.add(new TxByMethodRegex("(^_save.*|^_update.*|^_delete.*)"));
        initMapping();
        initRole();
    }

    private void initRole() {
        log.info("初始化角色");
        RoleService rs = new RoleService();
        MappingService ms = new MappingService();
        Role admin = rs.getRoleByName("admin");
        if(null != admin)
            return ;
        Role role = new Role();
        role.setName("admin");
        role.setMemberCnt(0);
        List<Mapping> mappings = ms.getMappings();
        rs.putRoleTree(role,mappings);
        rs._saveRole(role);
    }

    public void configHandler(Handlers me) {
        me.add(new RequestHandler());
    }
}
