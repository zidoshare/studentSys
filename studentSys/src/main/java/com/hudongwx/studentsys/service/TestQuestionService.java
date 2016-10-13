package com.hudongwx.studentsys.service;

import com.alibaba.fastjson.JSONArray;
import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.TestQuestion;
import com.hudongwx.studentsys.model.TestTag;
import com.hudongwx.studentsys.model.TestTagQuestion;
import com.hudongwx.studentsys.model.TestType;
import com.hudongwx.studentsys.util.ObjectKit;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by wuhongxu on 2016/10/10 0010.
 */
public class TestQuestionService extends Service {
    private TestTagQuestionService testTagQuestionService;

    public boolean _saveTestQuestion(TestQuestion testQuestion) {
        return testQuestion.save();
    }

    public boolean _updateTestQuestion(TestQuestion testQuestion) {
        return testQuestion.update();
    }

    public List<TestQuestion> getAllQuestions() {
        return TestQuestion.dao.find(TestQuestion.SEARCH_FROM_TEST_QUESTION);
    }

    public List<TestQuestion> getQuestionsByTypeId(Integer typeId) {
        return TestQuestion.dao.find(TestQuestion.SEARCH_FROM_TEST_QUESTION + "where testQuestionTypeId = ?", typeId);
    }
    public List<TestQuestion> getQuestionsByType(TestType type){
        return getQuestionsByTypeId(type.getId());
    }
    public List<TestQuestion> getQuestionsByTag(TestTag tag) {
        String str = testTagQuestionService.getQuestionStrByTag(tag);
        return TestQuestion.dao.find(TestQuestion.SEARCH_FROM_TEST_QUESTION+"where id in ?",str);
    }

    public List<TestQuestion> getQuestionsByTypeIdAndTagId(Integer tagId, Integer typeId) {
        if (null == tagId && null == typeId)
            return new ArrayList<>();
        if (null == tagId) {
            return getQuestionsByTypeId(typeId);
        }
        if (null == typeId) {
            return getQuestionsByTag(TestTag.dao.findById(tagId));
        }
        String str = testTagQuestionService.getQuestionStrByTag(TestTag.dao.findById(tagId));
        return TestQuestion.dao.find(TestQuestion.SEARCH_FROM_TEST_QUESTION+"where testQuestionTypeId = ? and id in "+str,typeId);
    }

    public List<TestQuestion> getQuestionsByJSONArray(JSONArray array) {
        String str = ObjectKit.getStrByJSONArray(array);
        return TestQuestion.dao.find(TestQuestion.SEARCH_FROM_TEST_QUESTION+"where id in "+str);
    }
}
