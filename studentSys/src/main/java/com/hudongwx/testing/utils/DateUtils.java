package com.hudongwx.testing.utils;


import java.text.SimpleDateFormat;

/**
 * Created by 11 on 2016/9/9.
 */
public class DateUtils {
    //当前时间转换为字符串
    public static String dateToString(){
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return  format.format(System.currentTimeMillis());
    }

}
