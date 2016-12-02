package com.hudongwx.studentsys.util;

import com.jfinal.core.Controller;

/**
 * Created by wuhongxu on 2016/8/31 0031.
 */
public class RenderKit {
    public static void renderSuccess(Controller me){
        renderState(me,"success");
    }
    public static void renderSuccess(Controller me,Object msg){
        renderMsg(me,msg,"success");
    }
    public static void renderError(Controller me){
        renderState(me,"error");
    }
    public static void renderError(Controller me,Object msg){
        renderMsg(me,msg,"error");
    }
    public static void renderState(Controller me,Object state){
        renderMsg(me,"",state);
    }
    public static void renderMsg(Controller me,Object msg,Object state){
        renderMsgWidthLocation(me,msg,state,"");
    }
    public static void renderMsgWidthLocation(Controller me,Object msg,Object state,Object url){
        /*JSONObject obj = new JSONObject();*/
        Resp resp = new Resp(state,msg,url);
        /*obj.put("state",state);
        obj.put("msg",msg);
        obj.put("url",url);*/
        me.renderJson(resp);
    }

    /*public static void renderSuccess(Controller me){
        renderSuccess(me,"");
    }
    public static void renderSuccess(Controller me,Object msg){
        renderMsg(me,msg,"success",200);
    }
    public static void renderError(Controller me){
        renderError(me,"");
    }
    public static void renderError(Controller me,Object msg){
        renderMsg(me,msg,"error",500);
    }
    public static void renderState(Controller me,Object state){
        renderMsg(me,"",state,200);
    }
    public static void renderMsg(Controller me,Object msg,Object state,Integer code){
        renderMsgWidthLocation(me,msg,state,"",code);
    }
    public static void renderMsgWidthLocation(Controller me,Object msg,Object state,Object url,Integer code){
        *//*JSONObject obj = new JSONObject();*//*
        Resp resp = new Resp(state,msg,url);
        *//*obj.put("state",state);
        obj.put("msg",msg);
        obj.put("url",url);*//*
        me.getResponse().setStatus(code);
        me.renderJson(JsonKit.toJson(resp));
    }*/
}
