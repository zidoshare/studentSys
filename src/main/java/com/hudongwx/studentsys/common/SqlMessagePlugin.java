package com.hudongwx.studentsys.common;

/**
 * Created by wuhongxu on 2016/10/31 0031.
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hudongwx.studentsys.util.ASMKit;
import com.hudongwx.studentsys.util.TableComment;
import com.hudongwx.studentsys.util.TableCommentMapping;

import com.jfinal.plugin.IPlugin;
import com.jfinal.plugin.activerecord.Config;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.DbKit;
import com.jfinal.plugin.activerecord.DbPro;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.Table;
import com.jfinal.plugin.activerecord.TableMapping;

/**
 * @author luoyizhu@gmail.com
 * @Description: PostgreSql:获取表、字段中文信息描述插件<BR>
 * 注意点：必须在com.jfinal.plugin.activerecord.ActiveRecordPlugin插件之后添加此插件。<BR>
 * 原因表信息，都是从TableMapping获取。
 * @time:2014年11月19日 下午5:40:21
 */
final class SqlMessagePlugin implements IPlugin {
    @Override
    public boolean start() {
        // 获取TableMapping私有变量的表映射信息
        Map<Class<? extends Model<?>>, Table> modelToTableMap = ASMKit.getFieldValue(TableMapping.me(), "modelToTableMap");
        assert modelToTableMap != null;
        for (Table table : modelToTableMap.values()) {
            Config config = DbKit.getConfig(table.getModelClass());
            DbPro dbPro = Db.use(config.getName());
            // 表名注释
            String tableNameComment = dbPro.findFirst("select table_comment from information_schema.tables where table_name = ?", table.getName()).getStr("table_comment");
            // 表所有字段集合
            List<Record> columnComments = dbPro.find("select column_name, column_comment from information_schema.columns where table_name = ?", table.getName());

            TableComment tableComment = new TableComment(table, tableNameComment);
            TableCommentMapping.me().putTableComment(tableComment);

            for (Record comment : columnComments) {
                // 表字段列名
                String columnName = comment.getStr("column_name");
                // 字段注释
                String columnComment = comment.getStr("column_comment");
                tableComment.setColumnComment(columnName, columnComment);
            }
        }
        return true;
    }

    @Override
    public boolean stop() {
        return false;
    }

}