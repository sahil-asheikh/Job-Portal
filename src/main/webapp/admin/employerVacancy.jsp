<%-- 
    Document   : subscriptionView
    Created on : 17 Feb, 2020, 11:06:26 AM
    Author     : win8.1
--%>


<%@page import="com.qt.jobportal.beans.tblSubscriptionCandidate"%>
<%@page import="com.qt.jobportal.models.SubscriptionCandidateModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.qt.jobportal.beans.TblVacancy"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.qt.jobportal.models.Vacancy"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.jsp" %>
        <link rel="stylesheet" type="text/css" href="../assets/lib/perfect-scrollbar/css/perfect-scrollbar.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/material-design-icons/css/material-design-iconic-font.min.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/datetimepicker/css/bootstrap-datetimepicker.min.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/select2/css/select2.min.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/bootstrap-slider/css/bootstrap-slider.min.css"/>

        <meta name="description" content="">
        <title>Subscription Details</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


    </head>
    <body>

        <%
            Vacancy vacmod = new Vacancy();
            ArrayList<TblVacancy> vacc = vacmod.selectByEmployerId(request.getParameter("id"));
        %>


        <div class="be-wrapper">

            <%@include file="navbar.jsp" %>
            <%@include file="sidebar.jsp" %>
            <%-- content starts here --%>
            <div class="be-content">
                <div class="main-content container-fluid">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card card-table">
                                <div class="card-header">Vacancy Details
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
                                                <th>Title </th>
                                                <th>Salary</th>                  
                                                <th>No Of Opening</th>
                                                <th>Min Qualification </th>
                                                <th>Experience</th>
                                                <th>Active/Inactive</th>
                                                <th >View</th>
                                            </tr>
                                        </thead>
                                        <%  for (TblVacancy vacancy : vacc) {
                                                if (vacancy.getSerialNo() == -1) {
                                        %>
                                        <tr>
                                            <td colspan="6">
                                                <%=  vacancy.getException()%>
                                            </td>  

                                            <%
                                            } else if (vacancy.getSerialNo() == 0) {

                                            %>
                                        <tr>
                                            <td colspan="6"> <%=  vacancy.getException()%>   </td>
                                        </tr>
                                        <%
                                        } else {
                                        %>
                                        <% if (vacancy.getEmployerId() == null || vacancy.getEmployerId() == "null") {
                                        %>
                                        <a href="vacancy.jsp" type="button" >Post Job</a>
                                        <%
                                        } else {
                                        %>
                                        <tbody>
                                            <tr class="odd gradeC ">
                                                <td><%= vacancy.getTitle()%></td>
                                                <td><%= vacancy.getMinSalary()%>-<%= vacancy.getMaxSalary()%></td>
                                                <td><%= vacancy.getNoOfOpening()%></td>
                                                <td><%= vacancy.getMinQualification()%></td>
                                                <td><%= vacancy.getExperience()%></td>
                                                <td>
                                                    <div class="btn-group btn-space">
                                                        <%
                                                            int vidStatus = vacancy.getJobStatus();
                                                            if (vidStatus == 1) {
                                                        %>
                                                        <span class="text-success ">
                                                            <div class="icon-sm">
                                                                <p class="font-weight-bold text-justify">ACTIVE</p>
                                                            </div>
                                                        </span>
                                                    </div>
                                                    <%
                                                    } else {
                                                    %>
                                                    <span class="text-danger ">
                                                        <div class="icon-sm">
                                                            <p class="font-weight-bold text-justify">DEACTIVATED</p>
                                                        </div>
                                                    </span>
                                                    <%
                                                        }
                                                    %>
                                                    </div>
                                                </td>

                                                <td colspan="3">
                                                    <div class="btn-group btn-space">
                                                        <button class="btn btn-sm btn-primary" type="button" data-toggle="modal" data-target="#exampleModalCenter"> 
                                                            <a href="employerVacancyView.jsp?vid=<%= vacancy.getVacancyPublicId()%>">
                                                                <div class="icon-sm">
                                                                    <span class="mdi mdi-eye" style="color: white"></span>
                                                                </div>
                                                            </a>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>

                                        </tbody>
                                        <%
                                                    }
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
        <%@include file="footer.jsp" %>
    </body>
</html>
