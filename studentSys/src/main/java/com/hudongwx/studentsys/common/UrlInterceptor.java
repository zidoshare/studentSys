package com.hudongwx.studentsys.common;

import com.hudongwx.studentsys.util.Common;
import com.hudongwx.studentsys.util.InsertKit;
import com.hudongwx.studentsys.util.RenderKit;
import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.jfinal.render.FreeMarkerRender;
import com.jfinal.render.Render;

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
        Controller controller = (BaseController) inv.getController();
        controller.setAttr(Common.LABEL_ACTION_KEY, actionKey);
        controller.setAttr(Common.LABEL_CONTROLLER_KEY, controllerKey);
        /*if (null == BaseController.getCurrentUser(controller)) {
            controller.setAttr("code", 403);
            controller.setAttr("msg", "你尚未登录");
            controller.forwardAction("/userManager/showLogin");
            return;
        }*/
        try {
            inv.invoke();
        } catch (Exception e) {
            String header = controller.getRequest().getHeader("x-requested-with");
            if ("XMLHttpRequest".equals(header)) {
                if (null == BaseController.getCurrentUser(controller)) {
                    RenderKit.renderError(controller, "未获取到你的登录信息，请尝试刷新登陆重试!");
                    return;
                }
                RenderKit.renderError(controller, e.getCause().getMessage());
                return;
            }
            header = controller.getRequest().getHeader("X-PJAX");
            if (null != header) {
                controller.setAttr("code", 403);
                controller.setAttr("msg", e.getCause().getMessage());
                controller.forwardAction("/userManager/showLogin");
            }
        }
    }
}
