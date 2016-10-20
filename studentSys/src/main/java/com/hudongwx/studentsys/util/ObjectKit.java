package com.hudongwx.studentsys.util;

import com.alibaba.fastjson.JSONArray;
import com.hudongwx.studentsys.model.TestQuestion;
import com.jfinal.plugin.activerecord.Model;

import java.util.Iterator;
import java.util.List;

/**
 * Created by wuhongxu on 2016/9/1 0001.
 */
public class ObjectKit {
    public static String toString(Object obj) {
        return obj == null?"":obj.toString();
    }
    public static String getStrByJSONArray(JSONArray array){
        Iterator<Object> iterator = array.iterator();
        StringBuilder str = new StringBuilder("(");
        while(iterator.hasNext()){
            str.append("\'").append(iterator.next()).append("\',");
        }
        if(str.length()>1)
            str.deleteCharAt(str.length()-1);
        else
            str.append("-1");
        str.append(")");
        return str.toString();
    }

    public static String getStrByList(List<? extends Model> list) {
        return getStrByList(list,"id");
    }
    public static String getStrByList(List<? extends Model> list,String key){
        StringBuilder str = new StringBuilder("(");
        for(Model model : list){
            str.append("\'").append(model.get(key)).append("\',");
        }
        if(str.length()>1)
            str.deleteCharAt(str.length()-1);
        else
            str.append("-1");
        str.append(")");
        return str.toString();
    }
}
