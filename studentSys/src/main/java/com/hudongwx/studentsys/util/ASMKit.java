package com.hudongwx.studentsys.util;

import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.TableMapping;

import java.lang.reflect.Field;

/**
 * Created by wuhongxu on 2016/10/31 0031.
 */
public class ASMKit {
    private static Log logger = Log.getLog(ASMKit.class);
    /**
     * @Description: 从对象中获取字段的值, 可以获取对象的私有字段
     * @author: luoyizhu
     * @time:2014年11月6日 下午7:14:36
     * @title getFieldValue
     * @param obj 从这个对象获取值
     * @param filedName 需要获取的字段名
     * @return
     */
    @SuppressWarnings("unchecked")
    public static <T> T getFieldValue(Object obj,
                                      String filedName) {
        final Class<?> cls = obj.getClass();
        try {
            Field field = cls.getDeclaredField(filedName);
            field.setAccessible(true);
            return (T) field.get(TableMapping.me());
        } catch (NoSuchFieldException | SecurityException | IllegalArgumentException | IllegalAccessException e) {
            logger.error(e.getMessage());
        }
        return null;
    }
}
