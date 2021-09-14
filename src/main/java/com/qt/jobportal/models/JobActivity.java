/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qt.jobportal.models;

import com.qt.jobportal.beans.TblJobActivity;
import com.qt.jobportal.commons.DatabaseExistance;
import com.qt.jobportal.commons.JobPortalDb;
import static com.qt.jobportal.models.JobActivity.TABLENAME;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Lenovo
 */
public class JobActivity {

    Connection con = null;
    DatabaseExistance existance = new DatabaseExistance();
    String sql, message = null;
    ResultSet rs = null;
    CallableStatement cs = null;

    public static final String TABLENAME = TblJobActivity.class.getSimpleName().toLowerCase();

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

    public String insert(TblJobActivity activities) {

        con = JobPortalDb.connectDb();

        Task:
        if (null == existance.doCheckExistanceOf(TABLENAME, null)) {
            message = "null parameter";
        } else {
            switch (existance.doCheckExistanceOf(TABLENAME, null)) {
                case "exist":
                    try {

                    sql = "call spJobTx(?,?,?,?,?,?,?,?,?,?)";
                    cs = con.prepareCall(sql);
                    cs.setString(1, activities.getCandidateId());
                    cs.setInt(2, activities.getDeduction());
                    cs.setInt(3, activities.getDeduction_type());
                    cs.setString(4, activities.getEmployerId());
                    cs.setInt(5, activities.getEmpDeduction());
                    cs.setInt(6, activities.getEmpDeduction_type());
                    cs.setString(7, activities.getEmployerName());
                    cs.setInt(8, activities.getActivity());
                    cs.setString(9, activities.getJobTitle());
                    cs.setString(10, activities.getVacancyId());

                    int rows = cs.executeUpdate();
                    if (rows >= 1) {
                        message = "<span class=\"text-success font-bold\">Applied for Job</span>";
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
                    create();
                    break Task;
                default:
                    message = "null parameter";
                    break;
            }
        }
        return message;
    }

    public String insertSave(TblJobActivity activities) {

        Task:
        if (null == existance.doCheckExistanceOf(TABLENAME, null)) {
            message = "null parameter";
        } else {
            switch (existance.doCheckExistanceOf(TABLENAME, null)) {
                case "exist":
                    con = JobPortalDb.connectDb();
                    try {
                        sql = "insert into tbljobactivity(candidate_id,activity, job_title,employer_id, employer_name,vacancy_id)values (?,?,?,?,?,?)";
                        cs = con.prepareCall(sql);
                        cs.setString(1, activities.getCandidateId());
                        cs.setInt(2, activities.getActivity());
                        cs.setString(3, activities.getJobTitle());
                        cs.setString(4, activities.getEmployerId());
                        cs.setString(5, activities.getEmployerName());
                        cs.setString(6, activities.getVacancyId());
                        int rows = cs.executeUpdate();
                        if (rows == 1) {
                            if (activities.getActivity() == 2) {
                                message = "<span class=\"text-success font-bold\">Saved</span>";
                            } else if (activities.getActivity() == 3) {
                                message = "<span class=\"text-success font-bold\">Liked</span>";
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

    // selectbycadidatelimit
    // limit=3
    public ArrayList<TblJobActivity> select() {
        con = JobPortalDb.connectDb();
        ArrayList<TblJobActivity> arrayList = new ArrayList<>();
        try {
            sql = "select * from " + TABLENAME + " order by Id desc";
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                arrayList.add(new TblJobActivity(
                        rs.getRow(),
                        rs.getInt("id"),
                        rs.getString("candidate_id"),
                        rs.getInt("activity"),
                        rs.getString("job_title"),
                        rs.getString("employer_id"),
                        rs.getString("employer_name"),
                        rs.getString("vacancy_id"),
                        rs.getString("created_at"),
                        rs.getString("modified_at")
                ));
            }
            if (arrayList.isEmpty()) {
                arrayList.add(new TblJobActivity(0, this.getClass().getName(), "No Data Found"));
            }
        } catch (SQLException e) {
            arrayList.add(new TblJobActivity(-1, this.getClass().getName(), e.getMessage()));
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

    public ArrayList<TblJobActivity> selectByCandidate(int activity, String candidate) {
        con = JobPortalDb.connectDb();
        ArrayList<TblJobActivity> arrayList = new ArrayList<>();
        try {
            //  sql = "select * from " + TABLENAME + " where candidate_id = ? and activity = ? ";
            sql = "select * from " + TABLENAME + " where activity = ? and candidate_id = ?";
            cs = con.prepareCall(sql);
            cs.setInt(1, activity);
            cs.setString(2, candidate);
            rs = cs.executeQuery();
            while (rs.next()) {
                arrayList.add(new TblJobActivity(
                        rs.getRow(),
                        rs.getInt("id"),
                        rs.getString("candidate_id"),
                        rs.getInt("activity"),
                        rs.getString("job_title"),
                        rs.getString("employer_id"),
                        rs.getString("employer_name"),
                        rs.getString("vacancy_id"),
                        rs.getString("created_at"),
                        rs.getString("modified_at")
                ));
            }
            if (arrayList.isEmpty()) {
                arrayList.add(new TblJobActivity(0, this.getClass().getName(), "No Data Found"));
            }
        } catch (SQLException e) {
            arrayList.add(new TblJobActivity(-1, this.getClass().getName(), e.getMessage()));
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

    public ArrayList<TblJobActivity> selectByLimit(int activity, String candidate) {
        con = JobPortalDb.connectDb();
        ArrayList<TblJobActivity> arrayList = new ArrayList<>();
        try {

            sql = "select * from " + TABLENAME + "  where activity = ? and candidate_id = ? LIMIT 3  ";

            cs = con.prepareCall(sql);
            cs.setInt(1, activity);
            cs.setString(2, candidate);
            rs = cs.executeQuery();
            while (rs.next()) {
                arrayList.add(new TblJobActivity(
                        rs.getRow(),
                        rs.getInt("id"),
                        rs.getString("candidate_id"),
                        rs.getInt("activity"),
                        rs.getString("job_title"),
                        rs.getString("employer_id"),
                        rs.getString("employer_name"),
                        rs.getString("vacancy_id"),
                        rs.getString("created_at"),
                        rs.getString("modified_at")
                ));
            }
            if (arrayList.isEmpty()) {
                arrayList.add(new TblJobActivity(0, this.getClass().getName(), "No Data Found"));
            }
        } catch (SQLException e) {
            arrayList.add(new TblJobActivity(-1, this.getClass().getName(), e.getMessage()));
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

    public ArrayList<TblJobActivity> selectByEmployer(String id) {
        con = JobPortalDb.connectDb();
        ArrayList<TblJobActivity> arrayList = new ArrayList<>();
        try {
            sql = "select * from  tbljobactivity where employer_id=? and  activity = 1 order by id desc   ";
            cs = con.prepareCall(sql);
            cs.setString(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                arrayList.add(new TblJobActivity(
                        rs.getRow(),
                        rs.getInt("id"),
                        rs.getString("candidate_id"),
                        rs.getInt("activity"),
                        rs.getString("job_title"),
                        rs.getString("employer_id"),
                        rs.getString("employer_name"),
                        rs.getString("vacancy_id"),
                        rs.getString("created_at"),
                        rs.getString("modified_at")
                ));
            }
            if (arrayList.isEmpty()) {
                arrayList.add(new TblJobActivity(0, this.getClass().getName(), "No Data Found"));
            }
        } catch (SQLException e) {
            arrayList.add(new TblJobActivity(-1, this.getClass().getName(), e.getMessage()));
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

    public TblJobActivity selectById(String candidateId) {
        con = JobPortalDb.connectDb();
        TblJobActivity bean = null;
        try {
            sql = "select * from " + TABLENAME + " where candidate_id = " + candidateId;
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                bean = new TblJobActivity(
                        rs.getRow(),
                        rs.getInt("id"),
                        rs.getString("candidate_id"),
                        rs.getInt("activity"),
                        rs.getString("job_title"),
                        rs.getString("employer_id"),
                        rs.getString("employer_name"),
                        rs.getString("vacancy_id"),
                        rs.getString("created_at"),
                        rs.getString("modified_at")
                );
            }
        } catch (SQLException e) {
            bean = new TblJobActivity(-1, this.getClass().getName(), e.getMessage());
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

    public ArrayList<TblJobActivity> selectByCandidateId(String id) {
        con = JobPortalDb.connectDb();
        ArrayList<TblJobActivity> arrayList = new ArrayList<>();
        try {
            sql = "select * from " + TABLENAME + " where candidate_id= " + id;
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                arrayList.add(new TblJobActivity(
                        rs.getRow(),
                        rs.getInt("id"),
                        rs.getString("candidate_id"),
                        rs.getInt("activity"),
                        rs.getString("job_title"),
                        rs.getString("employer_id"),
                        rs.getString("employer_name"),
                        rs.getString("vacancy_id"),
                        rs.getString("created_at"),
                        rs.getString("modified_at")
                ));
            }
            if (arrayList.isEmpty()) {
                arrayList.add(new TblJobActivity(0, this.getClass().getName(), "No Data Found"));
            }
        } catch (SQLException e) {
            arrayList.add(new TblJobActivity(-1, this.getClass().getName(), e.getMessage()));
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

    public String updateActivity(TblJobActivity beans) {

        con = JobPortalDb.connectDb();
        try {
            sql = "update " + TABLENAME + " set activity=? where employer_name=?";
            cs = con.prepareCall(sql);
            cs.setInt(1, beans.getActivity());
            cs.setString(2, beans.getEmployerName());

            int rows = cs.executeUpdate();
            if (rows >= 1) {
                message = "Changes Saved";
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

    public ArrayList<TblJobActivity> selectByCandidateIds(String id) {
        con = JobPortalDb.connectDb();
        ArrayList<TblJobActivity> arrayList = new ArrayList<>();
        try {
            sql = "select * from  tblcandidatetx  where candidate_id= ? order by id DESC LIMIT 5";
            cs = con.prepareCall(sql);
            cs.setString(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                arrayList.add(new TblJobActivity(
                        rs.getRow(),
                        rs.getInt("id"),
                        rs.getString("candidate_id"),
                        rs.getInt("deduction"),
                        rs.getInt("deduction_type"),
                        rs.getString("created_at"),
                        rs.getString("modified_at")
                ));
            }
            if (arrayList.isEmpty()) {
                arrayList.add(new TblJobActivity(0, this.getClass().getName(), "No Data Found"));
            }
        } catch (SQLException e) {
            arrayList.add(new TblJobActivity(-1, this.getClass().getName(), e.getMessage()));
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
    // Show transaction history in employer wallet

    public ArrayList<TblJobActivity> selectByEmployerId(String id) {
        con = JobPortalDb.connectDb();
        ArrayList<TblJobActivity> arrayList = new ArrayList<>();
        try {
            sql = "select * from  tblemployertx  where employer_id= ? order by id DESC LIMIT 5";
            cs = con.prepareCall(sql);
            cs.setString(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                arrayList.add(new TblJobActivity(
                        rs.getRow(),
                        rs.getInt("id"),
                        rs.getString("candidate_id"),
                        rs.getInt("deduction"),
                        rs.getInt("deduction_type"),
                        rs.getString("createdAt")
                ));
            }
            if (arrayList.isEmpty()) {
                arrayList.add(new TblJobActivity(0, this.getClass().getName(), "No Data Found"));
            }
        } catch (SQLException e) {
            arrayList.add(new TblJobActivity(-1, this.getClass().getName(), e.getMessage()));
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

    public String delete(TblJobActivity bn) {
        con = JobPortalDb.connectDb();
        try {
            sql = "delete from " + TABLENAME + " where id = ?";
            cs = con.prepareCall(sql);
            cs.setInt(1, bn.getId());
            int rows = cs.executeUpdate();
            if (rows >= 1) {
                message = "Job Deleted ";
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

    public ArrayList<TblJobActivity> selectByCandidateIdw(String id) {
        con = JobPortalDb.connectDb();
        ArrayList<TblJobActivity> arrayList = new ArrayList<>();
        try {
            sql = "select * from  tblcandidatetx where candidate_id = ?";
            cs = con.prepareCall(sql);
            cs.setString(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                arrayList.add(new TblJobActivity(
                        rs.getRow(),
                        rs.getInt("id"),
                        rs.getString("candidate_id"),
                        rs.getInt("deduction"),
                        rs.getInt("deduction_type"),
                        rs.getString("created_at"),
                        rs.getString("modified_at")
                ));
            }
            if (arrayList.isEmpty()) {
                arrayList.add(new TblJobActivity(0, this.getClass().getName(), "No Data Found"));
            }
        } catch (SQLException e) {
            arrayList.add(new TblJobActivity(-1, this.getClass().getName(), e.getMessage()));
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

// show employer wallet
    public ArrayList<TblJobActivity> selectByEmployerIdw(String id) {
        con = JobPortalDb.connectDb();
        ArrayList<TblJobActivity> arrayList = new ArrayList<>();
        try {
            sql = "select * from  tblemployertx  where employer_id= " + id;
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                arrayList.add(new TblJobActivity(
                        rs.getRow(),
                        rs.getInt("id"),
                        rs.getString("candidate_id"),
                        rs.getInt("deduction"),
                        rs.getInt("deduction_type"),
                        rs.getString("createdAt")
                ));
            }
            if (arrayList.isEmpty()) {
                arrayList.add(new TblJobActivity(0, this.getClass().getName(), "No Data Found"));
            }
        } catch (SQLException e) {
            arrayList.add(new TblJobActivity(-1, this.getClass().getName(), e.getMessage()));
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

//    method to check the job activity
    public boolean checkJobActivity(String cid, int activity, String vid) {
        boolean check = false;
        con = JobPortalDb.connectDb();
        sql = "SELECT * FROM tbljobactivity where candidate_id = ? and activity = ? and vacancy_id = ?";

        try {
            cs = con.prepareCall(sql);
            cs.setString(1, cid);
            cs.setInt(2, activity);
            cs.setString(3, vid);

            rs = cs.executeQuery();
            if (rs.next()) {
                check = true;
            }
        } catch (Exception e) {
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

    public String deleteActivity(TblJobActivity jobActivity) {

        con = JobPortalDb.connectDb();
        sql = "DELETE FROM tbljobactivity WHERE candidate_id = ? and activity = ? and vacancy_id = ?";

        try {
            cs = con.prepareCall(sql);
            cs.setString(1, jobActivity.getCandidateId());
            cs.setInt(2, jobActivity.getActivity());
            cs.setString(3, jobActivity.getVacancyId());

            int i = cs.executeUpdate();

            if (i == 1) {
                message = "Activity Deleted";
            } else {
                message = "Error while deleting activity...";
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

        return message;
    }

}
