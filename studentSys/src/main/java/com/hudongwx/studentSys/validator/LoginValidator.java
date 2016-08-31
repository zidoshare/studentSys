package com.hudongwx.studentSys.validator;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

/**
 * Created by wuhongxu on 2016/8/30 0030.
 */
public class LoginValidator extends Validator {
    /**
     * Use validateXxx method to validate the parameters of this action.
     *
     * @param c
     */
    protected void validate(Controller c) {
        validateRequiredString("name","nameMsg","请输入用户名");
        validateRequiredString("password","passwordMsg","请输入密码");
    }

    /**
     * Handle the validate error.
     * Example:<br>
     * controller.keepPara();<br>
     * controller.render("register.html");
     *
     * @param c
     */
    protected void handleError(Controller c) {
        c.keepPara();
        c.render("");
    }
}
