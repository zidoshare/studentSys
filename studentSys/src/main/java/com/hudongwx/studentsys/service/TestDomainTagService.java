package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.Domain;
import com.hudongwx.studentsys.model.DomainTag;

import java.util.List;

/**
 * Created by wuhongxu on 2016/10/13 0013.
 */
public class TestDomainTagService extends Service {
    public String getTagsStrByDomain(Domain domain){
        List<DomainTag> domainTags = DomainTag.dao.find(DomainTag.SEARCH_FROM_DOMAIN_TAG+"where domainId = ?",domain.getId());
        StringBuilder str = new StringBuilder("(");
        for(DomainTag dt : domainTags){
            str.append(dt.getTagId()).append(",");
        }
        if(str.length() > 1)
            str.deleteCharAt(str.length() - 1);
        else
            str.append("0");
        str.append(")");
        return str.toString();
    }
}
