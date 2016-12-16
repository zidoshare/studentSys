package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.exceptions.ServiceException;
import com.hudongwx.studentsys.model.Role;
import com.hudongwx.studentsys.model.Student;
import com.hudongwx.studentsys.model.User;
import com.hudongwx.studentsys.util.Common;
import com.hudongwx.studentsys.util.StrPlusKit;
import com.jfinal.log.Log;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by wuhongxu on 2016/8/31 0031.
 * <p>
 * 需要开启事务的函数前面前缀 _save..、_delete..、_update..、_query..
 */
public class UserService extends Service {
    private Log log = Log.getLog(getClass());
    private RoleService roleService;

    public User validate(String userAccount, String userPassword) {
        List<User> users = User.dao.find("select * from stumanager_user where userAccount = ? and userPassword = ?", userAccount, userPassword);
        if (users.isEmpty())
            return null;
        return users.get(0);
    }

    public User getUserById(Integer id) {
        return User.dao.findById(id);
    }

    public boolean _saveUser(User user) throws ServiceException {
        packingUser(user);
        return user.save();
    }

    public List<User> getAdmin() {
        return User.dao.find("select * from stumanager_user where userRole = 'admin'");
    }

    /*
    * 完善user，系统能为其设置的所有信息
    * */
    public void packingUser(User user) throws ServiceException {
        if (null == user.getUserAccount() || null == user.getUserPassword()) {
            throw new ServiceException("userAccount or userPassword cannot be null when packingUser");
        }
        if (null == user.getUserCreateTime())
            user.setUserCreateTime(System.currentTimeMillis());
        if (null == user.getUserPurikura())
            user.setUserPurikura(Common.getMainProp().get("defaultPurikura"));
        if (StrPlusKit.isEmpty(user.getUserRole()))
            throw new ServiceException("userRole cannot be null when packingUser");
        Role role = roleService.getRoleByName(user.getUserRole());
        if (null == role)
            throw new ServiceException("role:" + user.getUserRole() + " not exists");
        role.setMemberCnt(role.getMemberCnt() + 1);
        role.update();
        if (StrPlusKit.isEmpty(user.getUserNickname())) {
            String id = user.getId() + "";
            String str = Common.getMainProp().get("defaultNickNameBefore") + id;
            user.setUserNickname(str);
        }
        /*
        * user.set...
        *
        *
        * */
    }

    public List<User> getUsersByRole(Role role) {
        if (null == role)
            return new ArrayList<>();
        return User.dao.find(User.SEARCH_FROM_USER + "where userRole = ?", role.getName());
    }

    public User getUserByStudent(Student student) {
        return User.dao.findFirst(User.SEARCH_FROM_USER + "where userNickName = ?" , student.getName());
    }

    public User getUserBycounselor(Student student) {
        return User.dao.findFirst(User.SEARCH_FROM_USER + "where userNickName = ?" , student.getCounselorName());
    }

    public List<User> getUsersByRoleId(Role role) {
        if (null == role)
            return new ArrayList<>();
        return User.dao.find(User.SEARCH_FROM_USER + "where roleId = ?", role.getId());
    }

    public List<User>getAllUser(){
        return User.dao.find(User.SEARCH_FROM_USER+Common.ORDER_BY_ID_DESC);
    }
}
