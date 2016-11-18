package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.Domain;
import com.hudongwx.studentsys.model.DomainTag;
import com.hudongwx.studentsys.model.TestTag;

import java.util.List;

/**
 * Created by wuhongxu on 2016/10/13 0013.
 */
public class TestDomainTagService extends Service {
    public String getTagsStrByDomain(Domain domain){

        List<DomainTag> domainTags = null;
        if(domain.getId()!=0)
            domainTags = DomainTag.dao.find(DomainTag.SEARCH_FROM_DOMAIN_TAG+"where domainId = ?",domain.getId());
        else
            domainTags = DomainTag.dao.find(DomainTag.SEARCH_FROM_DOMAIN_TAG);
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

    public boolean _saveDomainTag(Domain domain, TestTag tag) {
        if(getByDomainTag(domain,tag) == null){
            DomainTag dt = new DomainTag();
            dt.setDomainId(domain.getId());
            dt.setTagId(tag.getId());
            return dt.save();
        }
        return true;
    }

    private DomainTag getByDomainTag(Domain domain, TestTag tag) {
        return DomainTag.dao.findFirst(DomainTag.SEARCH_FROM_DOMAIN_TAG+"where domainId = ? and tagId = ?",domain.getId(),tag.getId());
    }
}
