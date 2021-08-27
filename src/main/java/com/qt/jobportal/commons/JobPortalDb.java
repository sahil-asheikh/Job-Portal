/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qt.jobportal.commons;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Zeeshan
 */
public class JobPortalDb {

    private static final String DATABASE = JobPortalDb.class.getSimpleName().toLowerCase();
 //   private static final String DBURL = "jdbc:mysql://103.159.239.52/" + DATABASE +"?"  // server db test
    private static final String DBURL = "jdbc:mysql://localhost/" + DATABASE +"?"
            + "noAccessToProcedureBodies=true&"
            + "autoReconnect=true&"
            + "autoReconnectForPools=true&"
            + "useSSL=false&"
            + "max_allowed_packet=1024*1024*240&"
            + "maxPoolSize=10&"
            + "idleConnectionTestPeriod=3600&"
            + "testConnectionOnCheckIn=true";
  //  private static final String LOCAL_DB_USER = "jp-manager";
  //  private static final String LOCAL_DB_PASS = "Job@1234";
    private static final String LOCAL_DB_USER = "root";
    private static final String LOCAL_DB_PASS = "admin";

    public static Connection connectDb() {
        Connection con = null;
        try {
            // System.out.println("URL : "+DBURL);
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(DBURL, LOCAL_DB_USER, LOCAL_DB_PASS);
//           System.out.println("Done");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }
        return con;
    }

    public static void main(String[] args) throws SQLException {
        connectDb();
    }

}
