package com.hudongwx.studentsys.controller;

import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.model.Mapping;
import com.hudongwx.studentsys.model.Student;
import com.hudongwx.studentsys.model.StudentEmployment;
import com.hudongwx.studentsys.service.StudentEmploymentService;
import com.hudongwx.studentsys.service.StudentService;
import com.hudongwx.studentsys.util.RenderKit;
import com.jfinal.aop.Before;
import com.jfinal.ext.interceptor.POST;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Page;

import java.util.List;

/**
 * Created by wu on 2016/11/22.
 */
public class StudentEmploymentController extends BaseController {

    public StudentEmploymentService studentEmploymentService;
    public StudentService studentService;

    @Override
    public void index() {
        super.index();
    }

    @Override
    public Mapping init() {
        return mappingService.getMappingByUrl("/StudentEmploymentManager");
    }

    /****************************就业信息*******************************/
    /**
     * 添加追踪记录[需要前台的参数：oe(json数据类型的追踪信息)]
     */
    @Before(POST.class)
    public void addStuEmpInfo() {
        String obtainEmployment = getPara("oe");
        //// TODO: 2016/11/21 待获取json数据
    }

    /**
     * 删除指定的记录[需要前台的参数：seid(区域id)]
     */
    public void deleteStuEmpInfo() {
        Integer seid = getParaToInt("seid");
        if (seid == null) {
            RenderKit.renderError(this);
        } else {
            boolean b = studentEmploymentService._deleteStuEmpById(seid);
            if (b) {
                RenderKit.renderSuccess(this);
            } else {
                RenderKit.renderError(this, "刪除失败！");
            }
        }
    }

    /**
     * 删除所有记录
     */
    public void deleteAllStuEmpInfo() {
        studentEmploymentService._deleteAllStuEmp();
    }

    /**
     * 修改记录状态
     */
    public boolean updateStuEmpInfo() {
        String obtainEmployment = getPara("se");
        StudentEmployment se = new StudentEmployment();
        //// TODO: 2016/11/21 获取json修改数据
        return studentEmploymentService._updateStuEmp(se);
    }

    /**
     * 获取指定id的就业信息
     */
    public void getStuEmpInfo() {
        Integer seId = getParaToInt("seId");
        if (seId == null) {
            RenderKit.renderError(this);
        } else {
            List<StudentEmployment> seList = studentEmploymentService.getStuEmpById(seId);
            if (seList.size() != 0) {
                RenderKit.renderSuccess(this, JsonKit.toJson(seList));
            } else {
                RenderKit.renderError(this, "你查询的信息不存在或已删除！");
            }
        }
    }

    /********************************
     * 未就业
     *******************************/

    public void getUnEmpInfo() {
        Integer p = getParaToInt("p", 1);
        Page<Student> UnEmpStuP = studentService.getUnEmpStu(p);
        setAttr("UnEmpStuP", UnEmpStuP);
    }


}
