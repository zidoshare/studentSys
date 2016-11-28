package com.hudongwx.studentsys.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.model.Class;
import com.hudongwx.studentsys.model.*;
import com.hudongwx.studentsys.service.*;
import com.hudongwx.studentsys.util.RenderKit;
import com.jfinal.aop.Before;
import com.jfinal.ext.interceptor.POST;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Page;

import java.util.ArrayList;
import java.util.List;

/**
 * 补助管理
 * Created by wu on 2016/11/19.
 */
public class SubsidyController extends BaseController {
    public final int APPROV_STATUS_NO = 9;
    public final int APPROV_STATUS_ON = 10;
    public final int APPROV_STATUS_YET = 8;
    public SubsidyApplicationService subsidyApplicationService;
    public SubsidyClassInfoService subsidyClassInfoService;
    public ClassService classService;
    public UserRegionService userRegionService;
    public RegionService regionService;
    public StudentService studentService;

    @Override
    public void index() {
        super.index();
        Integer p = getParaToInt("p", 1);
        User user = getCurrentUser(this);
        Page<SubsidyApplication> salist = subsidyApplicationService.getSubsidyApplicationByApplicantId(user.getId(), p);
        setAttr("subsidyClasses", salist);
    }
    public void apply(){
        setMapping(mappingService.getMappingByUrl("/subsidyManager/apply"));
        super.index();
    }
    @Override
    public Mapping init() {
        return mappingService.getMappingByUrl("/subsidyManager");
    }
    public void historyManager(){
        setMapping(mappingService.getMappingByUrl("/subsidyManager/tagManager"));
        super.index();
    }

    /****************************申请表信息*******************************/
    /**
     * 添加申请表[需要前台的参数：sa (json格式的表格数据)]
     */
    @Before(POST.class)
    public void addApplication() {
        String subsidyApplication = getPara("sa");
        //// TODO: 2016/11/21 待获取json数据
    }

    /**
     * 删除申请表[需要前台的参数：无]
     */
    public void deleteAllApplication() {
        subsidyApplicationService._deleteAllSubsidyApplication();
    }

    /**
     * 删除申请表[需要前台的参数：aid（申请人id）,title (申请人指定的表名)]
     */
    public void deleteApplicantApplication() {
        boolean b = subsidyApplicationService._deleteSubsidyApplicationByAid(getPara("aid"), getPara("title"));
        if (b) {
            RenderKit.renderSuccess(this);
        } else {
            RenderKit.renderError(this);
        }
    }

    /**
     * 修改申请表[需要前台的参数：usa（新的json格式的申请表数据）]
     */
    public void updateApplication() {
        String usa = getPara("usa");
        //// TODO: 2016/11/23 获取前台json创建SubsidyApplication对象 
        SubsidyApplication application = new SubsidyApplication();
        subsidyApplicationService._updateSubsidyApplication(application);
    }

    /**
     * 获取申请表[需要前台的参数：aid （申请人id）]
     */
    public void getApplicantApplication() {
        Integer aid = getParaToInt("aid");
        if (aid == null) {
            RenderKit.renderError(this);
        } else {
            List<SubsidyApplication> salist = subsidyApplicationService.getSubsidyApplicationByApplicantId(aid);


            if (salist.size() != 0) {
                RenderKit.renderSuccess(this, JsonKit.toJson(salist));
            } else {
                RenderKit.renderError(this);
            }
        }
    }

    /**
     * 获取申请表[需要前台的参数：无（当前用户）]
     */
    public void getApproverApplication() {
        User user = getCurrentUser(this);
        List<SubsidyApplication> salist = subsidyApplicationService.getSubsidyApplicationByUserId(user.getId());
        if (salist.size() != 0) {
            RenderKit.renderSuccess(this, JsonKit.toJson(salist));
        } else {
            RenderKit.renderError(this, "当前用户没有需要审批的申请表信息！");
        }
    }

    /***************************申请班级信息******************************/

    /**
     * 添加补助班级信息[需要前台的参数：sci(json格式班级学生详情)]
     */
    @Before(POST.class)
    public boolean addSubsidyClassInfo() {
        String subsidyClassInfo = getPara("sci");
        SubsidyClassInfo sci = new SubsidyClassInfo();
        //// TODO: 2016/11/23 获取班级数据 
        String studentid = "";
        //// TODO: 2016/11/23 通过学生id checked状态统计信息
        return subsidyClassInfoService._saveSubsidyClassInfo(sci);
    }

    /**
     * 删除补助班级信息[需要前台的参数：classid(班级id),]
     */
    public void deleteSubsidyClassInfo() {
        Integer classId = getParaToInt("classId");
        if (classId == null) {
            RenderKit.renderError(this, "该班级不存在或已被删除");
            return;
        }
        subsidyClassInfoService._deleteSubsidyClassInfoByClassId(classId);
        subsidyApplicationService._deleteSubsidyApplicationByClassId(classId);
        RenderKit.renderSuccess(this, "删除成功");
    }

    /**
     * 修改补助班级信息[需要前台的参数：nsci(最新json格式班级学生详情)]
     */
    public boolean updateSubsidyClassInfo() {
        String subsidyClassInfo = getPara("nsci");
        SubsidyClassInfo sc = new SubsidyClassInfo();
        //// TODO: 2016/11/21 修改数据
        return subsidyClassInfoService._updateSubsidyClassInfo(sc);
    }

    /**
     * 获取正在申请的班级详情[需要前台的参数：classid(班级id)]
     */
    public void getSubsidyClassInfo() {
        List<SubsidyClassInfo> scList = subsidyClassInfoService.getSubsidyClassInfoById(getPara("classId"));
        if (scList.size() != 0) {
            String s = JsonKit.toJson(scList);
            RenderKit.renderSuccess(this, s);
        } else {
            RenderKit.renderError(this, "你所查找的数据不存在或已删除！");
        }
    }
    /**************************拓展功能区******************************/
    /**
     * 补助管理添加班级区块信息[需要前台的参数：无]
     */
    public void showRegion() {
        User user = getCurrentUser(this);
        List<UserRegion> urlist = userRegionService.getUserRegionInfoByUserId(user.getId());
        List<Region> areas = new ArrayList<>();
        if (urlist.size() <= 0) {
            RenderKit.renderError(this);
        } else {
            for (UserRegion ur : urlist) {
                areas.add(regionService.getRegionById(ur.getRegionId()).get(0));
            }
            if (areas.size() != 0) {
                RenderKit.renderSuccess(this, JsonKit.toJson(areas));
            } else {
                RenderKit.renderError(this);
            }
        }
    }

    /**
     * 补助管理添加班级区块信息[需要前台的参数：rid(区域id)]
     */
    public void showRegionClass() {
        Integer regionId = getParaToInt("id");
        if (regionId == null) {
            RenderKit.renderError(this);
        } else {
            List<Class> classList = classService.getClassByRegionId(regionId);
            if (classList.size() != 0) {
                RenderKit.renderSuccess(this, JsonKit.toJson(classList));
            } else {
                RenderKit.renderError(this);
            }
        }
    }

    public void addRegionSubsidyClass() {
        int id = 0;
        int totalsubsidyAmount = 0;
        int totalbonus = 0;
        String cidJsonArray = getPara("classId");
        System.out.println("==========cidJsonArray===========" + cidJsonArray);
        JSONArray jsonArray = JSON.parseArray(cidJsonArray);
        List<SubsidyClassInfo> sciList = subsidyClassInfoService.getAllSubsidyClassInfo();
        if (sciList.size() != 0) {
            for (SubsidyClassInfo subsidyClassInfo : sciList) {
                if (subsidyClassInfo.getApproveStatus() == APPROV_STATUS_NO) {
                    subsidyClassInfo.delete();
                }
            }
        }
        for (Object o : jsonArray) {
            System.out.println(o.toString());
            int cid = Integer.valueOf(o.toString());
            List<Student> studentList = studentService.getStudentByClassId(cid);
            for (Student student : studentList) {
                totalsubsidyAmount += student.getSubsidyPer();
                totalbonus += student.getBonus();
                setSubsidyClassInfo(++id, student);
            }
            setDefaultSubsidyApplicationInfo(totalsubsidyAmount, totalbonus, cid, studentList);
        }
        RenderKit.renderSuccess(this);
    }

    private void setSubsidyClassInfo(int id, Student student) {
        SubsidyClassInfo sci = new SubsidyClassInfo();
        sci.setId(++id);
        sci.setClassId(student.getClassId());
        sci.setClassName(student.getClassName());
        sci.setRegionId(student.getRegionId());
        sci.setStudentId(student.getId());
        sci.setStudentName(student.getName());
        sci.setSubsidyAmount(student.getSubsidyPer());
        sci.setBonus(student.getBonus());
        int n = student.getResidualFrequency();
        if (n >= 0) {
            sci.setResidualFrequency(n);
        }
        sci.setStatus(student.getStatus());
        sci.setApproveStatus(APPROV_STATUS_NO);
        sci.setRemark(student.getRemark());
        subsidyClassInfoService._saveSubsidyClassInfo(sci);
    }

    private void setDefaultSubsidyApplicationInfo(int totalsubsidyAmount, int totalbonus, int cid, List<Student> studentList) {
        User user = getCurrentUser(this);
        SubsidyApplication sa = new SubsidyApplication();
        sa.setApplicantId(user.getId());
        sa.setApplicantName(user.getUserNickname());
        sa.setApplicationDate(System.currentTimeMillis());
        sa.setRegionId(classService.getClassById(cid).getRegionId());
        sa.setClassId(cid);
        sa.setClassName(classService.getClassById(cid).getClassName());
        sa.setNumber(studentList.size());
        sa.setTotalSubsidy(totalsubsidyAmount);
        sa.setTotalBonus(totalbonus);
        sa.setAggregateAmount(totalsubsidyAmount + totalbonus);
        sa.setApproveStatus(APPROV_STATUS_NO);
        judgeAndAdd(user, sa);
        RenderKit.renderSuccess(this);
    }

    private void judgeAndAdd(User user, SubsidyApplication sa) {
        List<SubsidyApplication> applications = subsidyApplicationService.getAllApplications();
        if (applications.size() != 0) {
            boolean different = true;
            for (SubsidyApplication application : applications) {
                boolean judgeStatus = (sa.getApproveStatus().intValue() == application.getApproveStatus().intValue()) && (application.getApproveStatus().intValue() == 9);
                boolean judgeClassId = application.getClassId().intValue() == sa.getClassId().intValue();
                System.out.println(application.getClassId().intValue() + "++++++++++++++" + sa.getClassId().intValue());
                if (judgeClassId && judgeStatus) {
                    String className = classService.getClassById(sa.getClassId()).getClassName();
                    RenderKit.renderError(this, "你所选班级：" + className + "已在申请列表中请勿重复添加！");
                    different = false;
                    break;
                } else {
                    continue;
                }
            }
            if (different) {
                subsidyApplicationService._saveApplication(sa);
            }
        } else {
            subsidyApplicationService._saveApplication(sa);
        }

    }


}
