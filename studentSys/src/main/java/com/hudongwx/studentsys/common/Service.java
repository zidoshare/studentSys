package com.hudongwx.studentsys.common;

import com.hudongwx.studentsys.model.User;
import com.jfinal.core.Controller;
import com.jfinal.log.Log;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by wuhongxu on 2016/8/31 0031.
 */
public abstract class Service {
    private Log log = Log.getLog(getClass());
    protected static Map<Class<? extends Service>, Service> INSTANCE_MAP = new HashMap<Class<? extends Service>, Service>();
    private static Log serviceLog = Log.getLog(Service.class);
    public static <Ser extends Service> Ser getInstance(Class<Ser> clazz){
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
        return service;
    }
    public Service() {
        Field[] fields = this.getClass().getDeclaredFields();

        for (int i = 0; i < fields.length; i++) {
            Field field = fields[i];
            Class clazz = field.getType();
            if (Service.class.isAssignableFrom(clazz) && clazz != getClass()) {
                try {
                    field.setAccessible(true);
                    field.set(this, Service.getInstance(clazz));
                } catch (IllegalAccessException e) {
                    log.error(e.toString());
                }
            }
        }
    }
    public User getCurrentUser(Controller c){
        return c.getSessionAttr("user");
    }
}