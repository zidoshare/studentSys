package com.hudongwx.testing.controller;

import com.hudongwx.studentSys.common.BaseController;
import com.hudongwx.testing.service.TestService;
import com.hudongwx.studentSys.util.RenderKit;
import com.hudongwx.testing.model.*;
import com.jfinal.aop.Before;
import com.jfinal.ext.interceptor.POST;
import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.Page;

import java.util.List;

/**
 * Created by wuhongxu on 2016/9/6 0006.
 */
public class TestController extends BaseController {
    TestService testService;
    private Log log = Log.getLog(getClass());
    public void index(){
        forwardAction("/test/inputBigType");
    }
    //添加问题页面
    public void inputQuestion(){
        List<QuestionBigType> bigTypes = testService.getBigTypes();
        setAttr("bigTypes",bigTypes);
        Page<Questions> allQuestions = testService.getAllQuestions(1);
        setAttr("questions",allQuestions.getList());
        setAttr("maxPage",allQuestions.getTotalRow());
        render("inputQuestion.ftl");
    }
    //添加类型页面
    public void inputBigType(){
        List<QuestionBigType> bigTypes = testService.getBigTypes();
        setAttr("bigTypes",bigTypes);
        render("inputBigType.ftl");
    }
    @Before(POST.class)
    public void postBigType(){
        QuestionBigType qbt = getModel(QuestionBigType.class);
        log.info(qbt.getName()+"   "+qbt.getSortFlag());
        if(testService.saveBigType(qbt)){
            RenderKit.renderSuccess(this,"添加成功");
        }else
            RenderKit.renderError(this,"添加失败");
    }

    @Before(POST.class)
    public void postQuestion(){
        //题目
        if(getModel(Questions.class).save()){
            RenderKit.renderSuccess(this,"添加成功");
        }else
            RenderKit.renderError(this,"添加失败");
    }
    @Before(POST.class)
    public void postQuestionnaire(){
        if(getModel(Questionnaire.class).save()){
            RenderKit.renderSuccess(this,"添加成功");
        }else
            RenderKit.renderError(this,"添加失败");
    }
    @Before(POST.class)
    public void postRelation(){
        if(getModel(QuestionsQuestionnaire.class).save()){
            RenderKit.renderSuccess(this,"添加成功");
        }else
            RenderKit.renderError(this,"添加失败");
    }
    @Before(POST.class)
    public void postQresult(){
        if(getModel(QuestionnaireResult.class).save()){
            RenderKit.renderSuccess(this,"添加成功");
        }else
            RenderKit.renderError(this,"添加失败");
    }
}
