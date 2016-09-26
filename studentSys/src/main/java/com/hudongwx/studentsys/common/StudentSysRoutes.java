package com.hudongwx.studentsys.common;

import com.hudongwx.studentsys.controller.*;
import com.jfinal.config.Routes;

/**
 * Created by wuhongxu on 2016/9/19 0019.
 */
public class StudentSysRoutes extends Routes {
    /**
     * you must implement config method and use add method to config route
     */
    @Override
    public void config() {
        add("/user",UserController.class);
        add("/userManager",UserController.class);
        add("/option", OptionController.class);
        add("/attendanceManager", AttendanceController.class);
        add("/enrollManager",EnrollController.class);
        add("/repaymentManager",PaymentController.class);
        add("/certificateManager",CertificateController.class);
        add("/studentManager", StudentController.class,"/studentManager");

        add("/index", IndexController.class,"/common");
        add("/", IndexController.class,"/common");
    }
}
