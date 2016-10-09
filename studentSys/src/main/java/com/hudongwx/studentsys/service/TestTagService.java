package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.TestTag;

import java.util.List;

/**
 * Created by wuhongxu on 2016/10/9 0009.
 */
public class TestTagService extends Service {
    public List<TestTag> getAllTestTag(){
        return TestTag.dao.find(TestTag.SEARCH_FROM_TEST_TAG);
    }
}
