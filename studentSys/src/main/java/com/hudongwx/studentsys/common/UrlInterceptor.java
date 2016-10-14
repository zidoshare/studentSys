package com.hudongwx.studentsys.common;

import com.hudongwx.studentsys.util.Common;
import com.hudongwx.studentsys.util.InsertKit;
import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.jfinal.render.FreeMarkerRender;

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
        controller.setAttr(Common.LABEL_ACTION_KEY,actionKey);
        controller.setAttr(Common.LABEL_CONTROLLER_KEY,controllerKey);
        log.info(actionKey);
        if(null == BaseController.getCurrentUser(controller.getRequest())){
            controller.setAttr("code",403);
            controller.setAttr("msg","你尚未登录");
            controller.forwardAction("/userManager/showLogin");
            return ;
        }
        inv.invoke();
    }
}
