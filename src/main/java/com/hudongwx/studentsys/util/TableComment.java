package com.hudongwx.studentsys.util;

/**
 * Created by wuhongxu on 2016/10/31 0031.
 */
import java.util.HashMap;
import java.util.Map;

import com.jfinal.plugin.activerecord.Table;

/**
 * @author luoyizhu@gmail.com
 * @Description: 表、字段的注释，描述信息
 * @time:2014年11月19日 下午6:46:54
 */
public final class TableComment {
    /**
     * key : 数据库字段名。value : 对应的字段描述
     */
    private Map<String, String> columnCommentMap = new HashMap<>();
    private Table table;

    public TableComment(Table table, String comment) {
        this.table = table;
        this.columnCommentMap.put(table.getName(), comment);
    }

    public String getColumnComment(String columnName) {
        return this.columnCommentMap.get(columnName);
    }

    public Table getTable() {
        return this.table;
    }

    public String getTableName() {
        return table.getName();
    }

    public String getTableComment() {
        return columnCommentMap.get(table.getName());
    }

    public void setColumnComment(String columnName,
                                 String columnComment) {
        this.columnCommentMap.put(columnName, columnComment);
    }

    /**
     * @Description: Get attribute comment<BR>
     *               这样命名好处是如果你的页面模版是使用beetl，可以方便的获取字段描述<BR>
     *               <p>
     *               java controller code:<BR>
     *               this.setAttr("comment",TableCommentMapping.me().getTableComment(Bundle.class));
     *               </p>
     *               <p>
     *               beetl html code:<BR>
     *               ${comment.name} 获取字段描述
     *               </p>
     * @author: luoyizhu
     * @time:2014年11月19日 下午8:18:14
     * @title get
     * @param attr 属性名，数据库字段名
     * @return
     */
    public String get(String attr) {
        return columnCommentMap.get(attr);
    }
}
