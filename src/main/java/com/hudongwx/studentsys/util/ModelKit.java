package com.hudongwx.studentsys.util;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Table;
import com.jfinal.plugin.activerecord.TableMapping;

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

    public static Model simulateModelByRandom(Class<? extends Model<?>> _class, int maxLength) {
        try {
            Model model = _class.newInstance();
            Table table = TableMapping.me().getTable(_class);
            Map<String, Class<?>> columnTypeMap = table.getColumnTypeMap();
            int numLength = maxLength > 10 ? 10 : maxLength;
            double pow = Math.pow(10, numLength);
            for (String s : columnTypeMap.keySet()) {
                if (columnTypeMap.get(s) == String.class) {
                    StringBuilder stringBuilder = new StringBuilder("");
                    for (int i = 0; i < maxLength; i++) {
                        char c = ' ';
                        char or = (char) ((int) (Math.random() * 94) + c);
                        stringBuilder.append(or);
                    }
                    model.set(s, stringBuilder.toString());
                    continue;
                }
                model.set(s, (int) (Math.random() * pow) + "");
            }
            return model;
        } catch (InstantiationException | IllegalAccessException e) {
            e.printStackTrace();
        }
        return null;
    }
}
