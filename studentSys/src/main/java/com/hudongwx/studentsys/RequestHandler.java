package com.hudongwx.studentsys;

import com.jfinal.handler.Handler;
import com.jfinal.kit.HandlerKit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by wuhongxu on 2016/8/31 0031.
 */
public class RequestHandler extends Handler {
    /**
     * Handle target
     *
     * @param target    url target of this web http request
     * @param request   HttpServletRequest of this http request
     * @param response  HttpServletRequest of this http request
     * @param isHandled JFinalFilter will invoke doFilter() method if isHandled[0] == false,
     */
    public void handle(String target, HttpServletRequest request, HttpServletResponse response, boolean[] isHandled) {
        if(target.endsWith(".html")||target.endsWith(".ftl")||target.endsWith(".jsp")){
            HandlerKit.renderError404(request,response,isHandled);
        }
        next.handle(target,request,response,isHandled);
    }
}
