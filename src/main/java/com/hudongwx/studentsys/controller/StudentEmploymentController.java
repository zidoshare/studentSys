package com.hudongwx.studentsys.controller;

import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.model.Mapping;
import com.hudongwx.studentsys.model.ObtainEmployment;
import com.hudongwx.studentsys.service.ObtainEmploymentService;
import com.jfinal.aop.Before;
import com.jfinal.ext.interceptor.POST;

import java.util.List;

/**
 * Created by wu on 2016/11/22.
 */
public class StudentEmploymentController extends BaseController{

    public ObtainEmploymentService obtainEmploymentService;
    @Override
    public void index() {
        super.index();
    }

    @Override
    public Mapping init() {
        return mappingService.getMappingByUrl("/StudentEmploymentManager");
    }

    /****************************就业追踪信息*******************************/
    /**
     * 添加追踪记录
     */
    @Before(POST.class)
    public void addObtainEmployment() {
        String obtainEmployment = getPara("oe");
        //// TODO: 2016/11/21 待获取json数据
    }
    /**
     * 删除指定的记录
     */
    public boolean deleteObtainEmployment() {
        return obtainEmploymentService._deleteObtainEmploymentById(getPara("oeid"));
    }

    /**
     * 删除所有记录
     */
    public boolean deleteAllobtainEmploymentService() {
        return obtainEmploymentService._deleteAllObtainEmployment();
    }

    /**
     * 修改记录状态
     */
    public boolean updateObtainEmployment() {
        String obtainEmployment = getPara("oe");
        ObtainEmployment oe=new ObtainEmployment();
        //// TODO: 2016/11/21 获取json修改数据
        return obtainEmploymentService._updateObtainEmployment(oe);
    }

    /**
     * 获取正在申请的班级
     */
    public void getObtainEmploymentInfo() {
        List<ObtainEmployment> oelist = obtainEmploymentService._queryObtainEmploymentById(getPara("oeId"));
        setAttr("oeList", oelist);
    }

}
