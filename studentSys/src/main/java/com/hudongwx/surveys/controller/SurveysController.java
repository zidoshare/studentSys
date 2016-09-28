package com.hudongwx.surveys.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.util.Common;
import com.hudongwx.studentsys.util.IpKit;
import com.hudongwx.studentsys.util.RenderKit;
import com.hudongwx.studentsys.util.StrPlusKit;
import com.hudongwx.surveys.model.*;
import com.hudongwx.surveys.service.Node;
import com.hudongwx.surveys.service.SurveysService;
import com.jfinal.aop.Before;
import com.jfinal.ext.interceptor.POST;
import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.Page;

import java.util.*;

/**
 * Created by wuhongxu on 2016/9/6 0006.
 */
public class SurveysController extends BaseController {
    public SurveysService surveysService;
    private Log log = Log.getLog(getClass());

    public void index() {
        fillHeaderAndFooter();
        render("index.ftl");
    }
    public void surveyList(){
        super.index();
    }

    //添加问题页面
    public void inputQuestion() {
        List<QuestionBigType> bigTypes = surveysService.getBigTypes();
        setAttr("bigTypes", bigTypes);
        Page<Questions> allQuestions = surveysService.getAllQuestions(1);
        setAttr("questions", allQuestions.getList());
        setAttr("maxPage", allQuestions.getTotalRow());
        render("inputQuestion.ftl");
    }

    //添加类型页面
    public void inputBigType() {
        List<QuestionBigType> bigTypes = surveysService.getBigTypes();
        setAttr("bigTypes", bigTypes);
        render("inputBigType.ftl");
    }

    //添加试卷页面
    public void inputQuestionnaire() {
        String p = getPara("p");
        if (p == null)
            p = "" + Common.START_PAGE;
        if (StrPlusKit.isNumeric(p))
            p = "" + Common.START_PAGE;
        int page = Integer.valueOf(p);
        Page<Questionnaire> questionnaires = surveysService.getQuestionnaires(page);
        setAttr("questionnaires", questionnaires);
        List<Questions> allQuestions = surveysService.getAllQuestions();
        setAttr("questions", allQuestions);
        fillHeaderAndFooter();
        render("inputQuestionnaire.ftl");
    }

    //提交名字
    @Before(POST.class)
    public void registerName() {
        String name = getPara("name");
        if (StrPlusKit.isEmpty(name)) {
            RenderKit.renderError(this, "名字不能为空");
            return;
        }
        String ip = IpKit.getIp(getRequest());
        if (!IpKit.isIPv4(ip)) {
            RenderKit.renderError(this, "你的ip有问题");
        }
        String className = getPara("className");
        if (StrPlusKit.isEmpty(className)) {
            RenderKit.renderError(this, "班级不能为空");
            return;
        }
        Node nd = new Node(name, ip, className);
        if (surveysService.registerName(nd))
            RenderKit.renderSuccess(this, "/questionnaire/" + nd.code);
        else {
            RenderKit.renderSuccess(this, "/questionnaire/" + nd.code);
            //未完成检测

            //未完成处理
        }

    }
    public void checkResult(){
        fillHeaderAndFooter();
        String p = getPara("p");
        if (p == null)
            p = "" + Common.START_PAGE;
        if (StrPlusKit.isNumeric(p))
            p = "" + Common.START_PAGE;
        int page = Integer.valueOf(p);
        Page<Questionnaire> questionnaires = surveysService.getQuestionnaires(page);
        setAttr("questionnaires", questionnaires);
        fillHeaderAndFooter();
        render("checkResult.ftl");
    }
    public void getTable(){
        fillHeaderAndFooter();
        String qId = getPara(0);
        int sum = 0;
        List<QuestionnaireResult> questionnaireResultByQuestionnaireId = surveysService.getQuestionnaireResultByQuestionnaireId(qId);
        for(QuestionnaireResult q:questionnaireResultByQuestionnaireId){
            q.setUser(surveysService.getUserByIp(q.getIdUser()));
            JSONArray array = JSON.parseArray(q.getQuestionsReply());
            JSONObject json = array.getJSONObject(array.size()-1);
            Integer score = json.getInteger("score");
            if(score == null)
                score = 0;
            sum+=score;
            q.setCount(score);
        }
        Questionnaire questionnaire = Questionnaire.dao.findById(qId);
        int avg = 0;
        if(questionnaireResultByQuestionnaireId.size()>0) {
            avg = sum / questionnaireResultByQuestionnaireId.size();
        }
        setAttr("avg",avg);
        setAttr("questionnaire",questionnaire);
        setAttr("results",questionnaireResultByQuestionnaireId);
        render("countResult.ftl");
    }
    public void result(){
        fillHeaderAndFooter();
        String resultId = getPara(0);
        if(!StrPlusKit.isNumeric(resultId)){
            renderError(404);
            return;
        }
        QuestionnaireResult q = QuestionnaireResult.dao.findById(resultId);
        if(q == null){
            renderError(404);
            return;
        }
        Questionnaire questionnaire = Questionnaire.dao.findById(q.getIdQuestionnaire());
        if(questionnaire == null){
            renderError(404);
            return;
        }
        surveysService.generatorQuestionnaire(questionnaire);
        q.setUser(surveysService.getUserByIp(q.getIdUser()));
        JSONArray array = JSON.parseArray(q.getQuestionsReply());
        JSONObject json = array.getJSONObject(array.size()-1);
        Integer score = json.getInteger("score");
        if(score == null)
            score = 0;
        q.setCount(score);
        setAttr("result",q);
        setAttr("questionnaire",questionnaire);
        render("result.ftl");
    }
    public void chooseQuestionnaire() {
        fillHeaderAndFooter();
        String code = getPara(0);
        if (StrPlusKit.isEmpty(code)) {
            renderError(403);
            return;
        }
        Node user = surveysService.getUserByCode(code);
        if (null == user) {
            renderError(403);
            return;
        }
        List<Questionnaire> questionnaires = surveysService.getQuestionnairesByClassName(user.className);
        setAttr("questionnaires", questionnaires);
        setAttr("code", code);
        render("chooseQuestionnaire.ftl");
    }

    //调查问卷视图
    public void questionnaire() {
        String code = getPara(0);
        if (StrPlusKit.isEmpty(code)) {
            renderError(403);
            return;
        }

        Node user = surveysService.getUserByCode(code);
        if (null == user) {
            renderError(403);
            return;
        }
        log.info(String.format("班级为%s的学生\"%s\"开始了调查,ip为：%s", user.className, user.name, user.ip));
        log.info("总人数:" + surveysService.getRegisterSize());
        List<Questionnaire> questionnaires = surveysService.getQuestionnaireByClassNameAndDate(user.className);
        if (questionnaires != null && questionnaires.size() > 1)
            for (Questionnaire questionnaire : questionnaires) {
                surveysService.generatorQuestionnaire(questionnaire);
            }
        /*for (int i = 1; getPara(i) != null; i++) {
            Integer questionnaireId = getParaToInt(i);
            Questionnaire questionnaire = surveysService.getQuestionnaireById(questionnaireId);

            surveysService.generatorQuestionnaire(questionnaire);

            questionnaires.add(questionnaire);

        }*/
        fillHeaderAndFooter();
        setAttr("questionnaires", questionnaires);
        setAttr("code", code);
        setAttr("user", user);
        render("survey.ftl");
    }

    public void getNowTime() {
        RenderKit.renderSuccess(this, System.currentTimeMillis() + "");
    }

    @Before(POST.class)
    public void deleteQuestionnaire() {
        String qId = getPara("qId");
        if (Questionnaire.dao.deleteById(qId))
            RenderKit.renderSuccess(this, "删除成功");
        else
            RenderKit.renderError(this, "删除失败");
    }

    @Before(POST.class)
    public void postBigType() {
        QuestionBigType qbt = getModel(QuestionBigType.class);
        log.info(qbt.getName() + "   " + qbt.getSortFlag());
        if (surveysService.saveBigType(qbt)) {
            RenderKit.renderSuccess(this, "添加成功");
        } else
            RenderKit.renderError(this, "添加失败");
    }

    @Before(POST.class)
    public void postQuestion() {
        //题目
        if (getModel(Questions.class).save()) {
            RenderKit.renderSuccess(this, "添加成功");
        } else
            RenderKit.renderError(this, "添加失败");
    }

    @Before(POST.class)
    public void postQuestionnaire() {
        boolean flag = true;
        Questionnaire model = getModel(Questionnaire.class);
        log.info(model.getDate());
        if (surveysService._saveQuestionnaire(model)) {
            RenderKit.renderSuccess(this, "添加成功");
        } else
            RenderKit.renderError(this, "添加失败");
        String questionsId = getPara("questionsId");
        log.info(model.getId() + "+++++" + questionsId);
        String[] ids = questionsId.split(",");
        int questionnaireMaxId = surveysService.getQuestionnaireMaxId();
        for (String id1 : ids) {
            QuestionsQuestionnaire questionsQuestionnaire = new QuestionsQuestionnaire();
            questionsQuestionnaire.setIdQuestionnaire(questionnaireMaxId);
            if (!StrPlusKit.isNumeric(id1)) {
                RenderKit.renderError(this, "id只能为数字");
                return;
            }
            Integer id = Integer.valueOf(id1);
            questionsQuestionnaire.setIdQuestions(id);
            questionsQuestionnaire.setCreateDate(System.currentTimeMillis() + "");
            questionsQuestionnaire.save();
        }

    }

    @Before(POST.class)
    public void postRelation() {
        if (getModel(QuestionsQuestionnaire.class).save()) {
            RenderKit.renderSuccess(this, "添加成功");
        } else
            RenderKit.renderError(this, "添加失败");
    }

    @Before(POST.class)
    public void postQresult() {
        String code = getPara(0);
        if (code == null) {
            RenderKit.renderError(this, "提交失败！ 你未领取提交码获取不到你的身份信息");
            return;
        }
        Node user = surveysService.getUserByCode(code);
        if (user == null) {
            RenderKit.renderError(this, "提交失败！你的信息发生了变化或者获取不到你的身份信息");
            return;
        }
        List<QuestionnaireResult> questionnaireResults = surveysService.getQuestionnaireResultByUserName(user.name);
        QuestionnaireResult model = getModel(QuestionnaireResult.class);
        for (QuestionnaireResult q : questionnaireResults)
            if (Objects.equals(q.getIdQuestionnaire(), model.getIdQuestionnaire())) {
                q.setQuestionsReply(model.getQuestionsReply());
                q.setComment(model.getComment());
                Questionnaire questionnaire = Questionnaire.dao.findById(q.getIdQuestionnaire());
                if(Long.valueOf(questionnaire.getEndTime()) < System.currentTimeMillis() ){
                    RenderKit.renderError(this, "已经超时，提交失败");
                    return ;
                }
                log.info(q.getQuestionsReply());
                if (q.update()) {
                    RenderKit.renderSuccess(this, "提交成功");
                    return;
                } else {
                    RenderKit.renderError(this, "保存答案失败");
                    return ;
                }
            }
        log.info(model.getQuestionsReply());
        if (model.save()) {
            RenderKit.renderSuccess(this, "提交成功");
        } else
            RenderKit.renderError(this, "提交失败");
    }

    @Override
    public String init() {
        return "我的调查";
    }
}
