/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qt.jobportal.controllers;

import com.qt.jobportal.beans.TblSystemSetting;
import com.qt.jobportal.models.SystemSettingModel;
import java.io.IOException;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nikita
 */
@WebServlet(name = "SystemSettingController", urlPatterns = {"/SystemSettingController"})
public class SystemSettingController extends HttpServlet {

    SystemSettingModel model = new SystemSettingModel();
    TblSystemSetting beans = new TblSystemSetting();
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
                insert(request, response);
                break;

            case "insertVacancy":
                insertVac(request, response);
                break;

            case "addJobRole":
                addJobRole(request, response);
                break;

            case "jobeRoleSkills":
                jobeRoleSkills(request, response);
                break;

        }
    }

    private void insert(HttpServletRequest request, HttpServletResponse response) throws IOException {
        boolean jobRoleAvail = model.checkJobRole(request.getParameter("txtJobRole"));
        beans.setJobRole(request.getParameter("txtJobRole"));

        if (jobRoleAvail) {

            String jobskillList = request.getParameter("txtJobSkills") + model.selectSkills(request.getParameter("txtJobSkills"));
            String[] list = jobskillList.split(",");
            beans.setJobSkills(Arrays.toString(list));

            msg = model.update(beans);
        } else {

            String jobskillList = request.getParameter("txtJobSkills");
            String[] list = jobskillList.split(",");
            beans.setJobSkills(Arrays.toString(list));

            msg = model.insert(beans);
        }
        response.sendRedirect("admin/candidateSetting.jsp?message=" + msg);
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

    private void insertVac(HttpServletRequest request, HttpServletResponse response) throws IOException {
        beans.setJobRole(request.getParameter("txtJobRole"));
        String jobskillList = request.getParameter("txtJobSkills");
        String[] list = jobskillList.split(",");
        beans.setJobSkills(Arrays.toString(list));
        msg = model.insert(beans);
        response.sendRedirect("admin/vacancySetting.jsp?message=" + msg);

    }

    private void jobeRoleSkills(HttpServletRequest request, HttpServletResponse response) throws IOException {

        beans.setJobRole(request.getParameter("txtJobRole"));
        beans.setJobSkills(model.selectSkills(request.getParameter("txtJobRole")) + ", " + request.getParameter("txtJobSkills"));
        msg = model.update(beans);

        response.sendRedirect("admin/candidateSetting.jsp?message=" + msg);
    }

    private void addJobRole(HttpServletRequest request, HttpServletResponse response) throws IOException {

        boolean checkJobRole = model.checkJobRole(request.getParameter("txtJobRole"));

        if (checkJobRole) {
            msg = "Job role is already added";
        } else {
            beans.setJobRole(request.getParameter("txtJobRole"));
            msg = model.insert(beans);
        }

        response.sendRedirect("admin/candidateSetting.jsp?message=" + msg);
    }

}
