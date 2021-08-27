/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qt.jobportal.controllers;

import com.qt.jobportal.models.CandidateModel;
import com.qt.jobportal.models.EmployerModel;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Azher
 */
@WebServlet(name = "ResetPasswordController", urlPatterns = {"/ResetPasswordController"})
public class ResetPasswordController extends HttpServlet {

    CandidateModel candidate = new CandidateModel();
    EmployerModel employer = new EmployerModel();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String action = request.getParameter("action");
            switch (action) {
                case "candidateMobile":
                    candidateSendOTP(request, response);
                    break;
                case "employerMobile":
                    employeeSendOTP(request, response);
                    break;
                case "candidateOTP":
                    candidateVerifyOTP(request, response);
                    break;
                case "candidateRP":
                    candidatePasswordReset(request, response);
                    break;
                case "employerOTP":
                  employeeVerifyOTP(request, response);
                    break;
                case "employerRP": 
                    employerPasswordReset(request, response);
                    break;
                default:
                    break;
            }
        } catch (Exception ex) {
            System.out.println("com.qt.fala.controller.ResetPasswordController.processRequest() " + ex.getMessage());
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void candidateSendOTP(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String message = "";
        int status = 0 ;
        try {
            String phone = request.getParameter("txtPhone");
         status = candidate.sendOtp(phone, request);  
          
        } catch (Exception e) {
            message = e.getMessage();
        } finally {
            String location;
            if (status == 1 ) {
                message = "Phone Number Verified!" ;
                location = "candidate/otpVerification.jsp?phMsg=" + message;
            } else {
                message = "No candidate found with provided phone number !";
                location = "candidate/forgetPassword.jsp?msg=" + message;
            }
            response.sendRedirect(location);
        }
    }

    private void candidateVerifyOTP(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String message = "";
        int status =0 ;
        try {

            String OTP = request.getParameter("txtOTP");
           status = candidate.verifyOtp(OTP, response);    // uncomment this 
        } catch (RuntimeException e) {
            message = e.getMessage();
        } finally {
            String location;
            if (status == 1) {
                message = "OTP Verified Successfull !" ;
                location = "candidate/createPassword.jsp?msg=" + message;
            } else {
                message = "Incorrect OTP !" ;
                location = "candidate/otpVerification.jsp?veriMsg=" + message + "&phMsg=Phone Number Verified!" ;
            }
            response.sendRedirect(location);
        }
    }

   

    private void candidatePasswordReset(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
     
        String message = "";
        try {
                HttpSession session=request.getSession(); 
              String phoneFromSession = (String) session.getAttribute("phoneInSession");
              String newPassword =  request.getParameter("txtNewPass");
           message = candidate.resetPassword(phoneFromSession, newPassword);    ///////////////////////////
        } catch (RuntimeException e) {
            message = e.getMessage();
        } finally {
            String location;
            if ("New Password Created, Please Login".equals(message)) {
                location = "candidateLogin.jsp?newPass=" + message;
            } else {
                location = "candidate/createPassword.jsp?msg=" + message;
            }
            response.sendRedirect(location);
        }
        
          }
    
    //////////////////////////////////////Employer/////////////////////////////////////////////////

    private void employeeSendOTP(HttpServletRequest request, HttpServletResponse response)throws IOException {

        String message = "";
        int status =0 ;
        try {

            String phone = request.getParameter("txtPhone");
        
         status = employer.sendOtp(phone, request);   
        } catch (RuntimeException e) {
            message = e.getMessage();
        } finally {
            String location;
            if (status == 1 ) {
                message = "Phone Number Verified!" ;
                location = "employer/otpVerification.jsp?phMsg=" + message;
            } else {
                message = "No employer found with provided phone number !";
                location = "employer/forgetPassword.jsp?msg=" + message;
            }
            response.sendRedirect(location);
        }
    }

    private void employeeVerifyOTP(HttpServletRequest request, HttpServletResponse response)throws IOException {

        String message = "";
        int status =0 ;
        try {

            String OTP = request.getParameter("txtOTP");
          status = employer.verifyOtp(OTP, response);    // uncomment this 
        } catch (RuntimeException e) {
            message = e.getMessage();
        } finally {
            String location;
            if (status == 1) {
                message = "OTP Verified Successfull !" ;
                location = "employer/createPassword.jsp?msg=" + message;
            } else {
                message = "Incorrect OTP !" ;
                location = "employer/otpVerification.jsp?veriMsg=" + message + "&phMsg=Phone Number Verified!" ;
            }
            response.sendRedirect(location);
        }
    }


    private void employerPasswordReset(HttpServletRequest request, HttpServletResponse response)throws IOException, SQLException {
     
        String message = "";
        try {
                HttpSession session=request.getSession(); 
              String phoneFromSession = (String) session.getAttribute("phoneInSession");
              System.out.println(phoneFromSession);
              String newPassword =  request.getParameter("txtNewPass");
          
           message = employer.resetPassword(phoneFromSession, newPassword); 
        } catch (RuntimeException e) {
            message = e.getMessage();
        } finally {
            String location;
            if ("New Password Created, Please Login".equals(message)) {
                location = "employerLogin.jsp?message=" + message;
            } else {
                location = "employer/createPassword.jsp?msg=" + message;
            }
            response.sendRedirect(location);
        }
        
          }
    


}
