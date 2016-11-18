package com.hudongwx.studentsys.util;

/**
 * Created by wuhongxu on 2016/11/2 0002.
 */
public class Resp{
    private Object state;
    private Object msg;
    private Object url;

    public Resp(Object state, Object msg, Object url) {
        this.state = state;
        this.msg = msg;
        this.url = url;
    }

    public Object getState() {
        return state;
    }

    public void setState(Object state) {
        this.state = state;
    }

    public Object getMsg() {
        return msg;
    }

    public void setMsg(Object msg) {
        this.msg = msg;
    }

    public Object getUrl() {
        return url;
    }

    public void setUrl(Object url) {
        this.url = url;
    }
}
