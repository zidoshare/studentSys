package com.hudongwx.studentsys.util;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Table;
import com.jfinal.plugin.activerecord.TableMapping;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Created by 2-9 on 2016/11/21.
 */
public class ModelKit {
    public static Model simulateModel(Class<? extends Model> _class, Map<String, Object> map) {
        try {
            Model model = _class.newInstance();
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

    public static Model simulateModelByRandom(Class<? extends Model<?>> _class, int strLength, int numLength) {
        try {
            Model model = _class.newInstance();
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
                model.set(s, (int)(Math.random() * pow));
            }
            return model;
        } catch (InstantiationException | IllegalAccessException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static Model simulateModelByRandom(Class<? extends Model<?>> _class, int maxLength) {
        return simulateModelByRandom(_class, maxLength, maxLength > 10 ? 10 : maxLength);
    }

    public static List<Model> createList(Class<? extends Model<?>> _class, int strLength, int numLength, int count) {
        List<Model> list = new ArrayList<>();
        for (int i = 0; i < count; i++) {
            list.add(simulateModelByRandom(_class, strLength, numLength));
        }
        return list;
    }

    public static List<Model> createList(Class<? extends Model<?>> _class, int maxLength, int count) {
        List<Model> list = new ArrayList<>();
        for (int i = 0; i < count; i++) {
            list.add(simulateModelByRandom(_class, maxLength));
        }
        return list;
    }

    public static Page<Model> createPage(Class<? extends Model<?>> _class, int maxLength, int currentPage) {
        return new Page<Model>(createList(_class, maxLength, Common.MAX_PAGE_SIZE), currentPage, Common.MAX_PAGE_SIZE, Common.MAX_PAGE_SIZE, Common.MAX_PAGE_SIZE);
    }

    public static Page<Model> createPage(Class<? extends Model<?>> _class, int strLength, int numLength, int currentPage) {
        return new Page<Model>(createList(_class, strLength, numLength, Common.MAX_PAGE_SIZE), currentPage, Common.MAX_PAGE_SIZE, Common.MAX_PAGE_SIZE, Common.MAX_PAGE_SIZE);
    }
}
