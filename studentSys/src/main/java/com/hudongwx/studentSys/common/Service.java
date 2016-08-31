package com.hudongwx.studentSys.common;

import com.hudongwx.studentSys.model.User;
import com.jfinal.core.Controller;
import com.jfinal.log.Log;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by wuhongxu on 2016/8/31 0031.
 */
public abstract class Service {
    protected Controller controller;
    private static Map<Class<? extends Service>, Service> INSTANCE_MAP = new HashMap<Class<? extends Service>, Service>();
    private static Log serviceLog = Log.getLog(Service.class);
    public static <Ser extends Service> Ser getInstance(Class<Ser> clazz, Controller controller){
        Ser service = (Ser) INSTANCE_MAP.get(clazz);
        if (service == null){
            try {
                service = clazz.newInstance();
                INSTANCE_MAP.put(clazz, service);
            } catch (InstantiationException e) {
                serviceLog.error(e.toString());
            } catch (IllegalAccessException e) {
                serviceLog.error(e.toString());
            }
        }
        service.controller = controller;
        return service;
    }

    public User getCurrentUser(){
        return controller.getSessionAttr("user");
    }
}