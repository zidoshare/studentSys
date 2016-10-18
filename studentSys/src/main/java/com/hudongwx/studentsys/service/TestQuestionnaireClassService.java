package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.TestQuestionnaireClass;

/**
 * Created by wuhongxu on 2016/10/18 0018.
 */
public class TestQuestionnaireClassService extends Service {
    public boolean _saveTestQuestionnaireClass(TestQuestionnaireClass tqc){
        return tqc.save();
    }
}
