package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.exceptions.ServiceException;
import com.hudongwx.studentsys.model.Mapping;
import com.hudongwx.studentsys.model.Role;
import com.hudongwx.studentsys.util.Common;
import com.hudongwx.studentsys.util.StrPlusKit;
import com.jfinal.log.Log;
import com.jfinal.plugin.ehcache.CacheKit;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by wuhongxu on 2016/9/5 0005.
 */
public class RoleService extends Service {
    private Log log = Log.getLog(RoleService.class);
    private MappingService mappingService;
    public List<Role> getRoles(){
        return Role.dao.findByCache(Common.CACHE_FOEVER_LABEL,"roles","select * from stumanager_role");
    }
    public String[] getpermitMappingIds(Role role){
        return role.getTreeData().split(":");
    }
    public Role getRoleByName(String roleName){
        List<Role> roles = Role.dao.find("select * from stumanager_role");
        if(roles.isEmpty())
            return null;
        Role role = roles.get(0);
        return role;
    }
    public void putAllowMapping(Role role,long mappingId){
        if(role.allowMappings == null)
            role.allowMappings = new ArrayList<>();
        Mapping mapping = Mapping.dao.findById(mappingId);
        if(mapping == null)
            return ;
        role.allowMappings.add(mapping);
    }
    public void _updateRole(Role role){
        role.update();
    }
    public void putAllowMapping(Role role,Mapping mapping){
        if(role.allowMappings == null)
            role.allowMappings = new ArrayList<>();
        role.allowMappings.add(mapping);
    }
    public void _saveRole(Role role){
        try {
            packingRole(role);
            role.save();
            List<Role> roles = getRoles();
            roles.add(role);
            CacheKit.put(Common.CACHE_FOEVER_LABEL,"roles",roles);
        } catch (ServiceException e) {
            e.printStackTrace();
        }
    }
    public void _deleteRole(Role role){
        role.delete();
        List<Role> roles = getRoles();
        roles.remove(role);
        CacheKit.put(Common.CACHE_FOEVER_LABEL,"roles",roles);
    }
    public void packingRole(Role role) throws ServiceException {
        if(StrPlusKit.isEmpty(role.getName()))
            throw new ServiceException("role's name cannot be null or \"\"");
        if(StrPlusKit.isEmpty(role.getTreeData()))
            throw new ServiceException("role's data cannot be null or \"\"");
        role.setId(System.currentTimeMillis());
        role.setMemberCnt(0);
    }
    public List<Mapping> getRoleTree(Role role){
        String[] strs = getpermitMappingIds(role);
        List<Mapping> allowMappingIds = role.allowMappings;
        if(allowMappingIds != null)
            return allowMappingIds;
        List<Mapping> list = new ArrayList<>();
        for(int i = 0; i < strs.length; i++){
            list.add(Mapping.dao.findById(Long.valueOf(strs[i])));
        }
        role.allowMappings = list;
        return list;
    }
    public void putRoleTree(Role role,List<Mapping> list){
        List<Mapping> mappings = mappingService.getMappings();
        List<Mapping> list1 = new ArrayList<>(list);
        String str = "";
        for(Mapping mapping:mappings){
            for(Mapping mapping1:list1){
                if(mapping.getId().longValue() == mapping1.getId().longValue()){
                    str+=mapping.getId()+":";
                    list1.remove(mapping1);
                    break;
                }
            }
        }
        if(str.length()>0)
            str = str.substring(0,str.length()-1);
        role.allowMappings = list;
        role.setTreeData(str);
    }
}
