/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qt.jobportal.controllers;

import com.qt.jobportal.beans.TblEmployer;
import com.qt.jobportal.beans.TblEmployerDetails;
import com.qt.jobportal.commons.Utils;
import com.qt.jobportal.models.EmployerModel;
import com.qt.jobportal.models.Subscription;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Asus
 */
@WebServlet(name = "EmployerController", urlPatterns = {"/EmployerController"})
public class EmployerController extends HttpServlet {

    EmployerModel em = new EmployerModel();
    TblEmployer employer = new TblEmployer();
    String msg = null;
    Subscription sub = new Subscription();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "insert":
                employerInsert(request, response);
                break;
            case "update":
                doPut(request, response);
                break;
            case "delete":
                employerDelete(request, response);
                break;
            case "login":
                employerLogin(request, response);
                break;
            case "signUp":
                emplSignUp(request, response);
                break;
            case "logout":
                HttpSession session = request.getSession();
                session.invalidate();
                response.sendRedirect("index.jsp");
                break;
            case "updatePassword":
                updatePassword(request, response);
                break;
            case "downloadResume":
                resumeDownload(request, response);
                break;
            case "pricing":
                empPlan(request, response);
                break;
            case "saveCompanySummary":
                saveCompanySummary(request, response);
                break;
            case "updateCompanyAddress":
                updateCompanyAddress(request, response);
                break;
            case "saveWebsite":
                saveWebsite(request, response);
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
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws IOException {

//        employer.setId(Integer.parseInt(request.getParameter("id")));
        employer.setCompanyPublicId(request.getParameter("id"));
        employer.setCompanyName(request.getParameter("txtCompanyName"));
        employer.setContactPerson(request.getParameter("txtContactPerson"));
        employer.setPhoneNo(request.getParameter("txtPhoneNo"));
        employer.setEmailId(request.getParameter("txtEmailId"));
        employer.setJobAddress(request.getParameter("txtJobAddress"));
        msg = em.update(employer);

//        response.sendRedirect("employer/employerDash.jsp?msg=" + msg);
        response.sendRedirect("employer/profile.jsp?eid=" + request.getParameter("id") + "message=" + msg);

    }

    private void employerInsert(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int balance;
        balance = 0;

        System.out.println(request.getParameter("txtSubscription"));
        int bal = sub.SubscriptionAmountEmp(request.getParameter("txtSubscription"));
        // employer.setSubscriptionPlan(sub.SubscriptionAmountEmp(request.getParameter("txtSubscription"))));
        employer.setBalance(bal);

        // for Generating Public Id  use generatePublicId() method
        String publicId = Utils.generatePublicId(30);
        employer.setCompanyPublicId(publicId);

        employer.setCompanyName(request.getParameter("txtCompanyName"));
        employer.setContactPerson(request.getParameter("txtContactPerson"));
        employer.setPhoneNo(request.getParameter("txtPhoneNo"));
        employer.setEmailId(request.getParameter("txtEmailId"));
        employer.setPassword(request.getParameter("txtPassword"));
        employer.setJobAddress(request.getParameter("txtJobAddress"));
        msg = em.insert(employer);
        response.sendRedirect("employer/insertEmployer.jsp?msg=" + msg);
    }

    protected void employerDelete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (request.getParameter("eid") == null || request.getParameter("eid").equals("")) {
            msg = "Id should not be empty!";
        } else {
            employer.setCompanyPublicId(request.getParameter("eid"));
            msg = em.delete(employer);
            response.sendRedirect("admin/showEmployer.jsp?message=" + msg);
        }
    }

    private void employerLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        employer.setPhoneNo(request.getParameter("txtPhoneNo"));
        employer.setPassword(request.getParameter("txtPassword"));
        int status = em.doLogin(employer, request);

        switch (status) {
            case -1:
                msg = "please register yourself";
                break;
            case 0:
                msg = "You are blocked ! Please contact to admin";
                break;
            case 1:
                msg = "Login Succesfully";
                break;
            case 2:
                msg = "You have entered wrong password";
                break;

        }
        response.sendRedirect("employerLogin.jsp?msg=" + msg);
    }

    private void updatePassword(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String empId = request.getParameter("empId");
        if (request.getParameter("newPassword").equals(request.getParameter("confirmPassword"))) {
            employer.setCompanyPublicId(empId);
            employer.setValidPassword(request.getParameter("validPassword"));
            employer.setNewPassword(request.getParameter("newPassword"));
            employer.setConfirmPassword(request.getParameter("confirmPassword"));

            msg = em.updatePassword(employer);
        } else {
            msg = "Password Not Matched";
//            response.sendRedirect("employer/profile.jsp?id=" + empId + "message=" + msg);
        }

        response.sendRedirect("employer/profile.jsp?id=" + empId + "message=" + msg);

    }

    private void emplSignUp(HttpServletRequest request, HttpServletResponse response) throws IOException {
        TblEmployer empl = new TblEmployer();
        String publicId = Utils.generatePublicId(30);
        empl.setCompanyPublicId(publicId);
        empl.setCompanyName(request.getParameter("txtCompanyName"));
        empl.setPhoneNo(request.getParameter("txtPhoneNo"));
        empl.setEmailId(request.getParameter("txtEmailId"));
        empl.setPassword(request.getParameter("txtPassword"));
        msg = em.emplSignUp(empl);
        response.sendRedirect("employerLogin.jsp?id=" + publicId + "&message=" + msg);
    }

    private void empPlan(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String employerId = request.getParameter("employer_id");
        String subscriptionId = request.getParameter("subscription_id");
        try {

            msg = em.insertPlan(employerId, subscriptionId);
        } catch (SQLException ex) {
            Logger.getLogger(EmployerController.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("employer/subscriptionPrice.jsp?eid=" + employerId + "message=" + msg);

    }

    private void resumeDownload(HttpServletRequest request, HttpServletResponse response) throws FileNotFoundException, IOException {

        String stdresume = request.getParameter("cid");
        System.out.print(stdresume);
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String gurufile = stdresume.replace(".docx", "");
        String gurupath = "e:/JP/";
        response.setContentType("APPLICATION/OCTET-STREAM");
        response.setHeader("Content-Disposition", "attachment; filename=\""
                + gurufile + "\"");

        FileInputStream fileInputStream = new FileInputStream(gurupath
                + gurufile);

        int i;
        while ((i = fileInputStream.read()) != -1) {
            out.write(i);
        }
        fileInputStream.close();
        out.close();
    }

    private void saveCompanySummary(HttpServletRequest request, HttpServletResponse response) throws FileNotFoundException, IOException {

        String eid = request.getParameter("empid");
        String company_summary = request.getParameter("company_summary");

        TblEmployerDetails empDetails = new TblEmployerDetails();
        empDetails.setEmployer_id(eid);
        empDetails.setCompany_summary(company_summary);

        EmployerModel empModel = new EmployerModel();

        msg = empModel.saveCompanySummary(empDetails);

        response.sendRedirect("employer/profile.jsp?eid=" + eid + "message=" + msg);

    }

    private void updateCompanyAddress(HttpServletRequest request, HttpServletResponse response) throws FileNotFoundException, IOException {

        String eid = request.getParameter("id");
        String company_state = request.getParameter("txtState");
        String company_city = request.getParameter("txtCity");
        String company_address = request.getParameter("txtAddress");

        TblEmployerDetails empDetails = new TblEmployerDetails();
        empDetails.setEmployer_id(eid);
        empDetails.setCompany_state(company_state);
        empDetails.setCompany_city(company_city);
        empDetails.setCompany_address(company_address);

        EmployerModel empModel = new EmployerModel();

        msg = empModel.saveCompanyAddress(empDetails);

        response.sendRedirect("employer/profile.jsp?eid=" + eid + "message=" + msg);

    }

    private void saveWebsite(HttpServletRequest request, HttpServletResponse response) throws FileNotFoundException, IOException {

        String eid = request.getParameter("empid");
        String website = request.getParameter("website");

        TblEmployerDetails empDetails = new TblEmployerDetails();
        empDetails.setEmployer_id(eid);
        empDetails.setWebsite(website);

        EmployerModel emp = new EmployerModel();
        msg = emp.saveCompanyWebsite(empDetails);

        response.sendRedirect("employer/profile.jsp?eid=" + eid + "message=" + msg);

    }

}
