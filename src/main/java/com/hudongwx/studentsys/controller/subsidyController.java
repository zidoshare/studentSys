package com.hudongwx.studentsys.controller;

import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.model.Class;
import com.hudongwx.studentsys.model.Mapping;
import com.hudongwx.studentsys.model.SubsidyClassinfo;
import com.hudongwx.studentsys.util.Common;
import com.hudongwx.studentsys.util.ModelKit;
import com.hudongwx.studentsys.util.PageinateKit;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

import java.util.ArrayList;

/**
 * Created by 2-9 on 2016/11/19.
 */
public class SubsidyController extends BaseController {
    @Override
    public void index() {
        super.index();
        Page<Class> classP = Class.dao.paginate(1, Common.MAX_PAGE_SIZE,Common.COMMON_SELECT,Class.SQL_FROM);

        ArrayList<SubsidyClassinfo> subList = new ArrayList<>();
        for(int i = 0; i < 20; i++){
            Model model = ModelKit.simulateModelByRandom(SubsidyClassinfo.class, 5);
            subList.add((SubsidyClassinfo) model);
        }
        Page<SubsidyClassinfo> subsidyClassinfoPage = PageinateKit.ClonePage(classP, subList);
        setAttr("page",subsidyClassinfoPage);
    }

    @Override
    public Mapping init() {

        return mappingService.getMappingByUrl("/subsidyManager");
    }
}
