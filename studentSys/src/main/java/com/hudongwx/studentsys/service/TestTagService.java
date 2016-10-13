package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.*;

import java.util.List;

/**
 * Created by wuhongxu on 2016/10/9 0009.
 */
public class TestTagService extends Service {
    private TestDomainTagService domainTagService;
    public List<TestTag> getAllTestTag() {
        return TestTag.dao.find(TestTag.SEARCH_FROM_TEST_TAG);
    }

    public boolean _saveTestTag(TestTag tag) {
        return tag.save();
    }

    public boolean _updateTestTag(TestTag tag) {
        return tag.update();
    }

    public List<TestTag> getTagsByQuestion(TestQuestion tq) {
        List<TestTagQuestion> testTagQuestions = TestTagQuestion.dao.find(TestTagQuestion.SEARCH_FROM_TEST_TAG_QUESTION + "where testQuestionId = ?", tq.getId());
        String str = TestTag.SEARCH_FROM_TEST_TAG+"where id in (";
        for (TestTagQuestion testTagQuestion : testTagQuestions) {
            str+=testTagQuestion.getTagId()+",";
        }
        str+=Integer.MAX_VALUE+")";
        return TestTag.dao.find(str);
    }

    public List<TestTag> getTagsByDomain(Domain domain) {
        String str = domainTagService.getTagsStrByDomain(domain);
        if(domain.getId() == 0){
            return TestTag.dao.find(TestTag.SEARCH_FROM_TEST_TAG+"where id not in "+str);
        }
        return TestTag.dao.find(TestTag.SEARCH_FROM_TEST_TAG+"where id in "+str);
    }
}
