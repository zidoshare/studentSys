package com.hudongwx.studentsys.util;

import java.util.Calendar;

/**
 * Created by wuhongxu on 2016/10/27 0027.
 */
public class TimeKit {
    public static long getFirstDayofToMouth(){
        Calendar calendar = Calendar.getInstance();// 获取当前日期
        calendar.add(Calendar.MONTH, 0);
        calendar.set(Calendar.DAY_OF_MONTH, 1);// 设置为1号,当前日期既为本月第一天
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        return calendar.getTimeInMillis();
    }
    public static long getNowTime(){
        return Calendar.getInstance().getTimeInMillis();
    }
}
