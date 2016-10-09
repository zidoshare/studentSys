package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.TestQuestion;

/**
 * Created by wuhongxu on 2016/10/10 0010.
 */
public class TestQuestionService extends Service {
    public boolean _saveTestQuestion(TestQuestion testQuestion){
        return testQuestion.save();
    }
    public boolean _updateTestQuestion(TestQuestion testQuestion){
        return testQuestion.update();
    }
}
