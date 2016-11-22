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
    public static Model simulateModel(Class<? extends Model> _class, Map<String,Object> map){
        try {
            Model model = _class.newInstance();
            Set<String> keys = map.keySet();
            for (String key : keys) {
                model.set(key,map.get(key));
            }
            return model;
        } catch (InstantiationException | IllegalAccessException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static Model simulateModelByRandom(Class<? extends Model<?>> _class,int maxLength){
        try {
            Model model = _class.newInstance();
            String[] attrNames = model._getAttrNames();
            Table table = TableMapping.me().getTable(_class);
            Map<String, Class<?>> columnTypeMap = table.getColumnTypeMap();
            double pow = Math.pow(10, maxLength);
            for (String s : columnTypeMap.keySet()) {
                model.set(s, (int)(Math.random()*pow)+"");
            }
            return model;
        } catch (InstantiationException | IllegalAccessException e) {
            e.printStackTrace();
        }
        return null;
    }
}
