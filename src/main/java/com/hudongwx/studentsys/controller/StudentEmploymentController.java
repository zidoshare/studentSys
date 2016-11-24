package com.hudongwx.studentsys.controller;

import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.model.Mapping;
import com.hudongwx.studentsys.model.ObtainEmployment;
import com.hudongwx.studentsys.service.ObtainEmploymentService;
import com.hudongwx.studentsys.util.RenderKit;
import com.jfinal.aop.Before;
import com.jfinal.ext.interceptor.POST;
import com.jfinal.kit.JsonKit;

import java.util.List;

/**
 * Created by wu on 2016/11/22.
 */
public class StudentEmploymentController extends BaseController {

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
     * 添加追踪记录[需要前台的参数：oe(json数据类型的追踪信息)]
     */
    @Before(POST.class)
    public void addObtainEmployment() {
        String obtainEmployment = getPara("oe");
        //// TODO: 2016/11/21 待获取json数据
    }

    /**
     * 删除指定的记录[需要前台的参数：oeid(区域id)]
     */
    public void deleteObtainEmployment() {
        Integer oeid = getParaToInt("oeid");
        if (oeid == null) {
            RenderKit.renderError(this);
        } else {
            boolean b = obtainEmploymentService._deleteObtainEmploymentById(oeid);
            if (b) {
                RenderKit.renderSuccess(this);
            } else {
                RenderKit.renderError(this, "刪除失败！");
            }
        }
    }

    /**
     * 删除所有记录
     */
    public void deleteAllobtainEmploymentService() {
        obtainEmploymentService._deleteAllObtainEmployment();
    }

    /**
     * 修改记录状态
     */
    public boolean updateObtainEmployment() {
        String obtainEmployment = getPara("oe");
        ObtainEmployment oe = new ObtainEmployment();
        //// TODO: 2016/11/21 获取json修改数据
        return obtainEmploymentService._updateObtainEmployment(oe);
    }

    /**
     * 获取指定id的就业信息
     */
    public void getObtainEmploymentInfo() {
        Integer oeId = getParaToInt("oeId");
        if (oeId == null) {
            RenderKit.renderError(this);
        } else {
            List<ObtainEmployment> oeList = obtainEmploymentService.getObtainEmploymentById(oeId);
            if (oeList.size() != 0) {
                RenderKit.renderSuccess(this, JsonKit.toJson(oeList));
            } else {
                RenderKit.renderError(this, "你查询的信息不存在或已删除！");
            }
        }
    }

}
