package com.hudongwx.studentsys.service;

import com.alibaba.fastjson.JSONArray;
import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.TestTag;
import com.hudongwx.studentsys.model.TestType;
import com.hudongwx.studentsys.util.Common;
import com.hudongwx.studentsys.util.ObjectKit;

import java.util.List;

/**
 * Created by wuhongxu on 2016/10/9 0009.
 */
public class TestTypeService extends Service {
    public List<TestType> getAllVisibleTypes(){
        return TestType.dao.find(TestType.SEARCH_FROM_TEST_TYPE+"where testQuestionIsVisible = ?", Common.VALUE_VISIBLE);
    }

    public TestType getTypeById(Integer typeId) {
        if(typeId == null)
            return null;
        return TestType.dao.findById(typeId);
    }

    public List<TestType> getTypesByJSONArray(JSONArray array) {
        String str = ObjectKit.getStrByJSONArray(array);
        return TestType.dao.find(TestType.SEARCH_FROM_TEST_TYPE+"where id in "+str);
    }
}
