package com.hudongwx.testing.common;

import com.hudongwx.testing.controller.TestingController;
import com.hudongwx.testing.controller.UpdateTestingController;
import com.jfinal.config.Routes;

/**
 * Created by 11 on 2016/9/9.
 */
public class TestingRoutes extends Routes{
    @Override
    public void config() {
        add("/testing", UpdateTestingController.class);
        add("/tests", TestingController.class);
    }
}
