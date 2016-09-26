package com.hudongwx.studentsys.common;

import com.hudongwx.studentsys.model.Mapping;
import com.hudongwx.studentsys.model.Role;
import com.hudongwx.studentsys.model.User;
import com.hudongwx.studentsys.service.MappingService;
import com.hudongwx.studentsys.service.RoleService;
import com.hudongwx.studentsys.service.UserService;
import com.hudongwx.studentsys.util.ArrayTree;
import com.hudongwx.studentsys.util.Common;
import com.hudongwx.studentsys.util.ObjectKit;
import com.hudongwx.studentsys.util.StrPlusKit;
import com.jfinal.kit.PathKit;
import com.jfinal.log.Log;
import org.dom4j.*;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;
import java.util.List;

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
        Mapping attendanceList = new Mapping("attendanceList","考勤信息列表","/attendanceManager/attendanceList.ftl",Mapping.FUNCTION_VIEW);
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
        e.addAttribute(Common.ID_LABEL,""+mapping.getId());
        e.addAttribute(Mapping.ICON_LABEL,mapping.getIcon());
        e.addAttribute(Mapping.URL_LABEL,mapping.getUrl());
        e.addAttribute(Mapping.TITLE_LABEL,mapping.getTitle());
        e.addAttribute(Mapping.FUNCTION_LABEL,""+mapping.getFunction());
        return e.addElement("mappings");
    }
    private static void readXML(final ArrayTree<Mapping> tree,final String path) throws Exception {
        SAXReader saxReader = new SAXReader();
        File file = new File(path);
        if(!file.exists())
            throw new Exception(path+"文件不存在");
        Document document = saxReader.read(file);
        Queue<Element> queue = new LinkedList<>();
        queue.offer(document.getRootElement());
        Map<Element,Mapping> map = new HashMap<>();
        while (!queue.isEmpty()){
            Element nowe = queue.poll();
            final Attribute icona = nowe.attribute(Mapping.ICON_LABEL);
            final Attribute titlea = nowe.attribute(Mapping.TITLE_LABEL);
            final Attribute urla = nowe.attribute(Mapping.URL_LABEL);
            final Attribute functiona = nowe.attribute(Mapping.FUNCTION_LABEL);
            if(icona == null || titlea == null || urla == null)
                throw new Exception("icon/title/url不存在");
            final String icon = icona.getStringValue();
            final String title = titlea.getStringValue();
            final String url = urla.getStringValue();
            Integer function = Mapping.FUNCTION_DEFAULT;
            if(null != functiona)
                function = Integer.valueOf(functiona.getStringValue());
            if(StrPlusKit.isEmpty(url) || StrPlusKit.isEmpty(icon) || StrPlusKit.isEmpty(title))
                throw new Exception("icon/title/url不能为空值");
            Mapping now = new Mapping(icon,title,url,function);
            if(!nowe.isRootElement()){
                tree.insertChild(now,map.get(nowe.getParent()));
            }else{
                tree.initTree(now);
            }
            map.put(nowe,now);
            Element children = nowe.element("mappings");
            List<Element> elements = children.elements();
            queue.addAll(elements);
        }
    }
    public static void initUser(){

        //建立admin
        User admin = new User();
        admin.setUserNickname("admin");
        admin.setUserRole("admin");
        admin.setUserAccount("admin");
        admin.setUserPassword("admin");
        Role role = rs.getRoleByName("admin");
        role.setMemberCnt(role.getMemberCnt()+1);
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
        ArrayTree<Mapping> tree = ms.getTree();
        rs.putRoleTree(role,tree);
        rs._saveRole(role);
        log.info("初始化角色");
    }
    //清楚当前所有地图数据
    public static void clearMapping(){
        List<Mapping> mappings = Mapping.dao.find("select * from stumanager_mapping");
        mappings.forEach(Mapping::delete);
        List<User> users = User.dao.find("select * from stumanager_user");
        users.forEach(User::delete);
        List<Role> roles = Role.dao.find("select * from stumanager_role");
        roles.forEach(Role::delete);
        log.info("清楚地图数据完成");
    }
    public static void buildControl(){

        JFrame jf = new JFrame("控制窗口");
        jf.setSize(200,100);
        JPanel jp = new JPanel(new FlowLayout());
        jf.setContentPane(jp);
        JButton mappingBtn = new JButton("初始化数据");
        mappingBtn.addActionListener(e -> {
            buildMapping();
            initRole();
            initUser();
        });
        JButton clearBtn = new JButton("清除数据");
        clearBtn.addActionListener(e -> {
            clearMapping();
        });
        JButton generatorXML = new JButton("生成xml文件");
        generatorXML.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try {
                    generatorXML(tree);
                } catch (IOException e1) {
                    e1.printStackTrace();
                }
            }
        });
        jp.add(clearBtn);
        jp.add(mappingBtn);
        jp.add(generatorXML);
        jf.setVisible(true);
    }
}
