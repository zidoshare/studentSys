package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.Class;
import com.hudongwx.studentsys.model.TestQuestionnaireClass;
import com.hudongwx.studentsys.util.Common;
import com.jfinal.plugin.activerecord.Page;

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

    public List<TestQuestionnaireClass> getByClassId(Class aClass) {
        return TestQuestionnaireClass.dao.find(TestQuestionnaireClass.SEARCH_FROM_TEST_QUESTIONNAIRE_CLASS+"where classId = ? order by id desc",aClass.getId());
    }
    public Page<TestQuestionnaireClass> getByClassId(int page,Class aClass){
        return TestQuestionnaireClass.dao.paginate(page, Common.MAX_PAGE_SIZE,Common.COMMON_SELECT,TestQuestionnaireClass.FROM_SQL+"where classId = ? order by id desc",aClass.getId());
    }

    public Page<TestQuestionnaireClass> getAllTQC(int currentPage){
        return TestQuestionnaireClass.dao.paginate(currentPage,Common.MAX_PAGE_SIZE,Common.COMMON_SELECT,TestQuestionnaireClass.FROM_SQL+Common.ORDER_BY_ID_DESC);
    }
}
