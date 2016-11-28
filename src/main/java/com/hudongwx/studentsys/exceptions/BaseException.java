package com.hudongwx.studentsys.exceptions;

import com.jfinal.log.Log;

/**
 * Created by wuhongxu on 2016/11/28 0028.
 */
public class BaseException extends Exception {

    private Log log = Log.getLog(ServiceException.class);
    BaseException(){
        super("未知错误：");
    }
    BaseException(String msg){
        super(msg);
    }
    public String getType(){
        return "未知";
    }
}
