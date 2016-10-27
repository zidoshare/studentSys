package com.hudongwx.studentsys.controller;

import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.common.Build;
import com.hudongwx.studentsys.model.Mapping;
import com.hudongwx.studentsys.service.MappingService;
import com.hudongwx.studentsys.service.RoleService;
import com.hudongwx.studentsys.util.ArrayTree;
import com.hudongwx.studentsys.util.Common;
import com.hudongwx.studentsys.util.RenderKit;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wuhongxu on 2016/9/2 0002.
 */
public class IndexController extends BaseController{



    public void index(){
        super.index();
        setMapping(mappingService.getMappingByTitle("首页"));
        fillOutLink();
    }

    /**
     * @return 返回一级菜单的mapping
     */
    @Override
    public Mapping init() {
        return mappingService.getMappingByUrl("/");
    }

    public void admin(){
        String methodName = getPara("data");
        if(methodName.equals("initWebMap")){
            Build.clearMapping();
            try {
                Build.readXML(new ArrayTree<>(),Common.getMainProp().get("permissonPath"));
            } catch (Exception e) {
                RenderKit.renderError(this,e.toString());
                return ;
            }
            RenderKit.renderSuccess(this,"初始化地图成功");
        }else if(methodName.equals("initWebRole")){
            Build.clearRole();
            Build.initRole();
            Build.initUser();
            RenderKit.renderSuccess(this,"初始化用户&角色成功");
        }
    }
}
