package com.hudongwx.studentsys.controller;

import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.common.Build;
import com.hudongwx.studentsys.common.MyTx;
import com.hudongwx.studentsys.model.Mapping;
import com.hudongwx.studentsys.util.ArrayTree;
import com.hudongwx.studentsys.util.Common;
import com.hudongwx.studentsys.util.RenderKit;
import com.jfinal.aop.Before;
import com.jfinal.core.JFinal;

import java.io.File;

/**
 * Created by wuhongxu on 2016/9/2 0002.
 */
public class IndexController extends BaseController {


    public void index() {
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

    @Before(MyTx.class)
    public void admin() {
        String methodName = getPara("data");
        if (methodName.equals("initWebMap")) {
            try {
                String fileSeparator = System.getProperty("file.separator");
                String path = Common.getMainProp().get("permissonPath");
                String s = path.replace("\\", fileSeparator);

                File file = new File(path);
                if (!file.exists())
                    throw new Exception(path + "文件不存在");
                Build.clearMapping();
                Build.readXML(new ArrayTree<>(), s);
            } catch (Exception e) {
                if(JFinal.me().getConstants().getDevMode()){
                    e.printStackTrace();
                }
                RenderKit.renderError(this, e.toString());
                return;
            }
            RenderKit.renderSuccess(this, "初始化地图成功");
        } else if (methodName.equals("initWebRole")) {
            Build.clearRole();
            Build.initRole();
            Build.initUser();
            RenderKit.renderSuccess(this, "初始化用户&角色成功");
        }
    }
}
