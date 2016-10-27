package com.hudongwx.studentsys.common;

import com.hudongwx.studentsys.model.Mapping;
import com.hudongwx.studentsys.model.Role;
import com.hudongwx.studentsys.model.User;
import com.hudongwx.studentsys.service.MappingService;
import com.hudongwx.studentsys.service.RoleService;
import com.hudongwx.studentsys.service.UserService;
import com.hudongwx.studentsys.util.ArrayTree;
import com.hudongwx.studentsys.util.Common;
import com.hudongwx.studentsys.util.StrPlusKit;
import com.jfinal.log.Log;
import com.jfinal.plugin.ehcache.CacheKit;
import org.dom4j.*;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;
import org.w3c.dom.Attr;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;
import java.util.List;
import java.util.jar.Attributes;

/**
 * Created by wuhongxu on 2016/9/18 0018.
 *
 * 由main函数单独构建地图，角色
 * 可用于测试及动态更新地图、角色、权限
 *
 */
public class Build{
    private static Log log = Log.getLog(Build.class);
    private static MappingService ms = new MappingService();
    private static UserService us = new UserService();
    private static RoleService rs = new RoleService();
    private static ArrayTree<Mapping> tree;
    //建立地图
    public static void buildMapping(){
        log.info("初始化地图");
        //建立mapping
        tree = new ArrayTree<>();
        Mapping r = new Mapping();
        r.setIcon("fa");
        r.setTitle("根目录");
        r.setUrl("url");
        tree.initTree(r);
        Mapping root = tree.root();
        Mapping common = new Mapping();
        common.setIcon("fa fa-desktop");
        common.setTitle("首页");
        common.setUrl("/");
        common.setFunction(Mapping.FUNCTION_MENUITEM);
        tree.insertChild(common, root, null);

        Mapping search = new Mapping("search","全局搜索","/common/search.ftl",Mapping.FUNCTION_VIEW);
        tree.insertChild(search,common,null);

        Mapping fast = new Mapping("fast","快捷操作","/common/fastOprator.ftl",Mapping.FUNCTION_VIEW);
        tree.insertChild(fast,common,search,null);

        tree.insertChild(new Mapping("newest","最新报名","/common/newest.ftl",Mapping.FUNCTION_VIEW),common,null);
        tree.insertChild(new Mapping("statistics","统计","/common/statistics.ftl",Mapping.FUNCTION_VIEW),common,null);

        Mapping userManager = new Mapping();
        userManager.setIcon("fa fa-users");
        userManager.setTitle("用户管理");
        userManager.setUrl("/userManager");
        userManager.setFunction(Mapping.FUNCTION_MENUITEM);
        tree.insertChild(userManager, root, null);
        Mapping userList = new Mapping("userList","用户列表","/userManager/userList.ftl",Mapping.FUNCTION_VIEW);
        tree.insertChild(userList,userManager,null);
        tree.insertChild(new Mapping("addUser","添加","addUser",Mapping.FUNCTION_OPERATE),userList,null);
        tree.insertChild(new Mapping("updateUser","编辑","updateUser",Mapping.FUNCTION_OPERATE));
        tree.insertChild(new Mapping("deleteUser","删除","deleteUser",Mapping.FUNCTION_OPERATE));
        Mapping roleList = new Mapping("roleList", "角色列表", "/userManager/roleList.ftl",Mapping.FUNCTION_VIEW);
        tree.insertChild(roleList,userManager,null);
        tree.insertChild(new Mapping("addRole","添加","addRole",Mapping.FUNCTION_OPERATE),roleList);
        tree.insertChild(new Mapping("updateRole","编辑","updateRole",Mapping.FUNCTION_OPERATE));
        tree.insertChild(new Mapping("deleteRole","删除","deleteRole",Mapping.FUNCTION_OPERATE));

        Mapping studentManager = new Mapping();
        studentManager.setIcon("fa fa-calendar");
        studentManager.setTitle("学生管理");
        studentManager.setUrl("/studentManager");
        studentManager.setFunction(Mapping.FUNCTION_MENUITEM);
        tree.insertChild(studentManager, root, null);
        Mapping studentList = new Mapping("studentList","学生信息列表","/studentManager/studentList.ftl",Mapping.FUNCTION_VIEW);
        tree.insertChild(studentList,studentManager);
        tree.insertChild(new Mapping("addStudent","添加","addStudent",Mapping.FUNCTION_OPERATE),studentList);
        tree.insertChild(new Mapping("updateStudent","修改","updateStudent",Mapping.FUNCTION_OPERATE));
        tree.insertChild(new Mapping("deleteStudent","删除","deleteStudent",Mapping.FUNCTION_OPERATE));


        Mapping RePaymentManager = new Mapping();
        RePaymentManager.setIcon("fa fa-usd");
        RePaymentManager.setTitle("还款管理");
        RePaymentManager.setUrl("/repaymentManager");
        RePaymentManager.setFunction(Mapping.FUNCTION_MENUITEM);
        tree.insertChild(RePaymentManager, root, null);

        Mapping attendanceManager = new Mapping();
        attendanceManager.setIcon("fa fa-crosshairs");
        attendanceManager.setTitle("出勤管理");
        attendanceManager.setUrl("/attendanceManager");
        attendanceManager.setFunction(Mapping.FUNCTION_MENUITEM);
        tree.insertChild(attendanceManager, root, null);
        Mapping attendanceList = new Mapping("personalAttendanceList","考勤信息列表","/attendanceManager/personalAttendanceList.ftl",Mapping.FUNCTION_VIEW);
        tree.insertChild(attendanceList,attendanceManager);
        tree.insertChild(new Mapping("addAttendance","添加","addAttendance",Mapping.FUNCTION_OPERATE),attendanceList);
        tree.insertChild(new Mapping("updateAttendance","修改","updateAttendance",Mapping.FUNCTION_OPERATE));
        tree.insertChild(new Mapping("deleteStudent","删除","deleteStudent",Mapping.FUNCTION_OPERATE));


        Mapping certificateManager = new Mapping();
        certificateManager.setIcon("fa fa-book");
        certificateManager.setUrl("/certificateManager");
        certificateManager.setTitle("证书管理");
        certificateManager.setFunction(Mapping.FUNCTION_MENUITEM);
        tree.insertChild(certificateManager, root, null);

        Mapping myTest = new Mapping("fa fa-pencil","我的考试","/test",Mapping.FUNCTION_MENUITEM);
        tree.insertChild(myTest,root);
        Mapping testHistory = new Mapping("testHistory","考试历史","/test/history",Mapping.FUNCTION_MENUITEM_CHILD);

        Mapping toTest = new Mapping("toTest","参加考试","/test/to",Mapping.FUNCTION_MENUITEM_CHILD);
        tree.insertChild(testHistory,myTest);
        tree.insertChild(new Mapping("historyList","考试历史","/test/historyList.ftl",Mapping.FUNCTION_VIEW),testHistory);
        tree.insertChild(toTest,myTest);
        tree.insertChild(new Mapping("testing","正在进行的考试","/test/testing.ftl",Mapping.FUNCTION_VIEW),toTest);

        Mapping mySurveys = new Mapping("fa fa-file-text","我的调查","/#",Mapping.FUNCTION_MENUITEM);
        tree.insertChild(mySurveys,root);
        Mapping toSurveying = new Mapping("toSurveying","调查列表","/surveys/surveyList",Mapping.FUNCTION_MENUITEM_CHILD);
        tree.insertChild(toSurveying,mySurveys);
        Mapping surveying = new Mapping("surveying","正在进行的调查","/surveys/surveying.ftl",Mapping.FUNCTION_VIEW);
        tree.insertChild(surveying,toSurveying);
        Mapping toInputBigType = new Mapping("toInputBigType","添加大类型","/surveys/inputBigType",Mapping.FUNCTION_MENUITEM_CHILD);
        tree.insertChild(toInputBigType,mySurveys);
        tree.insertChild(new Mapping("inputBigType","添加大类型","/surveys/inputBigType.ftl",Mapping.FUNCTION_VIEW),toInputBigType);
        Mapping toInputQuestion = new Mapping("toInputQuestion","添加问题","/surveys/inputQuestion",Mapping.FUNCTION_MENUITEM_CHILD);
        tree.insertChild(toInputQuestion,mySurveys);
        tree.insertChild(new Mapping("inputQuestion","添加问题","/surveys/inputQuestion.ftl",Mapping.FUNCTION_VIEW),toInputQuestion);
        Mapping toInputQuestionnaire = new Mapping("toInputQuestionnaire","组卷","/surveys/inputQuestionnaire",Mapping.FUNCTION_MENUITEM_CHILD);
        tree.insertChild(toInputQuestionnaire,mySurveys);
        tree.insertChild(new Mapping("inputQuestionnaire","组卷","/surveys/inputQuestionnaire.ftl",Mapping.FUNCTION_VIEW),toInputQuestionnaire);
        Mapping toCheckResult = new Mapping("toCheckResult","查看调查结果","/surveys/checkResult",Mapping.FUNCTION_MENUITEM_CHILD);
        tree.insertChild(toCheckResult,mySurveys);
        tree.insertChild(new Mapping("checkResult","查看调查结果","/surveys/checkResult.ftl",Mapping.FUNCTION_VIEW),toCheckResult);

        Mapping option = new Mapping();
        option.setIcon("fa fa-gear");
        option.setTitle("通用设置");
        option.setUrl("/option");
        option.setFunction(Mapping.FUNCTION_MENUITEM);
        tree.insertChild(option, root, null);
        tree.insertChild(new Mapping("updatePurikura","修改头像","/option/updatePurikura.ftl",Mapping.FUNCTION_VIEW),option);
        tree.insertChild(new Mapping("updatePassword","修改密码","/option/updatePassword.ftl",Mapping.FUNCTION_VIEW));

        Mapping enrollManager = new Mapping();
        enrollManager.setIcon("fa fa-thumbs-up");
        enrollManager.setTitle("报名学生");
        enrollManager.setUrl("/enrollManager");
        enrollManager.setFunction(Mapping.FUNCTION_MENUITEM);
        tree.insertChild(enrollManager, root, null);
        Mapping enrollList = new Mapping("enrollList","报名学生列表","/enrollManager/enroll.ftl",Mapping.FUNCTION_VIEW);
        tree.insertChild(enrollList,enrollManager);
        tree.insertChild(new Mapping("addEnroll","添加报名学生","addEnroll",Mapping.FUNCTION_OPERATE),enrollList);
        tree.insertChild(new Mapping("updateEnroll","修改","updateEnroll",Mapping.FUNCTION_OPERATE));
        tree.insertChild(new Mapping("deleteEnroll","删除","deleteEnroll",Mapping.FUNCTION_OPERATE));
        ms._saveMappings(tree.getList());

        tree.checkTree(now -> {
            if(now.getParent() != null){
                now.setParentId(now.getParent().getId());
            }
            if(now.getLeftChild() != null)
                now.setLeftChildId(now.getLeftChild().getId());
            if(now.getNextSibling() != null)
                now.setNextSiblingId(now.getNextSibling().getId());

            return now.update();
        });

        log.info("建立地图完成");
    }
    public static void generatorXML(ArrayTree<Mapping> tree) throws IOException {
        Document document = DocumentHelper.createDocument();
        final Map<Mapping,Element> map = new HashMap<>();
        tree.checkTree(now->{
            if(now.getParent() == null){
                Element rt = DocumentHelper.createElement("mapping");
                document.setRootElement(rt);
                Element element = addAttributeToElement(rt, now);
                map.put(now,element);
                return true;
            }
            Element e = map.get(now.getParent()).addElement("mapping");
            map.put(now,addAttributeToElement(e,now));
            return true;
        });
        //输出到控制台
        XMLWriter xmlWriter = new XMLWriter();
        xmlWriter.write(document);

        // 输出到文件
        // 格式
        OutputFormat format = new OutputFormat("    ", true);// 设置缩进为4个空格，并且另起一行为true
        XMLWriter xmlWriter2 = new XMLWriter(
                new FileOutputStream("src\\main\\resources\\permission.xml"), format);
        xmlWriter2.write(document);

        // 另一种输出方式，记得要调用flush()方法,否则输出的文件中显示空白
       /* XMLWriter xmlWriter3 = new XMLWriter(new FileWriter("student2.xml"),
                format);
        xmlWriter3.write(document2);
        xmlWriter3.flush();*/
        // close()方法也可以

    }
    private static Element addAttributeToElement(Element e, Mapping mapping){
        e.addAttribute(Common.LABEL_ID,""+mapping.getId());
        e.addAttribute(Mapping.LABEL_ICON,mapping.getIcon());
        e.addAttribute(Mapping.LABEL_URL,mapping.getUrl());
        e.addAttribute(Mapping.LABEL_TITLE,mapping.getTitle());
        e.addAttribute(Mapping.LABEL_FUNCTION,""+mapping.getFunction());
        return e.addElement("mappings");
    }
    public static void readXML(final ArrayTree<Mapping> tree,final String path) throws Exception {
        SAXReader saxReader = new SAXReader();
        File file = new File(path);
        if(!file.exists())
            throw new Exception(path+"文件不存在");
        Document document = saxReader.read(file);
        //bfs实现建树
        Queue<Element> queue = new LinkedList<>();
        queue.offer(document.getRootElement());
        while (!queue.isEmpty()){
            Element now = queue.poll();
            if(now.attributeCount() < 4)
                throw new Exception(now.getPath()+"节点的元素个数不足");
            Mapping mapping = new Mapping();
            List<Attribute> attributes = now.attributes();
            for(Attribute attribute : attributes){
                mapping.set(attribute.getName(),attribute.getValue());
            }
             if(now.isRootElement()){
                tree.initTree(mapping);
            }else{
                List<Mapping> list = tree.getList();
                for(Mapping m : list){
                    Element parent = now.getParent().getParent();
                    String s = parent.attributeValue(Common.LABEL_ID);
                    if(Objects.equals(m.get(Common.LABEL_ID), s)){
                        tree.insertChild(mapping,m);
                        break;
                    }
                }
            }
            List<Element> list = now.element("mappings").elements();
            list.forEach(queue::offer);
        }
        //建树完成 注意：因类型关系，此树不能重复使用,必须重新读树
        tree.checkTree(now->{
            log.info(now.toString());
            return true;
        });
        tree.checkTree(now -> {
            if(now.getParent() != null){
                now.set("parentId",now.getParent().get(Common.LABEL_ID));
                /*now.setParentId(now.getParent().getId());*/
            }
            if(now.getLeftChild() != null)
                now.set("leftChildId",now.getLeftChild().get(Common.LABEL_ID));
/*                now.setLeftChildId(now.getLeftChild().getId());*/
            if(now.getNextSibling() != null)
                now.set("nextSiblingId",now.getNextSibling().get(Common.LABEL_ID));
                /*now.setNextSiblingId(now.getNextSibling().getId());*/

            return now.save();
        });
        CacheKit.put(Common.CACHE_60TIME_LABEL,"mappingTree",null);
        /*Queue<Element> queue = new LinkedList<>();
        queue.offer(document.getRootElement());
        Map<Element,Mapping> map = new HashMap<>();
        while (!queue.isEmpty()){
            Element nowe = queue.poll();
            final Attribute ida = nowe.attribute(Common.LABEL_ID);
            final Attribute icona = nowe.attribute(Mapping.LABEL_ICON);
            final Attribute titlea = nowe.attribute(Mapping.LABEL_TITLE);
            final Attribute urla = nowe.attribute(Mapping.LABEL_URL);
            final Attribute functiona = nowe.attribute(Mapping.LABEL_FUNCTION);
            if(icona == null || titlea == null || urla == null)
                throw new Exception("icon/title/url不存在");
            final Integer id = Integer.valueOf(ida.getStringValue());
            final String icon = icona.getStringValue();
            final String title = titlea.getStringValue();
            final String url = urla.getStringValue();
            Integer function = Mapping.FUNCTION_DEFAULT;
            if(null != functiona)
                function = Integer.valueOf(functiona.getStringValue());
            if(StrPlusKit.isEmpty(url) || StrPlusKit.isEmpty(icon) || StrPlusKit.isEmpty(title))
                throw new Exception("icon/title/url不能为空值");
            Mapping now = new Mapping(icon,title,url,function);
            now.setId(id);
            if(!nowe.isRootElement()){
                tree.insertChild(now,map.get(nowe.getParent()));
            }else{
                tree.initTree(now);
            }
            map.put(nowe,now);
            Element children = nowe.element("mappings");
            List<Element> elements = children.elements();
            queue.addAll(elements);
        }*/
    }
    public static void initUser(){

        //建立admin
        User admin = new User();
        admin.setUserNickname("admin");
        admin.setUserRole("admin");
        admin.setUserAccount("admin");
        admin.setUserPassword("admin");
        Role role = rs.getRoleByName("admin");
        role.update();
        us._saveUser(admin);

        log.info("初始化用户");
    }
    public static void initRole() {

        Role admin = rs.getRoleByName("admin");
        if(null != admin)
            return ;
        Role role = new Role();
        role.setName("admin");
        role.setMemberCnt(0);
        role.setCreateTime(System.currentTimeMillis());
        role.setOperater("system");
        ArrayTree<Mapping> tree = ms.getTree();
        rs.putRoleTree(role,tree);
        rs._saveRole(role);
        log.info("初始化角色");
    }
    //清楚当前所有地图数据
    public static void clearMapping(){
        List<Mapping> mappings = Mapping.dao.find("select * from stumanager_mapping");
        mappings.forEach(Mapping::delete);
        log.info("清除地图数据完成");
    }
    public static void clearRole(){
        List<User> users = User.dao.find("select * from stumanager_user");
        users.forEach(User::delete);
        List<Role> roles = Role.dao.find("select * from stumanager_role");
        roles.forEach(Role::delete);
        log.info("清除角色数据完成");
    }
    public static void buildControl(){

        JFrame jf = new JFrame("控制窗口");
        jf.setSize(200,300);
        JPanel jp = new JPanel(new FlowLayout());
        jf.setContentPane(jp);
        JButton mappingBtn = new JButton("硬初始化地图(从代码中初始化)");
        mappingBtn.addActionListener(e -> buildMapping());
        JButton roleBtn = new JButton("初始化角色");
        roleBtn.addActionListener(e -> {
            initRole();
            initUser();
        });
        JButton clearBtn = new JButton("清除地图数据");
        clearBtn.addActionListener(e -> clearMapping());
        JButton clearRoleBtn = new JButton("清除角色数据");
        clearRoleBtn.addActionListener(e -> clearRole());
        JButton generatorXML = new JButton("生成xml文件");
        generatorXML.addActionListener(e -> {
            try {
                tree = new MappingService().getTree();
                generatorXML(tree);
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        });
        JButton readXml = new JButton("从xml中初始化地图");
        readXml.addActionListener(e -> {
            try {
                readXML(new ArrayTree<>(),"src\\main\\resources\\permission.xml");
            } catch (Exception e1) {
                e1.printStackTrace();
            }
        });
        jp.add(clearBtn);
        jp.add(clearRoleBtn);
        jp.add(generatorXML);
        jp.add(readXml);
        jp.add(roleBtn);
        jp.add(mappingBtn);
        jf.setVisible(true);
    }
}
