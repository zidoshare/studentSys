package com.hudongwx.studentSys.common;

import com.hudongwx.studentSys.RequestHandler;
import com.hudongwx.studentSys.controller.IndexController;
import com.hudongwx.studentSys.controller.UserController;
import com.hudongwx.studentSys.model._MappingKit;
import com.hudongwx.studentSys.util.Common;
import com.hudongwx.studentSys.util.LangConfig;
import com.jfinal.config.*;
import com.jfinal.core.JFinal;
import com.jfinal.kit.PathKit;
import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;
import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.tx.TxByMethodRegex;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;

/**
 * Created by wuhongxu on 2016/8/29 0029.
 */
public class MainConfig extends JFinalConfig {
    private Log log = Log.getLog(MainConfig.class);
    public void configConstant(Constants me) {
        me.setDevMode(Common.getMainProp().getBoolean("devMode"));
        //初始化语言配置
        LangConfig.init();
        log.info("初始化config");

        //配置错误页面
        me.setError403View("/error/403.html");
        me.setError404View("/error/404.html");
        me.setError500View("/error/500.html");
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
    }

    public void configHandler(Handlers me) {
        me.add(new RequestHandler());
    }
}
