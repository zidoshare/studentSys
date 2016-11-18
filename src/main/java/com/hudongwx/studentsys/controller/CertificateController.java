package com.hudongwx.studentsys.controller;

import com.alibaba.fastjson.JSONArray;
import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.model.Certificate;
import com.hudongwx.studentsys.model.Class;
import com.hudongwx.studentsys.model.Mapping;
import com.hudongwx.studentsys.model.Student;
import com.hudongwx.studentsys.service.*;
import com.hudongwx.studentsys.util.RenderKit;
import com.jfinal.aop.Before;
import com.jfinal.ext.interceptor.POST;
import com.jfinal.plugin.activerecord.Page;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wuhongxu on 2016/9/21 0021.
 */
public class CertificateController extends BaseController {
    public CertificateService certificateService;
    public StudentService studentService;
    public ClassService classService;

    /**
     * @return 返回一级菜单的mapping
     */
    @Override
    public Mapping init() {
        return mappingService.getMappingByUrl("/certificateManager");
    }

    public void index() {
        super.index();
        Integer p = getParaToInt("p", 1);
        Page<Certificate> allCertificates = certificateService.getAllCertificates(p);
        Map<String, Student> studentMap = new HashMap<>();
        Map<String, Class> classMap = new HashMap<>();
        for (Certificate c : allCertificates.getList()) {
            Student stu = studentService.getStudentById(c.getStudentId());
            studentMap.put(c.getId() + "", stu);
            classMap.put(c.getId() + "", classService.getClassByStudent(stu));
        }
        List<Student> allStudent = studentService.getAllStudent();
        setAttr("students", allStudent);
        setAttr("page", allCertificates);
        setAttr("studentMap", studentMap);
        setAttr("classMap", classMap);
    }
    @Before(POST.class)
    public void postCertificate() {
        Certificate model = getModel(Certificate.class);
        if (model.getId() != null) {
            model.update();
        } else
            model.save();
        RenderKit.renderSuccess(this, "保存成功");
    }
    @Before(POST.class)
    public void deleteCertificate() {
        Integer id = getParaToInt(0);
        boolean b = Certificate.dao.deleteById(id);
        if(b){
            RenderKit.renderSuccess(this,"删除成功");
        }else
            RenderKit.renderError(this,"删除失败，未找到该记录");
    }
}
