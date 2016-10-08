package com.hudongwx.studentsys.common;

import com.hudongwx.studentsys.RequestHandler;
import com.hudongwx.studentsys.model._MappingKit;
import com.hudongwx.surveys.common.SurveysRoutes;
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

    public void configRoute(Routes me) {
        me.add(new StudentSysRoutes());
        me.add(new SurveysRoutes());
    }

    public void configPlugin(Plugins me) {
        Prop dataBaseProp = PropKit.use("local.properties");
        C3p0Plugin c3p0Plugin = new C3p0Plugin(dataBaseProp.get("jdbcUrl"),dataBaseProp.get("user"),dataBaseProp.get("password"));
        me.add(c3p0Plugin);

        ActiveRecordPlugin activeRecordPlugin = new ActiveRecordPlugin("main",c3p0Plugin);
        activeRecordPlugin.setShowSql(true);
        _MappingKit.mapping(activeRecordPlugin);
        me.add(activeRecordPlugin);



        C3p0Plugin surveysPlugin  = new C3p0Plugin(dataBaseProp.get("testUrl"),dataBaseProp.get("testUser"),dataBaseProp.get("testPassword"));
        me.add(surveysPlugin);
        ActiveRecordPlugin surveysRecordPlugin = new ActiveRecordPlugin("surveys",surveysPlugin);
        surveysRecordPlugin.setShowSql(true);
        surveysRecordPlugin.setDialect(new MysqlDialect());
        //---添加映射---
        com.hudongwx.surveys.model._MappingKit.mapping(surveysRecordPlugin);
        //-------------
        me.add(surveysRecordPlugin);
        //加载缓存插件ehcache
        me.add(new EhCachePlugin());
    }

    public void configInterceptor(Interceptors me) {
        //对增删改操作开启事务
        me.add(new TxByMethodRegex("(^_save.*|^_update.*|^_delete.*|^post.*)"));
        me.add(new UrlInterceptor());
        /*initMapping();*/
    }

    public void configHandler(Handlers me) {
        me.add(new RequestHandler());
        if(Common.getMainProp().getBoolean("devMode"))
            Build.buildControl();
    }
}
