package com.hudongwx.studentsys.exceptions;

import com.jfinal.log.Log;

/**
 * Created by wuhongxu on 2016/11/28 0028.
 */
public class ControllerException extends BaseException {
    public ControllerException() {
        super();
    }

    public ControllerException(String msg) {
        super(msg);
    }

    public String getType() {
        return "控制器错误";
    }
}
