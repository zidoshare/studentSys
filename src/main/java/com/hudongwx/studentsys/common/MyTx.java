package com.hudongwx.studentsys.common;

import com.hudongwx.studentsys.exceptions.ServiceException;
import com.hudongwx.studentsys.util.TxKit;
import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;

/**
 * Created by wuhongxu on 2016/11/4 0004.
 */
public class MyTx implements Interceptor {
    @Override
    public void intercept(Invocation inv){
        TxKit.beginTran();
        System.out.println("事务处理");
        try{
            inv.invoke();
        }catch (Exception e){
            TxKit.rollback();
            System.out.println("错误回滚");
            throw e;
        }
        System.out.println("无错不回滚");
        TxKit.commit();
    }
}
