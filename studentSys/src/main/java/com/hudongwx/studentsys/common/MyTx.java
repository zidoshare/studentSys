package com.hudongwx.studentsys.common;

import com.hudongwx.studentsys.util.TxKit;
import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;

/**
 * Created by wuhongxu on 2016/11/4 0004.
 */
public class MyTx implements Interceptor {
    @Override
    public void intercept(Invocation inv) {
        TxKit.beginTran();
        try{
            inv.invoke();
        }catch (Exception e){
            e.printStackTrace();
            TxKit.rollback();
        }
        TxKit.commit();
    }
}
