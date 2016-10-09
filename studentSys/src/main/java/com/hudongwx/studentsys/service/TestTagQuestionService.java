package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.TestQuestion;
import com.hudongwx.studentsys.model.TestTag;
import com.hudongwx.studentsys.model.TestTagQuestion;

/**
 * Created by wuhongxu on 2016/10/10 0010.
 */
public class TestTagQuestionService extends Service {
    public boolean _saveTagQuestion(TestTag tag, TestQuestion question){
        TestTagQuestion testTagQuestion = new TestTagQuestion();
        testTagQuestion.setTagId(tag.getId());
        testTagQuestion.setTestQuestionId(question.getId());
        return testTagQuestion.save();
    }
}
