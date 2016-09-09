package com.hudongwx.surveys.controller;

import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.util.Common;
import com.hudongwx.studentsys.util.IpKit;
import com.hudongwx.studentsys.util.StrPlusKit;
import com.hudongwx.surveys.model.*;
import com.hudongwx.studentsys.util.RenderKit;
import com.hudongwx.surveys.service.TestService;
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
        fillHeaderAndFooter();
        render("index.ftl");
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
    //添加试卷页面
    public void inputQuestionnaire(){
        String p = getPara("p");
        if(p == null)
            p = ""+Common.START_PAGE;
        if(StrPlusKit.isNumeric(p))
            p = ""+Common.START_PAGE;
        int page = Integer.valueOf(p);
        Page<Questionnaire> questionnaires = testService.getQuestionnaires(page);
        setAttr("questionnaires",questionnaires);
    }
    //提交名字
    @Before(POST.class)
    public void registerName(){
        String name = getPara("name");
        if(StrPlusKit.isEmpty(name)){
            RenderKit.renderError(this,"名字不能为空");
            return ;
        }

        RenderKit.renderSuccess(this,"/surveys/");
        boolean b = testService.registerName(name);
        String ip = IpKit.getIp(getRequest());
        if(b)
            log.info(name+"开始了调查,ip为："+ip);
        else
            log.info(name+"重新进入调查，ip为："+ip);
        log.info("总人数"+testService.getRegisterSize());
    }
    //调查问卷视图
    public void surveys(){
        String name = getPara(0);
        if(StrPlusKit.isEmpty(name)){
            renderError(403);
            return ;
        }

        if(testService.isContainUser(name)){
            renderError(403);
            return ;
        }
        List<Questions> allQuestions = testService.getAllQuestions();
        setAttr("questions",allQuestions);
        render("survey.ftl");
    }

    @Before(POST.class)
    public void deleteQuestionnaire(){
        String qId = getPara("qId");
        if(Questionnaire.dao.deleteById(qId))
            RenderKit.renderSuccess(this,"删除成功");
        else
            RenderKit.renderError(this,"删除失败");
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
