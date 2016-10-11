package com.hudongwx.studentsys.controller;

import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.model.Mapping;
import com.hudongwx.studentsys.service.MappingService;
import com.hudongwx.studentsys.service.RoleService;
import com.hudongwx.studentsys.util.Common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wuhongxu on 2016/9/2 0002.
 */
public class IndexController extends BaseController{

    @Override
    public String init() {
        return "首页";
    }

    public void index(){
        super.index();
        setMapping(mappingService.getMappingByTitle("首页"));
        String outLinkNames = Common.getMainProp().get("outLinkNames");
        String[] linkNames = outLinkNames.split(",");
        String outLinkUrls = Common.getMainProp().get("outLinkUrls");
        String[] linkUrls = outLinkUrls.split(",");
        String outLinkIcons = Common.getMainProp().get("outLinkIcons");
        String[] linkIcons = outLinkIcons.split(",");
        List<Map<String,String>> list= new ArrayList<>();
        for(int i = 0; i < linkNames.length; i++){
            Map<String,String> map = new HashMap<>();
            map.put("name",linkNames[i]);
            map.put("url",linkUrls[i]);
            map.put("icon",linkIcons[i]);
            list.add(map);
        }
        setAttr("outLinks",list);
    }
}
