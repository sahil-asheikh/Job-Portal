<%-- 
    Document   : walletShow
    Created on : Jun 29, 2020, 8:37:47 PM
    Author     : Lenovo
--%>

<%@page import="com.qt.jobportal.beans.TblJobActivity"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.qt.jobportal.models.JobActivity"%>
<%@page import="com.qt.jobportal.beans.TblCandidate"%>
<%@page import="com.qt.jobportal.models.CandidateModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="description" content="">
        <title>View More</title>
        <%@include file="head.jsp" %>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="../assets/lib/datatables/datatables.net-bs4/css/dataTables.bootstrap4.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/datatables/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css"/>
   
    </head>
    <body>
         <%
                CandidateModel candMol = new CandidateModel();
                 TblCandidate bean = candMol.selectById(String.valueOf(session.getAttribute("CandidateId")));
               
                JobActivity jobMod=new JobActivity();
       //          TblJobActivity beans=actMod.selectById(String.valueOf(session.getAttribute("CandidateId")));
                ArrayList<TblJobActivity> beans = jobMod.selectByCandidateIdw(String.valueOf(session.getAttribute("CandidateId")));
                      System.out.println(session.getAttribute("CandidateId"));
            %>   
         <div class="row">   
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="card card-table">
                                        <div class="card-header text-primary">Transaction History
                                            <div class="tools dropdown"><span class="icon mdi mdi-download"></span><a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown"><span class="icon mdi mdi-more-vert"></span></a>
                                                <div class="dropdown-menu" role="menu"><a class="dropdown-item" href="#">Action</a><a class="dropdown-item" href="#">Another action</a><a class="dropdown-item" href="#">Something else here</a>
                                                    <div class="dropdown-divider"></div><a class="dropdown-item" href="#">Separated link</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <table class="table table-striped table-hover table-fw-widget" id="table3">
                                                <thead>
                                                    <tr>
                                                        <th>Sr No.</th>
                                                        <th>Deduction  </th>

                                                        <th>Date</th>

                                                    </tr>
                                                </thead>
                                                  <%   
                                                   for(TblJobActivity trBean : beans) {
                                                    if (trBean.getSerialNo() == -1) {
                                            %>
                                            <tr>
                                                <td colspan="13"><%= trBean.getException()%></td>
                                            </tr>
                                            <%
                                            } else if (trBean.getSerialNo() == 0) {
                                            %>
                                            <tr>
                                                <td colspan="13"><%= trBean.getException()%></td>
                                            </tr>
                                            <%
                                            } else {
                                            %>

                                                <tbody>
                                                    <tr colspan="2">
                                                        <td><%= trBean.getSerialNo() %></td>
                                                        <td>&#8377; <%= trBean.getDeduction()%></td>

                                                        <td><%= trBean.getCreatedAt().substring(0,10) %></td>

                                                    </tr>
                                               
                                                </tbody>
                                                  <%
                                                    }
                                                }
                                            %>
                                      
                                            </table>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div> 
                        </div>
                    </div>
                </div>

            </div>
    </body>
</html>
