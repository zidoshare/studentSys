package com.hudongwx.studentSys.service;

import com.hudongwx.studentSys.common.Service;
import com.hudongwx.studentSys.exceptions.ServiceException;
import com.hudongwx.studentSys.model.Mapping;
import com.hudongwx.studentSys.util.Common;
import com.hudongwx.studentSys.util.StrPlusKit;
import com.jfinal.log.Log;
import com.jfinal.plugin.ehcache.CacheKit;

import java.util.List;

/**
 * Created by wuhongxu on 2016/9/2 0002.
 */
public class MappingService extends Service {
    private Log log = Log.getLog(getClass());
    public List<Mapping> getMappings(){
        return Mapping.dao.findByCache(Common.CACHE_FOEVER_LABEL, "mappingTree", "select * from stumanager_mapping");
    }
    public boolean _saveMappings(List<Mapping> mappings) {
        try {
            packingMappings(mappings);

            //神玩法....以前从来不知道有这种用法...真神奇
            mappings.forEach(Mapping::save);

            List<Mapping> mappingTree = CacheKit.get(Common.CACHE_FOEVER_LABEL, "mappingTree");
            mappingTree.addAll(mappings);
            CacheKit.put(Common.CACHE_FOEVER_LABEL,"mappingTree",mappingTree);
            return true;
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        return false;
    }
    public void _saveMapping(Mapping mappingNode){
        try {
            packingMapping(mappingNode);
            mappingNode.save();
            List<Mapping> mappingTree = CacheKit.get(Common.CACHE_FOEVER_LABEL, "mappingTree");
            mappingTree.add(mappingNode);
            CacheKit.put(Common.CACHE_FOEVER_LABEL,"mappingTree",mappingTree);
        } catch (ServiceException e) {
            e.printStackTrace();
        }

    }
    public void _deleteMapping(Mapping mapping){
        mapping.delete();
        List<Mapping> mappingTree = CacheKit.get(Common.CACHE_FOEVER_LABEL, "mappingTree");
        mappingTree.remove(mapping);
        CacheKit.put(Common.CACHE_FOEVER_LABEL,"mappingTree",mappingTree);
    }
    public void _updateMapping(Mapping mapping){
        mapping.update();
    }
    public void packingMapping(Mapping mapping) throws ServiceException {
        if(StrPlusKit.isEmpty(mapping.getTitle()))
            throw new ServiceException("mapping's title cannot be null or \"\"");
        if(StrPlusKit.isEmpty(mapping.getUrl()))
            throw new ServiceException("mapping's url cannot be null or \"\"");
        if(StrPlusKit.isEmpty(mapping.getIcon()))
            throw new ServiceException("mapping's icon cannot be null or \"\"");
        if(mapping.getId() == null || mapping.getId() == 0)
            mapping.setId(System.currentTimeMillis());
    }
    public void packingMappings(List<Mapping> mappings) throws ServiceException {
        for(Mapping mapping : mappings){
            packingMapping(mapping);
        }
    }


}
