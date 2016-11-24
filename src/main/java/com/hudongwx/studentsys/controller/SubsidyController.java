package com.hudongwx.studentsys.controller;

import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.model.Class;
import com.hudongwx.studentsys.model.Mapping;
import com.hudongwx.studentsys.model.SubsidyClassinfo;
import com.hudongwx.studentsys.service.SubsidyApplicationService;
import com.hudongwx.studentsys.service.SubsidyClassInfoService;
import com.hudongwx.studentsys.util.Common;
import com.hudongwx.studentsys.util.ModelKit;
import com.hudongwx.studentsys.util.PageinateKit;
import com.hudongwx.studentsys.model.*;
import com.hudongwx.studentsys.service.*;
import com.hudongwx.studentsys.util.RenderKit;
import com.jfinal.aop.Before;
import com.jfinal.ext.interceptor.POST;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

import java.util.ArrayList;
import java.util.List;

/**
 * 补助管理
 * Created by wu on 2016/11/19.
 */
public class SubsidyController extends BaseController {

    public SubsidyApplicationService subsidyApplicationService;
    public SubsidyClassInfoService subsidyClassInfoService;
    public ClassService classService;
    public UserRegionService userRegionService;

    @Override
    public void index() {
        super.index();
        Page<Class> classP = Class.dao.paginate(1, Common.MAX_PAGE_SIZE, Common.COMMON_SELECT, Class.SQL_FROM);

        List<SubsidyClassinfo> subList = new ArrayList<>();
        for (int i = 0; i < 20; i++) {
            Model model = ModelKit.simulateModelByRandom(SubsidyClassinfo.class, 5);
            subList.add((SubsidyClassinfo) model);
        }
        Page<SubsidyClassinfo> subsidyClassInfoPage = PageinateKit.ClonePage(classP, subList);

        setAttr("page", subsidyClassInfoPage);

    }


    @Override
    public Mapping init() {
        return mappingService.getMappingByUrl("/subsidyManager");
    }

    /****************************申请表信息*******************************/
    /**
     * 添加填好的申请表
     */
    @Before(POST.class)
    public void addSubsidyApplication() {
        String subsidyApplication = getPara("sa");
        //// TODO: 2016/11/21 待获取json数据
    }

    /**
     * 删除指定的申请表
     */
    public boolean deleteSubsidyApplication() {
        return subsidyApplicationService._deleteSubsidyApplicationById(getPara("said"));
    }

    /**
     * 删除所有申请表
     */
    public boolean deleteAllSubsidyApplication() {
        return subsidyApplicationService._deleteAllSubsidyApplication();
    }


    /***************************申请班级信息******************************/

    /**
     * 添加申请班级信息
     */
    @Before(POST.class)
    public boolean addSubsidyClassInfo() {
        String subsidyClassInfo = getPara("user");
        SubsidyClassinfo sc = new SubsidyClassinfo();
        return subsidyClassInfoService._saveSubsidyClassInfo(sc);
    }

    /**
     * 删除申请班级信息
     */
    public boolean deleteSubsidyClassInfo() {
        return subsidyClassInfoService._deleteSubsidyClassInfoById(getPara("sciId"));
    }

    /**
     * 修改申请班级信息
     */
    public boolean updateSubsidyClassInfo() {
        String subsidyClassInfo = getPara("nsci");
        SubsidyClassinfo sc = new SubsidyClassinfo();
        //// TODO: 2016/11/21 修改数据
        return subsidyClassInfoService._updateSubsidyClassInfo(sc);
    }

    /**
     * 获取正在申请的班级详情(classid)
     */
    public void getSubsidyClassInfo() {
        List<SubsidyClassinfo> scList = subsidyClassInfoService.getSubsidyClassInfoById(getPara("classId"));
        if (scList.size() != 0) {
            String s = JsonKit.toJson(scList);
            RenderKit.renderSuccess(this, s);
        } else {
            RenderKit.renderError(this, "你所查找的数据不存在或已删除！");
        }
    }


    /**
     * 补助管理添加班级时选择指定区域班级
     */
    public void showArea() {
        List<Class> area = classService.getClassInfoByArea(getPara("area"));
        if (area.size() != 0) {
            String s = JsonKit.toJson(area);
            RenderKit.renderSuccess(this, s);
        } else {
            RenderKit.renderError(this, "你所查区域无相关信息！");
        }
    }

    /**************************新功能区******************************/

    /**
     * 显示对应用户下的辖区
     */
    public void showUserRegionInfo() {
        List<UserRegion> userareas = userRegionService.getUserRegionInfoByUserId(getCurrentUser(this).getId().toString());
        if (userareas.size() != 0) {
            RenderKit.renderSuccess(this, JsonKit.toJson(userareas));
        } else {
            RenderKit.renderError(this, "无相关信息！");
        }
    }

    /**
     * 补助管理添加班级时选择指定区域班级
     */
    public void showClassInfoWithArea() {
        List<Class> area = classService.getClassInfoByArea(getPara("area"));
        if (area.size() != 0) {
            String s = JsonKit.toJson(area);
            RenderKit.renderSuccess(this, s);
        } else {
            RenderKit.renderError(this, "你所查区域无相关信息！");
        }
    }
}
