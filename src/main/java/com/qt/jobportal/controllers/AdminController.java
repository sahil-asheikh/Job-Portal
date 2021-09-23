package com.qt.jobportal.controllers;

import com.qt.jobportal.beans.TblAdmin;
import com.qt.jobportal.models.AdminModel;
import java.io.IOException;
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
@WebServlet(name = "AdminController", urlPatterns = {"/AdminController"})
public class AdminController extends HttpServlet {

    AdminModel model = new AdminModel();
    TblAdmin beans = new TblAdmin();
    String msg = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {

            case "updatePassword":
                updatePassword(request, response);
                break;
            case "login":
                adminLogin(request, response);
                break;
            case "logout":
                HttpSession session = request.getSession();
                session.invalidate();
                response.sendRedirect("adminLogin.jsp");
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

    }

    private void adminLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        beans.setPhoneNo(request.getParameter("txtPhoneNo"));
        beans.setPassword(request.getParameter("txtPassword"));
        int status = model.doLogin(beans, request);
        switch (status) {
            case -1:
                msg = "Please Register Yourself";
                break;
            case 0:
                msg = "You are Blocked! Please Contact to admin";
                break;
            case 1:
                msg = "Login Successfully";
                break;
            case 2:
                msg = "You have Entered wrong password";
                break;
        }
        response.sendRedirect("adminLogin.jsp?msg=" + msg);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void updatePassword(HttpServletRequest request, HttpServletResponse response) throws IOException {

        if (request.getParameter("newPassword").equals(request.getParameter("confirmPassword"))) {
            String empId = request.getParameter("id");

            beans.setAdmin_id(request.getParameter("id"));

            beans.setValidPassword(request.getParameter("validPassword"));

            beans.setNewPassword(request.getParameter("newPassword"));
            beans.setConfirmPassword(request.getParameter("confirmPassword"));

            msg = model.updatePassword(beans);
            response.sendRedirect("admin/profile.jsp?id=" + empId + "message=" + msg);

        } else {
            msg = "Password Not Matched";
            response.sendRedirect("admin/updatePassword.jsp?message=" + msg);

        }
    }
}
