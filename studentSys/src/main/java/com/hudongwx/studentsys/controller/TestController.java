package com.hudongwx.studentsys.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.surveys.model.Questions;
import com.jfinal.aop.Before;
import com.jfinal.ext.interceptor.POST;

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
    public void questions(){
        setMapping(mappingService.getMappingByTitle("题库"));
        super.index();
    }
    @Before(POST.class)
    public void addTestQuestion(){

    }
    @Before(POST.class)
    public void deleteTestQuestion(){

    }
    @Before(POST.class)
    public void updateTestQuestino(){

    }
}
