package com.hudongwx.studentsys.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.exceptions.ServiceException;
import com.hudongwx.studentsys.model.*;
import com.hudongwx.studentsys.service.RegionService;
import com.hudongwx.studentsys.service.UserRegionService;
import com.hudongwx.studentsys.service.UserService;
import com.hudongwx.studentsys.util.*;
import com.jfinal.aop.Before;
import com.jfinal.aop.Clear;
import com.jfinal.ext.interceptor.POST;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wuhongxu on 2016/8/30 0030.
 */
public class UserController extends BaseController {
    public UserService userService;
    public RegionService regionService;
    public UserRegionService userRegionService;

    @Override
    public void index() {
        super.index();
        List<Role> roles = roleService.getRoles();
        setAttr("roles", roles);
        Map<String, List<User>> map = new HashMap<>();
        for (Role role : roles) {
            map.put(role.getName(), userService.getUsersByRole(role));
        }
        setAttr("roleMap", map);
        List<Region> regionList = regionService.getAllRegions();
        setAttr("regionList", regionList);

    }

    /**
     * @return 返回一级菜单的mapping
     */
    @Override
    public Mapping init() {
        return mappingService.getMappingByUrl("/userManager");
    }

    @Clear
    @Before(POST.class)
    public void login() {
        String account = getPara("account");
        String password = getPara("password");

        User user = userService.validate(account, password);
        if (null != user) {
            setSessionAttr("user", user);

            RenderKit.renderSuccess(this, "登录成功," + account + " " + password);
        } else
            RenderKit.renderError(this, "账号或密码错误");
    }

    @Clear
    public void showLogin() {
        fillHeaderAndFooter();
        fillOutLink();
        render("/user/login.ftl");
    }

    @Before(POST.class)
    public void addRole() throws ServiceException {
        Role model = getModel(Role.class);
        if (model.getId() != null) {
            if (roleService._updateRole(model)) {
                RenderKit.renderSuccess(this);
                return;
            }
            RenderKit.renderError(this);
        } else {
            if (roleService._saveRole(model)) {
                RenderKit.renderSuccess(this);
                return;
            }
            RenderKit.renderError(this);
        }
    }

    @Before(POST.class)
    public void addUser() throws ServiceException {
        User user = getModel(User.class);
        if (userService._saveUser(user)) {
            String regionData = user.getRegionData();
            if (regionData != null) {
                String[] array = regionData.split(",");
                for (String s : array) {
                    if (MyKit.isNumber(s)) {
                        UserRegion ur = new UserRegion();
                        ur.setUserId(user.getId());
                        ur.setRegionId(Integer.valueOf(s));
                        userRegionService._saveRoleRegion(ur);
                    }
                }
            }
            RenderKit.renderSuccess(this, "用户添加成功！");
            return;
        }
        RenderKit.renderError(this, "用户添加失败！");
    }

    @Clear
    public void loginOut() {
        setSessionAttr("user", null);
        redirect("/");
    }

    public void showAllPermissons() {
        Integer id = getParaToInt(0);
        if (id == null) {
            RenderKit.renderError(this);
            return;
        }
        ArrayTree<Mapping> tree = mappingService.getTree();
        Role role = roleService.getRoleById(id);
        List<String> ids = roleService.getPermitMappingIds(role);
        final JSONArray jsonArray = new JSONArray();
        tree.checkTreePreorder(now -> {
            if (now == tree.root())
                return true;
            JSONObject json = new JSONObject();
            json.put(Common.LABEL_ID, now.getId());
            json.put(Mapping.LABEL_ICON, now.getIcon());
            json.put(Mapping.LABEL_TITLE, now.getTitle());
            json.put(Mapping.LABEL_URL, now.getUrl());
            json.put(Mapping.LABEL_CHILD_COUNT, now.getChildCount());
            json.put("isChecked", ids.contains(String.valueOf(now.getId())));
            jsonArray.add(json);
            return true;
        });
        log.info(jsonArray.toString());
        RenderKit.renderSuccess(this, jsonArray.toString());
    }

    public void showPermissions() {
        String id = getPara(0);
        ArrayTree<Mapping> tree = mappingService.getTree();
        Mapping parent = null;
        if (StrPlusKit.isEmpty(id))
            parent = tree.root();
        else
            parent = mappingService.getMappingById(Integer.valueOf(id));
        log.info(parent.getTitle());
        final JSONArray jsonArray = new JSONArray();
        Mapping finalParent = parent;
        tree.checkTree(parent, now -> {
            if (now == finalParent)
                return true;
            JSONObject json = new JSONObject();
            json.put(Common.LABEL_ID, now.getId());
            json.put(Mapping.LABEL_ICON, now.getIcon());
            json.put(Mapping.LABEL_TITLE, now.getTitle());
            json.put(Mapping.LABEL_URL, now.getUrl());
            json.put(Mapping.LABEL_CHILD_COUNT, now.getChildCount());
            jsonArray.add(json);
            return false;
        });
        log.info(jsonArray.toString());
        RenderKit.renderSuccess(this, jsonArray.toString());
        /*Map<String,List<Mapping>> map = new HashMap<>();
        tree.checkTree(now -> {
            map.put(now.getId()+"",new ArrayList<Mapping>());
            if(now.getParent() == null)
                return true;
            List<Mapping> mappings = map.get(now.getParent().getId() + "");
            mappings.add(now);
            return true;
        });
        setAttr("map",map);
        setAttr("root",tree.root());
        render("/userManager/showAllPermission.ftl");*/
    }
}
