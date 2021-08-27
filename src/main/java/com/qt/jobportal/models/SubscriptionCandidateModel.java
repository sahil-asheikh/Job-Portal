/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qt.jobportal.models;

import com.qt.jobportal.beans.TblCandidate;
import com.qt.jobportal.beans.TblCandidatePlan;
import com.qt.jobportal.beans.tblSubscriptionCandidate;
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
 * @author Nikita
 */
public class SubscriptionCandidateModel {

    Connection con = null;
    DatabaseExistance existance = new DatabaseExistance();
    String sql, message = null;
    ResultSet rs = null;
    CallableStatement cs = null;
    public static final String TABLENAME = tblSubscriptionCandidate.class.getSimpleName().toLowerCase();
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

    public String insert(tblSubscriptionCandidate bn) {
        System.out.println("We are here");
        con = JobPortalDb.connectDb();
        Task:
        if ("exist".equals(existance.doCheckExistanceOf(TABLENAME, null))) {
            try {
                sql = "insert into " + TABLENAME + "(subscriptioncandidate_id, title, price, validity, per_apply_price, suggestion, visibility) values (?,?,?,?,?,?,?)";
                cs = con.prepareCall(sql);

                cs.setString(1, bn.getSubCandPublicId());
                cs.setString(2, bn.getTitle());
                cs.setInt(3, bn.getPrice());
                cs.setString(4, bn.getValidity());
                cs.setInt(5, bn.getPer_apply_price());
                cs.setString(6, bn.getSuggestion());
                cs.setInt(7, bn.getVisibility());

                int rows = cs.executeUpdate();
                if (rows >= 1) {
                    message = "<span class=\"text-success font-bold\">Subscription Added </span>";
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

    public String delete(tblSubscriptionCandidate bn) {
        con = JobPortalDb.connectDb();
        try {
            sql = "delete from " + TABLENAME + " where id = ?";
            cs = con.prepareCall(sql);
            cs.setInt(1, bn.getId());
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

    public String update(tblSubscriptionCandidate bn) {
        con = JobPortalDb.connectDb();
        try {
            sql = "update " + TABLENAME + " set  title=?, price=?, validity=?, per_apply_price=?, suggestion=?, visibility=? where id = ?";
            cs = con.prepareCall(sql);
            cs.setString(1, bn.getTitle());
            cs.setInt(2, bn.getPrice());
            cs.setString(3, bn.getValidity());
            cs.setInt(4, bn.getPer_apply_price());
            cs.setString(5, bn.getSuggestion());
            cs.setInt(6, bn.getVisibility());
            cs.setInt(7, bn.getId());

            int rows = cs.executeUpdate();
            if (rows >= 1) {
                message = "Subscription Updated ";
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

    public ArrayList<tblSubscriptionCandidate> select() {
        con = JobPortalDb.connectDb();
        ArrayList<tblSubscriptionCandidate> arrayList = new ArrayList<>();
        try {
            sql = "select * from " + TABLENAME + " limit 4 ";
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                arrayList.add(new tblSubscriptionCandidate(
                        rs.getRow(),
                        rs.getInt("Id"),
                        rs.getString("subscriptioncandidate_id"),
                        rs.getString("title"),
                        rs.getInt("price"),
                        rs.getString("validity"),
                        rs.getInt("per_apply_price"),
                        rs.getString("suggestion"),
                        rs.getInt("visibility"),
                        rs.getString("createdAt"),
                        rs.getString("modifiedAt")
                )
                );
            }
            if (arrayList.isEmpty()) {
                arrayList.add(new tblSubscriptionCandidate(0, this.getClass().getName(), "No Data Found"));
            }
        } catch (SQLException e) {
            arrayList.add(new tblSubscriptionCandidate(-1, this.getClass().getName(), e.getMessage()));
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

    public tblSubscriptionCandidate selectById(String candSubPid) {
        con = JobPortalDb.connectDb();
        tblSubscriptionCandidate bean = null;
        try {
            sql = "select * from tblsubscriptioncandidate where subscriptioncandidate_id = ?";
            cs = con.prepareCall(sql);
            cs.setString(1, candSubPid);
            rs = cs.executeQuery();
            while (rs.next()) {
                bean = new tblSubscriptionCandidate(
                        rs.getRow(),
                        rs.getInt("id"),
                        rs.getString("subscriptioncandidate_id"),
                        rs.getString("title"),
                        rs.getInt("price"),
                        rs.getString("validity"),
                        rs.getInt("per_apply_price"),
                        rs.getString("suggestion"),
                        rs.getInt("visibility"),
                        rs.getString("createdAt"),
                        rs.getString("modifiedAt")
                );
            }
        } catch (SQLException e) {
            bean = new tblSubscriptionCandidate(-1, this.getClass().getName(), e.getMessage());
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

    public int SubscriptionCandAmountEmp(String subCandPublicId) {
        int balance = 0;
        con = JobPortalDb.connectDb();
        try {
            sql = "select price from tblsubscriptioncandidate where subscriptioncandidate_id = ? ";
            cs = con.prepareCall(sql);
            cs.setString(1, subCandPublicId);
            rs = cs.executeQuery();
            while (rs.next()) {
                balance = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        System.out.println("bal : " + balance);
        return balance;
    }

//    method to get the balance
    public static int getBalance(String candidateId) {
        int balance = 0;
        Connection con = JobPortalDb.connectDb();
        try {
            PreparedStatement ps = con.prepareStatement("selct balance from tblcandidate where candidate_id = ?");
            ps.setString(1, candidateId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                balance = rs.getInt(1);
            }
        } catch (Exception e) {
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
        return balance;
    }

//    method to get data from subscription table
    public static TblCandidatePlan selectSubscriptionPlan(String subscriptionId) {
        TblCandidatePlan candidatePlans = new TblCandidatePlan();
        Connection con = JobPortalDb.connectDb();
        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM tblsubscriptioncandidate WHERE subscriptioncandidate_id = ?");
            ps.setString(1, subscriptionId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
//                TblCandidatePlan candidate = new TblCandidatePlan();
                candidatePlans.setPlanTitle(rs.getString(3));
                candidatePlans.setPlanAmout(rs.getInt(4));
                candidatePlans.setValidityInDays(rs.getString(5));
                candidatePlans.setPerApplyDeduction(rs.getInt(6));
                candidatePlans.setPlanSuggestion(rs.getString(7));
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
        return candidatePlans;
    }

//    method to save the Subscription Data into the table
    public static int saveSubscriptionData(TblCandidatePlan getPlan) {
        int i = 0;
        Connection con = JobPortalDb.connectDb();
        try {
            PreparedStatement ps_tblcandidateplan = con.prepareStatement("INSERT INTO tblcandidateplan (candidate_id, plan_title, plan_amount, available_balance, validity_in_days, start_date, end_date, per_apply_deduction, plan_suggestion) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
            ps_tblcandidateplan.setString(1, getPlan.getCandidateId());
            ps_tblcandidateplan.setString(2, getPlan.getPlanTitle());
            ps_tblcandidateplan.setInt(3, getPlan.getPlanAmout());
            ps_tblcandidateplan.setInt(4, getPlan.getAvailableBalance());
            ps_tblcandidateplan.setString(5, getPlan.getValidityInDays());
            ps_tblcandidateplan.setString(6, getPlan.getStartDate());
            ps_tblcandidateplan.setString(7, getPlan.getEndDate());
            ps_tblcandidateplan.setInt(8, getPlan.getPerApplyDeduction());
            ps_tblcandidateplan.setString(9, getPlan.getPlanSuggestion());

            i = ps_tblcandidateplan.executeUpdate();

        } catch (Exception e) {
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

        return i;
    }

//    method to insert subscriptionID into the table
    public static int purchaseSubscription(TblCandidatePlan getPlan, String subscriptionId, int balance) {
        int i = 0;
        Connection con = JobPortalDb.connectDb();
        try {
            PreparedStatement ps = con.prepareStatement("UPDATE tblcandidate SET subscription_id = ?, balance = ? WHERE candidate_id = ?");
            ps.setString(1, subscriptionId);
            ps.setInt(2, balance);
            ps.setString(3, getPlan.getCandidateId());
            i = ps.executeUpdate();
            if (i == 1) {
                i = saveSubscriptionData(getPlan);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return i;
    }

    public static int deduction(String subscriptionId) {
        int deduction = 0;
        Connection con = JobPortalDb.connectDb();
        String sqlQuery = "SELECT per_apply_price FROM tblsubscriptioncandidate where subscriptioncandidate_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sqlQuery);
            ps.setString(1, subscriptionId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                deduction = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return deduction;
    }

}
