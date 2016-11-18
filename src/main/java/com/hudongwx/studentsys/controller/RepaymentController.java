package com.hudongwx.studentsys.controller;

import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.model.*;
import com.hudongwx.studentsys.model.Class;
import com.hudongwx.studentsys.service.ClassService;
import com.hudongwx.studentsys.service.StudentService;
import com.hudongwx.studentsys.util.Common;
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
public class RepaymentController extends BaseController {
    public StudentService studentService;
    public ClassService classService;

    /**
     * @return 返回一级菜单的mapping
     */
    @Override
    public Mapping init() {
        return mappingService.getMappingByUrl("/repaymentManager");
    }

    public void index() {
        super.index();
        Integer p = getParaToInt("p");
        if (p == null || p < 1)
            p = 1;
        Page<Repayment> repaymentPage = Repayment.dao.paginate(p, Common.MAX_PAGE_SIZE, Common.COMMON_SELECT, Repayment.SQL_FROM + Common.ORDER_BY_ID_DESC);
        Map<String, Class> classMap = new HashMap<>();
        Map<String, Student> studentMap = new HashMap<>();
        Map<String, RepaymentType> typeMap = new HashMap<>();
        for (Repayment r : repaymentPage.getList()) {
            Integer studentId = r.getStudentId();
            Student student = studentService.getStudentById(studentId);
            Class aClass = classService.getClassByStudent(student);
            classMap.put(r.getId() + "", aClass);
            studentMap.put(r.getId() + "", student);
            RepaymentType type = RepaymentType.dao.findById(r.getType());
            typeMap.put(r.getId() + "", type);
        }
        setAttr("studentList", studentService.getAllStudent());
        setAttr("classList", classService.getAllClass());
        setAttr("typeList", RepaymentType.dao.find(RepaymentType.SEARCH_FROM_REPAYMENT_TYPE));
        setAttr("classMap", classMap);
        setAttr("studentMap", studentMap);
        setAttr("typeMap", typeMap);
        setAttr("repaymentPage", repaymentPage);
    }

    @Before(POST.class)
    public void postRepayment() {
        Repayment model = getModel(Repayment.class);
        if (model.getId() == null)
            if (model.save()) RenderKit.renderSuccess(this, "保存成功");
            else RenderKit.renderError(this, "保存成功");
        else if (model.update())
            RenderKit.renderSuccess(this, "修改成功");
        else RenderKit.renderError(this, "修改失败");
    }

    @Before(POST.class)
    public void deleteRepayment() {
        Integer rId = getParaToInt(0);
        if (rId != null)
            if (Repayment.dao.deleteById(rId))
                RenderKit.renderSuccess(this, "删除成功");
            else RenderKit.renderError(this, "删除成功");
        else RenderKit.renderError(this, "未找到该记录，可能已经被删除！");
    }
}
