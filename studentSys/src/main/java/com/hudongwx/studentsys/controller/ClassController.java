package com.hudongwx.studentsys.controller;

import com.alibaba.fastjson.JSONArray;
import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.model.Class;
import com.hudongwx.studentsys.model.Mapping;
import com.hudongwx.studentsys.model.User;
import com.hudongwx.studentsys.service.ClassService;
import com.hudongwx.studentsys.service.StudentService;
import com.hudongwx.studentsys.service.UserService;
import com.hudongwx.studentsys.util.ASMKit;
import com.hudongwx.studentsys.util.RenderKit;
import com.hudongwx.studentsys.util.TableComment;
import com.hudongwx.studentsys.util.TableCommentMapping;
import com.jfinal.aop.Before;
import com.jfinal.ext.interceptor.POST;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Table;
import com.jfinal.plugin.activerecord.TableMapping;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wuhongxu on 2016/10/17 0017.
 */
public class ClassController extends BaseController {
    public ClassService classService;
    public StudentService studentService;
    public UserService userService;



    public void index() {
        super.index();
        Integer p = getParaToInt("p", 1);
        Page<Class> allClass = classService.getAllClass(p);
        setAttr("classes", allClass);
    }

    /**
     * @return 返回一级菜单的mapping
     */
    @Override
    public Mapping init() {
        return mappingService.getMappingByUrl("/classManager");
    }

    @Before(POST.class)
    public void addClass() {
        Class model = getModel(Class.class);
        boolean flag;
        if (model.getId() == null)
            flag = model.save();
        else {
            flag = model.update();
        }

        if (!flag) {
            RenderKit.renderError(this, "保存班级失败");
            return;
        }
        RenderKit.renderSuccess(this, "保存班级成功");
    }

    @Before(POST.class)
    public void deleteClass() {
        Integer id = getParaToInt(0);
        if (id == null) {
            RenderKit.renderError(this, "该班级不存在或已被删除");
            return ;
        }
        Class aClass = classService.getClassById(id);
        if (aClass == null) {
            RenderKit.renderError(this, "该班级不存在或已被删除");
            return ;
        }
        aClass.delete();
        RenderKit.renderSuccess(this,"删除成功");
    }
}
