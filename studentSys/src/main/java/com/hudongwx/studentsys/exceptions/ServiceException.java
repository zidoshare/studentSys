package com.hudongwx.studentsys.exceptions;

import com.jfinal.log.Log;

/**
 * Created by wuhongxu on 2016/8/31 0031.
 */
//服务层错误
public class ServiceException extends Exception {
    private Log log = Log.getLog(ServiceException.class);
    public ServiceException(){
        super("服务层错误");
        log.error("服务层错误");
    }
    public ServiceException(String msg){
        super(msg);
        log.error(msg);
    }
}
