/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this employermplaemployer file, choose Tools | Templaemployers
 * and open the employermplaemployer in the editor.
 */
package com.qt.jobportal.models;

import com.qt.jobportal.beans.TblEmployer;
import com.qt.jobportal.beans.TblEmployerDetails;
import com.qt.jobportal.beans.TblSubscription;
import com.qt.jobportal.beans.tblEmployerPlan;
import com.qt.jobportal.commons.DatabaseExistance;
import com.qt.jobportal.commons.GenerateOTP;
import com.qt.jobportal.commons.JobPortalDb;
import com.qt.jobportal.commons.Utils;
import java.io.IOException;
//import static java.lang.ref.Cleaner.create;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Asus
 */
public class EmployerModel {

    Connection con = null;
    DatabaseExistance existance = new DatabaseExistance();
    String sql, message = null;
    ResultSet rs = null;
    CallableStatement cs = null;

    public static final String TABLENAME = TblEmployer.class.getSimpleName().toLowerCase();

    public static final String TABLECONTENT = "";

    public void createmployer() {
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

    public String insert(TblEmployer employer) {
        con = JobPortalDb.connectDb();
        Task:
        if ("exist".equals(existance.doCheckExistanceOf(TABLENAME, null))) {
            try {
                sql = "insert into " + TABLENAME + "(employer_id, subscription_id, balance, company_name, contact_person, phone_no, email_id, password, job_address) values (?,?,?,?,?,?,?,?,?)";
                cs = con.prepareCall(sql);
                cs.setString(1, employer.getCompanyPublicId());
                cs.setString(2, employer.getSubscriptionId());
                cs.setInt(3, employer.getBalance());
                cs.setString(4, employer.getCompanyName());
                cs.setString(5, employer.getContactPerson());
                cs.setString(6, employer.getPhoneNo());
                cs.setString(7, employer.getEmailId());
                cs.setString(8, employer.getPassword());
                cs.setString(9, employer.getJobAddress());
                int rows = cs.executeUpdate();
                if (rows >= 1) {
                    message = "Employer Added Successfully";
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
            createmployer();
            break Task;
        } else {
            message = "null parameter";
        }
        return message;
    }//insert()

    public String delete(TblEmployer employer) {
        con = JobPortalDb.connectDb();
        try {
//            sql = "delete from " + TABLENAME + " where employer_id = ?";
            sql = "UPDATE tblemployer SET is_delete = 1 where employer_id = ?";
            cs = con.prepareCall(sql);
            cs.setString(1, employer.getCompanyPublicId());
            int rows = cs.executeUpdate();
            if (rows >= 1) {
                message = "Employer Deleted Successfully";
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
    }//deleemployer()

    public int checkEmployerDelete(String eid) {
        con = JobPortalDb.connectDb();
        sql = "select is_delete from tblemployer where employer_id = ?";
        int check = 0;
        try {
            cs = con.prepareCall(sql);
            cs.setString(1, eid);
            rs = cs.executeQuery();
            if (rs.next()) {
                check = rs.getInt(1);
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

    public int checkEmployerDeletePhone(String phone) {
        con = JobPortalDb.connectDb();
        sql = "select is_delete from tblemployer where phone_no = ?";
        int check = 0;
        try {
            cs = con.prepareCall(sql);
            cs.setString(1, phone);
            rs = cs.executeQuery();
            if (rs.next()) {
                check = rs.getInt(1);
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

    public String update(TblEmployer employer) {
        con = JobPortalDb.connectDb();
        try {
//            sql = "update " + TABLENAME + " set company_name=? , contact_person=? , phone_no=? , email_id=? , job_address=?  where id = ?";
            sql = "update " + TABLENAME + " set company_name=? , contact_person=? , phone_no=? , email_id=? , job_address=?  where employer_id = ?";
            cs = con.prepareCall(sql);
            cs.setString(1, employer.getCompanyName());
            cs.setString(2, employer.getContactPerson());
            cs.setString(3, employer.getPhoneNo());
            cs.setString(4, employer.getEmailId());
            cs.setString(5, employer.getJobAddress());
            cs.setString(6, employer.getCompanyPublicId());
            int rows = cs.executeUpdate();
            if (rows >= 1) {
                message = "Update Employer Successfully";
            }
        } catch (SQLException e) {
            message = "Unable to Update employer because of : " + e.getMessage() + " | At : " + this.getClass().getName();
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
    }//updaemployer()

    public ArrayList<TblEmployer> select() {
        con = JobPortalDb.connectDb();
        ArrayList<TblEmployer> arrayList = new ArrayList<>();
        try {
            sql = "select * from " + TABLENAME;
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                arrayList.add(new TblEmployer(
                        rs.getRow(),
                        rs.getInt("id"),
                        rs.getString("employer_id"),
                        rs.getString("subscription_id"),
                        rs.getInt("balance"),
                        rs.getString("company_name"),
                        rs.getString("contact_person"),
                        rs.getString("phone_no"),
                        rs.getString("email_id"),
                        rs.getString("password"),
                        rs.getString("job_address"),
                        rs.getInt("attempts"),
                        rs.getInt("authentication"),
                        rs.getString("created_at"),
                        rs.getString("modified_at")
                ));

            }
            if (arrayList.isEmpty()) {
                arrayList.add(new TblEmployer(0, this.getClass().getName(), "No Data Found"));
            }
        } catch (SQLException e) {
            arrayList.add(new TblEmployer(-1, this.getClass().getName(), e.getMessage()));
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

    public ArrayList<TblEmployer> selectByLimit(String limit) {
        con = JobPortalDb.connectDb();
        ArrayList<TblEmployer> arrayList = new ArrayList<>();
        try {
            sql = "select * from " + TABLENAME + " order by id desc limit " + limit;
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                arrayList.add(new TblEmployer(
                        rs.getRow(),
                        rs.getInt("id"),
                        rs.getString("employer_id"),
                        rs.getString("subscription_id"),
                        rs.getInt("balance"),
                        rs.getString("company_name"),
                        rs.getString("contact_person"),
                        rs.getString("phone_no"),
                        rs.getString("email_id"),
                        rs.getString("password"),
                        rs.getString("job_address"),
                        rs.getInt("attempts"),
                        rs.getInt("authentication"),
                        rs.getString("created_at"),
                        rs.getString("modified_at")
                ));
            }
            if (arrayList.isEmpty()) {
                arrayList.add(new TblEmployer(0, this.getClass().getName(), "No Data Found"));
            }
        } catch (SQLException e) {
            arrayList.add(new TblEmployer(-1, this.getClass().getName(), e.getMessage()));
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
    }//ArrayList()

    public TblEmployer selectById(String eid) {
        con = JobPortalDb.connectDb();
        TblEmployer employer = null;
        try {
            sql = "select * from " + TABLENAME + " where employer_id = ?";
            cs = con.prepareCall(sql);
            cs.setString(1, eid);
            rs = cs.executeQuery();
            while (rs.next()) {
                employer = new TblEmployer(
                        rs.getRow(),
                        rs.getInt("id"),
                        rs.getString("employer_id"),
                        rs.getString("subscription_id"),
                        rs.getInt("balance"),
                        rs.getString("company_name"),
                        rs.getString("contact_person"),
                        rs.getString("phone_no"),
                        rs.getString("email_id"),
                        rs.getString("password"),
                        rs.getString("job_address"),
                        rs.getInt("attempts"),
                        rs.getInt("authentication"),
                        rs.getString("created_at"),
                        rs.getString("modified_at")
                );
            }
        } catch (SQLException e) {
            employer = new TblEmployer(-1, this.getClass().getName(), e.getMessage());
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                message = e.getMessage();
            }
        }
        return employer;
    }//selectById()

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
    } //doCheckExist()

    HttpSession session = null;

    // -1 Not Found
    // 0 Blocked
    // 1 Found
    // 2 Wrong Password
    public int doLogin(TblEmployer employer, HttpServletRequest request) {
        int status = 0;
        int authStatus = doCheckLoginAccess(employer.getPhoneNo());
        System.out.println("LOGIN STATUS: " + authStatus);
        switch (authStatus) {
            case -1:
                status = -1;
                break;
            case 0:
                status = 0;
                break;
            case 1:
                int verifyStatus = doVerifyCredentials(employer.getPhoneNo(), employer.getPassword(), request);
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
        sql = "select authentication from tblemployer where phone_no = ?";
        try {
            cs = con.prepareCall(sql);
            cs.setString(1, phone);
            rs = cs.executeQuery();
            if (rs.next()) {
                status = rs.getInt(1);
            }
            System.out.println("EMP STAT: " + status);
        } catch (SQLException e) {
            System.out.println("Exception : " + e.getMessage());
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

    public int doVerifyCredentials(String phone, String password, HttpServletRequest request) {
        con = JobPortalDb.connectDb();
        int status = 0;
        session = request.getSession();
        sql = "select id, employer_id, contact_person, phone_no, password from " + TABLENAME + " where phone_no = '" + phone + "'";
        try {
            cs = con.prepareCall(sql);
            rs = cs.executeQuery(sql);
            if (rs.next()) {
                if (phone.equals(rs.getString("phone_no")) && password.equals(rs.getString("password"))) {
                    status = 1;
                    session.setAttribute("EmployerId", rs.getString("employer_id"));
                    session.setAttribute("EmployerName", rs.getString("contact_person"));
                    resetLoginCount(rs.getInt("Id"));
                } else {
                    status = 2;
                    doIncreamentAttempts(rs.getInt("Id"));
                }
            }
        } catch (SQLException e) {
            System.out.println("com.imantimes.portal.qaswatech.models.LoginModel.doVerifyCredentials-catch: " + e.getMessage());
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
        con = JobPortalDb.connectDb();
        try {
            cs = con.prepareCall("{call spIncreamentWrongAttempts(?,?)}");
            cs.setString(1, TABLENAME);
            cs.setInt(2, id);
            cs.executeUpdate();
        } catch (SQLException e) {
            System.out.println("exception because of Incrementing : " + e.getMessage());
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

    public void resetLoginCount(int id) {
        con = JobPortalDb.connectDb();
        sql = "update " + TABLENAME + " set attempts = 0 where id = " + id;
        try {
            cs = con.prepareCall(sql);
            cs.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage() + "com.qt.tandw.models.Client.resetLoginCount()");
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

    public String updatePassword(TblEmployer bn) {
        try {
            if (fetchPassword(bn.getCompanyPublicId()).equals(bn.getValidPassword())) {
                con = JobPortalDb.connectDb();
                sql = "UPDATE tblemployer SET password = ? WHERE employer_id = ?";
                cs = con.prepareCall(sql);
                cs.setString(1, bn.getNewPassword());
                cs.setString(2, bn.getCompanyPublicId());
                int rows = cs.executeUpdate();

                if (rows >= 1) {
                    message = "Password Updated Successfully";
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
        con = JobPortalDb.connectDb();
        String pass = null;
        try {
            sql = "select password from " + TABLENAME + " where employer_id = ?";
            cs = con.prepareCall(sql);
            cs.setString(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                pass = rs.getString(1);
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
        System.out.println("Pass : " + pass);
        return pass;
    }

    public String emplSignUp(TblEmployer bn) {
        System.out.println("We are here");
        con = JobPortalDb.connectDb();
        Task:
        if (null == existance.doCheckExistanceOf(TABLENAME, null)) {
            message = "null parameter";
        } else {
            switch (existance.doCheckExistanceOf(TABLENAME, null)) {
                case "exist":
                    try {

                    sql = "insert into " + TABLENAME + "( employer_id, company_name, phone_no, email_id, password) values (?,?,?,?,?)";
                    cs = con.prepareCall(sql);
                    cs.setString(1, bn.getCompanyPublicId());
                    System.out.println(bn.getCompanyPublicId());
                    cs.setString(2, bn.getCompanyName());
                    cs.setString(3, bn.getPhoneNo());
                    cs.setString(4, bn.getEmailId());
                    cs.setString(5, bn.getPassword());

                    int rows = cs.executeUpdate();
                    if (rows >= 1) {
                        message = "<span class=\"text-success font-bold\">Details Added Successfully</span>";
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
                break;
                case "not_exist":
//                    create();
                    break Task;
                default:
                    message = "null parameter";
                    break;
            }
        }
        return message;
    }

//     public ArrayList<Integer> EmployerCount(String title) {
//        ArrayList<Integer> subscriptionCount = new ArrayList();
//        con = JobPortalDb.connectDb();
//        try {
//            //   sql="CALL spVacancyCount(?)";
//            sql = "call spSubscriptionCount(?)";
//            cs = con.prepareCall(sql);
//            cs.setString(1, title);
//            rs = cs.executeQuery();
//            rs.next();
//            
//            subscriptionCount.add(rs.getInt("@totalSubscription"));   // total vaccancy
//            
//         } catch (SQLException e) {
//            System.out.println(e.getMessage());
//        } finally {
//            try {
//                if (con != null) {
//                    con.close();
//                }
//            } catch (SQLException e) {
//                message = e.getMessage();
//            }
//        }
//        return subscriptionCount;
//    }
    public String insertPlan(String employerId, String subscriptionId) throws SQLException {

        con = JobPortalDb.connectDb();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        String startDate = dtf.format(now);

        Subscription subEmp = new Subscription();
        TblSubscription empPlan = subEmp.selectById(subscriptionId);

        try {
            sql = "insert into tblemployerplan(  employer_id, plan_title, plan_amount,"
                    + " available_balance, job_post_deduction, "
                    + "response_deduction, validity_in_days, "
                    + "start_date, end_date, plan_suggestion) values (?,?,?,?,?,?,?,?,?,?)";
            cs = con.prepareCall(sql);

            cs.setString(1, employerId);
            cs.setString(2, empPlan.getTitle());
            cs.setInt(3, empPlan.getPrice());
            cs.setInt(4, empPlan.getPrice());
            cs.setInt(5, empPlan.getJob_post_deduction());
            cs.setInt(6, empPlan.getResponse_deduction());
            cs.setInt(7, empPlan.getValidity_in_days());
            cs.setString(8, startDate);
            cs.setString(9, "2020/12/06");
            cs.setString(10, empPlan.getSuggestion());
            int rows = cs.executeUpdate();
            if (rows >= 1) {
                sql = "update tblemployer set   subscription_id=?, balance = ? where employer_id = ?";
                cs = con.prepareCall(sql);
                cs.setString(1, subscriptionId);
                cs.setInt(2, empPlan.getPrice());
                cs.setString(3, employerId);
                int rows1 = cs.executeUpdate();
                if (rows1 >= 1) {
                    message = "Plan Added Successfully";
                }
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
        return message;
    }
    // send otp on verified mobile number

    public int sendOtp(String phone, HttpServletRequest request) {

        int status = 0;
        int isExist = findEmployer(phone);
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

    public int findEmployer(String phone) {

        con = JobPortalDb.connectDb();
        int exist = 0;
        String pass = null;
        try {
            sql = "select phone_no from tblemployer where phone_no = ?";
            cs = con.prepareCall(sql);
            cs.setString(1, phone);
            rs = cs.executeQuery();
            while (rs.next()) {
                pass = rs.getString("phone_no");
                exist = 1;
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

        return exist;

    }

    public boolean existTblEmpDetails(String eid) {
        boolean existTB = false;
        con = JobPortalDb.connectDb();
        sql = "SELECT * FROM tblemployerdetails where employer_id = ?";

        try {

            cs = con.prepareCall(sql);
            cs.setString(1, eid);
            rs = cs.executeQuery();
            if (rs.next()) {
                existTB = true;
            } else {
                existTB = false;
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

        return existTB;
    }

//    method to save company summary
    public String saveCompanySummary(TblEmployerDetails bn) {

        EmployerModel empModel = new EmployerModel();
        boolean existTB = empModel.existTblEmpDetails(bn.getEmployer_id());
        con = JobPortalDb.connectDb();
        if (existTB) {
            try {
                sql = "UPDATE tblemployerdetails SET company_summary = ? WHERE employer_id = ?";
                cs = con.prepareCall(sql);
                cs.setString(1, bn.getCompany_summary());
                cs.setString(2, bn.getEmployer_id());

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
        } else if (!existTB) {
            try {
                sql = "INSERT INTO tblemployerdetails (employer_detail_id, employer_id, company_summary) VALUES (?,?,?)";
                cs = con.prepareCall(sql);
                cs.setString(1, Utils.generatePublicId(30));
                cs.setString(2, bn.getEmployer_id());
                cs.setString(3, bn.getCompany_summary());

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
        } else {
            message = "null parameter";
        }
        return message;
    }

    public String saveCompanyAddress(TblEmployerDetails bn) {

        EmployerModel empModel = new EmployerModel();
        boolean existTB = empModel.existTblEmpDetails(bn.getEmployer_id());
        con = JobPortalDb.connectDb();
        if (existTB) {
            try {
                sql = "UPDATE tblemployerdetails SET company_state = ?, company_city = ?, company_address = ? WHERE employer_id = ?";
                cs = con.prepareCall(sql);
                cs.setString(1, bn.getCompany_state());
                cs.setString(2, bn.getCompany_city());
                cs.setString(3, bn.getCompany_address());
                cs.setString(4, bn.getEmployer_id());

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
        } else if (!existTB) {
            try {
                sql = "INSERT INTO tblemployerdetails (employer_detail_id, employer_id, company_state, company_city, company_address) VALUES (?,?,?,?,?)";
                cs = con.prepareCall(sql);
                cs.setString(1, Utils.generatePublicId(30));
                cs.setString(2, bn.getEmployer_id());
                cs.setString(3, bn.getCompany_state());
                cs.setString(4, bn.getCompany_city());
                cs.setString(5, bn.getCompany_address());

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
        } else {
            message = "null parameter";
        }
        return message;
    }

    public String saveCompanyWebsite(TblEmployerDetails bn) {

        EmployerModel empModel = new EmployerModel();
        boolean existTB = empModel.existTblEmpDetails(bn.getEmployer_id());
        con = JobPortalDb.connectDb();
        if (existTB) {
            try {
                sql = "UPDATE tblemployerdetails SET website = ? WHERE employer_id = ?";
                cs = con.prepareCall(sql);
                cs.setString(1, bn.getWebsite());
                cs.setString(2, bn.getEmployer_id());

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
        } else if (!existTB) {
            try {
                sql = "INSERT INTO tblemployerdetails (employer_detail_id, employer_id, website) VALUES (?,?,?)";
                cs = con.prepareCall(sql);
                cs.setString(1, Utils.generatePublicId(30));
                cs.setString(2, bn.getEmployer_id());
                cs.setString(3, bn.getWebsite());

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
        } else {
            message = "null parameter";
        }
        return message;
    }

    public TblEmployerDetails selectEmployerDetailsById(String eid) {
        con = JobPortalDb.connectDb();
        TblEmployerDetails employerDetails = new TblEmployerDetails();
        try {
            sql = "select * from tblemployerdetails where employer_id = ?";
            cs = con.prepareCall(sql);
            cs.setString(1, eid);
            rs = cs.executeQuery();
            while (rs.next()) {
                employerDetails.setId(rs.getInt(1));
                employerDetails.setEmployer_detail_id(rs.getString(2));
                employerDetails.setEmployer_id(rs.getString(3));
                employerDetails.setCompany_summary(rs.getString(4));
                employerDetails.setWebsite(rs.getString(5));
                employerDetails.setCompany_state(rs.getString(6));
                employerDetails.setCompany_city(rs.getString(7));
                employerDetails.setCompany_address(rs.getString(8));
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
        return employerDetails;
    }

    public tblEmployerPlan selectEmployerPlanById(String eid) {
        con = JobPortalDb.connectDb();
        tblEmployerPlan employer = null;
        try {
            sql = "SELECT * FROM tblemployerplan where employer_id = ?";
            cs = con.prepareCall(sql);
            cs.setString(1, eid);
            rs = cs.executeQuery();
            while (rs.next()) {
                employer = new tblEmployerPlan(
                        rs.getRow(),
                        rs.getInt("id"),
                        rs.getString("employer_id"),
                        null,
                        rs.getString("plan_title"),
                        rs.getInt("plan_amount"),
                        rs.getInt("available_balance"),
                        rs.getInt("job_post_deduction"),
                        rs.getInt("response_deduction"),
                        rs.getInt("validity_in_days"),
                        rs.getString("start_date"),
                        rs.getString("end_date"),
                        rs.getString("plan_suggestion"),
                        rs.getString("created_at"),
                        rs.getString("modified_at")
                );
            }
        } catch (SQLException e) {
            employer = new tblEmployerPlan(-1, this.getClass().getName(), e.getMessage());
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                message = e.getMessage();
            }
        }
        return employer;
    }

    public boolean checkEmployerBalance(String eid) {
        boolean avail = false;
        con = JobPortalDb.connectDb();
        sql = "select tblemployer.balance, tblemployerplan.response_deduction from tblemployer inner join tblemployerplan on tblemployer.employer_id = ?";

        try {
            cs = con.prepareCall(sql);
            cs.setString(1, eid);
            rs = cs.executeQuery();
            if (rs.next()) {
                if (rs.getInt(2) >= rs.getInt(1)) {
                    avail = false;
                } else {
                    avail = true;
                }
                System.out.println("BAL: " + rs.getInt(1));
                System.out.println("BAL: " + rs.getInt(2));
                System.out.println("STAT: " + avail);
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

        return avail;
    }

    public int fetchBalance(String id, String TABLENAME) {
        int balance = 0;
        con = JobPortalDb.connectDb();
        try {

            sql = "select balance from " + TABLENAME + " where employer_id = ?";
            cs = con.prepareCall(sql);
            cs.setString(1, id);
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
                System.out.println(e.getMessage());
            }
        }
        System.out.println("bal : " + balance);
        return balance;
    }

}//Admin
