package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.Domain;

import java.util.List;

/**
 * Created by wuhongxu on 2016/10/13 0013.
 */
public class TestDomainService extends Service {
    public List<Domain> getAllDomains(){
        return Domain.dao.find(Domain.SEARCH_FROM_DOMAIN);
    }

    public Domain getDomainById(Integer domainId) {
        return Domain.dao.findById(domainId);
    }
}
