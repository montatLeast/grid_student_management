
package com.family168.student;

import java.sql.*;

public class DbUtils {
    static {
        try {
            Class.forName("org.hsqldb.jdbcDriver");
        } catch(Exception ex) {
            System.err.println(ex);
        }
    }

    static Connection getConn() throws Exception {
        return DriverManager.getConnection("jdbc:hsqldb:res:/test", "sa", "");
    }

    static void close(ResultSet rs, Statement state, Connection conn) {
        if (rs != null) {
            try {
                rs.close();
            } catch(SQLException ex) {
                ex.printStackTrace();
            }
            rs = null;
        }
        if (state != null) {
            try {
                state.close();
            } catch(SQLException ex) {
                ex.printStackTrace();
            }
            state = null;
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            conn = null;
        }
    }
}
