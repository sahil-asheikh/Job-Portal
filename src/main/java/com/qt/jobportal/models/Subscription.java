/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qt.jobportal.models;

import com.qt.jobportal.beans.TblAdmin;
import com.qt.jobportal.beans.TblSubscription;
import com.qt.jobportal.commons.DatabaseExistance;
import com.qt.jobportal.commons.JobPortalDb;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author win8.1
 */
public class Subscription {

    Connection con = null;
    DatabaseExistance existance = new DatabaseExistance();
    String sql, message = null;
    ResultSet rs = null;
    CallableStatement cs = null;
    public static final String TABLENAME = TblSubscription.class.getSimpleName().toLowerCase();
    public static final String TABLECONTENT = "";

    public void create() {
        con = JobPortalDb.connectDb();
        try {
            sql = "create table " + TABLENAME + "(" + TABLECONTENT + ");";
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

    public String insert(TblSubscription bn) {
        System.out.println("We are here");
        con = JobPortalDb.connectDb();
        Task:
        if ("exist".equals(existance.doCheckExistanceOf(TABLENAME, null))) {
            try {
                sql = "insert into " + TABLENAME + "( subscription_id,title, price, validity_in_days, active_job_limit, response_limit, databaseLimit, phone_call_limit, suggestion,job_post_deduction,response_deduction , field3, visibility) values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
                cs = con.prepareCall(sql);
                cs.setString(1, bn.getSubscription_id());
                cs.setString(2, bn.getTitle());
                cs.setInt(3, bn.getPrice());
                cs.setInt(4, bn.getValidity_in_days());
                cs.setInt(5, bn.getActive_job_limit());
                cs.setInt(6, bn.getResponseLimit());
                cs.setInt(7, bn.getDatabaseLimit());
                cs.setInt(8, bn.getCallLimit());
                cs.setString(9, bn.getSuggestion());
                cs.setInt(10, bn.getJob_post_deduction());
                cs.setInt(11, bn.getResponse_deduction());
                cs.setString(12, bn.getField3());
                cs.setInt(13, bn.getVisibility());
                int rows = cs.executeUpdate();
                if (rows >= 1) {
                    message = "<span class=\"text-success font-bold\">Subscription Added</span>";
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
        } else if ("not_exist".equals(existance.doCheckExistanceOf(TABLENAME, null))) {
            create();
            break Task;
        } else {
            message = "null parameter";
        }
        return message;
    }

    public String delete(TblSubscription bn) {
        con = JobPortalDb.connectDb();
        try {
//            sql = "delete from " + TABLENAME + " where id = ?";
            sql = "delete from tblsubscription where subscription_id = ?";
            cs = con.prepareCall(sql);
            cs.setString(1, bn.getSubscription_id());
            int rows = cs.executeUpdate();
            if (rows >= 1) {
                message = "Subscription Deleted ";
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
    }

    public String update(TblSubscription bn) {
        con = JobPortalDb.connectDb();
        try {
            sql = "UPDATE tblsubscription SET title = ?, price = ?, validity_in_days = ?, suggestion = ?, job_post_deduction = ?, response_deduction = ? WHERE id = ?";

            cs = con.prepareCall(sql);
            cs.setString(1, bn.getTitle());
            cs.setInt(2, bn.getPrice());
            cs.setInt(3, bn.getValidity_in_days());
            cs.setString(4, bn.getSuggestion());
            cs.setInt(5, bn.getJob_post_deduction());
            cs.setInt(6, bn.getResponse_deduction());
            cs.setInt(7, bn.getId());

            int rows = cs.executeUpdate();
            if (rows >= 1) {
                message = " Subscription Updated ";
            }
        } catch (SQLException e) {
            message = "Unable to Update because of : " + e.getMessage() + " | At : " + this.getClass().getName();
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
    }

    public ArrayList<TblSubscription> select() {
        con = JobPortalDb.connectDb();
        ArrayList<TblSubscription> arrayList = new ArrayList<>();
        try {
            sql = "select * from " + TABLENAME + " where visibility = 1 limit 4";
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                arrayList.add(new TblSubscription(
                        rs.getRow(),
                        rs.getInt("Id"),
                        rs.getString("subscription_id"),
                        rs.getString("title"),
                        rs.getInt("price"),
                        rs.getInt("validity_in_days"),
                        rs.getInt("active_job_limit"),
                        rs.getInt("response_limit"),
                        rs.getInt("databaseLimit"),
                        rs.getInt("phone_call_limit"),
                        rs.getString("suggestion"),
                        rs.getInt("job_post_deduction"),
                        rs.getInt("response_deduction"),
                        rs.getString("field3"),
                        rs.getInt("visibility"),
                        rs.getString("created_at"),
                        rs.getString("modifiedAt")
                )
                );
            }
            if (arrayList.isEmpty()) {
                arrayList.add(new TblSubscription(0, this.getClass().getName(), "No Data Found"));
            }
        } catch (SQLException e) {
            arrayList.add(new TblSubscription(-1, this.getClass().getName(), e.getMessage()));
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
    }
    
    public ArrayList<TblSubscription> selectAllEmpSub() {
        con = JobPortalDb.connectDb();
        ArrayList<TblSubscription> arrayList = new ArrayList<>();
        try {
            sql = "select * from " + TABLENAME;
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                arrayList.add(new TblSubscription(
                        rs.getRow(),
                        rs.getInt("Id"),
                        rs.getString("subscription_id"),
                        rs.getString("title"),
                        rs.getInt("price"),
                        rs.getInt("validity_in_days"),
                        rs.getInt("active_job_limit"),
                        rs.getInt("response_limit"),
                        rs.getInt("databaseLimit"),
                        rs.getInt("phone_call_limit"),
                        rs.getString("suggestion"),
                        rs.getInt("job_post_deduction"),
                        rs.getInt("response_deduction"),
                        rs.getString("field3"),
                        rs.getInt("visibility"),
                        rs.getString("created_at"),
                        rs.getString("modifiedAt")
                )
                );
            }
            if (arrayList.isEmpty()) {
                arrayList.add(new TblSubscription(0, this.getClass().getName(), "No Data Found"));
            }
        } catch (SQLException e) {
            arrayList.add(new TblSubscription(-1, this.getClass().getName(), e.getMessage()));
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
    }

    public ArrayList<TblSubscription> selectByLimit(String limit) {
        con = JobPortalDb.connectDb();
        ArrayList<TblSubscription> arrayList = new ArrayList<>();
        try {
//            sql = "select * from " + TABLENAME;
            sql = "select * from " + TABLENAME + " where visibility = 1 limit " + limit;
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                arrayList.add(new TblSubscription(
                        rs.getRow(),
                        rs.getInt("Id"),
                        rs.getString("subscription_id"),
                        rs.getString("title"),
                        rs.getInt("price"),
                        rs.getInt("validity_in_days"),
                        rs.getInt("active_job_limit"),
                        rs.getInt("response_limit"),
                        rs.getInt("databaseLimit"),
                        rs.getInt("phone_call_limit"),
                        rs.getString("suggestion"),
                        rs.getInt("job_post_deduction"),
                        rs.getInt("response_deduction"),
                        rs.getString("field3"),
                        rs.getInt("visibility"),
                        rs.getString("created_at"),
                        rs.getString("modifiedAt")
                ));
            }
            if (arrayList.isEmpty()) {
                arrayList.add(new TblSubscription(0, this.getClass().getName(), "No Data Found"));
            }
        } catch (SQLException e) {
            arrayList.add(new TblSubscription(-1, this.getClass().getName(), e.getMessage()));
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
    }

    public TblSubscription selectById(String sid) {
        con = JobPortalDb.connectDb();
        TblSubscription bean = null;
        try {
            sql = "SELECT * FROM tblsubscription where subscription_id = ? ";
            System.out.println(sid);
            cs = con.prepareCall(sql);
            cs.setString(1, sid);
            rs = cs.executeQuery();
            while (rs.next()) {
                bean = new TblSubscription(
                        rs.getRow(),
                        rs.getInt("id"),
                        rs.getString("subscription_id"),
                        rs.getString("title"),
                        rs.getInt("price"),
                        rs.getInt("validity_in_days"),
                        rs.getInt("active_job_limit"),
                        rs.getInt("response_limit"),
                        rs.getInt("databaseLimit"),
                        rs.getInt("phone_call_limit"),
                        rs.getString("suggestion"),
                        rs.getInt("job_post_deduction"),
                        rs.getInt("response_deduction"),
                        rs.getString("field3"),
                        rs.getInt("visibility"),
                        rs.getString("created_at"),
                        rs.getString("modifiedAt")
                );
            }
        } catch (SQLException e) {
            bean = new TblSubscription(-1, this.getClass().getName(), e.getMessage());
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                message = e.getMessage();
            }
        }
        return bean;
    }

    public int doCheckExist(int ProductId, int productSize) {
        con = JobPortalDb.connectDb();
        int status = 0;
        sql = "SELECT size FROM " + TABLENAME + " where ";
        try {
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            if (rs.next()) {
                if (rs.getInt(1) == productSize) {
                    return 1;
                }
            } else {
                return 2;
            }
        } catch (SQLException e) {
            System.out.println("Exception At : " + this.getClass().getName() + " | " + e.getMessage());
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                message = e.getMessage();
            }
        }
        return status;
    }

    // Get wallet Balance for employer
    public int SubscriptionAmountEmp(String subsPublicId) {
        int balance = 0;
        con = JobPortalDb.connectDb();
        try {
            sql = "select price from tblsubscription where subscription_id = ? ";
            cs = con.prepareCall(sql);
            cs.setString(1, subsPublicId);
            rs = cs.executeQuery();
            while (rs.next()) {
                balance = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                message = e.getMessage();
            }
        }
        System.out.println("bal : " + balance);
        return balance;
    }

    public static String empSubscID(String empID) {
        String empSubID = null;
        Connection con = JobPortalDb.connectDb();
        String sqlQuery = "select subscription_id from tblemployer where employer_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sqlQuery);
            ps.setString(1, empID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                empSubID = rs.getString(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return empSubID;
    }

    public static int empDeduction(String empId) {
        int empDeduction = 0;
        String empSubscID = Subscription.empSubscID(empId);
        Connection con = JobPortalDb.connectDb();
        String sqlQuery = "SELECT response_deduction FROM tblsubscription where subscription_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sqlQuery);
            ps.setString(1, empSubscID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                empDeduction = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return empDeduction;
    }

    public static int empBalance(String empId) {
        int empBalance = 0;
        Connection con = JobPortalDb.connectDb();
        String sqlQuery = "select balance from tblemployer where employer_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sqlQuery);
            ps.setString(1, empId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                empBalance = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return empBalance;
    }

    public boolean empSubLimit(String sid) {
        System.out.println("EXECUTED");
        int subLimit = 0;
        boolean stat = false;
        con = JobPortalDb.connectDb();
        sql = "SELECT visibility FROM tblsubscription where visibility = 1";
        try {
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                subLimit = subLimit + 1;
            }
            if (subLimit >= 4) {
                stat = false;
            } else {
                stat = true;
            }
            subLimit = 0;
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
        return stat;
    }

    public String changeEmpSubscriptionVisibility(int status, String sid) {
        con = JobPortalDb.connectDb();
        sql = "UPDATE tblsubscription SET visibility = ? WHERE subscription_id = ?";
        try {
            cs = con.prepareCall(sql);
            cs.setInt(1, status);
            cs.setString(2, sid);
            int i = cs.executeUpdate();
            if (i >= 1) {
                if (status == 1) {
                    message = "Subscription is activated";
                } else {
                    message = "Subscription is deactivated";
                }
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

        return message;
    }

}
