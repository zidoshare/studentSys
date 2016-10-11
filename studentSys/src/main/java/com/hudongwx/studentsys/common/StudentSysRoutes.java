package com.hudongwx.studentsys.common;

import com.hudongwx.studentsys.controller.*;
import com.hudongwx.studentsys.util.Common;
import com.jfinal.config.Routes;
import com.jfinal.log.Log;

/**
 * Created by wuhongxu on 2016/9/19 0019.
 */
public class StudentSysRoutes extends Routes {
    private Log log = Log.getLog(getClass());
    /**
     * you must implement config method and use add method to config route
     */
    @Override
    public void config() {
        String root =Common.getMainProp().get("servePath");
        log.info("root = "+root);
        add("/user",UserController.class);
        add("/userManager",UserController.class);
        add("/option", OptionController.class);
        add("/attendanceManager", AttendanceController.class);
        add("/enrollManager",EnrollController.class);
        add("/repaymentManager",PaymentController.class);
        add("/certificateManager",CertificateController.class);
        add("/studentManager", StudentController.class,"/studentManager");
        add("/test", TestController.class);

        //add("/index", IndexController.class,"/common");
        add("/", IndexController.class,"/common");
    }
}
