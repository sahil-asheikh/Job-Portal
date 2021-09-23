/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qt.jobportal.commons;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Zeeshan
 */
public class DatabaseExistance {

    Connection con = JobPortalDb.connectDb();
    Statement stmt = null;
    ResultSet res = null;
    DatabaseMetaData data = null;

    public String doCheckExistanceOf(String tableName, String storeProcedureName) {
        String status = null;
        try {
            stmt=con.createStatement();
            data = con.getMetaData();
            if ((tableName == null || tableName.equals("")) && (storeProcedureName == null || storeProcedureName.equals(""))) {
                status = "null parameter";
            } else {
                if (tableName == null || tableName.equals("")) {
                    // check store procedure
                    res = data.getProcedures(null, null, storeProcedureName);
                } else if (storeProcedureName == null || storeProcedureName.equals("")) {
                    // check table
                    res = data.getTables(null, null, tableName, null);
                }
                if (res.next()) {
                    status = "exist";
                } else {
                    status = "not exist";
                }
            }
        } catch (SQLException e) {
            System.out.println("Exception : " + e.getMessage() + " At - " + this.getClass().getCanonicalName());
        }
        return status;
    }

    public static void main(String[] args) {
//        DatabaseExistance existance = new DatabaseExistance();
//        System.out.println(existance.doCheckExistanceOf("tblkeys", null));
    }
}
