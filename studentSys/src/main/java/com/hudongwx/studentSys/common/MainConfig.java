package com.hudongwx.studentsys.common;

import com.hudongwx.studentsys.RequestHandler;
import com.hudongwx.testing.controller.TestController;
import com.hudongwx.studentsys.model.Mapping;
import com.hudongwx.studentsys.model.Role;
import com.hudongwx.studentsys.model.User;
import com.hudongwx.studentsys.service.MappingService;
import com.hudongwx.studentsys.service.RoleService;
import com.hudongwx.studentsys.service.UserService;
import com.hudongwx.studentsys.util.ArrayTree;
import com.hudongwx.studentsys.util.Common;
import com.hudongwx.studentsys.util.LangConfig;
import com.jfinal.config.*;
import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;
import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.dialect.MysqlDialect;
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
        MappingService ms = new MappingService();
        UserService us = new UserService();
        List<User> admins = us.getAdmin();
        if(admins != null && !admins.isEmpty()){
            return;
        }

        log.info("初始化地图");
        //建立mapping
        ArrayTree<Mapping> tree = new ArrayTree<>();
        Mapping r = new Mapping();
        r.setIcon("fa");
        r.setTitle("根目录");
        r.setUrl("url");
        tree.initTree(r);
        Mapping root = tree.root();
        Mapping common = new Mapping();
        common.setIcon("fa fa-desktop");
        common.setTitle("首页");
        common.setUrl("/");
        tree.insertChild(common, root, null);

        Mapping studentManager = new Mapping();
        studentManager.setIcon("fa fa-calendar");
        studentManager.setTitle("学生管理");
        studentManager.setUrl("/studentManager");
        tree.insertChild(studentManager, root, null);

        Mapping userManager = new Mapping();
        userManager.setIcon("fa fa-users");
        userManager.setTitle("用户管理");
        userManager.setUrl("/userManager");
        tree.insertChild(userManager, root, null);

        Mapping paymentManager = new Mapping();
        paymentManager.setIcon("fa fa-usd");
        paymentManager.setTitle("还款管理");
        paymentManager.setUrl("/paymentManager");
        tree.insertChild(paymentManager, root, null);

        Mapping attendanceManager = new Mapping();
        attendanceManager.setIcon("fa fa-history");
        attendanceManager.setTitle("出勤管理");
        attendanceManager.setUrl("/attendanceManager");
        tree.insertChild(attendanceManager, root, null);

        Mapping certificateManager = new Mapping();
        certificateManager.setIcon("fa fa-graduation-cap");
        certificateManager.setUrl("/certificateManager");
        certificateManager.setTitle("证书管理");
        tree.insertChild(certificateManager, root, null);
        Mapping option = new Mapping();
        option.setIcon("fa fa-gear");
        option.setTitle("通用设置");
        option.setUrl("/option");
        tree.insertChild(option, root, null);

        Mapping enrollManager = new Mapping();
        enrollManager.setIcon("fa fa-thumbs-up");
        enrollManager.setTitle("报名学生");
        enrollManager.setUrl("/enrollManager");
        tree.insertChild(enrollManager, root, null);




        ms._saveMappings(tree.getTree());

        //建立admin
        User admin = new User();
        admin.setUserNickname("admin");
        admin.setUserRole("admin");
        admin.setUserAccount("admin");
        admin.setUserPassword("admin");
        us._saveUser(admin);

        initRole();
    }

    public void configRoute(Routes me) {
       /*me.add("/user",UserController.class);
        me.add("/", IndexController.class,"/common");*/
        me.add("/", TestController.class,"test");
        me.add("/test",TestController.class);
    }

    public void configPlugin(Plugins me) {
        Prop dataBaseProp = PropKit.use("local.properties");
        /*C3p0Plugin c3p0Plugin = new C3p0Plugin(dataBaseProp.get("jdbcUrl"),dataBaseProp.get("user"),dataBaseProp.get("password"));
        me.add(c3p0Plugin);

        ActiveRecordPlugin activeRecordPlugin = new ActiveRecordPlugin("main",c3p0Plugin);
        activeRecordPlugin.setShowSql(true);
        _MappingKit.mapping(activeRecordPlugin);
        me.add(activeRecordPlugin);*/



        C3p0Plugin testC3p0Plugin  = new C3p0Plugin(dataBaseProp.get("testUrl"),dataBaseProp.get("testUser"),dataBaseProp.get("testPassword"));
        me.add(testC3p0Plugin);
        ActiveRecordPlugin testRecordPlugin = new ActiveRecordPlugin("test",testC3p0Plugin);
        testRecordPlugin.setShowSql(true);
        testRecordPlugin.setDialect(new MysqlDialect());
        //---添加映射---
        com.hudongwx.testing.model._MappingKit.mapping(testRecordPlugin);
        //-------------
        me.add(testRecordPlugin);
        //加载缓存插件ehcache
        me.add(new EhCachePlugin());
    }

    public void configInterceptor(Interceptors me) {
        //对增删改操作开启事务
        me.add(new TxByMethodRegex("(^_save.*|^_update.*|^_delete.*|^post.*)"));
        /*initMapping();*/
    }

    private void initRole() {
        log.info("初始化角色");
        RoleService rs = new RoleService();
        MappingService ms = new MappingService();
        Role admin = rs.getRoleByName("admin");
        if(null == admin)
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
