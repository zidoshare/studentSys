package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.TestQuestion;
import com.hudongwx.studentsys.model.TestType;

import java.util.List;

/**
 * Created by wuhongxu on 2016/10/10 0010.
 */
public class TestQuestionService extends Service {
    public boolean _saveTestQuestion(TestQuestion testQuestion){
        return testQuestion.save();
    }
    public boolean _updateTestQuestion(TestQuestion testQuestion){
        return testQuestion.update();
    }

    public List<TestQuestion> getAllQuestions() {
        return TestQuestion.dao.find(TestQuestion.SEARCH_FROM_TEST_QUESTION);
    }
    public List<TestQuestion> getQuestionsByType(TestType type){
        return TestQuestion.dao.find(TestQuestion.SEARCH_FROM_TEST_QUESTION+"where testQuestionTypeId = ?",type.getId());
    }
}
