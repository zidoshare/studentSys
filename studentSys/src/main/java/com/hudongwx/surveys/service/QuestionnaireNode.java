package com.hudongwx.surveys.service;

import com.hudongwx.surveys.model.QuestionBigType;
import com.hudongwx.surveys.model.Questions;

import java.util.List;

/**
 * Created by wuhongxu on 2016/9/12 0012.
 */
public class QuestionnaireNode {
    private QuestionBigType questionBigType;
    private List<Questions> questionsList;
    //做计数，方便遍历
    private int size;
    public QuestionBigType getQuestionBigType() {
        return questionBigType;
    }

    public void setQuestionBigType(QuestionBigType questionBigType) {
        this.questionBigType = questionBigType;
    }

    public List<Questions> getQuestionsList() {
        return questionsList;
    }

    public void setQuestionsList(List<Questions> questionsList) {
        this.questionsList = questionsList;
        size = questionsList.size();
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }
}
