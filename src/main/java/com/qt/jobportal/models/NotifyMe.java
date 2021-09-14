/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qt.jobportal.models;

import com.qt.jobportal.beans.TblNotify;
import com.qt.jobportal.commons.DatabaseExistance;
import com.qt.jobportal.commons.JobPortalDb;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Zoya
 */
public class NotifyMe {

    Connection con = null;
    DatabaseExistance existance = new DatabaseExistance();
    String sql, message = null;
    ResultSet rs = null;
    CallableStatement cs = null;

    public String insert(TblNotify notifyme) {

        boolean checkEmail = checkEmail(notifyme.getEmailId());
        con = JobPortalDb.connectDb();

        if (checkEmail) {
            message = "<span class=\"text-danger font-bold\"> You have already subscribed to our services </span>";
        } else {
            try {
                sql = "insert into tblnotifyme(notify_public_id, name, job_category, email)values (?,?,?,?)";
                cs = con.prepareCall(sql);
                cs.setString(1, notifyme.getNotifyPublicId());
                cs.setString(2, notifyme.getName());
                cs.setString(3, notifyme.getJobCategory());
                cs.setString(4, notifyme.getEmailId());
                int rows = cs.executeUpdate();
                if (rows >= 1) {
                    message = "<span class=\"text-success font-bold\"> Subscriber Added </span>";
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
        }

        return message;

    }

    public boolean checkEmail(String email) {
        con = JobPortalDb.connectDb();
        sql = "SELECT * FROM tblnotifyme where email = ?";
        boolean check = false;

        try {
            cs = con.prepareCall(sql);
            cs.setString(1, email);
            rs = cs.executeQuery();
            if (rs.next()) {
                check = true;
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

        return check;
    }

    //select notify subscriber
    public ArrayList<TblNotify> select() {
        con = JobPortalDb.connectDb();
        ArrayList<TblNotify> arrayList = new ArrayList<>();
        try {
            sql = "select * from tblnotifyme";
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                arrayList.add(new TblNotify(
                        rs.getRow(),
                        rs.getString("notify_public_id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("job_category"),
                        rs.getString("created_at"),
                        rs.getString("modified_at")
                ));
            }
            if (arrayList.isEmpty()) {
                arrayList.add(new TblNotify(0, this.getClass().getName(), "No Data Found"));
            }
        } catch (SQLException e) {
            arrayList.add(new TblNotify(-1, this.getClass().getName(), e.getMessage()));
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                message = e.getMessage();
            }
        }
        return arrayList;
    }//ArrayList

    public String delete(TblNotify notify) {
        con = JobPortalDb.connectDb();
        try {
            sql = "delete from tblnotifyme where notify_public_id = ?";
            cs = con.prepareCall(sql);
            cs.setString(1, notify.getNotifyPublicId());
            int rows = cs.executeUpdate();
            if (rows >= 1) {
                message = "Data Deleted";
            }
        } catch (SQLException e) {
            message = "Unable to Delete because of : " + e.getMessage() + " | At : " + this.getClass().getName();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                message = e.getMessage();
            }
        }
        return message;
    }//delete

}
