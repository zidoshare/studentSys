package com.hudongwx.studentsys.util;

import com.alibaba.fastjson.JSONArray;

import java.util.Iterator;

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
        str.append(")");
        return str.toString();
    }
}
