package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.TestQuestion;
import com.hudongwx.studentsys.model.TestTag;
import com.hudongwx.studentsys.model.TestTagQuestion;

import java.util.List;

/**
 * Created by wuhongxu on 2016/10/10 0010.
 */
public class TestTagQuestionService extends Service {
    public boolean _saveTagQuestion(TestTag tag, TestQuestion question) {
        TestTagQuestion testTagQuestion = new TestTagQuestion();
        testTagQuestion.setTagId(tag.getId());
        testTagQuestion.setTestQuestionId(question.getId());
        return testTagQuestion.save();
    }

    public List<TestTagQuestion> getTagQuestionByTag(TestTag tag) {
        return TestTagQuestion.dao.find(TestTagQuestion.SEARCH_FROM_TEST_TAG_QUESTION + "where tagId = ?", tag.getId());
    }

    public List<TestTagQuestion> getTagQuestionByTag(Integer tagId){
        return TestTagQuestion.dao.find(TestTagQuestion.SEARCH_FROM_TEST_TAG_QUESTION + "where tagId = ?", tagId);
    }

    public String getQuestionStrByTag(Integer tagId) {
        List<TestTagQuestion> tqs = getTagQuestionByTag(tagId);
        StringBuilder str = new StringBuilder("(");
        for (TestTagQuestion tq : tqs) {
            str.append(tq.getTestQuestionId()).append(",");
        }
        if (str.length() > 1)
            str.deleteCharAt(str.length() - 1);
        str.append(")");
        return str.toString();
    }
}
