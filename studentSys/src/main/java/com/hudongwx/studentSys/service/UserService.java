package com.hudongwx.studentSys.service;

import com.hudongwx.studentSys.common.Service;
import com.hudongwx.studentSys.exceptions.ServiceException;
import com.hudongwx.studentSys.model.User;
import com.hudongwx.studentSys.util.Common;
import com.hudongwx.studentSys.util.StrPlusKit;
import com.jfinal.kit.HttpKit;
import com.jfinal.log.Log;

import java.util.Date;

/**
 * Created by wuhongxu on 2016/8/31 0031.
 */
public class UserService extends Service {
    private Log log = Log.getLog(getClass());
    public User getCurrentUser(){
        return super.getCurrentUser();
    }
    public User getUserById(String id){
        return User.dao.findById(id);
    }
    public void addUser(User user) throws ServiceException {
        packingUser(user);
        user.save();
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
