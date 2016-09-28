package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.exceptions.ServiceException;
import com.hudongwx.studentsys.model.Mapping;
import com.hudongwx.studentsys.model.Role;
import com.hudongwx.studentsys.util.ArrayTree;
import com.hudongwx.studentsys.util.Common;
import com.hudongwx.studentsys.util.StrPlusKit;
import com.jfinal.log.Log;
import com.jfinal.plugin.ehcache.CacheKit;

import java.util.*;

/**
 * Created by wuhongxu on 2016/9/5 0005.
 */
public class RoleService extends Service {
    private Log log = Log.getLog(RoleService.class);
    private MappingService mappingService;

    public List<Role> getRoles() {
        return Role.dao.find(Role.SEARCH_FROM_ROLE);
        //暂时取消缓存
        //return Role.dao.findByCache(Common.CACHE_FOREVER_LABEL, "roles", "select * from stumanager_role");
    }

    public List<String> getpermitMappingIds(Role role) {
        List<String> ids = new LinkedList<>();
        String[] split = role.getTreeData().split(":");
        for(String s : split)
            ids.add(s);
        return ids;
    }

    public Role getRoleByName(String roleName) {
        List<Role> roles = Role.dao.find("select * from stumanager_role where name = ?", roleName);
        if (roles.isEmpty())
            return null;
        Role role = roles.get(0);
        return role;
    }

    public void putAllowMapping(Role role, int mappingId) {
        if (role.allowTree == null)
            role.allowTree = new ArrayTree<>();
        Mapping mapping = mappingService.getMappingById(mappingId);
        if (mapping == null)
            return;
        role.allowTree.addGoodNode(mapping);
    }

    public void _updateRole(Role role) {
        role.update();
    }

    public void putAllowMapping(Role role, Mapping mapping) {
        if (role.allowTree == null)
            role.allowTree = new ArrayTree<>();
        role.allowTree.addGoodNode(mapping);
    }

    public void _saveRole(Role role) {
        try {
            packingRole(role);
            role.save();
           /* List<Role> roles = getRoles();
            roles.add(role);
            CacheKit.put(Common.CACHE_FOREVER_LABEL, "roles", roles);*/
        } catch (ServiceException e) {
            e.printStackTrace();
        }
    }

    public void _deleteRole(Role role) {
        role.delete();
        /*List<Role> roles = getRoles();
        roles.remove(role);
        CacheKit.put(Common.CACHE_FOREVER_LABEL, "roles", roles);*/
    }

    public void packingRole(Role role) throws ServiceException {
        if (StrPlusKit.isEmpty(role.getName()))
            throw new ServiceException("role's name cannot be null or \"\"");
        if (StrPlusKit.isEmpty(role.getTreeData()))
            throw new ServiceException("role's data cannot be null or \"\"");
        role.setMemberCnt(0);
    }
    public ArrayTree<Mapping> getRoleTree(final Role role) {
        if(role.allowTree != null)
            return role.allowTree;
        List<String> ids = getpermitMappingIds(role);
        ArrayTree<Mapping> tree = mappingService.getTree();
        //依附查找
        ArrayTree<Mapping> roleTree = new ArrayTree<>();
        /* 效率太低，废弃
        for(String id : ids){
            Mapping mapping = mappingService.getMappingById(Integer.valueOf(id));
            roleTree.addGoodNode(mapping);
        }*/
        //需要严格遵守顺序
        tree.checkTree(now -> {
            Integer id = Integer.valueOf(ids.get(0));
            if(id.equals(now.getId())){
                roleTree.addGoodNode(now);
                ids.remove(0);
                return true;
            }
            return false;
        });
        role.allowTree = roleTree;
        return roleTree;
    }

    public void putRoleTree(Role role, ArrayTree<Mapping> tree) {
        String str = "";
        List<Mapping> list = tree.getList();
        for (Mapping mapping : list) {
            str += mapping.getId() + ":";
        }
        if (str.length() > 0)
            str = str.substring(0, str.length() - 1);
        role.allowTree = tree;
        role.setTreeData(str);
    }
}
