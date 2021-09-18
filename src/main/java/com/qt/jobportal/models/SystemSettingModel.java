/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qt.jobportal.models;

import com.qt.jobportal.beans.TblSystemSetting;
import com.qt.jobportal.commons.DatabaseExistance;
import com.qt.jobportal.commons.JobPortalDb;
import com.qt.jobportal.commons.Utils;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
                sql = "insert into " + "tbljobrole" + "(job_role_id, job_role, job_skill) values (?,?,?)";
                cs = con.prepareCall(sql);
                cs.setString(1, Utils.generatePublicId(30));
                cs.setString(2, bn.getJobRole());
                cs.setString(3, bn.getJobSkills());

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

    public boolean checkJobRole(String jobRole) {
        boolean avil = false;
        con = JobPortalDb.connectDb();
        sql = "SELECT * FROM tbljobrole where job_role = ?";
        try {
            cs = con.prepareCall(sql);
            cs.setString(1, jobRole);
            rs = cs.executeQuery();
            if (rs.next()) {
                avil = true;
            }
        } catch (Exception e) {
            message = e.getMessage();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                message = e.getMessage();
            }
        }
        return avil;
    }

    public ArrayList<TblSystemSetting> select() {
        ArrayList<TblSystemSetting> jobRoles = new ArrayList();
        con = JobPortalDb.connectDb();
        sql = "SELECT * FROM tbljobrole";
        try {
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                TblSystemSetting role = new TblSystemSetting();
                role.setId(rs.getInt(1));
                role.setJobRole(rs.getString(3));
                role.setJobSkills(rs.getString(4));

                jobRoles.add(role);
            }
        } catch (SQLException e) {
            message = e.getMessage();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                message = e.getMessage();
            }
        }
        return jobRoles;
    }

    public String update(TblSystemSetting bn) {
        con = JobPortalDb.connectDb();
        Task:
        if ("exist".equals(existance.doCheckExistanceOf("tbljobrole", null))) {
            try {
                sql = "UPDATE tbljobrole SET job_skill = ? WHERE job_role = ?";
                cs = con.prepareCall(sql);
                cs.setString(1, bn.getJobSkills());
                cs.setString(2, bn.getJobRole());

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

    public String selectSkills(String jobRole) {

        String skills = null;
        con = JobPortalDb.connectDb();
        sql = "SELECT job_skill FROM tbljobrole where job_role = ?";
        try {
            cs = con.prepareCall(sql);
            cs.setString(1, jobRole);
            rs = cs.executeQuery();
            if (rs.next()) {
                skills = rs.getString(1);
            }
        } catch (SQLException e) {
            message = e.getMessage();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                message = e.getMessage();
            }
        }
        return skills;
    }

}
