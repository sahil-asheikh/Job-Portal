/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qt.jobportal.models;

import com.qt.jobportal.beans.TblVacancy;
import com.qt.jobportal.commons.DatabaseExistance;
import com.qt.jobportal.commons.JobPortalDb;
import com.qt.jobportal.commons.Utils;
import static com.qt.jobportal.models.EmployerModel.TABLENAME;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Zeeshan
 */
public class Vacancy {

    Connection con = null;
    DatabaseExistance existance = new DatabaseExistance();
    String sql, message = null;
    ResultSet rs = null;
    CallableStatement cs = null;
    public static final String TABLENAME = TblVacancy.class.getSimpleName().toLowerCase();
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

    public String insert(TblVacancy vacancy) {
        con = JobPortalDb.connectDb();
        Task:
        if (null == existance.doCheckExistanceOf(TABLENAME, null)) {
            message = "null parameter";
        } else {
            switch (existance.doCheckExistanceOf(TABLENAME, null)) {
                case "exist":
                    try {
                        System.out.println(vacancy.getJobDescription());
                        Utils util = new Utils();

                        int balance = util.fetchBalance(vacancy.getEmployerId(), "tblemployer");
                        System.out.println(balance);
                        if (balance >= 50) {
                            sql = "insert into tblvacancy ( "
                                    + "vacancy_id,title, min_sal, max_sal, no_of_opening,"
                                    + "job_in_state, job_in_city, job_in_area, job_address,"
                                    + "job_description, min_qualification, experience, gender,"
                                    + "english_accuracy, skill_set, job_timing, interview_details,"
                                    + "company_name, contact_person, phone_no, email_id,Employer_id) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                            cs = con.prepareCall(sql);
                            cs.setString(1, vacancy.getVacancyPublicId());
                            cs.setString(2, vacancy.getTitle());
                            cs.setInt(3, vacancy.getMinSalary());
                            cs.setInt(4, vacancy.getMaxSalary());
                            cs.setInt(5, vacancy.getNoOfOpening());
                            cs.setString(6, vacancy.getJobState());
                            cs.setString(7, vacancy.getJobCity());
                            cs.setString(8, vacancy.getJobArea());
                            cs.setString(9, vacancy.getJobAddress());
                            cs.setString(10, vacancy.getJobDescription());
                            cs.setString(11, vacancy.getMinQualification());
                            cs.setString(12, vacancy.getExperience());
                            cs.setString(13, vacancy.getGender());
                            cs.setString(14, vacancy.getEnglishAccuracy());
                            cs.setString(15, vacancy.getSkillSet());
                            cs.setString(16, vacancy.getJobTiming());
                            cs.setString(17, vacancy.getInterviewDetails());
                            cs.setString(18, vacancy.getCompanyName());
                            cs.setString(19, vacancy.getContactPerson());
                            cs.setString(20, vacancy.getPhoneNo());
                            cs.setString(21, vacancy.getEmailId());
                            cs.setString(22, vacancy.getEmployerId());
                            int rows = cs.executeUpdate();
                            if (rows >= 1) {
                                String sql1 = "call spEmployerJobPost(?,?,?)";
                                cs = con.prepareCall(sql1);
                                cs.setString(1, vacancy.getEmployerId());
                                cs.setInt(2, 50);   // Deduction 50 rs
                                cs.setInt(3, 1);    // Post new job
                                cs.executeUpdate();
                                message = "<span class=\"text-success font-bold\">Job Added </span>";

                            }
                        } else {
                            message = "<span class=\"text-danger font-bold\">Insuffient Balance </span>";

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

    public String delete(TblVacancy vacancy) {
        con = JobPortalDb.connectDb();
        try {
            sql = "delete from " + TABLENAME + " where vacancy_id = ?";
            cs = con.prepareCall(sql);
            cs.setString(1, vacancy.getVacancyPublicId());
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

    public String update(TblVacancy vacancy) {
        con = JobPortalDb.connectDb();
        try {
            sql = "update " + TABLENAME + " set title = ?,min_sal = ?,max_sal = ?,"
                    + "no_of_opening = ?,job_in_state = ?,job_in_city = ?,"
                    + "job_in_area = ?,job_address = ?,job_description = ?,"
                    + "min_qualification =?,experience = ?,gender = ?,english_accuracy = ?,"
                    + "skill_set = ?,job_timing = ?,interview_details = ?,"
                    + "company_name = ?,contact_person = ?,phone_no = ?,"
                    + "email_id = ? where id = ?";
            cs = con.prepareCall(sql);
            cs.setString(1, vacancy.getTitle());
            cs.setInt(2, vacancy.getMinSalary());
            cs.setInt(3, vacancy.getMaxSalary());
            cs.setInt(4, vacancy.getNoOfOpening());
            cs.setString(5, vacancy.getJobState());
            cs.setString(6, vacancy.getJobCity());
            cs.setString(7, vacancy.getJobArea());
            cs.setString(8, vacancy.getJobAddress());
            cs.setString(9, vacancy.getJobDescription());
            cs.setString(10, vacancy.getMinQualification());
            cs.setString(11, vacancy.getExperience());
            cs.setString(12, vacancy.getGender());
            cs.setString(13, vacancy.getEnglishAccuracy());
            cs.setString(14, vacancy.getSkillSet());
            cs.setString(15, vacancy.getJobTiming());
            cs.setString(16, vacancy.getInterviewDetails());
            cs.setString(17, vacancy.getCompanyName());
            cs.setString(18, vacancy.getContactPerson());
            cs.setString(19, vacancy.getPhoneNo());
            cs.setString(20, vacancy.getEmailId());
            cs.setInt(21, vacancy.getId());
            int rows = cs.executeUpdate();
            if (rows >= 1) {
                message = "Job Updated ";
            }
        } catch (SQLException e) {
            System.out.println("com.qt.jobportal.models.Vacancy.update() " + e.getMessage());
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

    public ArrayList<TblVacancy> select() {
        con = JobPortalDb.connectDb();
        ArrayList<TblVacancy> arrayList = new ArrayList<>();
        try {
            sql = "select * from tblvacancy  where job_status = 1 ORDER BY Id DESC";
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                arrayList.add(new TblVacancy(
                        rs.getRow(),
                        rs.getInt("id"),
                        rs.getString("vacancy_id"),
                        rs.getString("Employer_id"),
                        rs.getString("title"),
                        rs.getInt("min_sal"),
                        rs.getInt("max_sal"),
                        rs.getInt("no_of_opening"),
                        rs.getString("job_in_state"),
                        rs.getString("job_in_city"),
                        rs.getString("job_in_area"),
                        rs.getString("job_address"),
                        rs.getString("job_description"),
                        rs.getString("min_qualification"),
                        rs.getString("experience"),
                        rs.getString("gender"),
                        rs.getString("english_accuracy"),
                        rs.getString("Skill_Set"),
                        rs.getString("job_timing"),
                        rs.getString("interview_details"),
                        rs.getString("company_name"),
                        rs.getString("contact_person"),
                        rs.getString("phone_no"),
                        rs.getString("email_id"),
                        rs.getInt("job_status"),
                        rs.getInt("job_hide"),
                        rs.getString("created_at"),
                        rs.getString("modified_at")
                ));
            }
            if (arrayList.isEmpty()) {
                arrayList.add(new TblVacancy(0, this.getClass().getName(), "No Data Found"));
            }
        } catch (SQLException e) {
            arrayList.add(new TblVacancy(-1, this.getClass().getName(), e.getMessage()));
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

    public ArrayList<TblVacancy> selectByLimit(String limit) {
        con = JobPortalDb.connectDb();
        ArrayList<TblVacancy> arrayList = new ArrayList<>();
        try {
            sql = "select * from " + TABLENAME + " order by Id desc limit " + limit;
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                arrayList.add(new TblVacancy(
                        rs.getRow(),
                        rs.getInt("id"),
                        rs.getString("vacancy_id"),
                        rs.getString("Employer_id"),
                        rs.getString("title"),
                        rs.getInt("min_sal"),
                        rs.getInt("max_sal"),
                        rs.getInt("no_of_opening"),
                        rs.getString("job_in_state"),
                        rs.getString("job_in_city"),
                        rs.getString("job_in_area"),
                        rs.getString("job_address"),
                        rs.getString("job_description"),
                        rs.getString("min_qualification"),
                        rs.getString("experience"),
                        rs.getString("gender"),
                        rs.getString("english_accuracy"),
                        rs.getString("Skill_Set"),
                        rs.getString("job_timing"),
                        rs.getString("interview_details"),
                        rs.getString("company_name"),
                        rs.getString("contact_person"),
                        rs.getString("phone_no"),
                        rs.getString("email_id"),
                        rs.getInt("job_status"),
                        rs.getInt("job_hide"),
                        rs.getString("created_at"),
                        rs.getString("modified_at")
                ));
            }
            if (arrayList.isEmpty()) {
                arrayList.add(new TblVacancy(0, this.getClass().getName(), "No Data Found"));
            }
        } catch (SQLException e) {
            arrayList.add(new TblVacancy(-1, this.getClass().getName(), e.getMessage()));
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

    public ArrayList<TblVacancy> selectByEmployerId(String id) {
        con = JobPortalDb.connectDb();
        ArrayList<TblVacancy> arrayList = new ArrayList<>();
        try {
            sql = "select * from " + TABLENAME + " where employer_id=? order by employer_id desc";
            cs = con.prepareCall(sql);
            cs.setString(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                arrayList.add(new TblVacancy(
                        rs.getRow(),
                        rs.getInt("id"),
                        rs.getString("vacancy_id"),
                        rs.getString("Employer_id"),
                        rs.getString("title"),
                        rs.getInt("min_sal"),
                        rs.getInt("max_sal"),
                        rs.getInt("no_of_opening"),
                        rs.getString("job_in_state"),
                        rs.getString("job_in_city"),
                        rs.getString("job_in_area"),
                        rs.getString("job_address"),
                        rs.getString("job_description"),
                        rs.getString("min_qualification"),
                        rs.getString("experience"),
                        rs.getString("gender"),
                        rs.getString("english_accuracy"),
                        rs.getString("Skill_Set"),
                        rs.getString("job_timing"),
                        rs.getString("interview_details"),
                        rs.getString("company_name"),
                        rs.getString("contact_person"),
                        rs.getString("phone_no"),
                        rs.getString("email_id"),
                        rs.getInt("job_status"),
                        rs.getInt("job_hide"),
                        rs.getString("created_at"),
                        rs.getString("modified_at")
                ));
            }
            if (arrayList.isEmpty()) {
                arrayList.add(new TblVacancy(0, this.getClass().getName(), "No Job Post "));
            }
        } catch (SQLException e) {
            arrayList.add(new TblVacancy(-1, this.getClass().getName(), e.getMessage()));
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

    public TblVacancy selectById(String id) {
        con = JobPortalDb.connectDb();
        TblVacancy vacancy = new TblVacancy();
        try {
            sql = "select * from tblvacancy where vacancy_id = ?";
            cs = con.prepareCall(sql);
            cs.setString(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                vacancy = new TblVacancy(
                        rs.getRow(),
                        rs.getInt("id"),
                        rs.getString("vacancy_id"),
                        rs.getString("Employer_id"),
                        rs.getString("title"),
                        rs.getInt("min_sal"),
                        rs.getInt("max_sal"),
                        rs.getInt("no_of_opening"),
                        rs.getString("job_in_state"),
                        rs.getString("job_in_city"),
                        rs.getString("job_in_area"),
                        rs.getString("job_address"),
                        rs.getString("job_description"),
                        rs.getString("min_qualification"),
                        rs.getString("experience"),
                        rs.getString("gender"),
                        rs.getString("english_accuracy"),
                        rs.getString("Skill_Set"),
                        rs.getString("job_timing"),
                        rs.getString("interview_details"),
                        rs.getString("company_name"),
                        rs.getString("contact_person"),
                        rs.getString("phone_no"),
                        rs.getString("email_id"),
                        rs.getInt("job_status"),
                        rs.getInt("job_hide"),
                        rs.getString("created_at"),
                        rs.getString("modified_at")
                );
            }
        } catch (SQLException e) {
            vacancy = new TblVacancy(-1, this.getClass().getName(), e.getMessage());
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                message = e.getMessage();
            }
        }
        return vacancy;
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

    public ArrayList<Integer> VacancyCount(String pid) {

        System.out.println("pid=" + pid);

        ArrayList<Integer> vaccancyCount = new ArrayList();
        con = JobPortalDb.connectDb();
        try {

            //   sql="CALL spVacancyCount(?)";
            sql = "call spVacancyCount(?)";
            cs = con.prepareCall(sql);
            cs.setString(1, pid);
            rs = cs.executeQuery();
            rs.next();

            vaccancyCount.add(rs.getInt("@totalVacancy"));   // total vaccancy
            vaccancyCount.add(rs.getInt("@activeVacancy"));   // Acrtive vaccancy
            vaccancyCount.add(rs.getInt("@deActiveVacancy"));   // Deactive vaccancy
            // vaccancyCount.add(rs.getInt("@totalResponses"));   // total Responses
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
        return vaccancyCount;
    }

    public ArrayList<TblVacancy> searchByCategory(String category) {
        con = JobPortalDb.connectDb();
        ArrayList<TblVacancy> arrayList = new ArrayList<>();
        try {
            System.out.println(category);
            sql = "select * from " + TABLENAME + " where title like '" + category + "' ";
            System.out.println(sql);
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                arrayList.add(new TblVacancy(
                        rs.getRow(),
                        rs.getInt("id"),
                        rs.getString("vacancy_id"),
                        rs.getString("Employer_id"),
                        rs.getString("title"),
                        rs.getInt("min_sal"),
                        rs.getInt("max_sal"),
                        rs.getInt("no_of_opening"),
                        rs.getString("job_in_state"),
                        rs.getString("job_in_city"),
                        rs.getString("job_in_area"),
                        rs.getString("job_address"),
                        rs.getString("job_description"),
                        rs.getString("min_qualification"),
                        rs.getString("experience"),
                        rs.getString("gender"),
                        rs.getString("english_accuracy"),
                        rs.getString("Skill_Set"),
                        rs.getString("job_timing"),
                        rs.getString("interview_details"),
                        rs.getString("company_name"),
                        rs.getString("contact_person"),
                        rs.getString("phone_no"),
                        rs.getString("email_id"),
                        rs.getInt("job_status"),
                        rs.getInt("job_hide"),
                        rs.getString("created_at"),
                        rs.getString("modified_at")
                ));
            }
            if (arrayList.isEmpty()) {
                arrayList.add(new TblVacancy(0, this.getClass().getName(), "No Data Found"));
            }
        } catch (SQLException e) {
            arrayList.add(new TblVacancy(-1, this.getClass().getName(), e.getMessage()));
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

    public ArrayList<TblVacancy> searchByCity(String jobCity) {

        String jobycity = "%" + jobCity + "%";
        jobycity.trim();
        con = JobPortalDb.connectDb();
        ArrayList<TblVacancy> arrayList = new ArrayList<>();
        try {
            System.out.println(jobycity);

            //  sql = "select * from " + TABLENAME + " where job_in_city like '"+jobbycity+"'";
            //  sql = "select * from " + TABLENAME + " where job_in_city like '%Nagpur%'";
            sql = "select * from " + TABLENAME + " where job_in_city like " + jobCity;
            System.out.println(sql);
            cs = con.prepareCall(sql);
            //  cs.setString(1, jobCity);
            rs = cs.executeQuery();
            while (rs.next()) {
                arrayList.add(new TblVacancy(
                        rs.getRow(),
                        rs.getInt("id"),
                        rs.getString("vacancy_id"),
                        rs.getString("Employer_id"),
                        rs.getString("title"),
                        rs.getInt("min_sal"),
                        rs.getInt("max_sal"),
                        rs.getInt("no_of_opening"),
                        rs.getString("job_in_state"),
                        rs.getString("job_in_city"),
                        rs.getString("job_in_area"),
                        rs.getString("job_address"),
                        rs.getString("job_description"),
                        rs.getString("min_qualification"),
                        rs.getString("experience"),
                        rs.getString("gender"),
                        rs.getString("english_accuracy"),
                        rs.getString("Skill_Set"),
                        rs.getString("job_timing"),
                        rs.getString("interview_details"),
                        rs.getString("company_name"),
                        rs.getString("contact_person"),
                        rs.getString("phone_no"),
                        rs.getString("email_id"),
                        rs.getInt("job_status"),
                        rs.getInt("job_hide"),
                        rs.getString("created_at"),
                        rs.getString("modified_at")
                ));
            }
            if (arrayList.isEmpty()) {
                arrayList.add(new TblVacancy(0, this.getClass().getName(), "No Data Found"));
            }
        } catch (SQLException e) {
            arrayList.add(new TblVacancy(-1, this.getClass().getName(), e.getMessage()));
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

    public ArrayList<TblVacancy> searchByKeyword(String keyword) {
        con = JobPortalDb.connectDb();
        ArrayList<TblVacancy> arrayList = new ArrayList<>();
        try {
            System.out.println(keyword);
            sql = "select * from " + TABLENAME + " where title like '" + keyword + "' "
                    + "or min_sal like '" + keyword + "' or max_sal like '" + keyword + "'  "
                    + "or no_of_opening like '" + keyword + "'  or company_name like '" + keyword + "' "
                    + " or english_accuracy like '" + keyword + "' or min_qualification like '" + keyword + "' or job_in_city like '" + keyword + "' or job_in_state like '" + keyword + "' ";
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                arrayList.add(new TblVacancy(
                        rs.getRow(),
                        rs.getInt("id"),
                        rs.getString("vacancy_id"),
                        rs.getString("Employer_id"),
                        rs.getString("title"),
                        rs.getInt("min_sal"),
                        rs.getInt("max_sal"),
                        rs.getInt("no_of_opening"),
                        rs.getString("job_in_state"),
                        rs.getString("job_in_city"),
                        rs.getString("job_in_area"),
                        rs.getString("job_address"),
                        rs.getString("job_description"),
                        rs.getString("min_qualification"),
                        rs.getString("experience"),
                        rs.getString("gender"),
                        rs.getString("english_accuracy"),
                        rs.getString("Skill_Set"),
                        rs.getString("job_timing"),
                        rs.getString("interview_details"),
                        rs.getString("company_name"),
                        rs.getString("contact_person"),
                        rs.getString("phone_no"),
                        rs.getString("email_id"),
                        rs.getInt("job_status"),
                        rs.getInt("job_hide"),
                        rs.getString("created_at"),
                        rs.getString("modified_at")
                ));
            }
            if (arrayList.isEmpty()) {
                arrayList.add(new TblVacancy(0, this.getClass().getName(), "No Data Found"));
            }
        } catch (SQLException e) {
            arrayList.add(new TblVacancy(-1, this.getClass().getName(), e.getMessage()));
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

}
