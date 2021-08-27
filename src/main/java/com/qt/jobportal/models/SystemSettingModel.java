/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qt.jobportal.models;

import com.qt.jobportal.beans.TblSubscription;
import com.qt.jobportal.beans.TblSystemSetting;
import com.qt.jobportal.commons.DatabaseExistance;
import com.qt.jobportal.commons.JobPortalDb;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Nikita
 */
public class SystemSettingModel {

    Connection con = null;
    DatabaseExistance existance = new DatabaseExistance();
    String sql, message = null;
    ResultSet rs = null;
    CallableStatement cs = null;
//    public static final String TABLENAME = TblJobRole.class.getSimpleName().toLowerCase();
    public static final String TABLECONTENT = "";

    public void create() {
        con = JobPortalDb.connectDb();
        try {
            sql = "create table " + "tbljobrole" + "(" + TABLECONTENT + ");";
            cs = con.prepareCall(sql);
            cs.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Unable to create : " + e.getMessage());
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                message = e.getMessage();
            }
        }
    }

    public String insert(TblSystemSetting bn) {
        System.out.println("We are here");
        con = JobPortalDb.connectDb();
        Task:
        if ("exist".equals(existance.doCheckExistanceOf("tbljobrole", null))) {
            try {
                sql = "insert into " + "tbljobrole" + "( job_role, job_skill) values (?,?)";
                cs = con.prepareCall(sql);
                cs.setString(1, bn.getJobRole());
                cs.setString(2, bn.getJobSkills());

                int rows = cs.executeUpdate();
                if (rows >= 1) {
                    message = "Details Added ";
                }
            } catch (SQLException e) {
                message = "Unable to Add because of : " + e.getMessage() + " | At : " + this.getClass().getName();
            } finally {
                try {
                    if (con != null) {
                        con.close();
                    }
                } catch (SQLException e) {
                    message = e.getMessage();
                }
            }
        } else if ("not_exist".equals(existance.doCheckExistanceOf("tbljobrole", null))) {
            create();
            break Task;
        } else {
            message = "null parameter";
        }
        return message;
    }

    public TblSystemSetting keySkills(String keyskill) {
        con = JobPortalDb.connectDb();
        TblSystemSetting systemBean = null;
        String kSkill = "%" + keyskill + "%";
        try {
            sql = "select * from tbljobrole where job_role like '" + kSkill + "' ";
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                systemBean = new TblSystemSetting(
                        rs.getRow(),
                        rs.getInt("Id"),
                        rs.getString("job_skill"),
                        rs.getString("job_role")
                );
                System.out.println(rs.getString("job_skill"));

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            systemBean = new TblSystemSetting(-1, this.getClass().getName(), e.getMessage());
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                message = e.getMessage();
            }
        }

        return systemBean;
    }

}
