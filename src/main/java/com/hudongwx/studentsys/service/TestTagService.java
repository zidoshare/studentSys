package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.*;
import com.hudongwx.studentsys.util.Common;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.TagName;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by wuhongxu on 2016/10/9 0009.
 */
public class TestTagService extends Service {
    private TestDomainTagService domainTagService;
    public List<TestTag> getAllTestTag() {
        return TestTag.dao.find(TestTag.SEARCH_FROM_TEST_TAG+ Common.ORDER_BY_ID_DESC);
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
        if(domain == null)
            return new ArrayList<>();
        if(domain.getId() == 0){
            return TestTag.dao.find(TestTag.SEARCH_FROM_TEST_TAG+Common.ORDER_BY_ID_DESC);
        }
        String str = domainTagService.getTagsStrByDomain(domain);
        return TestTag.dao.find(TestTag.SEARCH_FROM_TEST_TAG+"where id in "+str+Common.ORDER_BY_ID_DESC);
    }

    public TestTag createTag(String tagName){
        TestTag now = new TestTag();
        now.setTagName(tagName);
        now.setQuestionCnt(0);
        return now;
    }
}
