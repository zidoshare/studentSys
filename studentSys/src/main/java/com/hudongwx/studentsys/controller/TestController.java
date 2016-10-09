package com.hudongwx.studentsys.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.model.TestQuestion;
import com.hudongwx.studentsys.model.TestTag;
import com.hudongwx.studentsys.model.TestType;
import com.hudongwx.studentsys.service.*;
import com.hudongwx.studentsys.util.RenderKit;
import com.hudongwx.surveys.model.Questions;
import com.jfinal.aop.Before;
import com.jfinal.ext.interceptor.POST;

import java.util.List;

/**
 * Created by wuhongxu on 2016/10/8 0008.
 */
public class TestController extends BaseController{
    public TestTypeService testTypeService;
    public TestTagService testTagService;
    public TestQuestionService testQuestionService;
    public TestTagQuestionService testTagQuestionService;
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
        List<TestType> testTypes = testTypeService.getAllTestTypes();
        setAttr("types",testTypes);
        List<TestTag> tags = testTagService.getAllTestTag();
        setAttr("tags",tags);
    }
    @Before(POST.class)
    public void addTestQuestion(){
        TestQuestion model = getModel(TestQuestion.class);
        boolean b ;
        if(null==model.getId())
            b = testQuestionService._saveTestQuestion(model);
        else
            b=testQuestionService._updateTestQuestion(model);
        String tagsPara = getPara("tags");
        String[] tags = tagsPara.split(",");
        List<TestTag> allTestTag = testTagService.getAllTestTag();
        for (String tag : tags) {
            TestTag now = null;
            for (TestTag t : allTestTag) {
                if (t.getTagName().equals(tag)) {
                    now = t;
                }
            }
            if (now == null) {
                now = new TestTag();
                now.setTagName(tag);
                now.setQuestionCnt(0);
                testTagService._saveTestTag(now);
            }
            now.setQuestionCnt(now.getQuestionCnt() + 1);
            testTagService._updateTestTag(now);
            testTagQuestionService._saveTagQuestion(now,model);
        }
        if(b){
            RenderKit.renderSuccess(this,"保存成功");
            return ;
        }
        RenderKit.renderError(this,"保存失败");
    }
    @Before(POST.class)
    public void deleteTestQuestion(){

    }
}
