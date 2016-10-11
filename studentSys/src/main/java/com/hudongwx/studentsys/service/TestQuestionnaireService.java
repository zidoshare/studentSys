package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.*;
import com.hudongwx.studentsys.model.Class;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Created by wuhongxu on 2016/10/10 0010.
 */
public class TestQuestionnaireService extends Service {
    private ClassService classService;
    private StudentService studentService;

    public List<TestQuestionnaire> getAllTestQuestionnaire() {
        return TestQuestionnaire.dao.find(TestQuestionnaire.SEARCH_FROM_TEST_QUESTIONNAIRE);
    }

    public List<TestQuestionnaire> getQuestionnaireByClass(Class c) {
        if(c == null)
            return new ArrayList<>();
        return TestQuestionnaireClass.dao
                .find(TestQuestionnaireClass.SEARCH_FROM_TEST_QUESTIONNAIRE_CLASS + "where classId = ?", c.getId())
                .stream().map(tc -> TestQuestionnaire.dao.findById(tc.getTestQuestionnaireId()))
                .collect(Collectors.toList());
    }

    public List<TestQuestionnaire> getQuestionnaireByStudent(Student student) {
        if(student == null)
            return new ArrayList<>();
        return getQuestionnaireByClass(classService.getClassByStudent(student));
    }

    public List<TestQuestionnaire> getQuestionnaireByUser(User user) {
        if(user == null)
            return new ArrayList<>();
        return getQuestionnaireByStudent(studentService.getStudentByUser(user));
    }

    public Map<String, String> getMsgMapByQuestionnaire(TestQuestionnaire tq) {
        List<TestQuestionnaireClass> questionnaireClasses = TestQuestionnaireClass.dao.find(TestQuestionnaireClass.SEARCH_FROM_TEST_QUESTIONNAIRE_CLASS + "where testQuestionnaireId = ?", tq.getId());
        Map<String,String> msgMap = new HashMap<>();
        for(TestQuestionnaireClass tqc : questionnaireClasses){
            msgMap.put(tq.getId()+"-"+tqc.getClassId()+"StartTime",tqc.getTestQuestionnaireStartTime()+"");
            msgMap.put(tq.getId()+"-"+tqc.getClassId()+"EndTime",tqc.getTestQuestionnaireEndTime()+"");
            Class aClass = classService.getClassById(tqc.getClassId());
            msgMap.put(tq.getId()+"-classId",aClass.getId()+"");
            msgMap.put(tq.getId()+"-"+tqc.getClassId()+"className",aClass.getClassName());
        }
        return msgMap;

    }
}
