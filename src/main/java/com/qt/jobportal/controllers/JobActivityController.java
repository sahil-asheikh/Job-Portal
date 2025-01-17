/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qt.jobportal.controllers;

import com.qt.jobportal.beans.TblJobActivity;
import com.qt.jobportal.models.JobActivity;
import com.qt.jobportal.models.Subscription;
import com.qt.jobportal.models.SubscriptionCandidateModel;
import java.io.FileNotFoundException;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lenovo
 */
@WebServlet(name = "JobActivityController", urlPatterns = {"/JobActivityController"})
public class JobActivityController extends HttpServlet {

    JobActivity model = new JobActivity();
    TblJobActivity beans = new TblJobActivity();
    String msg = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "apply":
                activityApply(request, response);
                break;
            case "save":
                activityInsert(request, response);
                break;
            case "favCompany":
                activityInsert(request, response);
                break;
            case "updateActivity":
                activityUpdate(request, response);
                break;
            case "delete":
                vacancyDelete(request, response);
                break;
            case "deleteActivity":
                deleteActivity(request, response);
                break;
            default:
                break;
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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

    private void activityInsert(HttpServletRequest request, HttpServletResponse response) throws IOException {

        System.out.println(request.getParameter("candidateid"));
        beans.setCandidateId(request.getParameter("candidateid"));

        int activity = 0;
        if (request.getParameter("action").equals("apply")) {
            activity = 1;
        } else if (request.getParameter("action").equals("save")) {
            activity = 2;     // save job
        } else {
            activity = 3;    // 3 = fav. Company
        }

        JobActivity jobAct = new JobActivity();
        boolean check = jobAct.checkJobActivity(request.getParameter("candidateid"), activity, request.getParameter("vacancyid"));

        if (check) {
            msg = "Activity of Job is added";
        } else {

            beans.setActivity(activity);

            System.out.println(request.getParameter("title"));
            beans.setJobTitle(request.getParameter("title"));
            beans.setEmployerId(request.getParameter("employerId"));
            System.out.println(request.getParameter("employerId"));

            System.out.println(request.getParameter("employername"));
            beans.setEmployerName(request.getParameter("employername"));
            beans.setVacancyId(request.getParameter("vacancyid"));

            msg = model.insertSave(beans);

            String vacancyId = request.getParameter("vacancyid");
        }

        response.sendRedirect("jobDetails.jsp?id=" + request.getParameter("vacancyid") + "&message=" + msg);
//        response.sendRedirect("jobDetails.jsp?id=" + request.getParameter("vacancyid") + "&msg=" + msg);

    }

    private void activityApply(HttpServletRequest request, HttpServletResponse response) throws IOException {
        beans.setCandidateId(request.getParameter("candidateid"));
        int activity = 0;
        if (request.getParameter("action").equals("apply")) {
            activity = 1;
        }

        JobActivity jobAct = new JobActivity();
        boolean check = jobAct.checkJobActivity(request.getParameter("candidateid"), activity, request.getParameter("vacancyid"));

        if (check) {
            msg = "Applied for Job";
        } else {
            beans.setActivity(activity);
            beans.setJobTitle(request.getParameter("title"));
            beans.setEmployerName(request.getParameter("employername"));
            beans.setVacancyId(request.getParameter("vacancyid"));
            beans.setCandidateId(request.getParameter("candidateid"));
            
            
//            beans.setDeduction(Integer.parseInt(request.getParameter("deduction")));
            beans.setDeduction(SubscriptionCandidateModel.deduction(request.getParameter("candidateid")));
            
            
            beans.setDeduction_type(Integer.parseInt(request.getParameter("deduction_type")));
            beans.setEmployerId(request.getParameter("employerId"));
            beans.setEmpDeduction(Subscription.empDeduction(request.getParameter("employerId")));
            beans.setEmpDeduction_type(Integer.parseInt(request.getParameter("empdeduction_type")));
            beans.setJobTitle(request.getParameter("jobtitle"));
            beans.setEmployerName(request.getParameter("empname"));

            msg = model.insert(beans);
        }

        response.sendRedirect("jobDetails.jsp?id=" + request.getParameter("vacancyid") + "&message=" + msg);
    }

    private void activityUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int activity = 0;
        if (request.getParameter("action").equals("updateActivity")) {
            activity = 1;
        }

        JobActivity jobAct = new JobActivity();
        boolean check = jobAct.checkJobActivity(request.getParameter("candidateid"), activity, request.getParameter("vacancyid"));
        String vacancyId = request.getParameter("vacancyid");

        if (check) {
            msg = "Applied for Job";
        } else {

            beans.setActivity(activity);
            beans.setCandidateId(request.getParameter("candidateid"));
            beans.setJobTitle(request.getParameter("title"));
            beans.setEmployerId(request.getParameter("employerId"));
            beans.setEmployerName(request.getParameter("employername"));
            beans.setVacancyId(request.getParameter("vacancyid"));

            msg = model.insertSave(beans);

        }

        response.sendRedirect("candidate/candidateAccount.jsp?vacancyid=" + vacancyId + "&message=" + msg);
//        response.sendRedirect("candidate/candidateAccount.jsp?vacancyid=" + vacancyId + "&msg=" + msg);

    }

    private void vacancyDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (request.getParameter("id") == null || request.getParameter("id").equals("")) {
            msg = "Id should not be empty!";
        } else {

            beans.setId(Integer.parseInt(request.getParameter("id")));
            msg = model.delete(beans);
            response.sendRedirect("candidate/appliedJob.jsp?message=" + msg);
        }
    }

    private void deleteActivity(HttpServletRequest request, HttpServletResponse response) throws FileNotFoundException, IOException {

        int activity = Integer.parseInt(request.getParameter("activity"));

        JobActivity jobAct = new JobActivity();
        boolean check = jobAct.checkJobActivity(request.getParameter("candidateid"), activity, request.getParameter("vacancyid"));
        String vacancyId = request.getParameter("vacancyid");

        if (!check) {
            msg = "Job is not available";
        } else {

            beans.setActivity(activity);
            beans.setCandidateId(request.getParameter("candidateid"));
            beans.setVacancyId(request.getParameter("vacancyid"));

            msg = model.deleteActivity(beans);

        }

        response.sendRedirect("candidate/candidateAccount.jsp?vacancyid=" + vacancyId + "&message=" + msg);
//        response.sendRedirect("candidate/candidateAccount.jsp?vacancyid=" + vacancyId + "&msg=" + msg);

    }

}
