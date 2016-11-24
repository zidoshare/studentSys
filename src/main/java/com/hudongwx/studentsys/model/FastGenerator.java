package com.hudongwx.studentsys.model;

import com.jfinal.kit.PathKit;
import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.dialect.MysqlDialect;
import com.jfinal.plugin.activerecord.generator.Generator;
import com.jfinal.plugin.c3p0.C3p0Plugin;

import javax.sql.DataSource;

/**
 * Created by wuhongxu on 2016/8/29 0029.
 */
public class FastGenerator {
    public static DataSource getDataSource() {
        Prop dataBaseProp = PropKit.use("local.properties");
        String jdbcUrl = dataBaseProp.get("jdbcUrl");
        String user = dataBaseProp.get("user");
        String password = dataBaseProp.get("password");
        System.out.println(jdbcUrl + ":::::::" + user + "::::::" + password);
        C3p0Plugin c3p0Plugin = new C3p0Plugin(jdbcUrl, user, password);
        c3p0Plugin.start();
        return c3p0Plugin.getDataSource();
    }

    public static void main(String[] args) {
        String baseModelPackageName = "com.hudongwx.studentsys.common";
        String baseModelOutputDir = PathKit.getWebRootPath() + "\\src\\main\\java\\com\\hudongwx\\studentsys\\common";
        String modelPackageName = "com.hudongwx.studentsys.model";
        String modelOutputDir = PathKit.getWebRootPath() + "\\src\\main\\java\\com\\hudongwx\\studentsys\\model";
        Generator generator = new Generator(getDataSource(), baseModelPackageName, baseModelOutputDir, modelPackageName, modelOutputDir);
        generator.setDialect(new MysqlDialect());
        generator.setGenerateDaoInModel(true);
        generator.setGenerateDataDictionary(true);
        generator.setRemovedTableNamePrefixes("stumanager_");
        generator.generate();
    }

}
