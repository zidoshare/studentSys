package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.TestQuestionnaire;
import com.hudongwx.studentsys.model.TestQuestionnaireQuestion;
import com.jfinal.plugin.activerecord.Model;

import java.util.List;

/**
 * Created by wuhongxu on 2016/10/14 0014.
 */
public class TestQuestionnaireQuestionService extends Service{
    public boolean _saveTestQuestionnaireQuestion(TestQuestionnaireQuestion testQuestionnaireQuestion){
        return testQuestionnaireQuestion.save();
    }

    public List<TestQuestionnaireQuestion> getByIn(String str) {
        return TestQuestionnaireQuestion.dao.find(TestQuestionnaireQuestion.SEARCH_FROM_MODEL+"where testQuestionId in "+str);
    }

    public TestQuestionnaireQuestion getByQuestionIdAndQuestionnaireId(Integer questionId, Integer questionnaireId) {
        return TestQuestionnaireQuestion.dao.findFirst(TestQuestionnaireQuestion.SEARCH_FROM_MODEL + "where testQuestionId = ? and testQuestionnaireId = ?",questionId,questionnaireId);
    }

    public boolean _deleteAllByQuestionnaire(TestQuestionnaire questionnaire) {
        List<TestQuestionnaireQuestion> questionnaires = TestQuestionnaireQuestion.dao.find(TestQuestionnaireQuestion.SEARCH_FROM_MODEL + "where testQuestionnaireId = ?", questionnaire.getId());
        questionnaires.forEach(Model::delete);
        return true;
    }
}
