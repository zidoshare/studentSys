package com.hudongwx.studentsys.exceptions;

import com.jfinal.log.Log;

/**
 * Created by wuhongxu on 2016/8/31 0031.
 */
//服务层错误
public class ServiceException extends BaseException {
    public ServiceException(){
        super();
    }
    public ServiceException(String msg){
        super(msg);
    }

    public String getType() {
        return "服务层错误";
    }
}
