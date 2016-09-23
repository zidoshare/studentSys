package com.hudongwx.studentsys.controller;

import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.model.Mapping;
import com.hudongwx.studentsys.service.MappingService;
import com.hudongwx.studentsys.service.RoleService;

/**
 * Created by wuhongxu on 2016/9/21 0021.
 */
public class CertificateController extends BaseController {

    /**
     * @return 返回mapping的title属性
     */
    @Override
    public String init() {
        return "证书管理";
    }
}
