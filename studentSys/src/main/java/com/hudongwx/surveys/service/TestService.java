package com.hudongwx.surveys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.surveys.model.Questions;
import com.jfinal.plugin.activerecord.Page;

/**
 * Created by wuhongxu on 2016/10/9 0009.
 */
public class TestService extends Service {
    public Page<Questions> getQuestions(int currentPage,int pageSize,String select,String sqlException){
        return Questions.dao.paginate(currentPage,pageSize,select,sqlException);
    }
}
