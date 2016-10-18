package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.TestQuestionnaireClass;

import java.util.List;

/**
 * Created by wuhongxu on 2016/10/18 0018.
 */
public class TestQuestionnaireClassService extends Service {
    public boolean _saveTestQuestionnaireClass(TestQuestionnaireClass tqc){
        return tqc.save();
    }

    public List<TestQuestionnaireClass> getAllTQC() {
        return TestQuestionnaireClass.dao.find(TestQuestionnaireClass.SEARCH_FROM_TEST_QUESTIONNAIRE_CLASS);
    }

    public TestQuestionnaireClass getById(Integer testQuestionnaireClassId) {
        return TestQuestionnaireClass.dao.findById(testQuestionnaireClassId);
    }
}
