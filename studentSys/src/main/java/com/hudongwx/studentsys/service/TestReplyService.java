package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.TestReply;
import com.hudongwx.studentsys.util.Common;
import com.jfinal.plugin.ehcache.CacheKit;

import java.util.List;

/**
 * Created by wuhongxu on 2016/10/19 0019.
 */
public class TestReplyService extends Service {
    public boolean _saveTestReply(TestReply testReply) {
        return testReply.save();
    }

    public boolean _updateTestReply(TestReply testReply) {
        if (testReply.getId() == null)
            return false;
        return testReply.update();
    }

    public TestReply readByCache(Integer qcId, Integer studentId) {
        TestReply reply = TestReply.dao.findFirstByCache(Common.CACHE_LONG_TIME_LABEL, qcId + "-" + studentId,
                TestReply.SEARCH_FROM_TEST_REPLY + "where testQuestionnaireClassId = ? and studentId = ?", qcId, studentId);
        if(reply == null){
            reply = new TestReply();
            reply.setTestQuestionnaireClassId(qcId);
            reply.setStudentId(studentId);
            reply.setAnswers("{}");
        }
        return reply;
    }

    public TestReply putByCache(TestReply testReply, boolean isSave) {
        if (isSave) {
            if (testReply.getId() == null)
                _saveTestReply(testReply);
            else
                _updateTestReply(testReply);
        }
        CacheKit.put(Common.CACHE_LONG_TIME_LABEL, testReply.getTestQuestionnaireClassId() + "-" + testReply.getStudentId(), testReply);
        return testReply;
    }

    public TestReply putByCache(TestReply testReply) {
        return putByCache(testReply, false);
    }

    public List<TestReply> getReplies(Integer qcId) {
        return TestReply.dao.find(TestReply.SEARCH_FROM_TEST_REPLY+"where testQuestionnaireClassId = ? order by id desc",qcId);
    }
}
