package com.hudongwx.studentsys.util;


import com.jfinal.plugin.activerecord.Config;
import com.jfinal.plugin.activerecord.DbKit;

import java.sql.Connection;

/**
 * Created by wuhongxu on 2016/11/4 0004.
 */

public class TxKit {

    private static void beginTran(Config config) {
        try {
            Connection conn = config.getConnection();
            config.setThreadLocalConnection(conn);
            conn.setAutoCommit(false);
        } catch (Exception e) {
            throw (new RuntimeException(e));
        }
    }

    public static void beginTran(String configName) {
        beginTran(DbKit.getConfig(configName));
    }

    public static void beginTran() {
        beginTran(DbKit.getConfig());
    }

    public static void commit() throws RuntimeException {
        try {
            DbKit.getConfig().getThreadLocalConnection().commit();
            DbKit.getConfig().getThreadLocalConnection().setAutoCommit(true);
            DbKit.getConfig().close(DbKit.getConfig().getThreadLocalConnection());
            DbKit.getConfig().setThreadLocalConnection(null);
        } catch (Exception e) {
            throw (new RuntimeException(e));
        }
    }

    public static void commit(String configName) {
        try {
            DbKit.getConfig(configName).getThreadLocalConnection().commit();
            DbKit.getConfig(configName).getThreadLocalConnection().setAutoCommit(true);
            DbKit.getConfig(configName).close(DbKit.getConfig().getThreadLocalConnection());
            DbKit.getConfig(configName).setThreadLocalConnection(null);
        } catch (Exception e) {
            throw (new RuntimeException(e));
        }
    }

    public static void rollback() {
        try {
            DbKit.getConfig().getThreadLocalConnection().rollback();
            DbKit.getConfig().getThreadLocalConnection().setAutoCommit(true);
            DbKit.getConfig().close(DbKit.getConfig().getThreadLocalConnection());
            DbKit.getConfig().setThreadLocalConnection(null);

        } catch (Exception e) {
            throw (new RuntimeException(e));
        }
    }

    public static void rollback(String configName) {
        try {
            DbKit.getConfig(configName).getThreadLocalConnection().rollback();
            DbKit.getConfig(configName).getThreadLocalConnection().setAutoCommit(true);
            DbKit.getConfig(configName).close(DbKit.getConfig().getThreadLocalConnection());
            DbKit.getConfig(configName).setThreadLocalConnection(null);
        } catch (Exception e) {
            throw (new RuntimeException(e));
        }
    }
}
