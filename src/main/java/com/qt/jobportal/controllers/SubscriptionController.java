/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qt.jobportal.controllers;

import com.qt.jobportal.beans.TblSubscription;
import com.qt.jobportal.commons.Utils;
import com.qt.jobportal.models.Subscription;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Zeeshan
 */
@WebServlet(name = "SubscriptionController", urlPatterns = {"/SubscriptionController"})
public class SubscriptionController extends HttpServlet {

    Subscription model = new Subscription();
    TblSubscription beans = new TblSubscription();
    String msg = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "insert":
                subscriptionInsert(request, response);
                break;
            case "update":
                subscriptionUpdate(request, response);
                break;
            case "delete":
                subscriptionDelete(request, response);
                break;
            case "visibility":
                subscriptionVisibility(request, response);
                break;
            case "logout":
                HttpSession session = request.getSession();
                session.invalidate();
                response.sendRedirect("adminLogin.jsp");
            default:
                break;
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
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("Id") == null || req.getParameter("Id").equals("")) {
            msg = "Id should not be empty!";
        } else {
            beans.setId(Integer.parseInt(req.getParameter("Id")));
            // msg = model.delete(beans);
        }
        resp.sendRedirect("admin.jsp?msg=" + msg);
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

    private void subscriptionInsert(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String publicId = Utils.generatePublicId(30);
        beans.setSubscription_id(publicId);

        beans.setTitle(request.getParameter("txtTitle"));
        beans.setPrice(Integer.parseInt(request.getParameter("txtPrice")));
        beans.setValidity_in_days(Integer.parseInt(request.getParameter("txtValidity")));
        beans.setActive_job_limit(Integer.parseInt(request.getParameter("txtActiveJobLimit")));
        beans.setField3(request.getParameter("txtField3"));
        beans.setVisibility(Integer.parseInt(request.getParameter("txtVisibility")));
        beans.setResponseLimit(Integer.parseInt(request.getParameter("txtResponseLimit")));
        beans.setDatabaseLimit(Integer.parseInt(request.getParameter("txtDatabaseLimit")));
        beans.setCallLimit(Integer.parseInt(request.getParameter("txtPhoneCallLimit")));
        beans.setSuggestion(request.getParameter("txtSuggestion"));
        beans.setJob_post_deduction(Integer.parseInt(request.getParameter("txtJobPostDeduction")));
        beans.setResponse_deduction(Integer.parseInt(request.getParameter("txtResponseDeduction")));

        msg = model.insert(beans);
        response.sendRedirect("admin/subscriptionSelect.jsp?message=" + msg);

    }

    private void subscriptionUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {

        beans.setId(Integer.parseInt(request.getParameter("id")));
        beans.setTitle(request.getParameter("txtTitle"));
        beans.setPrice(Integer.parseInt(request.getParameter("txtPrice")));
        beans.setValidity_in_days(Integer.parseInt(request.getParameter("txtValidity")));
        beans.setSuggestion(request.getParameter("txtSuggestion"));
        beans.setJob_post_deduction(Integer.parseInt(request.getParameter("txtJobDeduction")));
        beans.setResponse_deduction(Integer.parseInt(request.getParameter("txtResponseDeduction")));

        msg = model.update(beans);
        response.sendRedirect("admin/subscriptionSelect.jsp?message=" + msg);

    }

    private void subscriptionDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {

        beans.setSubscription_id(request.getParameter("sid"));

        msg = model.delete(beans);
        response.sendRedirect("admin/subscriptionSelect.jsp?message=" + msg);

    }

    private void subscriptionVisibility(HttpServletRequest request, HttpServletResponse response) throws IOException {

        try {
            String sid = request.getParameter("sid");
            int status = Integer.parseInt(request.getParameter("status"));
            boolean subscriptionLimit = model.empSubLimit(sid);

            if (status == 1) {
                if (subscriptionLimit) {
                    msg = model.changeEmpSubscriptionVisibility(status, sid);
                } else {
                    msg = "You already have 4 subscription active";
                }
            } else {
                msg = model.changeEmpSubscriptionVisibility(status, sid);
            }

        } catch (Exception e) {
            msg = e.getMessage();
        } finally {
            response.sendRedirect("admin/subscriptionSelect.jsp?message=" + msg);
        }

    }

}
