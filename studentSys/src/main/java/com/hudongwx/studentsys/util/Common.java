package com.hudongwx.studentsys.util;

import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;

/**
 * Created by wuhongxu on 2016/8/29 0029.
 *
 * 用于存储各种常用的常量
 * 一般是各种get("",)/set("",) 中用到的常量值
 */
public class Common {
    public final static String STATIC_SERVE_PATH_LABEL = "staticServePath";
    public final static String SERVE_PATH_LABEL = "servePath";
    public final static String HOLD_PATH_LABEL = "holdPath";
    public final static String STATIC_RESOURCE_VERSION_LABEL = "staticResourceVersion";
    public final static String LOGIN_ROLE_LABEL = "loginRole";
    public final static String IS_LOGIN_LABEL = "isLogin";
    public final static String LOGIN_NAME_ERROR_LABEL = "loginNameErrorLabel";
    public final static String INVALID_PASSWORD_LABEL = "invalidPasswordLabel";
    public final static String ACTION_KEY_LABEL = "actionKey";
    public final static String CONTROLLER_KEY_LABEL = "controllerKey";
    public final static String SIDES_LABEL = "sides";
    public static final String CONTENT_LABEL = "content";
    public final static String CATALOG = "Catalog";
    public static final int MAX_SIDE_CNT = 8;
    public static final int MAX_PAGE_SIZE = 20;


    //缓存Label
    public static final String CACHE_FOEVER_LABEL = "forever";
    public static final String CACHE_LONG_TIME_LABEL = "longTime";
    public static final String CACHE_60TIME_LABEL = "60time";


    //此处得到主配置
    public static Prop getMainProp(){
        return PropKit.use("config.properties");
    }
}
