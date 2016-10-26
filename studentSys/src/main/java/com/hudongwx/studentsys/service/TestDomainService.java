package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.Domain;
import com.hudongwx.studentsys.util.Common;
import com.jfinal.plugin.activerecord.Page;

import java.util.List;

/**
 * Created by wuhongxu on 2016/10/13 0013.
 */
public class TestDomainService extends Service {
    public List<Domain> getAllDomains(){
        return Domain.dao.find(Domain.SEARCH_FROM_DOMAIN);
    }

    public Page<Domain> getAllDomains(int currentPage){
        return Domain.dao.paginate(currentPage, Common.MAX_PAGE_SIZE,Common.COMMON_SELECT,Domain.FROM_DQL+Common.ORDER_BY_ID_DESC);
    }
    public Domain getDomainById(Integer domainId) {
        return Domain.dao.findById(domainId);
    }
}
