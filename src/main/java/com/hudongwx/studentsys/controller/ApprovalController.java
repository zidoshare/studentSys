package com.hudongwx.studentsys.controller;

import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.model.Mapping;
import com.hudongwx.studentsys.model.SubsidyApplication;
import com.hudongwx.studentsys.service.SubsidyApplicationService;
import com.jfinal.plugin.activerecord.Page;

/**
 * Created by 2-9 on 2016/11/21.
 */
public class ApprovalController extends BaseController {
    SubsidyApplicationService sas;
    @Override
    public void index() {
        super.index();
        Integer id = getCurrentUser(this).getId();
        Integer p = getParaToInt("p", 1);
        Page<SubsidyApplication> saP = sas.getSubsidyApplicationByApproveId(id, p);
        setAttr("asP",saP);
    }

    @Override
    public Mapping init() {

        return mappingService.getMappingByUrl("/approvalManager");
    }


}
