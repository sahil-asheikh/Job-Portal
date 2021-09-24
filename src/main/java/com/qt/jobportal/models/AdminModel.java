package com.qt.jobportal.models;

import com.qt.jobportal.beans.TblAdmin;
import com.qt.jobportal.commons.DatabaseExistance;
import com.qt.jobportal.commons.JobPortalDb;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Asus
 */
public class AdminModel {

    Connection con = null;
    DatabaseExistance existance = new DatabaseExistance();
    String sql, message = null;
    ResultSet rs = null;
    CallableStatement cs = null;

    public static final String TABLENAME = TblAdmin.class.getSimpleName().toLowerCase();

    public static final String TABLECONTENT = "";

    public String updatePassword(TblAdmin bn) {
        con = JobPortalDb.connectDb();
        try {
            if (fetchPassword(bn.getAdmin_id()).equals(bn.getValidPassword())) {
                sql = "update " + TABLENAME + " set  password=? where admin_id = ? ";
                cs = con.prepareCall(sql);
                cs.setString(1, bn.getNewPassword());
                cs.setString(2, bn.getAdmin_id());
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
            sql = "select password from " + TABLENAME + " where admin_id = ?";
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

    public TblAdmin selectById(String id) {
        con = JobPortalDb.connectDb();
        TblAdmin bean = null;
        try {
            sql = "select * from " + TABLENAME + " where admin_id = ?";
            cs = con.prepareCall(sql);
            cs.setString(1, id);

            rs = cs.executeQuery();
            while (rs.next()) {
                bean = new TblAdmin(
                        rs.getRow(),
                        rs.getInt("Id"),
                        rs.getString("admin_id"),
                        rs.getString("name"),
                        rs.getString("phone_no"),
                        rs.getString("email_id"),
                        rs.getString("password"),
                        rs.getInt("authentication"),
                        rs.getInt("attempts"),
                        rs.getString("created_at"),
                        rs.getString("modified_at")
                );
            }
        } catch (SQLException e) {
            bean = new TblAdmin(-1, this.getClass().getName(), e.getMessage());
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

    HttpSession session = null;

    // -1 Not Found
    // 0 Blocked
    // 1 Found
    // 2 Wrong Password
    public int doLogin(TblAdmin admin, HttpServletRequest request) {
        int status = 0;
        int authStatus = doCheckLoginAccess(admin.getPhoneNo());
        switch (authStatus) {
            case -1:
                status = -1;
                break;
            case 0:
                status = 0;
                break;
            case 1:
                int verifyStatus = doVerifyCredentials(admin.getPhoneNo(), admin.getPassword(), request);
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
        sql = "select Id,admin_id ,Name, phone_no, password from " + TABLENAME + " where phone_no = '" + phone + "'";
        try {
            cs = con.prepareCall(sql);
            rs = cs.executeQuery(sql);
            if (rs.next()) {
                if (phone.equals(rs.getString("phone_no")) && password.equals(rs.getString("password"))) {
                    status = 1;
                    session.setAttribute("AdminId", rs.getString("admin_id"));
                    session.setAttribute("AdminName", rs.getString("Name"));
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

    public ArrayList<Integer> AdminCount() {
        ArrayList<Integer> adminCount = new ArrayList();
        con = JobPortalDb.connectDb();
        try {

            sql = "call spAdminCount()";
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            rs.next();
            adminCount.add(rs.getInt(1));   // total vaccancy
            adminCount.add(rs.getInt(2));   // Acrtive vaccancy
            adminCount.add(rs.getInt(3));   // Deactive vaccancy
            adminCount.add(rs.getInt(4));   // Deactive vaccancy

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
        return adminCount;
    }

}
