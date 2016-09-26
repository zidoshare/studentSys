package com.hudongwx.studentsys.common;

import com.hudongwx.studentsys.model.Mapping;
import com.hudongwx.studentsys.model.Role;
import com.hudongwx.studentsys.model.User;
import com.hudongwx.studentsys.service.MappingService;
import com.hudongwx.studentsys.service.RoleService;
import com.hudongwx.studentsys.service.UserService;
import com.hudongwx.studentsys.util.ArrayTree;
import com.jfinal.log.Log;

import javax.swing.*;
import java.awt.*;
import java.util.List;
import java.util.Map;

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
    //建立地图
    public static void buildMapping(){
        log.info("初始化地图");
        //建立mapping
        ArrayTree<Mapping> tree = new ArrayTree<>();
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
        JButton userBtn = new JButton("初始化用户");
        userBtn.addActionListener(e -> {
            initUser();
        });
        JButton mappingBtn = new JButton("初始化地图");
        mappingBtn.addActionListener(e -> {
            buildMapping();
        });
        JButton clearBtn = new JButton("清除数据");
        clearBtn.addActionListener(e -> {
            clearMapping();
        });
        JButton roleBtn = new JButton("初始化角色");
        roleBtn.addActionListener(e -> {
            initRole();
        });
        jp.add(clearBtn);
        jp.add(mappingBtn);
        jp.add(userBtn);
        jp.add(roleBtn);
        jf.setVisible(true);
        jf.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        /*Scanner sc = new Scanner(System.in);
        Class build = Build.class;
        Method[] methods = build.getMethods();
        while(true){
            String name = sc.next();
            if(name.equals("q"))
                return;
            for (Method method : methods) {
                if (name.equals(method.getName())) {
                    try {
                        method.invoke(null);
                    } catch (InvocationTargetException | IllegalAccessException e) {
                        e.printStackTrace();
                    }
                    break;
                }
            }
        }*/
    }
}
