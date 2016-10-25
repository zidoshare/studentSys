package com.hudongwx.studentsys.util;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

import java.util.List;

/**
 * Created by wuhongxu on 2016/10/24 0024.
 */
public class PageinateKit {
    public static <A extends Model,T extends Model> Page<T> ClonePage(Page<A> origin, List<T> list){
        return new Page<>(list,origin.getPageNumber(),origin.getPageSize(),origin.getTotalPage(),origin.getTotalRow());
    }
}
