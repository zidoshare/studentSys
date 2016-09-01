package com.hudongwx.studentSys.service;

import com.hudongwx.studentSys.common.Service;
import com.hudongwx.studentSys.exceptions.ServiceException;
import com.hudongwx.studentSys.model.User;
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
        log.info("addUser中packing前");
        packingUser(user);
        log.info("addUser中packing后");
        user.save();
    }
    public void packingUser(User user) throws ServiceException {
        if(null == user.getUserAccount() || null == user.getUserPassword() ){
            //手动释放????
            user = null;
            log.info("异常前");
            throw new ServiceException("userAccount or userPassword cannot be null when packingUser");
        }
        log.info("异常后");
        user.setId(System.currentTimeMillis());
        /*
        * user.set...
        *
        *
        * */
    }
}
