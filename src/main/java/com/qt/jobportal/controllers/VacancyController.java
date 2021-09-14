/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qt.jobportal.controllers;

import com.qt.jobportal.beans.TblVacancy;
import com.qt.jobportal.commons.Utils;
import com.qt.jobportal.models.Subscription;
import static com.qt.jobportal.models.Subscription.empDeduction;
import com.qt.jobportal.models.Vacancy;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lenovo
 */
@WebServlet(name = "VacancyController", urlPatterns = {"/VacancyController"})
public class VacancyController extends HttpServlet {

    Vacancy model = new Vacancy();
    TblVacancy vacancy = new TblVacancy();
    String msg = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "insert":
                insertVacancy(request, response);
                break;
            case "update":
                doPut(request, response);
                break;
            case "delete":
                doDelete(request, response);
                break;
            case "visibility":
                jobVisibility(request, response);
                break;
            default:
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        vacancy.setId(Integer.parseInt(request.getParameter("id")));
        vacancy.setTitle(request.getParameter("txtTitle"));
        vacancy.setMinSalary(Integer.parseInt(request.getParameter("txtMinSalary")));
        vacancy.setMaxSalary(Integer.parseInt(request.getParameter("txtMaxSalary")));
        vacancy.setNoOfOpening(Integer.parseInt(request.getParameter("txtNoOfOpening")));
        vacancy.setJobState(request.getParameter("txtJobInState"));
        vacancy.setJobCity(request.getParameter("txtJobInCity"));
        vacancy.setJobArea(request.getParameter("txtJobInArea"));
        vacancy.setJobAddress(request.getParameter("txtJobAddress"));
        vacancy.setJobDescription(request.getParameter("txtJobDescription"));
        vacancy.setMinQualification(request.getParameter("txtMinQualification"));
        vacancy.setExperience(request.getParameter("txtExperience"));
        vacancy.setGender(request.getParameter("rdGender"));
        vacancy.setEnglishAccuracy(request.getParameter("txtEnglishAccuracy"));
//          String jobskillList=request.getParameter("txtSkillSet");
//            String[] list = jobskillList.split("");
//           vacancy.setSkillSet(Arrays.toString(list));
        vacancy.setSkillSet(request.getParameter("txtSkillSet"));
        vacancy.setJobTiming(request.getParameter("txtJobTiming"));
        vacancy.setInterviewDetails(request.getParameter("txtInterviewDetail"));
        vacancy.setCompanyName(request.getParameter("txtCompanyName"));
        vacancy.setContactPerson(request.getParameter("txtContactPerson"));
        vacancy.setPhoneNo(request.getParameter("txtPhoneNumber"));
        vacancy.setEmailId(request.getParameter("txtEmailId"));

        msg = model.update(vacancy);
        response.sendRedirect("employer/vacancyselect.jsp?message=" + msg);

    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("vid") == null || req.getParameter("vid").equals("")) {
            msg = "Id should not be empty!";
        } else {
            vacancy.setVacancyPublicId(req.getParameter("vid"));
            msg = model.delete(vacancy);
        }
        resp.sendRedirect("employer/vacancyselect.jsp?msg=" + msg);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void insertVacancy(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String publicId = Utils.generatePublicId(30);
        vacancy.setVacancyPublicId(publicId);

        vacancy.setEmployerId(request.getParameter("employerId"));
        System.err.println(request.getParameter("employerId"));
        vacancy.setTitle(request.getParameter("txtTitle"));
        vacancy.setMinSalary(Integer.parseInt(request.getParameter("txtMinSalary")));
        vacancy.setMaxSalary(Integer.parseInt(request.getParameter("txtMaxSalary")));
        vacancy.setNoOfOpening(Integer.parseInt(request.getParameter("txtNoOfOpening")));
        vacancy.setJobState(request.getParameter("txtJobInState"));
        vacancy.setJobCity(request.getParameter("txtJobInCity"));
        vacancy.setJobArea(request.getParameter("txtJobInArea"));
        vacancy.setJobAddress(request.getParameter("txtJobAddress"));
        vacancy.setJobDescription(request.getParameter("txtJobDescription"));
        vacancy.setMinQualification(request.getParameter("txtMinQualification"));
        vacancy.setExperience(request.getParameter("txtExperience"));
        vacancy.setGender(request.getParameter("rdGender"));
        vacancy.setEnglishAccuracy(request.getParameter("txtEnglishAccuracy"));
        vacancy.setSkillSet(request.getParameter("txtSkillSet"));
        vacancy.setJobTiming(request.getParameter("txtJobTiming"));
        vacancy.setInterviewDetails(request.getParameter("txtInterviewDetail"));
        vacancy.setCompanyName(request.getParameter("txtCompanyName"));
        vacancy.setContactPerson(request.getParameter("txtContactPerson"));
        vacancy.setPhoneNo(request.getParameter("txtPhoneNumber"));
        vacancy.setEmailId(request.getParameter("txtEmailId"));

        msg = model.insert(vacancy);

        response.sendRedirect("employer/vacancyselect.jsp?message=" + msg);
    }

    private void jobVisibility(HttpServletRequest request, HttpServletResponse response) throws FileNotFoundException, IOException {

        String vid = request.getParameter("vid");
        int status = Integer.parseInt(request.getParameter("status"));
        String empID = request.getParameter("empID");
        int empDeduction = Subscription.empDeduction(empID);
        int empBalance = Subscription.empBalance(empID);

        try {
            if (status == 1) {
                if (empBalance >= empDeduction) {
                    TblVacancy tblVacancy = new TblVacancy();
                    tblVacancy.setJobStatus(status);
                    tblVacancy.setVacancyPublicId(vid);

                    Vacancy vacancy = new Vacancy();
                    msg = vacancy.jobVisibility(tblVacancy);
                } else {
                    msg = "You don't have sufficient balance to activate this job";
                }
            } else {
                TblVacancy tblVacancy = new TblVacancy();
                tblVacancy.setJobStatus(status);
                tblVacancy.setVacancyPublicId(vid);

                Vacancy vacancy = new Vacancy();
                msg = vacancy.jobVisibility(tblVacancy);
            }

        } catch (Exception e) {
            msg = "Error occured because of " + e.getMessage();
        } finally {
            response.sendRedirect("employer/vacancyselect.jsp?vid=" + request.getParameter("vid") + "&message=" + msg);
        }
    }

}
