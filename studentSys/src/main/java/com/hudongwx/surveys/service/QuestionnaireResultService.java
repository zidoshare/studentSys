package com.hudongwx.surveys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.Student;
import com.hudongwx.studentsys.model.User;
import com.hudongwx.surveys.model.Questionnaire;
import com.hudongwx.surveys.model.QuestionnaireResult;

/**
 * Created by wuhongxu on 2016/10/11 0011.
 */
public class QuestionnaireResultService extends Service{
    public QuestionnaireResult getQuestionnaireResultByStudentAndQuestionnaire(Student student,Questionnaire questionnaire){
        return QuestionnaireResult.dao.findFirst(QuestionnaireResult.SEARCH_FROM_QUESTIONNAIRE_RESULT+"where id_user = ? and id_questionnaire = ?",student.getName(),questionnaire.getId());
    }
}
