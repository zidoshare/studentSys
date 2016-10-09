package com.hudongwx.surveys.common;

import com.hudongwx.surveys.controller.SurveysController;
import com.hudongwx.studentsys.controller.TestController;
import com.jfinal.config.Routes;

/**
 * Created by wuhongxu on 2016/9/9 0009.
 */
public class SurveysRoutes extends Routes {
    /**
     * you must implement config method and use add method to config route
     */
    @Override
    public void config() {
//        add("/", SurveysController.class,"surveys");
        add("/surveys",SurveysController.class);
    }
}
