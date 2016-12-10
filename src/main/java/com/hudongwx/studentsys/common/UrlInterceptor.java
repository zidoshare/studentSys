package com.hudongwx.studentsys.common;

import com.hudongwx.studentsys.exceptions.BaseException;
import com.hudongwx.studentsys.util.Common;
import com.hudongwx.studentsys.util.RenderKit;
import com.hudongwx.studentsys.util.StrPlusKit;
import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import com.jfinal.core.JFinal;
import com.jfinal.log.Log;

import java.sql.SQLException;

/**
 * Created by wuhongxu on 2016/8/31 0031.
 */

public class UrlInterceptor implements Interceptor {
    private Log log = Log.getLog(UrlInterceptor.class);

    @Override
    public void intercept(Invocation inv) {
        String actionKey = inv.getActionKey();
        String controllerKey = inv.getControllerKey();
        Controller controller = inv.getController();
        controller.setAttr(Common.LABEL_ACTION_KEY, actionKey);
        controller.setAttr(Common.LABEL_CONTROLLER_KEY, controllerKey);
        if (null == BaseController.getCurrentUser(controller)) {
            RenderKit.render403Error(controller, "/userManager/showLogin", "未获取到你的登录信息，请尝试刷新以重新登录!");
            controller.setAttr("code", 403);
            controller.setAttr("msg", "未获取到你的登录信息，已自动跳转至登录页面");
            controller.forwardAction("/userManager/showLogin");
            return;
        }
        try {
            inv.invoke();
        } catch (RuntimeException e) {
            if (JFinal.me().getConstants().getDevMode())
                e.printStackTrace();
            String msg = formatException(e);
            RenderKit.render500Error(controller, msg);
        }
    }

    private static String formatException(Exception e) {
        String message = null;
        Throwable ourCause = e;
        while ((ourCause = e.getCause()) != null) {
            e = (Exception) ourCause;
        }
        String eClassName = e.getClass().getName();
        //一些常见异常提示
        if ("java.lang.NumberFormatException".equals(eClassName)) {
            message = "请输入正确的数字";
        } else if (e instanceof SQLException) {
            String type = "";
            if (JFinal.me().getConstants().getDevMode()) {
                type = "数据错误：";
            }
            message = e.getMessage();
            if (StrPlusKit.isBlank(message))
                message = e.toString();
            message = type + message;
        } else if (e instanceof BaseException) {
            String type = "";
            if (JFinal.me().getConstants().getDevMode()) {
                type = ((BaseException) e).getType() + "：";
            }
            message = e.getMessage();
            if (StrPlusKit.isBlank(message))
                message = e.toString();
            message = type + message;
        } else if (e instanceof RuntimeException) {
            message = e.getMessage();
            if (StrPlusKit.isBlank(message))
                message = e.toString();
            String type = "";
            if (JFinal.me().getConstants().getDevMode()) {
                type = "代码错误：";
            }
            message = type + message;
        }

        //获取默认异常提示
        if (StrPlusKit.isBlank(message)) {
            message = "未知错误，请联系管理员";
        }
        //替换特殊字符
        message = message.replaceAll("\"", "'");
        return message;
    }

}
