package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.TestQuestionnaireQuestion;

/**
 * Created by wuhongxu on 2016/10/14 0014.
 */
public class TestQuestionnaireQuestionService extends Service{
    public boolean _saveTestQuestionnaireQuestion(TestQuestionnaireQuestion testQuestionnaireQuestion){
        return testQuestionnaireQuestion.save();
    }
}
