package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.TestType;

import java.util.List;

/**
 * Created by wuhongxu on 2016/10/9 0009.
 */
public class TestTypeService extends Service {
    public List<TestType> getAllTestTypes(){
        return TestType.dao.find(TestType.SEARCH_FROM_TEST_TYPE);
    }

    public TestType getTypeById(Integer typeId) {
        return TestType.dao.findById(typeId);
    }
}
