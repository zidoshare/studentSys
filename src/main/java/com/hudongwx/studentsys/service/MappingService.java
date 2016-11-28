package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.exceptions.ServiceException;
import com.hudongwx.studentsys.model.Mapping;
import com.hudongwx.studentsys.util.ArrayTree;
import com.hudongwx.studentsys.util.Common;
import com.hudongwx.studentsys.util.StrPlusKit;
import com.jfinal.log.Log;
import com.jfinal.plugin.ehcache.CacheKit;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by wuhongxu on 2016/9/2 0002.
 */
public class MappingService extends Service {
    private Log log = Log.getLog(getClass());

    /*//私有化构造函数
    private MappingService(){}

    private static MappingService mappingService = new MappingService();
    public static MappingService create(){
        return mappingService;
    }*/
    public ArrayTree<Mapping> getTree() {
        ArrayTree<Mapping> mappingTree = CacheKit.get(Common.CACHE_60TIME_LABEL, "mappingTree");
        if (mappingTree == null) {
            //查询持久化之后的树
            List<Mapping> mappings = Mapping.dao.find("select * from stumanager_mapping");
            //------------装载树--------------
            mappingTree = new ArrayTree<>();
            for (Mapping m : mappings) {
                for (Mapping mp : mappings) {
                    if (mp.getId().equals(m.getParentId()))
                        m.setParent(mp);
                    else if (mp.getId().equals(m.getLeftChildId()))
                        m.setLeftChild(mp);
                    else if (mp.getId().equals(m.getNextSiblingId()))
                        m.setNextSibling(mp);
                }
                //要实现ArrayTree的遍历，必须将树根放置于首位
                if (m.getTitle().equals("根目录"))
                    mappingTree.addGoodNode(0, m);
                else
                    mappingTree.addGoodNode(m);
            }
            //------------装载完成--------------
            //加入缓存
            CacheKit.put(Common.CACHE_60TIME_LABEL, "mappingTree", mappingTree);
        }
        return mappingTree;
    }

    public Mapping getMappingById(Integer id) {
        List<Mapping> list = getTree().getList();
        for (Mapping mp : list) {
            if (mp.getId().equals(id))
                return mp;
        }
        return null;
    }

    public Mapping getMappingByUrl(String url) {
        List<Mapping> list = getTree().getList();
        for (Mapping mp : list) {
            if (mp.getUrl().equals(url))
                return mp;
        }
        return null;
    }

    public Mapping getMappingByTitle(String title) {
        List<Mapping> list = getTree().getList();
        for (Mapping mp : list) {
            if (mp.getTitle().equals(title))
                return mp;
        }
        return null;
    }

    public boolean _saveMappings(List<Mapping> mappings) throws ServiceException {
        packingMappings(mappings);

        //神玩法....以前从来不知道有这种用法...真神奇
        mappings.forEach(Mapping::save);

        List<Mapping> mappingTree = CacheKit.get(Common.CACHE_FOREVER_LABEL, "mappingTree");
        if (null == mappingTree)
            mappingTree = new ArrayList<>();
        mappingTree.addAll(mappings);
        CacheKit.put(Common.CACHE_FOREVER_LABEL, "mappingTree", mappingTree);
        return true;
    }

    public boolean _saveMapping(Mapping mappingNode) throws ServiceException {
        boolean x = false;
        packingMapping(mappingNode);
        x = mappingNode.save();
        List<Mapping> mappingTree = CacheKit.get(Common.CACHE_FOREVER_LABEL, "mappingTree");
        mappingTree.add(mappingNode);
        CacheKit.put(Common.CACHE_FOREVER_LABEL, "mappingTree", mappingTree);
        return x;
    }

    public void _deleteMapping(Mapping mapping) {
        mapping.delete();
        List<Mapping> mappingTree = CacheKit.get(Common.CACHE_FOREVER_LABEL, "mappingTree");
        mappingTree.remove(mapping);
        CacheKit.put(Common.CACHE_FOREVER_LABEL, "mappingTree", mappingTree);
    }

    public void _updateMapping(Mapping mapping) {
        mapping.update();
    }

    public void packingMapping(Mapping mapping) throws ServiceException {
        if (StrPlusKit.isEmpty(mapping.getTitle()))
            throw new ServiceException("mapping's title cannot be null or \"\"");
        if (StrPlusKit.isEmpty(mapping.getUrl()))
            throw new ServiceException("mapping's url cannot be null or \"\"");
    }

    public void packingMappings(List<Mapping> mappings) throws ServiceException {
        for (Mapping mapping : mappings) {
            packingMapping(mapping);
        }
    }

    public Mapping getBaseMenu(Mapping mapping) {
        while (mapping != null && mapping.getFunction() < Mapping.FUNCTION_MENUITEM) {
            mapping = mapping.getParent();
        }
        return mapping;
    }

}
