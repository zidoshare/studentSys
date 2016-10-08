package com.hudongwx.surveys.controller;

import com.hudongwx.studentsys.common.BaseController;

/**
 * Created by wuhongxu on 2016/10/8 0008.
 */
public class TestController extends BaseController{
    /**
     * @return 返回mapping的title属性
     */
    @Override
    public String init() {
        return "我的考试";
    }
    public void history(){
        setMapping(mappingService.getMappingByTitle("考试历史"));
        super.index();

    }
    public void to(){
        setMapping(mappingService.getMappingByTitle("参加考试"));
        super.index();
    }

}
