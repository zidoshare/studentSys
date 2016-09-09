package com.hudongwx.testing.controller;

import com.hudongwx.studentsys.util.RenderKit;
import com.hudongwx.testing.model.TQuestionBigType;
import com.hudongwx.testing.model.TQuestions;
import com.hudongwx.testing.model.TQuestionsTag;
import com.hudongwx.testing.service.UpdateTestingService;
import com.hudongwx.testing.utils.DateUtils;
import com.jfinal.core.Controller;
import com.jfinal.log.Log;

import java.util.List;

/**
 * Created by 11 on 2016/9/9.
 */
public class UpdateTestingController extends Controller{
    private Log log = Log.getLog(getClass());

    //添加题分类
    public void addBigType(){
        TQuestionBigType bigType = getModel(TQuestionBigType.class);
        log.info(bigType.getId()+"   "+bigType.getName());
        if(bigType.save()){
            RenderKit.renderSuccess(this);
        }else{
            RenderKit.renderError(this);
        }
    }

    //添加标签
    public void addQuestionTag(){
        TQuestionsTag questionsTag = getModel(TQuestionsTag.class);
        log.info(questionsTag.getId()+"   "+questionsTag.getName());
        if( questionsTag.save()){
            RenderKit.renderSuccess(this);
        }else{
            RenderKit.renderError(this);
        }
    }

    //添加题目
    public void addTesting(){
        TQuestions questions = getModel(TQuestions.class);
        log.info(questions.getId()+"   "+questions.getScore());
        questions.setCreateTime(DateUtils.dateToString());
        if(UpdateTestingService.service.saveTesting(questions)){
            RenderKit.renderSuccess(this,"添加成功！");
        }else{
            RenderKit.renderError(this,"添加失败！");
        }
    }

    //删除题目
    public void deleteTesting(){
        String questionid = getPara("questionid");
        TQuestions tQuestions = TQuestions.dao.findById(questionid);
        tQuestions.setIsEnable(0);
        if(tQuestions.update()){
            RenderKit.renderSuccess(this,"删除成功！");
        }else{
            RenderKit.renderError(this,"删除失败！");
        }
    }

    //获取题目
    public void getTesting(){
        List<TQuestions> questions = UpdateTestingService.service.getTesting();
        setAttr("questions",questions);
        RenderKit.renderSuccess(this);
    }

    //获取标签
    public void getQuestionTag(){
        List<TQuestionsTag> tags = UpdateTestingService.service.getQuestionTag();
        setAttr("tags",tags);
        RenderKit.renderSuccess(this);
    }

    //获取题型
    public void getQuestionType(){
        List<TQuestionBigType> types = UpdateTestingService.service.getQuestionType();
        setAttr("types",types);
        RenderKit.renderSuccess(this);
    }

    //删除标签  --修改可用
    public void deleteQuestionTag(){
        String tagid = getPara("tagid");
        TQuestionsTag questionsTag = TQuestionsTag.dao.findById(tagid);
        questionsTag.setIsEnable(0);
        if(questionsTag.update()){
            RenderKit.renderSuccess(this,"删除成功！");
        }else{
            RenderKit.renderError(this,"删除失败！");
        }
    }

    //修改标签
    public void updateQuestionTag(){
        TQuestionsTag questionsTag = getModel(TQuestionsTag.class);
        if(questionsTag.update()){
            RenderKit.renderSuccess(this,"修改成功！");
        }else{
            RenderKit.renderError(this,"修改失败！");
        }
    }

    //删除题类型  --修改可用
    public void deleteQuestionType(){
        String typeid = getPara("typeid");
        TQuestionBigType tQuestionBigType = TQuestionBigType.dao.findById(typeid);
        tQuestionBigType.setIsEnable(0);
        if(tQuestionBigType.update()){
            RenderKit.renderSuccess(this,"删除成功！");
        }else{
            RenderKit.renderError(this,"删除失败！");
        }
    }

    //修改题型
    public void updateQuestionType(){
        TQuestionBigType tQuestionBigType = getModel(TQuestionBigType.class);
        if(tQuestionBigType.update()){
            RenderKit.renderSuccess(this,"修改成功！");
        }else{
            RenderKit.renderError(this,"修改失败！");
        }
    }
}
