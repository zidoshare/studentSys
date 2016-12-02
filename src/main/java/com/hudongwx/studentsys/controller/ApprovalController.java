package com.hudongwx.studentsys.controller;

import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.model.Mapping;
import com.hudongwx.studentsys.model.SubsidyApplication;
import com.hudongwx.studentsys.model.SubsidyClassInfo;
import com.hudongwx.studentsys.service.SubsidyApplicationService;
import com.hudongwx.studentsys.service.SubsidyClassInfoService;
import com.jfinal.plugin.activerecord.Page;

import java.util.List;

/**
 * Created by 2-9 on 2016/11/21.
 */
public class ApprovalController extends BaseController {
   public SubsidyApplicationService sas;
    public SubsidyClassInfoService subsidyClassInfoService;
    @Override
    public void index() {
        super.index();
        Integer id = getCurrentUser(this).getId();

        Integer p = getParaToInt("p", 1);

        Page<SubsidyApplication> saP = sas.getSubsidyApplicationByApproveId(id, p);


        setAttr("saP",saP);
    }

    @Override
    public Mapping init() {

        return mappingService.getMappingByUrl("/approvalManager");
    }

    public void showStudentDetails(){
        Integer classId = getParaToInt("classId");
        String className = getPara("className");
        List<SubsidyClassInfo> classInfoList = subsidyClassInfoService.getSubsidyClassInfoByIdAndStatus(classId, SubsidyApplication.APPROVE_WAITTING);
        setAttr("classInfoList",classInfoList);
        setAttr("className",className);
        render("/approvalManager/classDetails.ftl");
    }

}
