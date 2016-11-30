package com.hudongwx.studentsys.util;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Table;
import com.jfinal.plugin.activerecord.TableMapping;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Created by wuhongxu on 2016/11/21.
 */
public class ModelKit {
    public static <T extends Model> T simulateModel(Class<T> _class, Map<String, Object> map) {
        try {
            T model = _class.newInstance();
            Set<String> keys = map.keySet();
            for (String key : keys) {
                model.set(key, map.get(key));
            }
            return model;
        } catch (InstantiationException | IllegalAccessException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static <T extends Model> T simulateModelByRandom(Class<T> _class, int strLength, int numLength) {
        try {
            T model = _class.newInstance();
            Table table = TableMapping.me().getTable(_class);
            Map<String, Class<?>> columnTypeMap = table.getColumnTypeMap();
            numLength = numLength > 10 ? 10 : numLength;
            double pow = Math.pow(10, numLength);
            for (String s : columnTypeMap.keySet()) {
                Class<?> aClass = columnTypeMap.get(s);

                if (columnTypeMap.get(s) == String.class) {
                    StringBuilder stringBuilder = new StringBuilder("");
                    for (int i = 0; i < strLength; i++) {
                        char c = ' ';
                        char or = (char) ((int) (Math.random() * 94) + c);
                        stringBuilder.append(or);
                    }
                    model.set(s, stringBuilder.toString());
                    continue;
                }
                Constructor<?> constructor = aClass.getConstructor(String.class);
                if(constructor == null){
                    throw new Exception("---------------错误：类型不支持-----------------");
                }
                model.set(s, constructor.newInstance(((int) (Math.random() * pow))+""));
            }
            return model;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static <T extends Model> T simulateModelByRandom(Class<T> _class, int maxLength) {
        return simulateModelByRandom(_class, maxLength, maxLength > 10 ? 10 : maxLength);
    }

    public static <T extends Model> List<T> createList(Class<T> _class, int strLength, int numLength, int count) {
        List<T> list = new ArrayList<>();
        for (int i = 0; i < count; i++) {
            list.add(simulateModelByRandom(_class, strLength, numLength));
        }
        return list;
    }

    public static <T extends Model> List<T> createList(Class<T> _class, int maxLength, int count) {
        List<T> list = new ArrayList<>();
        for (int i = 0; i < count; i++) {
            list.add(simulateModelByRandom(_class, maxLength));
        }
        return list;
    }

    public static <T extends Model> Page<T> createPage(Class<T> _class, int maxLength, int currentPage) {
        return new Page<T>(createList(_class, maxLength, Common.MAX_PAGE_SIZE), currentPage, Common.MAX_PAGE_SIZE, Common.MAX_PAGE_SIZE, Common.MAX_PAGE_SIZE);
    }

    public static <T extends Model> Page<T> createPage(Class<T> _class, int strLength, int numLength, int currentPage) {
        return new Page<T>(createList(_class, strLength, numLength, Common.MAX_PAGE_SIZE), currentPage, Common.MAX_PAGE_SIZE, Common.MAX_PAGE_SIZE, Common.MAX_PAGE_SIZE);
    }

    public static <T extends Model> List<T> injectList(Class<T> _class, Controller me, String key, Integer length) throws NoSuchMethodException, IllegalAccessException, InstantiationException, InvocationTargetException {
        if(length <= 0)
            return new ArrayList<>();
        List<T> list=  new ArrayList<>();
        Map<String, Class<?>> columnTypeMap = TableMapping.me().getTable(_class).getColumnTypeMap();
        for(int i = 0 ; i < length; i++){
            T t = _class.newInstance();
            for (String s : columnTypeMap.keySet()) {
                String para = me.getPara(key + "[" + i + "][" + s + "]");
                if(para == null)
                    continue;
                Constructor<?> constructor = columnTypeMap.get(s).getConstructor(String.class);
                if(constructor != null){
                    t.set(s,constructor.newInstance(para));
                }else
                    t.set(s,para);
            }
            list.add(t);
        }
        return list;
    }
}
