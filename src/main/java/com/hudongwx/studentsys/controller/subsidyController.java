package com.hudongwx.studentsys.controller;

import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.model.Mapping;
import com.hudongwx.studentsys.model.SubsidyClassinfo;
import com.hudongwx.studentsys.model.SubsidyHistory;
import com.hudongwx.studentsys.service.SubsidyApplicationService;
import com.hudongwx.studentsys.service.SubsidyClassInfoService;
import com.hudongwx.studentsys.service.SubsidyHistoryService;
import com.jfinal.aop.Before;
import com.jfinal.ext.interceptor.POST;

import java.util.List;

/**
 * Created by wu on 2016/11/19.
 */
public class SubsidyController extends BaseController {

    public SubsidyApplicationService subsidyApplicationService;
    public SubsidyClassInfoService subsidyClassInfoService;
    public SubsidyHistoryService subsidyHistoryService;

    @Override
    public void index() {
        super.index();

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
     * 删除指定的申请表
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
        String subsidyClassInfo = getPara("sci");
        SubsidyClassinfo sc = new SubsidyClassinfo();
        return subsidyClassInfoService._saveSubsidyClassInfo(sc);
    }

    /**
     * 删除申请班级信息
     */
    public boolean deleteSubsidyClassInfo() {
        String subsidyClassInfoId = getPara("sciid");
        return subsidyClassInfoService._deleteSubsidyClassInfoById(subsidyClassInfoId);
    }

    /**
     * 修改申请班级信息
     */
    public boolean updateSubsidyClassInfo() {
        String subsidyClassInfo = getPara("nsci");
        SubsidyClassinfo sc=new SubsidyClassinfo();
        //// TODO: 2016/11/21 修改数据
        return subsidyClassInfoService._updateSubsidyClassInfo(sc);
    }

    /**
     * 获取正在申请的班级
     */
    public void getSubsidyClassInfo() {
        List<SubsidyClassinfo> sclist = subsidyClassInfoService._querySubsidyClassInfoById(getPara("classId"));
        setAttr("sc", sclist);
    }

    /*****************************申请历史记录******************************/

    /**
     * 添加历史申请信息
     */
    @Before(POST.class)
    public boolean addSubsidyHistory() {
        String subsidyHistory = getPara("sh");
        SubsidyHistory sh = new SubsidyHistory();
        //// TODO: 2016/11/22 获取json
        return subsidyHistoryService._saveSubsidyHistory(sh);
    }

    /**
     * 删除历史申请信息
     */
    public boolean deleteSubsidyHistory() {
        return subsidyHistoryService._deleteSubsidyHistoryById(getPara("sciid"));
    }

    /**
     * 获取历史申请信息
     */
    public void getSubsidyHistory() {
        List<SubsidyHistory> sclist = subsidyHistoryService._querySubsidyHistoryById(getPara("shid"));
        setAttr("sc", sclist);
    }

    /**
     * 获取所有历史申请信息
     */
    public void getAllSubsidyHistory() {
        List<SubsidyHistory> sclist = subsidyHistoryService._queryAllSubsidyClassInfo();
        setAttr("sc", sclist);
    }

}
