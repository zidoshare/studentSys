package com.hudongwx.studentsys.common;

import com.hudongwx.studentsys.exceptions.ServiceException;
import com.hudongwx.studentsys.util.Common;
import com.hudongwx.studentsys.util.InsertKit;
import com.hudongwx.studentsys.util.RenderKit;
import com.hudongwx.studentsys.util.StrPlusKit;
import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import com.jfinal.core.JFinal;
import com.jfinal.log.Log;
import com.jfinal.render.FreeMarkerRender;
import com.jfinal.render.Render;

import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
            String header = controller.getRequest().getHeader("x-requested-with");
            if ("XMLHttpRequest".equals(header)) {
                String method = controller.getRequest().getMethod();
                if ("GET".equals(method)) {
                    controller.renderError(403);
                    return;
                }
                RenderKit.renderError(controller, "未获取到你的登录信息，请尝试刷新以重新登录!");
                return;
            }
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
            String header = controller.getRequest().getHeader("x-requested-with");
            if ("XMLHttpRequest".equals(header)) {
                if ("get".equals(controller.getRequest().getMethod())) {
                    controller.renderError(403);
                }
                RenderKit.renderError(controller, msg);
                return;
            }
            controller.setAttr("code", 403);
            controller.setAttr("msg", msg);
            controller.forwardAction("/userManager/showLogin");
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
        } else if (e instanceof ServiceException || e instanceof RuntimeException) {
            message = e.getMessage();
            if (StrPlusKit.isBlank(message)) message = e.toString();
        }

        //获取默认异常提示
        if (StrPlusKit.isBlank(message)) {
            message = "系统繁忙,请稍后再试";
        }
        //替换特殊字符
        message = message.replaceAll("\"", "'");
        return message;
    }

}
