package com.hudongwx.testing.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.util.Common;
import com.hudongwx.testing.model.TQuestionBigType;
import com.hudongwx.testing.model.TQuestions;
import com.hudongwx.testing.model.TQuestionsTag;
import com.jfinal.plugin.ehcache.CacheKit;

import java.util.List;

/**
 * Created by 11 on 2016/9/9.
 */
public class UpdateTestingService extends  Service{
    public static UpdateTestingService service = new UpdateTestingService();

    //获取题目
    public List<TQuestions> getTesting(){
        return TQuestions.dao.findByCache(Common.CACHE_LONG_TIME_LABEL, "tQuestions", "select * from testing_t_questions");
    }

    //添加题目
    public boolean saveTesting(TQuestions questions){
        List<TQuestions> tQuestions = TQuestions.dao.findByCache(Common.CACHE_LONG_TIME_LABEL, "tQuestions", "select * from testing_t_questions");
        if(questions.save()) {
            tQuestions.add(questions);
            CacheKit.put(Common.CACHE_LONG_TIME_LABEL, "tQuestions",tQuestions);
            return true;
        }
        return false;
    }

    //添加题型
    public boolean saveQuestionType(TQuestionBigType type){
        List<TQuestionBigType> types = TQuestionBigType.dao.findByCache(Common.CACHE_LONG_TIME_LABEL, "tType", "select * from testing_t_question_big_type");
        if(type.save()) {
            types.add(type);
            CacheKit.put(Common.CACHE_LONG_TIME_LABEL, "tType",types);
            return true;
        }
        return false;
    }

    //获取题型
    public List<TQuestionBigType> getQuestionType(){
        return TQuestionBigType.dao.findByCache(Common.CACHE_LONG_TIME_LABEL, "tType", "select * from testing_t_question_big_type");
    }

    //添加题目标签
    public boolean saveQuestionTag(TQuestionsTag tag){
        List<TQuestionsTag> tags = TQuestionsTag.dao.findByCache(Common.CACHE_LONG_TIME_LABEL, "tTag", "select * from testing_t_questions_tag");
        if(tag.save()) {
            tags.add(tag);
            CacheKit.put(Common.CACHE_LONG_TIME_LABEL, "tTag",tags);
            return true;
        }
        return false;
    }

    //获取题目标签
    public List<TQuestionsTag> getQuestionTag(){
        return TQuestionsTag.dao.findByCache(Common.CACHE_LONG_TIME_LABEL, "tTag", "select * from testing_t_questions_tag");
    }
}
