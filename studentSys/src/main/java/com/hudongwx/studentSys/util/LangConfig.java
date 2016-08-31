package com.hudongwx.studentSys.util;

import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;

/**
 * Created by wuhongxu on 2016/8/31 0031.
 */
public class LangConfig {
    //默认
    private static String lang = "zh_CN";
    private static String LANG_CONFIG_PATH;

    public static void init() {
        Prop use = PropKit.use("config.properties");
        lang = use.get("language");
        LANG_CONFIG_PATH = "label-" + lang + ".properties";
    }
    public static Prop getLangProp(){
        return PropKit.use(LANG_CONFIG_PATH);
    }
}
