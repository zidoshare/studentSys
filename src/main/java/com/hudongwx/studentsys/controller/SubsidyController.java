package com.hudongwx.studentsys.controller;

import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.model.*;
import com.hudongwx.studentsys.model.Class;
import com.hudongwx.studentsys.service.*;
import com.hudongwx.studentsys.util.Common;
import com.hudongwx.studentsys.util.ModelKit;
import com.hudongwx.studentsys.util.PageinateKit;
import com.hudongwx.studentsys.util.RenderKit;
import com.jfinal.aop.Before;
import com.jfinal.ext.interceptor.POST;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

import java.util.ArrayList;
import java.util.List;

/**
 * 补助管理
 * Created by wu on 2016/11/19.
 */
public class SubsidyController extends BaseController {

    public SubsidyApplicationService subsidyApplicationService;
    public SubsidyClassInfoService subsidyClassInfoService;
    public ClassService classService;
    public UserRegionService userRegionService;
    public RegionService regionService;

    @Override
    public void index() {
        super.index();
        Page<Class> classP = Class.dao.paginate(1, Common.MAX_PAGE_SIZE, Common.COMMON_SELECT, Class.SQL_FROM);

        List<SubsidyClassInfo> subList = new ArrayList<>();
        for (int i = 0; i < 20; i++) {
            Model model = ModelKit.simulateModelByRandom(SubsidyClassInfo.class, 5);
            subList.add((SubsidyClassInfo) model);
        }
        Page<SubsidyClassInfo> subsidyClassInfoPage = PageinateKit.ClonePage(classP, subList);
        setAttr("page", subsidyClassInfoPage);
    }

    @Override
    public Mapping init() {
        return mappingService.getMappingByUrl("/subsidyManager");
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
    public boolean deleteSubsidyClassInfo() {
        return subsidyClassInfoService._deleteSubsidyClassInfoById(getPara("sciId"));
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
    public void showRegionClassInfo() {
        Integer rid = getParaToInt("rid");
        if (rid == null) {
            RenderKit.renderError(this);
        } else {
            List<Class> classList = classService.getClassInfoByRegionId(rid);
            if (classList.size() != 0) {
                RenderKit.renderSuccess(this, JsonKit.toJson(classList));
            } else {
                RenderKit.renderError(this);
            }
        }
    }
}
