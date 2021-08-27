/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qt.jobportal.models;

import com.qt.jobportal.beans.TblCandidate;
import com.qt.jobportal.beans.TblCandidateDetails;
import com.qt.jobportal.beans.TblCandidatePlan;
import com.qt.jobportal.beans.TblSystemSetting;
import com.qt.jobportal.beans.tblSubscriptionCandidate;
import com.qt.jobportal.commons.DatabaseExistance;
import com.qt.jobportal.commons.GenerateOTP;
import com.qt.jobportal.commons.JobPortalDb;
import com.qt.jobportal.commons.Utils;
import java.io.IOException;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author win8.1
 */
public class CandidateModel {

    Connection con = null;
    DatabaseExistance existance = new DatabaseExistance();
    String sql, message = null;
    ResultSet rs = null;
    CallableStatement cs = null;

    public static final String TABLENAME = TblCandidate.class.getSimpleName().toLowerCase();

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

    public String insert(TblCandidate bn) {
        System.out.println("We are here");
        con = JobPortalDb.connectDb();
        Task:
        if (null == existance.doCheckExistanceOf(TABLENAME, null)) {
            message = "null parameter";
        } else {
            switch (existance.doCheckExistanceOf(TABLENAME, null)) {
                case "exist":
                    try {

                    sql = "insert into " + TABLENAME + "( candidate_id,subscription_id, balance, fullName, state,"
                            + " phone_no, city, address, age,"
                            + " gender, qualification, schoolMedium, englishSkill, "
                            + "fresherExperience, jobRole, skillSet, password, emailId) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                    cs = con.prepareCall(sql);

                    cs.setString(1, bn.getCandPublicId());
                    System.out.println(bn.getCandPublicId());
                    cs.setString(2, bn.getSubscriptionId());
                    cs.setInt(3, bn.getBalance());
                    cs.setString(4, bn.getFullName());
                    cs.setString(5, bn.getState());
                    cs.setString(6, bn.getPhone_No());
                    cs.setString(7, bn.getCity());
                    cs.setString(8, bn.getAddress());
                    cs.setInt(9, bn.getAge());
                    cs.setString(10, bn.getGender());
                    cs.setString(11, bn.getQualification());
                    cs.setString(12, bn.getSchoolMedium());
                    cs.setString(13, bn.getEnglishSkill());
                    cs.setString(14, bn.getFresherExperience());
                    cs.setString(15, bn.getJobRole());
                    cs.setString(16, bn.getSkillSet());
                    cs.setString(17, bn.getPassword());
                    cs.setString(18, bn.getEmailId());

                    int rows = cs.executeUpdate();
                    if (rows >= 1) {
                        message = "<span class=\"text-success font-bold\">Candidate Added </span>";
                    }

                } catch (SQLException e) {
                    message = "Unable to Add Candidate because of : " + e.getMessage() + " | At : " + this.getClass().getName();
                } finally {
                    try {
                        if (con != null) {
                            con.close();
                        }
                    } catch (SQLException e) {
                        message = e.getMessage();
                    }
                }
                break;
                case "not_exist":
                    create();
                    break Task;
                default:
                    message = "null parameter";
                    break;
            }
        }
        return message;
    }

    public String update(TblCandidate bn) {
        con = JobPortalDb.connectDb();
        try {
            sql = "update " + TABLENAME + " set fullName =?,state=?, phone_no =?, city =?,"
                    + " address =?, age =?, gender =?, qualification =?, "
                    + "schoolMedium =?, englishSkill =?, fresherExperience =?, jobRole =? ,"
                    + "skillSet=?, password=?, emailId=?,subscription_id=? ,balance=?  where candidate_id = ?";
            cs = con.prepareCall(sql);
            cs.setString(1, bn.getFullName());
            cs.setString(2, bn.getState());
            cs.setString(3, bn.getPhone_No());
            cs.setString(4, bn.getCity());
            cs.setString(5, bn.getAddress());
            cs.setInt(6, bn.getAge());
            cs.setString(7, bn.getGender());
            cs.setString(8, bn.getQualification());
            cs.setString(9, bn.getSchoolMedium());
            cs.setString(10, bn.getEnglishSkill());
            cs.setString(11, bn.getFresherExperience());
            cs.setString(12, bn.getJobRole());
            cs.setString(13, bn.getSkillSet());
            cs.setString(14, bn.getPassword());
            cs.setString(15, bn.getEmailId());
            cs.setString(16, bn.getSubscriptionId());
            cs.setInt(17, bn.getBalance());

            cs.setString(18, bn.getCandPublicId());

            int rows = cs.executeUpdate();
            if (rows >= 1) {
                message = " Candidate Updated ";
            }
        } catch (SQLException e) {
            message = "Unable to Update Candidate because of : " + e.getMessage() + " | At : " + this.getClass().getName();
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

    public String delete(TblCandidate bn) {
        con = JobPortalDb.connectDb();
        try {
            sql = "delete from " + TABLENAME + " where candidate_id = ?";
            cs = con.prepareCall(sql);
            cs.setString(1, bn.getCandPublicId());
            int rows = cs.executeUpdate();
            if (rows >= 1) {
                message = "Candidate Deleted ";
            }
        } catch (SQLException e) {
            message = "Unable to Delete Candidate because of : " + e.getMessage() + " | At : " + this.getClass().getName();
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

    public ArrayList<TblCandidate> select() {
        con = JobPortalDb.connectDb();
        ArrayList<TblCandidate> arrayList = new ArrayList<>();
        try {
            sql = "select * from " + TABLENAME;
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                arrayList.add(new TblCandidate(
                        rs.getRow(),
                        rs.getInt("Id"),
                        rs.getString("candidate_id"),
                        rs.getString("subscription_id"),
                        rs.getInt("balance"),
                        rs.getString("fullName"),
                        rs.getString("state"),
                        rs.getString("phone_no"),
                        rs.getString("city"),
                        rs.getString("address"),
                        rs.getInt("age"),
                        rs.getString("gender"),
                        rs.getString("qualification"),
                        rs.getString("schoolMedium"),
                        rs.getString("englishSkill"),
                        rs.getString("fresherExperience"),
                        rs.getString("jobRole"),
                        rs.getString("skillSet"),
                        rs.getString("createdAt"),
                        rs.getString("modifiedAt"),
                        rs.getString("password"),
                        rs.getString("emailId"),
                        rs.getInt("authentication"),
                        rs.getInt("attempts")
                ));
            }
            if (arrayList.isEmpty()) {
                arrayList.add(new TblCandidate(0, this.getClass().getName(), "No Data Found"));
            }
        } catch (SQLException e) {
            arrayList.add(new TblCandidate(-1, this.getClass().getName(), e.getMessage()));
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

    public ArrayList<TblCandidate> selectByLimit(String limit) {
        con = JobPortalDb.connectDb();
        ArrayList<TblCandidate> arrayList = new ArrayList<>();
        try {
            sql = "select * from " + TABLENAME;
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                arrayList.add(new TblCandidate(
                        rs.getRow(),
                        rs.getInt("Id"),
                        rs.getString("candidate_id"),
                        rs.getString("subscription_id"),
                        rs.getInt("balance"),
                        rs.getString("fullName"),
                        rs.getString("state"),
                        rs.getString("phone_no"),
                        rs.getString("city"),
                        rs.getString("address"),
                        rs.getInt("age"),
                        rs.getString("gender"),
                        rs.getString("qualification"),
                        rs.getString("schoolMedium"),
                        rs.getString("englishSkill"),
                        rs.getString("fresherExperience"),
                        rs.getString("jobRole"),
                        rs.getString("skillSet"),
                        rs.getString("createdAt"),
                        rs.getString("modifiedAt"),
                        rs.getString("password"),
                        rs.getString("emailId"),
                        rs.getInt("authentication"),
                        rs.getInt("attempts")
                ));
            }
            if (arrayList.isEmpty()) {
                arrayList.add(new TblCandidate(0, this.getClass().getName(), "No Data Found"));
            }
        } catch (SQLException e) {
            arrayList.add(new TblCandidate(-1, this.getClass().getName(), e.getMessage()));
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

    public TblCandidate selectById(String cid) {
        con = JobPortalDb.connectDb();
        TblCandidate bean = null;
        try {
            sql = "select * from " + TABLENAME + " where candidate_id = ?";
            cs = con.prepareCall(sql);
            cs.setString(1, cid);
            rs = cs.executeQuery();
            while (rs.next()) {
                bean = new TblCandidate(
                        rs.getRow(),
                        rs.getInt("Id"),
                        rs.getString("candidate_id"),
                        rs.getString("subscription_id"),
                        rs.getInt("balance"),
                        rs.getString("fullName"),
                        rs.getString("state"),
                        rs.getString("phone_no"),
                        rs.getString("city"),
                        rs.getString("address"),
                        rs.getInt("age"),
                        rs.getString("gender"),
                        rs.getString("qualification"),
                        rs.getString("schoolMedium"),
                        rs.getString("englishSkill"),
                        rs.getString("fresherExperience"),
                        rs.getString("jobRole"),
                        rs.getString("skillSet"),
                        rs.getString("createdAt"),
                        rs.getString("modifiedAt"),
                        rs.getString("password"),
                        rs.getString("emailId"),
                        rs.getInt("authentication"),
                        rs.getInt("attempts")
                );
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            bean = new TblCandidate(-1, this.getClass().getName(), e.getMessage());
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

    public static TblCandidateDetails selectCandDet(String cid) {
        TblCandidateDetails cand = new TblCandidateDetails();
        Connection con = JobPortalDb.connectDb();
        String sqlQuery = "select * from tblcandidatedetails where candidate_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sqlQuery);
            ps.setString(1, cid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cand.setCandDetailsPublicId(rs.getString(2));
                cand.setCandPublicId(rs.getString(3));
                cand.setSummary(rs.getString(4));
                cand.setExperience(rs.getString(5));
                cand.setExperienceDetails(rs.getString(6));
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

        return cand;
    }

    public TblCandidateDetails selectCandidateDetailsById(String cid) {
        con = JobPortalDb.connectDb();
        TblCandidateDetails beanDetails = null;
        try {
            sql = "select * from tblcandidatedetails where candidate_id = ?";
            cs = con.prepareCall(sql);
            cs.setString(1, cid);
            rs = cs.executeQuery();
            while (rs.next()) {
                beanDetails = new TblCandidateDetails(
                        rs.getRow(),
                        rs.getInt("Id"),
                        rs.getString("candidate_details_id"),
                        rs.getString("candidate_id"),
                        rs.getString("summary"),
                        rs.getString("experience"),
                        rs.getString("experience_details"),
                        rs.getString("created_at"),
                        rs.getString("modified_at")
                );
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            beanDetails = new TblCandidateDetails(-1, this.getClass().getName(), e.getMessage());
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                message = e.getMessage();
            }
        }
        return beanDetails;
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

    public ArrayList<TblCandidate> selectByCandidateId(String id) {
        con = JobPortalDb.connectDb();
        ArrayList<TblCandidate> arrayList = new ArrayList<>();
        try {
            sql = "select * from " + TABLENAME;
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                arrayList.add(new TblCandidate(
                        rs.getRow(),
                        rs.getInt("Id"),
                        rs.getString("candidate_id"),
                        rs.getString("subscription_id"),
                        rs.getInt("balance"),
                        rs.getString("fullName"),
                        rs.getString("state"),
                        rs.getString("phone_no"),
                        rs.getString("city"),
                        rs.getString("address"),
                        rs.getInt("age"),
                        rs.getString("gender"),
                        rs.getString("qualification"),
                        rs.getString("schoolMedium"),
                        rs.getString("englishSkill"),
                        rs.getString("fresherExperience"),
                        rs.getString("jobRole"),
                        rs.getString("skillSet"),
                        rs.getString("createdAt"),
                        rs.getString("modifiedAt"),
                        rs.getString("password"),
                        rs.getString("emailId"),
                        rs.getInt("authentication"),
                        rs.getInt("attempts")
                ));
            }
            if (arrayList.isEmpty()) {
                arrayList.add(new TblCandidate(0, this.getClass().getName(), "No Data Found"));
            }
        } catch (SQLException e) {
            arrayList.add(new TblCandidate(-1, this.getClass().getName(), e.getMessage()));
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

    HttpSession session = null;

    // -1 Not Found
    // 0 Blocked
    // 1 Found
    // 2 Wrong Password
    public int doLogin(TblCandidate candidate, HttpServletRequest request) {
        int status = 0;
        int authStatus = doCheckLoginAccess(candidate.getPhone_No());
        switch (authStatus) {
            case -1:
                status = -1;
                break;
            case 0:
                status = 0;
                break;
            case 1:
                int verifyStatus = doVerifyCredentials(candidate.getPhone_No(), candidate.getPassword(), request);
                if (verifyStatus == 1) {
                    return 1;
                } else if (verifyStatus == 2) {
                    return 2;
                }
                break;
        }
        return status;
    }

    public int doCheckLoginAccess(String phone) {
        con = JobPortalDb.connectDb();
        int status = -1;
        sql = "select Authentication from " + TABLENAME + " where phone_no = '" + phone + "'";
        try {
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            if (rs.next()) {
                status = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Exception : " + e.getMessage());
        }
        return status;
    }

    public int doVerifyCredentials(String phone, String password, HttpServletRequest request) {

        int status = 0;
        session = request.getSession();
        sql = "select Id,candidate_id, fullName, phone_no, password from " + TABLENAME + " where phone_no = '" + phone + "'";
        try {
            cs = con.prepareCall(sql);
            rs = cs.executeQuery(sql);
            if (rs.next()) {
                if (phone.equals(rs.getString("phone_no")) && password.equals(rs.getString("password"))) {
                    status = 1;
                    session.setAttribute("CandidateId", rs.getString("candidate_id"));
                    System.out.println("cid" + rs.getString("candidate_id"));
                    session.setAttribute("CandidateName", rs.getString("fullName"));
                    resetLoginCount(rs.getInt("Id"));
                } else {
                    status = 2;
                    doIncreamentAttempts(rs.getInt("Id"));
                }
            }
        } catch (SQLException e) {
            System.out.println("com.imantimes.portal.qaswatech.models.LoginModel.doVerifyCredentials() : " + e.getMessage());
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                System.out.println("com.qt.jobportal.models.EmployerModel.doVerifyCredentials() : " + e.getMessage());
            }
        }
        return status;
    }

    public void doIncreamentAttempts(int id) {

        try {
            cs = con.prepareCall("{call spIncreamentWrongAttempts(?,?)}");
            cs.setString(1, TABLENAME);
            cs.setInt(2, id);
            cs.executeUpdate();
        } catch (SQLException e) {
            System.out.println("exception because of Incrementing : " + e.getMessage());
        }
    }

    public void resetLoginCount(int id) {
        sql = "update " + TABLENAME + " set attempts = 0 where id = " + id;
        try {
            cs = con.prepareCall(sql);
            cs.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage() + "com.qt.jobportal.models.candidate.resetLoginCount()");
        }
    }

    public String updatePassword(TblCandidate bn) {
        con = JobPortalDb.connectDb();
        try {
            if (fetchPassword(bn.getCandPublicId()).equals(bn.getValidPassword())) {
                sql = "update " + TABLENAME + " set  password=? where candidate_id = ? ";
                cs = con.prepareCall(sql);
                cs.setString(1, bn.getNewPassword());
                cs.setString(2, bn.getCandPublicId());
                int rows = cs.executeUpdate();

                if (rows >= 1) {
                    message = "Password Updated ";
                }
            } else {
                message = "Old Password does not match";

            }
        } catch (SQLException e) {
            message = "Unable to Update password because of : " + e.getMessage() + " | At : " + this.getClass().getName();
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

    public String fetchPassword(String id) {
        String pass = null;
        try {
            sql = "select password from " + TABLENAME + " where candidate_id = ?";
            cs = con.prepareCall(sql);
            cs.setString(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                pass = rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        System.out.println("Pass : " + pass);
        return pass;
    }

    //insert candidate summary
    public String insertSummary(TblCandidateDetails bn) {
        //   isEmpty(publicID,"columnName","tableName")
        boolean isExist = isEmpty(bn.getCandPublicId(), "summary", "tblcandidatedetails");

        if (isExist == true) {
            // if candidate id exist 
            try {
                sql = "update tblcandidatedetails set summary =? where candidate_id = ?";
                cs = con.prepareCall(sql);
                cs.setString(1, bn.getSummary());
                cs.setString(2, bn.getCandPublicId());

                int rows = cs.executeUpdate();
                if (rows >= 1) {
                    message = "<span class=\"text-success font-bold\"> Details Updated </span>";
                }
            } catch (SQLException e) {
                message = "Unable to Update Candidate Details because of : " + e.getMessage() + " | At : " + this.getClass().getName();
            } finally {
                try {
                    if (con != null) {
                        con.close();
                    }
                } catch (SQLException e) {
                    message = e.getMessage();
                }
            }
        } else {
            try {
                sql = "insert into tblcandidatedetails( candidate_details_id, candidate_id, summary) values (?,?,?)";
                cs = con.prepareCall(sql);
                cs.setString(1, bn.getCandDetailsPublicId());
                cs.setString(2, bn.getCandPublicId());
                cs.setString(3, bn.getSummary());
                int rows = cs.executeUpdate();
                if (rows >= 1) {
                    message = "<span class=\"text-success font-bold\"> Summary Added </span>";
                }

            } catch (SQLException e) {
                message = "Unable to Add Candidate Summary because of : " + e.getMessage() + " | At : " + this.getClass().getName();
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

    public String experienceDetail(TblCandidateDetails bn) {
        con = JobPortalDb.connectDb();
        int isExistCand = 0;

        try {
            sql = "select candidate_id from tblcandidatedetails where candidate_id = ?";
            cs = con.prepareCall(sql);
            cs.setString(1, bn.getCandPublicId());
            rs = cs.executeQuery();
            while (rs.next()) {
                isExistCand = 1;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        //   isEmpty(publicID,"columnName","tableName")
        boolean isExist = isEmpty(bn.getCandPublicId(), "experience_details", "tblcandidatedetails");

        if (isExist == true) {
            // if candidate Exp aleady Exist Thn UPDATE
            try {
                sql = "update tblcandidatedetails set experience = ?,experience_details =? where candidate_id = ?";
                cs = con.prepareCall(sql);
                cs.setString(1, bn.getExperience());
                cs.setString(2, bn.getExperienceDetails());
                cs.setString(3, bn.getCandPublicId());

                int rows = cs.executeUpdate();
                if (rows >= 1) {
                    message = "<span class=\"text-success font-bold\"> Experience Details Updated</span>";
                }
            } catch (SQLException e) {
                message = "Unable to Update  because of : " + e.getMessage() + " | At : " + this.getClass().getName();
            } finally {
                try {
                    if (con != null) {
                        con.close();
                    }
                } catch (SQLException e) {
                    message = e.getMessage();
                }

            }

        } else {
            // if not exist candidate Exp then insert
            try {

                sql = "insert into tblcandidatedetails( candidate_details_id, candidate_id,experience, experience_details) values (?,?,?,?)";
                cs = con.prepareCall(sql);
                cs.setString(1, bn.getCandDetailsPublicId());
                cs.setString(2, bn.getCandPublicId());
                cs.setString(3, bn.getExperience());
                cs.setString(4, bn.getExperienceDetails());

                int rows = cs.executeUpdate();
                if (rows >= 1) {
                    message = "<span class=\"text-success font-bold\">Experience Added</span>";
                }

            } catch (SQLException e) {
                message = "Unable to Add Candidate Experience because of : " + e.getMessage() + " | At : " + this.getClass().getName();
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
    // find candidate details

    public String findCandidateSummary(String cid) {
        con = JobPortalDb.connectDb();
        String summary = null;
        try {

            sql = "select summary from tblcandidatedetails where candidate_id = ?";
            cs = con.prepareCall(sql);
            cs.setString(1, cid);

            rs = cs.executeQuery();
            if (rs.next()) {
                summary = rs.getString("summary");
            } else {
                summary = "No Summary Available";
            }
        } catch (SQLException e) {
            System.out.println("Exception : " + e.getMessage());
        }
        return summary;

    }

    // find candidate experience
    public String findCandidateExperience(String cid) {
        con = JobPortalDb.connectDb();
        String experience = null;

        try {
            sql = "select experience_details from tblcandidatedetails where candidate_id = ?";
            cs = con.prepareCall(sql);
            cs.setString(1, cid);

            rs = cs.executeQuery();
            if (rs.next()) {
                experience = rs.getString("experience_details");
            } else {
                experience = "No experience Available";
            }
        } catch (SQLException e) {
            System.out.println("Exception : " + e.getMessage());
        }
        return experience;

    }

    // members, jobs, resume, counter 
    public ArrayList<Integer> MemberCount() {
        ArrayList<Integer> memberCount = new ArrayList();
        con = JobPortalDb.connectDb();
        try {

            sql = "call spCounter()";
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            rs.next();
            memberCount.add(rs.getInt(1));   // vacancy count
            memberCount.add(rs.getInt(2));   // total members
            memberCount.add(rs.getInt(3));   // candidate count
            memberCount.add(rs.getInt(4));   // emloyer count

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
        return memberCount;
    }

    public String candSignUp(TblCandidate bn) {
        System.out.println("We are here");
        con = JobPortalDb.connectDb();
        Task:
        if (null == existance.doCheckExistanceOf(TABLENAME, null)) {
            message = "null parameter";
        } else {
            switch (existance.doCheckExistanceOf(TABLENAME, null)) {
                case "exist":
                    try {

                    sql = "insert into " + TABLENAME + "( candidate_id, fullName, phone_no, emailId, password) values (?,?,?,?,?)";
                    cs = con.prepareCall(sql);
                    cs.setString(1, bn.getCandPublicId());
                    System.out.println(bn.getCandPublicId());
                    cs.setString(2, bn.getFullName());
                    cs.setString(3, bn.getPhone_No());
                    cs.setString(4, bn.getEmailId());
                    cs.setString(5, bn.getPassword());

                    int rows = cs.executeUpdate();
                    if (rows >= 1) {
                        message = "<span class=\"text-success font-bold\">Registered Successfully Please Login to continue</span>";
                    }

                } catch (SQLException e) {
                    message = "Unable to Registered because of : " + e.getMessage() + " | At : " + this.getClass().getName();
                } finally {
                    try {
                        if (con != null) {
                            con.close();
                        }
                    } catch (SQLException e) {
                        message = e.getMessage();
                    }
                }
                break;
                case "not_exist":
                    create();
                    break Task;
                default:
                    message = "null parameter";
                    break;
            }
        }
        return message;
    }

    // Check isEmpty  
    boolean isEmpty(String pid, String columnName, String tableName) {

        con = JobPortalDb.connectDb();
        boolean result = false;
        try {
            sql = "select " + columnName + " from " + tableName + " where candidate_id = ?";
            cs = con.prepareCall(sql);
            cs.setString(1, pid);
            rs = cs.executeQuery();
            if (rs.next() == false) {
                result = false;
                System.out.println("is EMPTY OR NULL");
            } else {
                result = true;
                System.out.println("NNOOTTTTT EMPTY OR NULL");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return result;
    }
    // send otp on verified mobile number

    public int sendOtp(String phone, HttpServletRequest request) {
        int status = 0;
        int isExist = findCandidate(phone);
        if (isExist == 0) {
            status = 0;
        } else {
            // Generate otp
            String otpText = GenerateOTP.createOTP(6);
            System.out.println("created otp is : " + otpText);
            session = request.getSession();
            session.setAttribute("otpInSession", otpText);
            session.setAttribute("phoneInSession", phone);

            ////// Otp sms sending code goes Here /////
            // generated OTP send via Msg
            status = 1;
            // message = "Phone Number Verified!" ;
        }
        return status;
    }

    ///////////////////////////////////////////////////////////////
    // Verify Entered Otp  verifyOtp
    public int verifyOtp(String OTP, HttpServletResponse response) {
        int status = 0;
        String otpFromSession = (String) session.getAttribute("otpInSession");
        if (otpFromSession.equals(OTP)) {
            status = 1;
            //   "OTP Verified Successfull !";
            System.out.println("when OTP Correct: " + session.getAttribute("phoneInSession"));
        } else {

            System.out.println("when incorrect OTP : " + session.getAttribute("phoneInSession"));
            status = 0;
            //  "Incorrect OTP !" ;
        }
        return status;
    }
    ////////////////////////////////////////////////////////////////
    // update Dealer Paswword

    public String resetPassword(String phone, String password) throws IOException, SQLException {
        con = JobPortalDb.connectDb();

        try {
            sql = "update " + TABLENAME + " set  password=? where phone_no= ?";
            cs = con.prepareCall(sql);
            cs.setString(1, password);
            cs.setString(2, phone);
            int rows = cs.executeUpdate();
            if (rows >= 1) {
                message = "New Password Created, Please Login";
            }
        } catch (SQLException e) {
            message = "Unable to Update Password because of : " + e.getMessage() + " | At : " + this.getClass().getName();
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return message;
    }

    public int findCandidate(String phone) {
        con = JobPortalDb.connectDb();
        int exist = 0;
        String pass = null;
        try {
            sql = "select phone_no from tblcandidate where phone_no = ?";
            cs = con.prepareCall(sql);
            cs.setString(1, phone);
            rs = cs.executeQuery();
            while (rs.next()) {
                pass = rs.getString("phone_no");
                exist = 1;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return exist;
    }

    // find cand Id in detail table
    public int findCandInDetailsTable(String cid) {
        con = JobPortalDb.connectDb();
        int exist = 0;

        try {
            sql = "select candidate_id from tblcandidatedetails where candidate_id = ?";
            cs = con.prepareCall(sql);
            cs.setString(1, cid);
            rs = cs.executeQuery();
            while (rs.next()) {
                exist = 1;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return exist;
    }

    public String insertPlan(String candidateId, String subscriptionId) throws SQLException {

        con = JobPortalDb.connectDb();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        String startDate = dtf.format(now);

        SubscriptionCandidateModel subCand = new SubscriptionCandidateModel();
        tblSubscriptionCandidate candPlan = subCand.selectById(subscriptionId);
        //method 2 - via Date
        Date date = new Date();
        System.out.println(new Timestamp(date.getTime()));
        try {
            sql = "insert into tblcandidateplan(  candidate_id,plan_title, plan_amount, available_balance, validity_in_days, start_date, end_date, per_apply_deduction, plan_suggestion) values (?,?,?,?,?,?,?,?,?)";
            cs = con.prepareCall(sql);

            cs.setString(1, candidateId);
            cs.setString(2, candPlan.getTitle());
            cs.setInt(3, candPlan.getPrice());
            cs.setInt(4, candPlan.getPrice());
            cs.setString(5, candPlan.getValidity());
            cs.setString(6, "2020-10-14");
            cs.setString(7, "2020-01-14");
            cs.setInt(8, candPlan.getPer_apply_price());
            cs.setString(9, candPlan.getSuggestion());
            int rows = cs.executeUpdate();

            if (rows >= 1) {

                sql = "update tblcandidate set   subscription_id=?, balance = ? where candidate_id = ?";
                cs = con.prepareCall(sql);
                cs.setString(1, subscriptionId);
                cs.setInt(2, candPlan.getPrice());
                cs.setString(3, candidateId);
                int rows1 = cs.executeUpdate();
                if (rows1 >= 1) {
                    message = "Changes Saved";

                }
            }

        } catch (SQLException e) {
            message = "Unable to Add Candidate Plan because of : " + e.getMessage() + " | At : " + this.getClass().getName();
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
    //method for select my plan using candidate id

    public TblCandidatePlan selectMyPlan(String candidateId) {
        con = JobPortalDb.connectDb();
        TblCandidatePlan bean = null;
        System.out.println("cid in meth:" + candidateId);
        try {
            sql = "select * from tblcandidateplan where candidate_id = ?";
            cs = con.prepareCall(sql);
            cs.setString(1, candidateId);
            rs = cs.executeQuery();
            System.out.println("cid in meth again:" + candidateId);
            while (rs.next()) {
                bean = new TblCandidatePlan(
                        rs.getRow(),
                        rs.getInt("id"),
                        rs.getString("candidate_id"),
                        rs.getString("plan_title"),
                        rs.getInt("plan_amount"),
                        rs.getInt("available_balance"),
                        rs.getString("validity_in_days"),
                        rs.getString("start_date"),
                        rs.getString("end_date"),
                        rs.getInt("per_apply_deduction"),
                        rs.getString("plan_suggestion"),
                        rs.getString("created_at"),
                        rs.getString("modified_at")
                );
                System.out.println("in while" + rs.getString("plan_title"));
            }

        } catch (SQLException e) {
            bean = new TblCandidatePlan(-1, this.getClass().getName(), e.getMessage());
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
    // find candidate details

    public String findCandidateJobRole(String cid) {
        con = JobPortalDb.connectDb();
        String jobRole = null;

        try {
            sql = "select jobRole from tblcandidate where candidate_id = ?";
            cs = con.prepareCall(sql);
            cs.setString(1, cid);

            rs = cs.executeQuery();
            if (rs.next()) {
                jobRole = rs.getString("jobRole");
            }
        } catch (SQLException e) {
            System.out.println("Exception : " + e.getMessage());
        }

        if (jobRole == null) {
            jobRole = "Job Role Not Added";
            return jobRole;
        } else {
            return jobRole;
        }
    }

    //update Job role tbl candidate
    public String updateJobRole(TblCandidate bn) {
        con = JobPortalDb.connectDb();
        try {
            sql = "update " + TABLENAME + " set  jobRole =? where candidate_id = ?";
            cs = con.prepareCall(sql);
            cs.setString(1, bn.getJobRole());
            cs.setString(2, bn.getCandPublicId());
            int rows = cs.executeUpdate();
            if (rows >= 1) {
                message = "Changes Saved";
            }
        } catch (SQLException e) {
            message = "Unable to Change because of : " + e.getMessage() + " | At : " + this.getClass().getName();
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

    //update Education details tbl candidate
    public String updateEducationDetails(TblCandidate bn) {
        con = JobPortalDb.connectDb();
        System.out.println("sm :" + bn.getSchoolMedium());
        System.out.println("qua :" + bn.getQualification());
        try {
            sql = "update " + TABLENAME + " set  schoolMedium =?, qualification =? where candidate_id = ?";
            cs = con.prepareCall(sql);
            cs.setString(1, bn.getSchoolMedium());
            cs.setString(2, bn.getQualification());
            cs.setString(3, bn.getCandPublicId());
            int rows = cs.executeUpdate();
            if (rows >= 1) {
                message = "Changes Saved";
            }
        } catch (SQLException e) {
            message = "Unable to Change because of : " + e.getMessage() + " | At : " + this.getClass().getName();
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
    // find candidate education

    public int findCandidateEducation(String cid) {
        con = JobPortalDb.connectDb();
        int isEmpty = 0;

        try {
            sql = "select schoolMedium, qualification from tblcandidate where candidate_id = ?";
            cs = con.prepareCall(sql);
            cs.setString(1, cid);

            rs = cs.executeQuery();
            if (rs.next()) {
                if (rs.getString("schoolMedium").equals(null) && rs.getString("qualification").equals(null)) {
                    isEmpty = 0;
                } else {
                    isEmpty = 1;
                }
            }
        } catch (SQLException e) {
            System.out.println("Exception : " + e.getMessage());
        }

        return isEmpty;

    }

    //update personal details tbl candidate
    public String updatePersonalDetails(TblCandidate bn) {
        con = JobPortalDb.connectDb();
        System.out.println("age :" + bn.getAge());
        System.out.println("gender :" + bn.getGender());

        try {
            sql = "update " + TABLENAME + " set  age =?, gender =?, address =?, city =?, state =?  where candidate_id = ?";
            cs = con.prepareCall(sql);
            cs.setInt(1, bn.getAge());
            cs.setString(2, bn.getGender());
            cs.setString(3, bn.getAddress());
            cs.setString(4, bn.getCity());
            cs.setString(5, bn.getState());
            cs.setString(6, bn.getCandPublicId());
            int rows = cs.executeUpdate();
            if (rows >= 1) {
                message = " Changes Saved ";
            }
        } catch (SQLException e) {
            message = "Unable to Change because of : " + e.getMessage() + " | At : " + this.getClass().getName();
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

//    method to upload resume
    public static int uploadResume(String fileName, String userPublicId) {
        int stat = 0;
        Connection con = JobPortalDb.connectDb();

        String resumeUpdateQuery = "UPDATE tblcandidate SET resumePath = ? WHERE candidate_id = ?;";
        try {
            PreparedStatement ps = con.prepareStatement(resumeUpdateQuery);
            ps.setString(1, fileName);
            ps.setString(2, userPublicId);
            stat = ps.executeUpdate();
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
        return stat;
    }

//    method to check the resume status is uploaded or not
    public static boolean resumeAvailable(String id) {
        boolean status = false;
        try {
            Connection con = JobPortalDb.connectDb();
            PreparedStatement ps = con.prepareStatement("SELECT resumePath FROM tblcandidate where candidate_id = ?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                if (rs.getString(1) == null) {
                    status = false;
                } else if (rs.getString(1).equals("")) {
                    status = false;
                } else {
                    status = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

//    method to retrieve the fileName i.e. resume name from the database
    public static String retrieveResumename(String id) {
        String fileName = null;
        try {
            Connection con = JobPortalDb.connectDb();
            PreparedStatement ps = con.prepareStatement("SELECT resumePath FROM tblcandidate where candidate_id = ?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                fileName = rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return fileName;
    }

//    method to delete resume from database
    public static int deleteResume(String userId) {
        int stat = 0;
        try {
            Connection con = JobPortalDb.connectDb();
            PreparedStatement ps = con.prepareStatement("UPDATE tblcandidate SET resumePath = ? WHERE candidate_id = ?");
            ps.setString(1, "");
            ps.setString(2, userId);
            stat = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return stat;
    }

//    method to download the resume
    public static String getResume(String userID) {

        String path = null; // path where all the resumes will save

        try {
            Connection con = JobPortalDb.connectDb();
            PreparedStatement ps = con.prepareStatement("SELECT resumePath FROM tblcandidate WHERE candidate_id = ?");
            ps.setString(1, userID);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                path = "D:QaswaTech\\WORKSPACE\\files\\" + rs.getString(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return path;

    }

//    method to select jobRole from table
    public ArrayList<TblCandidate> selectJobRole() {
        con = JobPortalDb.connectDb();
        ArrayList<TblCandidate> arrayList = new ArrayList<>();
        try {
            sql = "select job_role from tbljobrole";
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                TblCandidate candidate = new TblCandidate();
                candidate.setJobRole(rs.getString(1));
                arrayList.add(candidate);
            }
            if (arrayList.isEmpty()) {
                arrayList.add(new TblCandidate(0, this.getClass().getName(), "No Data Found"));
            }
        } catch (SQLException e) {
            arrayList.add(new TblCandidate(-1, this.getClass().getName(), e.getMessage()));
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

//    method to select Skills from table
    public ArrayList<TblCandidate> selectSkillsRole() {
        con = JobPortalDb.connectDb();
        ArrayList<TblCandidate> arrayList = new ArrayList<>();
        try {
            sql = "select job_skill from tbljobrole";
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                TblCandidate candidate = new TblCandidate();
                candidate.setJobRole(rs.getString(1));
                arrayList.add(candidate);
            }
            if (arrayList.isEmpty()) {
                arrayList.add(new TblCandidate(0, this.getClass().getName(), "No Data Found"));
            }
        } catch (SQLException e) {
            arrayList.add(new TblCandidate(-1, this.getClass().getName(), e.getMessage()));
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

    //update Education details tbl candidate
    public String updateEduDetails(TblCandidate bn) {
        con = JobPortalDb.connectDb();
        System.out.println("sm :" + bn.getSchoolMedium());
        System.out.println("qua :" + bn.getQualification());
        try {

            sql = "update " + TABLENAME + " set  schoolMedium =?, qualification =? where candidate_id = ?";
            cs = con.prepareCall(sql);
            cs.setString(1, bn.getSchoolMedium());
            cs.setString(2, bn.getQualification());
            cs.setString(3, bn.getCandPublicId());
            int rows = cs.executeUpdate();
            if (rows >= 1) {
                message = "Changes Saved";
            }
        } catch (SQLException e) {
            message = "Unable to Change because of : " + e.getMessage() + " | At : " + this.getClass().getName();
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

//    method to update the experiance details
    public String updateExperinceDetails(TblCandidateDetails candidate) {

        con = JobPortalDb.connectDb();

        boolean isExist = isEmpty(candidate.getCandPublicId(), "experience_details", "tblcandidatedetails");

        if (isExist == true) {
            // if candidate id exist 
            try {
                sql = "UPDATE tblcandidatedetails SET experience = ?, experience_details = ? WHERE candidate_id = ?";
                cs = con.prepareCall(sql);
                cs.setString(1, candidate.getExperience());
                cs.setString(2, candidate.getExperienceDetails());
                cs.setString(3, candidate.getCandPublicId());

                int rows = cs.executeUpdate();
                if (rows >= 1) {
                    message = "<span class=\"text-success font-bold\"> Details Updated </span>";
                }
            } catch (SQLException e) {
                message = "Unable to Update Candidate Details because of : " + e.getMessage() + " | At : " + this.getClass().getName();
            } finally {
                try {
                    if (con != null) {
                        con.close();
                    }
                } catch (SQLException e) {
                    message = e.getMessage();
                }
            }
        } else {
            try {
//                sql = "insert into tblcandidatedetails (candidate_details_id, candidate_id, summary) values (?,?,?)";
                sql = "insert into tblcandidatedetails (candidate_details_id, candidate_id, experience, experience_details) values (?,?,?,?)";
                cs = con.prepareCall(sql);

                cs.setString(1, Utils.generatePublicId(30));
                cs.setString(2, candidate.getCandPublicId());
                cs.setString(3, candidate.getExperience());
                cs.setString(4, candidate.getExperienceDetails());

                int rows = cs.executeUpdate();
                if (rows >= 1) {
                    message = "<span class=\"text-success font-bold\"> Experience Added </span>";
                }

            } catch (SQLException e) {
                message = "Unable to Add Candidate Summary because of : " + e.getMessage() + " | At : " + this.getClass().getName();
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

        /*
        try {

            sql = "UPDATE tblcandidatedetails SET experience = ?, experience_details = ? WHERE candidate_id = ?";
            cs = con.prepareCall(sql);
            cs.setString(1, candidate.getExperience());
            cs.setString(2, candidate.getExperienceDetails());
            cs.setString(3, candidate.getCandPublicId());

            System.out.println("EXP: " + candidate.getExperience());
            System.out.println("EXP: " + candidate.getExperienceDetails());
            System.out.println("EXP: " + candidate.getCandPublicId());

            int rows = cs.executeUpdate();
            if (rows >= 1) {
                message = "Changes Saved";
            } else {
                message = "Error while saving the experience details";
            }

        } catch (Exception e) {
            message = "Unable to Change because of : " + e.getMessage() + " | At : " + this.getClass().getName();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                message = e.getMessage();
            }
        }
         */
        return message;

    }

//    method to update the skill set
    public String insertJobSkills(TblCandidate bn) {
        System.out.println("We are here");
        con = JobPortalDb.connectDb();
        Task:
        if ("exist".equals(existance.doCheckExistanceOf("tbljobrole", null))) {
            try {
                sql = "UPDATE tblcandidate SET englishSkill = ?, skillSet = ? WHERE candidate_id = ?";
                cs = con.prepareCall(sql);
                cs.setString(1, bn.getEnglishSkill());
                cs.setString(2, bn.getSkillSet());

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

    public static String updateSkills(TblCandidate candidate) throws SQLException {
        String msg = "";
        Connection con = JobPortalDb.connectDb();
        String sqlQUery = "UPDATE tblcandidate SET englishSkill = ?, skillSet = ? WHERE candidate_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sqlQUery);
            ps.setString(1, candidate.getEnglishSkill());
            ps.setString(2, candidate.getSkillSet());
            ps.setString(3, candidate.getCandPublicId());
            
            int i = ps.executeUpdate();
            
            if (i == 1) {
                msg = "Skills has been saved";
            } else {
                msg = "Skills are not saved becaues of some internal problem";
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                con.close();
            }
        }

        return msg;
    }

}
