<%-- 
    Document   : savedJob
    Created on : 28 Mar, 2020, 7:18:41 PM
    Author     : Zoya
--%>



<%@page import="java.util.ArrayList"%>
<%@page import="com.qt.jobportal.beans.TblJobActivity"%>

<%@page import="com.qt.jobportal.models.JobActivity"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.jsp" %>
        <meta name="description" content="">
        <title>Saved Job</title>
        <link rel="stylesheet" type="text/css" href="../assets/lib/datatables/datatables.net-bs4/css/dataTables.bootstrap4.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/datatables/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css"/>
    </head>
    <body>
        <%

            JobActivity jobAct = new JobActivity();
            ArrayList<TblJobActivity> act = jobAct.selectByCandidate(2, String.valueOf(session.getAttribute("CandidateId")));

        %>
          
        <div class="be-wrapper">
            <%@include file="navbar.jsp" %>
            <%@include file="sidebar.jsp" %>
            <div class="be-content">
                <div class="container mt-2">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">

                                <div class="col-sm-12">
                                    <div class="card card-table">
                                        <div class="card-header">Saved Jobs
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
                                                        <th>Job Title</th>
                                                        <th>Job Address</th>
                                                        <th>Saved Days</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>


                                                <%  for (TblJobActivity bean : act) {
                                                        if (bean.getSerialNo() == -1 || bean.getSerialNo() == 0) {
                                                %>



                                                <tr>
                                                    <td colspan="4" class="text-center">
                                                        <%=  bean.getException()%>
                                                    </td>  

                                                    <%
                                                    } else if (bean.getSerialNo() == 0) {

                                                    %>
                                                <tr>
                                                    <td colspan="4" class="text-center"> <%=  bean.getException()%>   </td>
                                                </tr>
                                                <%
                                                } else {
                                                %>

                                                <tbody>
                                                    <tr colspan="2">
                                                        <td><%= bean.getJobTitle()%></td>
                                                        <td><%= bean.getEmployerName()%></td>
                                                        <td>Moved to saved Dated on <%= bean.getCreatedAt().substring(0, 10)%></td>

                                                    <td colspan="2"><center><a href="../JobActivityController?action=updateActivity&employername=<%= bean.getEmployerName()%>&vacancyid=<%= bean.getVacancyId() %>" class="btn btn-outline-primary form-control-sm"  title="Apply" ><i class="fa fa-mouse-pointer mt-1" style="font-size: 15px"></i>&nbsp;Apply</a>

                                                        <a class="btn btn-secondary btn-sm btn-danger" href="../JobActivityController?action=delete&id=<%= bean.getId()%>">
                                                            <span class="mdi mdi-delete"></span>
                                                        </a>
                                                    </td>        
                                                </div>
                                            </div>
                                        
                                        </tr>

                                        <%
                                                }
                                            }
                                        %> 
                                        </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                    </div>
                        </div> 
                    </div>
                </div>
            </div>
          
            
            <%@include file="footer.jsp" %>
            <script src="../assets/lib/datatables/datatables.net/js/jquery.dataTables.js" type="text/javascript"></script>
            <script src="../assets/lib/datatables/datatables.net-bs4/js/dataTables.bootstrap4.js" type="text/javascript"></script>
            <script src="../assets/lib/datatables/datatables.net-buttons/js/dataTables.buttons.min.js" type="text/javascript"></script>
            <script src="../assets/lib/datatables/datatables.net-buttons/js/buttons.flash.min.js" type="text/javascript"></script>
            <script src="../assets/lib/datatables/jszip/jszip.min.js" type="text/javascript"></script>
            <script src="../assets/lib/datatables/pdfmake/pdfmake.min.js" type="text/javascript"></script>
            <script src="../assets/lib/datatables/pdfmake/vfs_fonts.js" type="text/javascript"></script>
            <script src="../assets/lib/datatables/datatables.net-buttons/js/buttons.colVis.min.js" type="text/javascript"></script>
            <script src="../assets/lib/datatables/datatables.net-buttons/js/buttons.print.min.js" type="text/javascript"></script>
            <script src="../assets/lib/datatables/datatables.net-buttons/js/buttons.html5.min.js" type="text/javascript"></script>
            <script src="../assets/lib/datatables/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js" type="text/javascript"></script>
            <script src="../assets/lib/datatables/datatables.net-responsive/js/dataTables.responsive.min.js" type="text/javascript"></script>
            <script src="../assets/lib/datatables/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js" type="text/javascript"></script>
            <script type="text/javascript">
                $(document).ready(function () {
                    //-initialize the javascript
                    App.dataTables();
                });
            </script>
    </body>
</html>

