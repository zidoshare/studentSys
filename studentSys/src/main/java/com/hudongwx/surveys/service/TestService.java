package com.hudongwx.surveys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.surveys.model.QuestionBigType;
import com.hudongwx.surveys.model.Questions;
import com.hudongwx.surveys.model.QuestionsQuestionnaire;
import com.hudongwx.studentsys.util.Common;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by wuhongxu on 2016/9/6 0006.
 */
public class TestService extends Service {
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
