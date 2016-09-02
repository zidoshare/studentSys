package com.hudongwx.studentSys.controller;

import com.alibaba.fastjson.JSONObject;
import com.hudongwx.studentSys.common.BaseController;

/**
 * Created by wuhongxu on 2016/9/2 0002.
 */
public class IndexController extends BaseController{
    public void index(){
        fillHeaderAndFooter();
        fillSide();

        render("index.ftl");
    }
}
