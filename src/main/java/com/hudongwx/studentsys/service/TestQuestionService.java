package com.hudongwx.studentsys.service;

import com.alibaba.fastjson.JSONArray;
import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.*;
import com.hudongwx.studentsys.util.Common;
import com.hudongwx.studentsys.util.ObjectKit;
import com.jfinal.plugin.activerecord.Page;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by wuhongxu on 2016/10/10 0010.
 */
public class TestQuestionService extends Service {
    private TestTagQuestionService testTagQuestionService;
    private TestQuestionnaireQuestionService testQuestionnaireQuestionService;

    public boolean _saveTestQuestion(TestQuestion testQuestion) {
        return testQuestion.save();
    }

    public boolean _updateTestQuestion(TestQuestion testQuestion) {
        return testQuestion.update();
    }

    public List<TestQuestion> getAllQuestions() {
        return TestQuestion.dao.find(TestQuestion.SEARCH_FROM_TEST_QUESTION);
    }

    public Page<TestQuestion> getAllQuestions(int currentPage) {
        return TestQuestion.dao.paginate(currentPage, Common.MAX_PAGE_SIZE, Common.COMMON_SELECT, TestQuestion.FROM_SQL + Common.ORDER_BY_ID_DESC);
    }

    public Page<TestQuestion> getQuestionsByTypeAndTag(int currentPage, int type, int tag) {
        if (tag == 0 && type == 0) {
            return TestQuestion.dao.paginate(currentPage, Common.MAX_PAGE_SIZE, Common.COMMON_SELECT, TestQuestion.FROM_SQL + Common.ORDER_BY_ID_DESC);
        } else if (type != 0 && tag == 0)
            return TestQuestion.dao.paginate(currentPage, Common.MAX_PAGE_SIZE, Common.COMMON_SELECT, TestQuestion.FROM_SQL + Common.SQL_WHERE + "testQuestionTypeId = ?" + Common.ORDER_BY_ID_DESC, type);
        else if (type == 0) {
            String str = testTagQuestionService.getQuestionStrByTag(tag);
            return TestQuestion.dao.paginate(currentPage, Common.MAX_PAGE_SIZE, Common.COMMON_SELECT, TestQuestion.FROM_SQL + "where id in " + str + Common.ORDER_BY_ID_DESC);
        } else {
            String str = testTagQuestionService.getQuestionStrByTag(tag);
            return TestQuestion.dao.paginate(currentPage, Common.MAX_PAGE_SIZE, Common.COMMON_SELECT, TestQuestion.FROM_SQL + "where id in " + str + " and testQuestionTypeId = ?" + Common.ORDER_BY_ID_DESC, type);
        }
    }

    public List<TestQuestion> getQuestionsByTypeId(Integer typeId) {
        return TestQuestion.dao.find(TestQuestion.SEARCH_FROM_TEST_QUESTION + "where testQuestionTypeId = ?", typeId);
    }

    public List<TestQuestion> getQuestionsByType(TestType type) {
        return getQuestionsByTypeId(type.getId());
    }

    public List<TestQuestion> getQuestionsByTag(Integer tagId) {
        String str = testTagQuestionService.getQuestionStrByTag(tagId);
        return TestQuestion.dao.find(TestQuestion.SEARCH_FROM_TEST_QUESTION + "where id in ?", str);
    }

    public List<TestQuestion> getQuestionsByTypeIdAndTagId(int tagId, int typeId) {
        if (tagId == 0 && typeId == 0) {
            return TestQuestion.dao.find(TestQuestion.SEARCH_FROM_TEST_QUESTION + Common.ORDER_BY_ID_DESC);
        } else if (typeId != 0 && tagId == 0)
            return TestQuestion.dao.find(TestQuestion.SEARCH_FROM_TEST_QUESTION + Common.SQL_WHERE + "testQuestionTypeId = ?" + Common.ORDER_BY_ID_DESC, typeId);
        else if (typeId == 0) {
            String str = testTagQuestionService.getQuestionStrByTag(tagId);
            return TestQuestion.dao.find(TestQuestion.SEARCH_FROM_TEST_QUESTION + "where id in " + str + Common.ORDER_BY_ID_DESC);
        } else {
            String str = testTagQuestionService.getQuestionStrByTag(tagId);
            return TestQuestion.dao.find(TestQuestion.SEARCH_FROM_TEST_QUESTION + "where id in " + str + " and testQuestionTypeId = ?" + Common.ORDER_BY_ID_DESC, typeId);
        }
    }

    //当不强调顺序的时候使用此方法
    public List<TestQuestion> getQuestionsByTestQuestionnaire(TestQuestionnaire testQuestionnaire) {
        List<TestQuestionnaireQuestion> tqqs = testQuestionnaireQuestionService.getByTestQuestionnaire(testQuestionnaire);
        String str = ObjectKit.getStrByList(tqqs, "testQuestionId");
        return TestQuestion.dao.find(TestQuestion.SEARCH_FROM_TEST_QUESTION + "where id in " + str);
    }

    public List<TestQuestion> getQuestionsByJSONArray(JSONArray array) {
        String str = ObjectKit.getStrByJSONArray(array);
        return TestQuestion.dao.find(TestQuestion.SEARCH_FROM_TEST_QUESTION + "where id in " + str);
    }

    public List<TestQuestion> getQuestionsByJSONArray(JSONArray array, String order) {
        //预留排序功能
        return getQuestionsByJSONArray(array);
    }

    public TestQuestion getQuestionById(Integer id) {
        return TestQuestion.dao.findById(id);
    }
}
