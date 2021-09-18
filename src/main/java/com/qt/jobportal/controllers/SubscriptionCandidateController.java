/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qt.jobportal.controllers;

import com.qt.jobportal.beans.tblSubscriptionCandidate;
import com.qt.jobportal.commons.Utils;
import com.qt.jobportal.models.SubscriptionCandidateModel;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nikita
 */
@WebServlet(name = "SubscriptionCandidateController", urlPatterns = {"/SubscriptionCandidateController"})
public class SubscriptionCandidateController extends HttpServlet {

    SubscriptionCandidateModel model = new SubscriptionCandidateModel();
    tblSubscriptionCandidate beans = new tblSubscriptionCandidate();
    String msg = null;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "insert":
                subscriptionCandInsert(request, response);
                break;
            case "update":
                subscriptionCandUpdate(request, response);
                break;
            case "delete":
                subscriptionCandDelete(request, response);
                break;
            case "visibility":
                updateCandSubVisibility(request, response);
                break;
            case "logout":
                HttpSession session = request.getSession();
                session.invalidate();
                response.sendRedirect("adminLogin.jsp");

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

    private void subscriptionCandInsert(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String publicId = Utils.generatePublicId(30);
        beans.setSubCandPublicId(publicId);

        beans.setTitle(request.getParameter("txtTitle"));
        beans.setPrice(Integer.parseInt(request.getParameter("txtPrice")));
        beans.setValidity(request.getParameter("txtValidity"));
        beans.setPer_apply_price(Integer.parseInt(request.getParameter("txtPerApplyPrice")));
        beans.setSuggestion(request.getParameter("txtSuggestion"));
        beans.setVisibility(Integer.parseInt(request.getParameter("txtVisibility")));

        msg = model.insert(beans);
        response.sendRedirect("admin/subscriptionCandidateSelect.jsp?message=" + msg);
    }

    private void subscriptionCandUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
        beans.setId(Integer.parseInt(request.getParameter("id")));
        beans.setTitle(request.getParameter("txtTitle"));
        beans.setPrice(Integer.parseInt(request.getParameter("txtPrice")));
        beans.setValidity(request.getParameter("txtValidity"));
        beans.setPer_apply_price(Integer.parseInt(request.getParameter("txtPerApplyLimit")));
        beans.setSuggestion(request.getParameter("txtSuggestion"));
        beans.setVisibility(Integer.parseInt(request.getParameter("txtVisibility")));

        msg = model.update(beans);
        response.sendRedirect("admin/subscriptionCandidateSelect.jsp?message=" + msg);
    }

    private void subscriptionCandDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        beans.setSubCandPublicId(request.getParameter("sid"));

        msg = model.delete(beans);
        response.sendRedirect("admin/subscriptionCandidateSelect.jsp?message=" + msg);
    }

    private void updateCandSubVisibility(HttpServletRequest request, HttpServletResponse response) throws IOException {
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
            response.sendRedirect("admin/subscriptionCandidateSelect.jsp?message=" + msg);
        }
    }

}
