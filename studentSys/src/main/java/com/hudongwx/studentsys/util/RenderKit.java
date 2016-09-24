package com.hudongwx.studentsys.util;

import com.alibaba.fastjson.JSONObject;
import com.jfinal.core.Controller;

/**
 * Created by wuhongxu on 2016/8/31 0031.
 */
public class RenderKit {
    public static void renderSuccess(Controller me){
        renderState(me,"success");
    }
    public static void renderSuccess(Controller me,String msg){
        renderMsg(me,msg,"success");
    }
    public static void renderError(Controller me){
        renderState(me,"error");
    }
    public static void renderError(Controller me,String msg){
        renderMsg(me,msg,"error");
    }
    public static void renderState(Controller me,String state){
        renderMsg(me,"",state);
    }
    public static void renderMsg(Controller me,String msg,String state){
        renderMsgWidthLocation(me,msg,state,"");
    }
    public static void renderMsgWidthLocation(Controller me,String msg,String state,String url){
        JSONObject obj = new JSONObject();
        obj.put("state",state);
        obj.put("msg",msg);
        obj.put("url",url);
        me.renderJson(obj);
    }
}
