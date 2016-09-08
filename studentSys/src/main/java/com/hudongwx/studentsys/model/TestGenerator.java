package com.hudongwx.studentsys.model;

import com.jfinal.kit.PathKit;
import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.dialect.MysqlDialect;
import com.jfinal.plugin.activerecord.generator.Generator;
import com.jfinal.plugin.c3p0.C3p0Plugin;

import javax.sql.DataSource;

/**
 * Created by wuhongxu on 2016/9/6 0006.
 */
public class TestGenerator {
    public static DataSource getDataSource(){
        Prop dataBaseProp = PropKit.use("local.properties");
        String jdbcUrl = dataBaseProp.get("testUrl");
        String user = dataBaseProp.get("testUser");
        String password = dataBaseProp.get("testPassword");
        System.out.println(jdbcUrl+":::::::"+user+"::::::"+password);

        C3p0Plugin c3p0Plugin = new C3p0Plugin(jdbcUrl,user,password);
        c3p0Plugin.start();
        return c3p0Plugin.getDataSource();
    }
    public static void main(String[] args){
        String baseModelPackageName = "com.hudongwx.studentsys.common.testBaseModel";
        String baseModelOutputDir = PathKit.getWebRootPath()+"\\src\\main\\java\\com\\hudongwx\\studentsys\\common\\testBaseModel";

        String modelPackageName = "com.hudongwx.studentsys.model.testModel";
        String modelOutputDir = PathKit.getWebRootPath()+"\\src\\main\\java\\com\\hudongwx\\studentsys\\model\\testModel";
        Generator generator = new Generator(getDataSource(),baseModelPackageName,baseModelOutputDir,modelPackageName,modelOutputDir);
        generator.setDialect(new MysqlDialect());
        generator.setGenerateDaoInModel(true);
        generator.setGenerateDataDictionary(true);
        generator.setRemovedTableNamePrefixes("surveys_t_");
        generator.generate();
    }


}
