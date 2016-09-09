package com.hudongwx.testing.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.testing.model.TQuestionsTag;
import com.jfinal.plugin.ehcache.CacheKit;

import java.util.List;

/**
 * Created by 11 on 2016/9/9.
 */
public class TestingService extends  Service{
    public static TestingService service = new TestingService();

    //遍历取题目标签
    public List<TQuestionsTag> getQuestionTag(){
        return  TQuestionsTag.dao.find("select * from testing_t_questions_tag");
    }

    //添加题目

}
