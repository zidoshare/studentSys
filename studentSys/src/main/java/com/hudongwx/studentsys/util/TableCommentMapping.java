package com.hudongwx.studentsys.util;

/**
 * Created by wuhongxu on 2016/10/31 0031.
 */
import java.util.HashMap;
import java.util.Map;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Table;

/**
 * @author luoyizhu@gmail.com
 * @Description: TableCommentMapping保存了，表、字段的描述
 * @time:2014年11月19日 下午7:28:06
 */
public final class TableCommentMapping {
    private final Map<Class<? extends Model<?>>, TableComment> modelToTableMap = new HashMap<>();
    private static final TableCommentMapping ME = new TableCommentMapping();

    private TableCommentMapping() {}

    public static TableCommentMapping me() {
        return ME;
    }

    public void putTableComment(TableComment table) {
        modelToTableMap.put(table.getTable().getModelClass(), table);
    }

    @SuppressWarnings("rawtypes")
    public TableComment getTableComment(Class<? extends Model> modelClass) {
        TableComment tableComment = modelToTableMap.get(modelClass);
        if (tableComment == null) throw new RuntimeException("The TableComment mapping of model: " + modelClass.getName() + " not exists. Please add mapping to ActiveRecordPlugin: activeRecordPlugin.addMapping(tableName, YourModel.class).");

        return tableComment;
    }

    public TableComment getTableComment(Table table) {
        return getTableComment(table.getModelClass());
    }
}