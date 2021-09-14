/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qt.jobportal.controllers;

import com.qt.jobportal.beans.TblNotify;
import com.qt.jobportal.commons.Utils;
import com.qt.jobportal.models.NotifyMe;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Zoya
 */
@WebServlet(name = "NotifyController", urlPatterns = {"/NotifyController"})
public class NotifyController extends HttpServlet {

    NotifyMe model = new NotifyMe();
    TblNotify beans = new TblNotify();
    String msg = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println(request.getParameter("action"));

        switch (action) {
            case "insert":
                insert(request, response);
                break;
            case "delete":
                Delete(request, response);
                break;
            default:
                break;
        }
    }

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

        System.out.println("hieee");
        processRequest(request, response);
    }

    private void insert(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String publicId = Utils.generatePublicId(30);
        beans.setNotifyPublicId(publicId);

        beans.setName(request.getParameter("txtName"));
        beans.setEmailId(request.getParameter("txtEmail"));
        beans.setJobCategory(request.getParameter("sltCategory"));
        System.out.println("request.getParameter()");

        msg = model.insert(beans);
        response.sendRedirect("index.jsp?message=" + msg + "#notify");

    }

    private void Delete(HttpServletRequest request, HttpServletResponse response) throws IOException {

        if (request.getParameter("nid") == null || request.getParameter("nid").equals("")) {
            msg = "Id should not be empty!";
        } else {
            beans.setNotifyPublicId(request.getParameter("nid"));
            msg = model.delete(beans);
            response.sendRedirect("admin/showNotifyMe.jsp?message=" + msg);
        }
    }

}
