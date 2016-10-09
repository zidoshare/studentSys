package com.hudongwx.studentsys.common;

import com.hudongwx.studentsys.model.Mapping;
import com.hudongwx.studentsys.model.User;
import com.hudongwx.studentsys.service.MappingService;
import com.hudongwx.studentsys.service.RoleService;
import com.hudongwx.studentsys.util.ArrayTree;
import com.hudongwx.studentsys.util.Common;
import com.hudongwx.studentsys.util.LangConfig;
import com.jfinal.core.Controller;
import com.jfinal.kit.Prop;
import com.jfinal.log.Log;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Field;
import java.util.*;

/**
 * Created by wuhongxu on 2016/8/30 0030.
 */
public abstract class BaseController extends Controller {
    protected Log log = Log.getLog(this.getClass());
    public MappingService mappingService;
    public RoleService roleService;
    protected Mapping mapping;

    public BaseController() {
        Field[] fields = this.getClass().getFields();
        for (Field field : fields) {
            //log.info("获取到属性：" + field.getName());
            Class clazz = field.getType();
            if (Service.class.isAssignableFrom(clazz) && clazz != Service.class) {
                try {
                    field.setAccessible(true);
                    field.set(this, Service.getInstance(clazz));
                } catch (IllegalAccessException e) {
                    log.error(e.toString());
                }
            }
        }
        mapping = mappingService.getMappingByTitle(init());
    }

    public void index() {
        fillHeaderAndFooter();
        if (!fillContent()) {
            renderError(403);
            return;
        }
        render("/index.ftl");
    }
    /**
     * @return 返回mapping的title属性
     */
    public abstract String init();

    public void fillHeader() {
        //三个地址：static用于找资源、servePath用于得到去掉参数的网址、holdPath为带参数网址
        String uri = getRequest().getRequestURI();
        String url = String.valueOf(getRequest().getRequestURL());
        String staticPath = url.substring(0, url.lastIndexOf(uri));
        String para = getRequest().getQueryString();
        if (null == para)
            para = "";
        else
            para = "?" + para;
        String actionKey = getAttr(Common.LABEL_ACTION_KEY);
        String servePath = staticPath + actionKey;
        /*if(staticPath.endsWith("/"))
            staticPath = staticPath.substring(0,staticPath.length()-1);
        if(servePath.endsWith("/"))
            servePath = servePath.substring(0,servePath.length()-1);
        if(url.endsWith("/"))
            url = url.substring(0,url.length()-1);*/
        url += para;

        /*log.info("static用于找资源:"+staticPath);
        log.info("servePath用于得到去掉参数的网址:"+servePath);
        log.info("holdPath为带参数网址:"+url);*/

        setAttr(Common.LABEL_STATIC_SERVE_PATH, staticPath);
        setAttr(Common.LABEL_SERVE_PATH, servePath);
        setAttr(Common.LABEL_HOLD_PATH, url);

        setAttr(Common.LABEL_STATIC_RESOURCE_VERSION, new Date().getTime());
        User currentUser = getCurrentUser(this);

        setAttr(Common.LABEL_IS_LOGIN, currentUser == null);
            setAttr(Common.LABEL_LOGIN_ROLE, currentUser!=null?currentUser.getUserRole():"");
        setAttr(Common.LABEL_USER, currentUser);
        Prop langProp = LangConfig.getLangProp();
        setAttr(Common.LABEL_LOGIN_NAME_ERROR, langProp.get(Common.LABEL_LOGIN_NAME_ERROR));
        setAttr(Common.LABEL_INVALID_PASSWORD, langProp.get(Common.LABEL_INVALID_PASSWORD));
    }

    private void fillFooter() {
        /*Prop langProp = LangConfig.getLangProp();
        Enumeration<Object> elements = langProp.getProperties().elements();
        while(elements.hasMoreElements()) {
            Object o = elements.nextElement();
            //System.out.println(o);
        }*/
    }

    //页面测试
    protected void fillTest() {

        List<Mapping> mappings = mappingService.getTree().getList();
        mappings.remove(0);

        setAttr(Common.LABEL_SIDES, mappings);

    }

    protected boolean fillContentParent() {
        User user = getCurrentUser(getRequest());
        if (user == null) {
            redirect("/user/login");
            return false;
        }
        if (mapping == null) {
            renderError(403);
            return false;
        }
        ArrayTree<Mapping> roleTree = roleService.getRoleTree(roleService.getRoleByName(user.getUserRole()));
        List<Mapping> sides = new ArrayList<>();
        List<Mapping> childSides = new ArrayList<>();
        List<Mapping> views = new ArrayList<>();
        final int[] size = new int[Common.MAX_DEGREE];
        roleTree.checkTree(now -> {
            if (roleTree.getParent(now) == null)
                return true;
            //子菜单计数,只支持二级菜单。。。子菜单下继续遍历子视图
            if (now.getFunction() > Mapping.FUNCTION_MENUITEM) {
                size[sides.indexOf(now.getParent())]++;
                childSides.add(now);
                //子菜单为当前点击菜单才会继续向子视图遍历
                return now == mapping;
            }
            //一级菜单
            if (now.getFunction() == Mapping.FUNCTION_MENUITEM) {
                sides.add(now);
                return true;
            }
            //视图遍历，遍历到一级视图停止遍历,并添加到视图链表，以便后续功能或子视图的遍历处理
            if (now.getParent() == mapping && now.getFunction() == Mapping.FUNCTION_VIEW) {
                views.add(now);
                return false;
            }
            //如果同层不同访问，则其他同层节点子节点放弃遍历
            /*if(mappingService.getBaseMenu(now) == mapping)
                return true;
            return mappingService.getBaseMenu(now) == mapping;*/
            return false;
        });
        setAttr(Common.LABEL_SIDES, sides);
        setAttr(Common.LABEL_SIDES_SIZE, size);
        setAttr(Common.LABEL_SIDES_CHILD, childSides);
        setAttr(Common.LABEL_VIEWS, views);
        setAttr(Common.LABEL_NOW_VISIT, mapping);
        //base处理通用的，其他处理继续下放
        setAttr(Common.LABEL_ROLE_TREE, roleTree);
        setAttr(Common.LABEL_ROOT_MAPPING,roleTree.root());
        return true;
    }

    //如果没有子视图模块，则可以使用通用的操作遍历
    protected boolean fillContentChild() {
        User user = getCurrentUser(getRequest());
        if (user == null) {
            redirect("/user/login");
            return false;
        }
        if (mapping == null) {
            renderError(403);
            return false;
        }
        ArrayTree<Mapping> roleTree = roleService.getRoleTree(roleService.getRoleByName(user.getUserRole()));
        List<Mapping> sides = getAttr(Common.LABEL_VIEWS);
        Map<String, List<Mapping>> map = new HashMap<>();
        for (Mapping side : sides) {
            List<Mapping> operators = new ArrayList<>();
            roleTree.checkTree(side, now -> {
                if (now.getFunction() == Mapping.FUNCTION_OPERATE) {
                    operators.add(now);
                    return false;
                }
                return true;
            });
            map.put("operators" + side.getId(), operators);
        }
        setAttr("map", map);
        return true;
    }

    protected boolean fillContent() {
        return fillContentParent() && fillContentChild();
    }

    protected void fillHeaderAndFooter() {
        fillHeader();
        fillFooter();
    }

    public static User getCurrentUser(HttpServletRequest request) {
        /*User user = new User();
        user.setUserNickname("管理员");
        user.setUserRole("admin");
        return user;*/
        return (User) request.getSession().getAttribute("user");
    }
    public static User getCurrentUser(Controller me){
        return getCurrentUser(me.getRequest());
    }
    //如果是从二级菜单导航出去，一定要setMapping
    public void setMapping(Mapping mapping){
        this.mapping = mapping;
    }
}
