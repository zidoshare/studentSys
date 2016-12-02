package com.hudongwx.studentsys.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.model.Class;
import com.hudongwx.studentsys.model.*;
import com.hudongwx.studentsys.service.*;
import com.hudongwx.studentsys.util.ModelKit;
import com.hudongwx.studentsys.util.RenderKit;
import com.jfinal.aop.Before;
import com.jfinal.ext.interceptor.POST;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Page;

import java.lang.reflect.InvocationTargetException;
import java.util.*;

/**
 * 补助管理
 * Created by wu on 2016/11/19.
 */
public class SubsidyController extends BaseController {
    public final int APPROV_STATUS_NO = 9;
    public final int APPROV_STATUS_ON = 10;
    public final int APPROV_STATUS_YET = 8;
    public final int CHECKED = 11;
    public final int UN_CHECKED = 12;
    public SubsidyApplicationService subsidyApplicationService;
    public SubsidyClassInfoService subsidyClassInfoService;
    public ClassService classService;
    public UserRegionService userRegionService;
    public RegionService regionService;
    public StudentService studentService;
    public UserService userService;

    @Override
    public void index() {
        super.index();
        Integer p = getParaToInt("p", 1);
        User user = getCurrentUser(this);
        Page<SubsidyApplication> saList = subsidyApplicationService.getSubsidyApplicationByApplicantId(user.getId(), p);
        setAttr("subsidyClasses", saList);
        List<Role> roleList = roleService.getRoleByMapping(mappingService.getMappingByUrl("/approvalManager"));
        List<User> userList = new ArrayList<>();
        if (roleList.size() != 0) {
            for (Role role : roleList) {
                List<User> users = userService.getUsersByRoleId(role);
                for (User user1 : users) {
                    userList.add(user1);
                }
            }
        }
        setAttr("roles", userList);
    }


    @Override
    public Mapping init() {
        return mappingService.getMappingByUrl("/subsidyManager");
    }

    public void historyManager() {
        setMapping(mappingService.getMappingByUrl("/subsidyManager/historyManager"));
        super.index();
        User user = getCurrentUser(this);
        Integer p = getParaToInt("p", 1);
        Page<SubsidyApplication> saPages = subsidyApplicationService.getSubsidyApplicationHistoryByUserId(p, user.getId());
        setAttr("saPages", saPages);
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
    public void addSubsidyClassInfo() {

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
    public void updateSubsidyClassInfo() throws InvocationTargetException, NoSuchMethodException, InstantiationException, IllegalAccessException {
        List<SubsidyClassInfo> sciList = ModelKit.injectList(SubsidyClassInfo.class, this, "list", getParaToInt("length"));
        Integer classId = sciList.get(0).getClassId();
        long date = sciList.get(0).getApplicationDate();
        List<SubsidyClassInfo> allSciList = subsidyClassInfoService.getSubsidyClassInfoByClassId(classId);
        dealCheckedSci(sciList, allSciList);
        updateApplication(sciList.size(),classId,date);
        RenderKit.renderSuccess(this, "更新成功！");
    }


    private void dealCheckedSci(List<SubsidyClassInfo> sciList, List<SubsidyClassInfo> allSciList) {
        for (SubsidyClassInfo subsidyClassInfo : allSciList) {
            int classId = subsidyClassInfo.getClassId();
            int studentId = subsidyClassInfo.getStudentId();
            long date = subsidyClassInfo.getApplicationDate();
            boolean checked=false;
            int bonus = 0;
            for (SubsidyClassInfo sci : sciList) {
                int cid = sci.getClassId();
                int studentId1 = sci.getStudentId();
                long date1 = sci.getApplicationDate();
                if (cid == classId && date == date1 && studentId==studentId1) {
                    bonus=sci.getBonus();
                    checked=true;
                }
            }
            if(!checked){
                subsidyClassInfo.setChecked(UN_CHECKED);
            }else {
                subsidyClassInfo.setBonus(bonus);
                subsidyClassInfo.setChecked(CHECKED);
            }
            subsidyClassInfoService._updateSubsidyClassInfo(subsidyClassInfo);
        }
    }


    private void updateApplication(int num , Integer classId, Long date) {
        int totalBonus = 0;
        int totalSubsidy = 0;
        List<SubsidyClassInfo> sciList = subsidyClassInfoService.getSciGroup(classId,date, CHECKED);
        for (SubsidyClassInfo sci : sciList) {
            totalBonus += sci.getBonus();
            System.out.println("totalBonus="+totalBonus);
            totalSubsidy += sci.getSubsidyAmount();
        }
        setApplicationAttr(num,classId,date, totalBonus, totalSubsidy);
    }

    private void setApplicationAttr(int num, int classId , Long date, int totalBonus, int totalSubsidy) {
        int total;
        List<SubsidyApplication> saList = subsidyApplicationService.getApplicationByClassIdAndDate(classId, date);
        if (saList.size() != 0) {
            for (SubsidyApplication subsidyApplication : saList) {
                total = totalBonus + totalSubsidy;
                subsidyApplication.setTotalBonus(totalBonus);
                subsidyApplication.setTotalSubsidy(totalSubsidy);
                subsidyApplication.setAggregateAmount(total);
                subsidyApplication.setNumber(num);
                System.out.println("更新的总数据"+total+"=totalBonus=="+totalBonus);
                subsidyApplicationService._updateSubsidyApplication(subsidyApplication);
            }
        }
    }

    /**
     * 获取正在申请的班级详情[需要前台的参数：classid(班级id)]
     */
    public void getSubsidyClassInfo() {
        List<SubsidyClassInfo> scList = subsidyClassInfoService.getSubsidyClassInfoByClassId(getParaToInt("classId"));
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
                areas.add(regionService.getRegionById(ur.getRegionId()));
            }
            if (areas.size() != 0) {
                String s = JsonKit.toJson(areas);
                RenderKit.renderSuccess(this, s);
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
        boolean isEmpty = false;
        boolean equal = false;
        final long applicationDate = System.currentTimeMillis();
        String cidJsonArray = getPara("classId");
        System.out.println("==========cidJsonArray===========" + cidJsonArray);
        JSONArray jsonArray = JSON.parseArray(cidJsonArray);
        List<SubsidyClassInfo> allSciList = subsidyClassInfoService.getAllSubsidyClassInfo();
        List<List<Student>> ll = new ArrayList<>();
        for (Object o : jsonArray) {
            int cid = Integer.valueOf(o.toString());
            List<Student> studentList = studentService.getStudentByClassId(cid);
            if (studentList.size() == 0) {
                isEmpty = true;
                break;
            } else {
                for (Student student : studentList) {
                    int stuId = student.getId();
                    for (SubsidyClassInfo sci : allSciList) {
                        int sciStudentId = sci.getStudentId();
                        if (stuId == sciStudentId && (sci.getApproveStatus() == APPROV_STATUS_NO||sci.getApproveStatus() == APPROV_STATUS_ON)) {
                            equal = true;
                            break;
                        }
                    }

                }
            }
            ll.add(studentList);
        }
        if (!isEmpty && !equal) {
            for (List<Student> stuList : ll) {
                int classId = 0;
                boolean first = true;
                int totalSubsidyAmount = 0;
                int totalBonus = 0;
                for (Student student : stuList) {
                    if (first) {
                        classId = student.getClassId();
                        first = false;
                    }
                    totalSubsidyAmount += student.getSubsidyPer();
                    totalBonus += student.getBonus();
                    setSubsidyClassInfo(applicationDate, student);
                }
                setDefaultSubsidyApplicationInfo(applicationDate, totalSubsidyAmount, totalBonus, classId, stuList.size());
            }
            RenderKit.renderSuccess(this, "添加成功！");
        }
        if (isEmpty) {
            RenderKit.renderError(this, "班级学生不能为空！");
        }
        if (equal) {
            RenderKit.renderError(this, "存在重复添加！或在申请中！");
        }


    }

    private void setSubsidyClassInfo(long applicationDate, Student student) {
        SubsidyClassInfo sci = new SubsidyClassInfo();
        sci.setClassId(student.getClassId());
        sci.setClassName(student.getClassName());
        sci.setRegionId(student.getRegionId());
        sci.setStudentId(student.getId());
        sci.setStudentName(student.getName());
        sci.setSubsidyAmount(student.getSubsidyPer());
        sci.setBonus(student.getBonus());
        sci.setApplicationDate(applicationDate);
        sci.setChecked(CHECKED);
        int n = student.getResidualFrequency();
        if (n >= 0) {
            sci.setResidualFrequency(n);
        }
        sci.setStatus(student.getStatus());
        sci.setApproveStatus(APPROV_STATUS_NO);
        sci.setRemark(student.getRemark());
        subsidyClassInfoService._saveSubsidyClassInfo(sci);
    }

    private void setDefaultSubsidyApplicationInfo(long applicationDate, int totalSubsidyAmount, int totalBonus, int cid, int num) {
        User user = getCurrentUser(this);
        SubsidyApplication sa = new SubsidyApplication();
        sa.setApplicantId(user.getId());
        sa.setApplicantName(user.getUserNickname());
        sa.setApplicationDate(applicationDate);
        sa.setRegionId(classService.getClassById(cid).getRegionId());
        sa.setClassId(cid);
        sa.setClassName(classService.getClassById(cid).getClassName());
        sa.setNumber(num);
        sa.setTotalSubsidy(totalSubsidyAmount);
        sa.setTotalBonus(totalBonus);
        sa.setAggregateAmount(totalSubsidyAmount + totalBonus);
        sa.setApproveStatus(APPROV_STATUS_NO);
        judgeAndAdd( sa);
    }

    private void judgeAndAdd(SubsidyApplication sa) {
        List<SubsidyApplication> applications = subsidyApplicationService.getAllApplications();
        if (applications.size() != 0) {
            boolean different = true;
            for (SubsidyApplication application : applications) {
                boolean judgeStatus = (sa.getApproveStatus().intValue() == application.getApproveStatus().intValue()) && (application.getApproveStatus().intValue() == 9);
                boolean judgeDate = application.getApplicationDate().intValue() == sa.getApplicationDate().intValue();
                boolean judgeClassId = application.getClassId().intValue() == sa.getClassId().intValue();
                System.out.println(application.getClassId().intValue() + "++++++++++++++" + sa.getClassId().intValue());
                if (judgeClassId && judgeDate &&judgeStatus) {
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

    public void confirmSubmit() {
        long date = System.currentTimeMillis();
        String sub = getPara("list");
        System.out.println("-------sub--------" + sub);
        JSONArray array = JSON.parseArray(sub);
        String remark = array.get(0).toString();
        int approverId = Integer.valueOf(array.get(1).toString());
        JSONArray dateArray = JSON.parseArray(array.get(2).toString());
        for (Object o : dateArray) {
            JSONObject jb = JSON.parseObject(o.toString());
            long ad = jb.getLongValue("applicationDate");
            setSubsidyClassInfo(date, ad);
            setSubApplication(date, remark, approverId, ad);
        }
        resetSubsidyClassInfo();
        RenderKit.renderSuccess(this, "提交成功！");
    }

    private void resetSubsidyClassInfo() {
        List<SubsidyClassInfo> sciList = subsidyClassInfoService.getAllSubsidyClassInfo();
        if (sciList.size() != 0) {
            for (SubsidyClassInfo subsidyClassInfo : sciList) {
                if (subsidyClassInfo.getApproveStatus() == APPROV_STATUS_NO || subsidyClassInfo.getChecked() == UN_CHECKED) {
                    subsidyClassInfo.delete();
                }
            }
        }
    }

    private void setSubsidyClassInfo(long date, long ad) {
        List<SubsidyClassInfo> sciList = subsidyClassInfoService.getSubsidyClassInfoByApplicationDate(ad);
        for (SubsidyClassInfo subsidyClassInfo : sciList) {
            System.out.println("提交学生申请修改状态："+subsidyClassInfo.getClassId());
            subsidyClassInfo.setApplicationDate(date);
            subsidyClassInfo.setApproveStatus(APPROV_STATUS_ON);
            subsidyClassInfoService._updateSubsidyClassInfo(subsidyClassInfo);
        }
    }

    private void setSubApplication(long date, String remark, int approverId, long ad) {
        List<SubsidyApplication> appList = subsidyApplicationService.getSubApplicationByApplicationDate(ad);
        if (appList.size() != 0) {
            for (SubsidyApplication app : appList) {
                app.setApplicationDate(date);
                app.setRemark(remark);
                app.setApproverId(approverId);
                app.setApproveStatus(APPROV_STATUS_ON);
                subsidyApplicationService._updateSubsidyApplication(app);
            }
        }

    }

}
