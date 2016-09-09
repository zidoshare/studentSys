package com.hudongwx.surveys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.exceptions.ServiceException;
import com.hudongwx.studentsys.util.StrPlusKit;
import com.hudongwx.surveys.model.QuestionBigType;
import com.hudongwx.surveys.model.Questionnaire;
import com.hudongwx.surveys.model.Questions;
import com.hudongwx.surveys.model.QuestionsQuestionnaire;
import com.hudongwx.studentsys.util.Common;
import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * Created by wuhongxu on 2016/9/6 0006.
 */
public class SurveysService extends Service {
    private Thread runSuevey = null;
    private List<String> onlineUses = new ArrayList<>();
    public List<QuestionBigType> getBigTypes() {
        return QuestionBigType.dao.findByCache(Common.CACHE_LONG_TIME_LABEL, "bigTypes", "select * from surveys_t_question_big_type");
    }
    public boolean saveBigType(QuestionBigType qbt) {
        List<QuestionBigType> bigTypes = QuestionBigType.dao.findByCache(Common.CACHE_LONG_TIME_LABEL, "bigTypes", "select * from surveys_t_question_big_type");
            if(qbt.save()) {
            bigTypes.add(qbt);
            CacheKit.put(Common.CACHE_LONG_TIME_LABEL, "bigTypes",bigTypes);
            return true;
        }
        return false;
    }
    public Page<Questions> getAllQuestions(int currentPage){
        return Questions.dao.paginate(currentPage, Common.MAX_PAGE_SIZE, "select *", "from surveys_t_questions");
    }
    public Page<Questions> getQuestionsByBigType(int currentPageNum,int typeId){
        return Questions.dao.paginate(currentPageNum,Common.MAX_PAGE_SIZE,"select *","from surveys_t_questions where big_type_id = ?",typeId);
    }
    public List<Questions> getQuestionsByQuestionnaire(int questionnaireId){
        List<QuestionsQuestionnaire> questionsQuestionnaires = QuestionsQuestionnaire.dao.find("select * from surveys_t_questions_questionnaire where id_questionnaire = ?", questionnaireId);
        if(questionsQuestionnaires.isEmpty())
            return new ArrayList<>();
        String ids = "(";
        for(QuestionsQuestionnaire q : questionsQuestionnaires){
            ids+=q.getIdQuestions()+",";
        }
        ids = ids.substring(0,ids.length()-1);
        ids +=")";
        return Questions.dao.findByCache(Common.CACHE_LONG_TIME_LABEL,questionnaireId,"select * from surveys_t_questions where id IN "+ids);
    }

    public Page<Questionnaire> getQuestionnaires(int currentPage) {
        return getQuestionnaires(currentPage,Common.MAX_PAGE_SIZE);
    }

    public Page<Questionnaire> getQuestionnaires(int currentPage,int pageSize){
        return Questionnaire.dao.paginateByCache(Common.CACHE_60TIME_LABEL,"questionnaires"+currentPage,currentPage,pageSize,"select *","from questionnaire");
    }
    public boolean _saveQuestionnaire(Questionnaire questionnaire){
        try {
            if (StrPlusKit.isEmpty(questionnaire.getClassName()))
                throw new ServiceException("className cannot be null or \"\"");
            if (StrPlusKit.isEmpty(questionnaire.getDate()))
                throw new ServiceException("date cannot be null or \"\"");
            if(StrPlusKit.isEmpty(questionnaire.getToUser()))
                throw new ServiceException("toUser cannot be null or \"\"");
        } catch (ServiceException e) {
            log.error(e.getMessage());
            return false;
        }
        questionnaire.save();
        return true;
    }
    //关联问题和调查表
    public void _saveQuestionQuestionnaires(int questionnaireId,int questionId){
        QuestionsQuestionnaire questionsQuestionnaire = new QuestionsQuestionnaire();
        questionsQuestionnaire.setIdQuestionnaire(questionnaireId);
        questionsQuestionnaire.setId(questionId);
        questionsQuestionnaire.save();
    }
    public boolean isContainUser(String name) {
        for(String holdName : onlineUses){
            if(holdName.equals(name)){
                return true;
            }
        }
        return false;
    }
    public boolean registerName(String name) {
        if(!isContainUser(name)){
            onlineUses.add(name);
            Random r = new Random();
            return true;
        }
        return false;
    }
    public int getRegisterSize(){
        return onlineUses.size();
    }
    public void runSurveys(){
        runSuevey = new Thread(() -> {
            while(true){

            }
        });

    }

    public List<Questions> getAllQuestions() {
         return Questions.dao.findByCache(Common.CACHE_LONG_TIME_LABEL,"questions","select * from surveys_t_questions ORDER BY (surveys_t_questions.big_type_id in (select id from surveys_t_question_big_type))");
    }
    class node{
        public String name;

    }

    /*private List<String> testFlags;
    public void addTestFlag(String flag){
        if(testFlags == null)
            testFlags = new ArrayList<>();
        testFlags.add(flag);
    }
    public boolean removeTestFlag(String flag){
        if(testFlags.remove(flag))
            return true;
        for(String s : testFlags)
            if (s.equals(flag)) {
                testFlags.remove(s);
                return true;
            }
        return false;
    }
    public String generatorTestFlag(){
        Double v = Math.random() * 100000 + 10000;
        return ""+v;
    }*/
    
}
