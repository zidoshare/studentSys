package com.hudongwx.studentSys.service;

import com.hudongwx.studentSys.common.Service;
import com.hudongwx.studentSys.exceptions.ServiceException;
import com.hudongwx.studentSys.model.Mapping;
import com.hudongwx.studentSys.util.StrPlusKit;
import com.jfinal.log.Log;

import java.util.List;

/**
 * Created by wuhongxu on 2016/9/2 0002.
 */
public class MappingService extends Service {
    private Log log = Log.getLog(getClass());
    public List<Mapping> getMappings(){
        return Mapping.dao.find("select * from stumanager_mapping");
    }
    public boolean _saveMapping(Mapping mapping){
        try {
            packingMaping(mapping);
            mapping.save();
            return true;
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        return false;
    }
    public boolean _saveMappings(List<Mapping> mappings) {
        try {
            packingMappings(mappings);

            //神用法....以前从来不知道有这种用法...真神奇
            mappings.forEach(Mapping::save);
            return true;
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        return false;
    }
    public void packingMaping(Mapping mapping) throws ServiceException {
        if(StrPlusKit.isEmpty(mapping.getTitle()))
            throw new ServiceException("mapping's title cannot be null or \"\"");
        if(StrPlusKit.isEmpty(mapping.getHref()))
            throw new ServiceException("mapping's href cannot be null or \"\"");
        if(StrPlusKit.isEmpty(mapping.getIcon()))
            throw new ServiceException("mapping's icon cannot be null or \"\"");
        mapping.setId(System.currentTimeMillis());
    }
    public void packingMappings(List<Mapping> mappings) throws ServiceException {
        for(Mapping mapping : mappings){
            packingMaping(mapping);
        }
    }
}
