package com.hudongwx.studentsys.exceptions;

/**
 * Created by wuhongxu on 2016/11/28 0028.
 */
public class CodeException extends BaseException{
    public CodeException(){
        super();
    }
    public CodeException(String msg) {
        super(msg);
    }
    public String getType(){
        return "代码错误";
    }
}
