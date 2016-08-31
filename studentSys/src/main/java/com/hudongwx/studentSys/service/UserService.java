package com.hudongwx.studentSys.service;

import com.hudongwx.studentSys.common.Service;
import com.hudongwx.studentSys.model.User;

import java.util.Date;

/**
 * Created by wuhongxu on 2016/8/31 0031.
 */
public class UserService extends Service {
    public User getCurrentUser(){
        return super.getCurrentUser();
    }
    public User getUserById(String id){
        return User.dao.findById(id);
    }
    public void addUser(User user){
        packingUser(user);
        user.save();
    }
    public void packingUser(User user){
        user.setId(System.currentTimeMillis());
        /*
        * user.set...
        *
        *
        * */
    }
}
