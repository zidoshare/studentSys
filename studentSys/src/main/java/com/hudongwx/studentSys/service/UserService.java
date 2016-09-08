package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.exceptions.ServiceException;
import com.hudongwx.studentsys.model.User;
import com.hudongwx.studentsys.util.Common;
import com.jfinal.log.Log;

import java.util.List;

/**
 * Created by wuhongxu on 2016/8/31 0031.
 *
 * 需要开启事务的函数前面前缀 _save..、_delete..、_update..、_query..
 *
 */
public class UserService extends Service {
    private Log log = Log.getLog(getClass());
    public User validate(String userAccount,String userPassword){
        List<User> users = User.dao.find("select * from stumanager_user where userAccount = ? and userPassword = ?", userAccount, userPassword);
        if(users.isEmpty())
            return null;
        return users.get(0);
    }
    public User getUserById(String id){
        return User.dao.findById(id);
    }
    public void _saveUser(User user){
        try {
            packingUser(user);
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        user.save();
    }
    public List<User> getAdmin(){
        return User.dao.find("select * from stumanager_user where userRole = 'admin'");
    }
    /*
    * 完善user，系统能为其设置的所有信息
    * */
    public void packingUser(User user) throws ServiceException {
        if(null == user.getUserAccount() || null == user.getUserPassword() ){
            //手动释放????
            user = null;
            throw new ServiceException("userAccount or userPassword cannot be null when packingUser");
        }
        if(null == user.getId())
            user.setId(System.currentTimeMillis());
        if(null == user.getUserCreateTime())
            user.setUserCreateTime(System.currentTimeMillis());
        if(null == user.getUserPurikura())
            user.setUserPurikura(Common.getMainProp().get("defaultPurikura"));
        if(null == user.getUserRole())
            user.setUserRole(Common.getMainProp().get("defaultRole"));
        if(null == user.getUserNickname()){
            String id = user.getId()+"";
            id.substring(id.length()-7,id.length());
            String str = Common.getMainProp().get("defaultNickNameBefore")+id;
            user.setUserNickname(str);
        }
        /*
        * user.set...
        *
        *
        * */
    }
}
