<%-- 
    Document   : responseCandidate
    Created on : 23 Apr, 2020, 9:14:05 PM
    Author     : Nikita
--%>

<%@page import="com.qt.jobportal.beans.TblCandidate"%>
<%@page import="com.qt.jobportal.models.CandidateModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.qt.jobportal.beans.TblJobActivity"%>
<%@page import="com.qt.jobportal.models.JobActivity"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>


    <%@include file="head.jsp" %>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta name="description" content="">

    <link rel="stylesheet" type="text/css" href="../assets/lib/datatables/datatables.net-bs4/css/dataTables.bootstrap4.css"/>
    <link rel="stylesheet" type="text/css" href="../assets/lib/datatables/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css"/>
</head>


<%
    JobActivity jobAct = new JobActivity();
    // TblJobActivity beanJob = jobAct.selectByEmployer(String.valueOf(session.getAttribute("EmployerName")));
    System.out.print(session.getAttribute("EmployerId"));

    ArrayList<TblJobActivity> beans = jobAct.selectByEmployer(String.valueOf(session.getAttribute("EmployerId")));


%>
system.out.print(<%= session.getAttribute("EmployerId")%>)
<div class="be-wrapper">

    <%@include file="navbar.jsp" %>

    <%@include file="sidebar.jsp" %>
    <%-- content starts here --%>
    <div class="be-content">
        <div class="main-content container-fluid">
            <div class="row">
                <div class="col-sm-12">
                    <div class="card card-table">
                        <div class="card-header">Applied Student
                            <div class="tools dropdown">
                                <span class="icon mdi mdi-download"></span>
                                <a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown">
                                    <span class="icon mdi mdi-more-vert"></span>
                                </a>
                                <div class="dropdown-menu" role="menu">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#">Separated link</a>
                                </div>
                            </div>
                        </div>

                        <div class="card-body">
                            <div class="container-fluid">
                                <table class="table table-bordered table-hover table-fw-widget table-sm" id="table3">
                                    <thead>
                                        <tr>
                                            <th>Sr. No.</th>
                                            <th>Job Title</th>
                                            <th>Candidate name</th>
                                            <th>Applied Date</th>
                                            <th>Action</th>
                                            <!--                                            <th>Activity</th>-->
                                        </tr>
                                    </thead>
                                    <%
                                        for (TblJobActivity trBean : beans) {
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
                                        <%
                                            CandidateModel candidate = new CandidateModel();
                                            TblCandidate beanCandidate = candidate.selectById(trBean.getCandidateId());
                                        %>

                                    <td><%=  trBean.getSerialNo()%></td>
                                    <td><%=   trBean.getJobTitle()%></td>
                                    <td><%=  beanCandidate.getFullName()%></td>
                                    <td><%=  trBean.getCreatedAt().substring(0, 10)%></td>
                                    <td>
                                        <div class="btn-group btn-space">
                                            <button class="btn btn-secondary btn-sm " type="button" data-toggle="modal" data-target="#exampleModalCenter"> 
                                                <a href="/C:\Users\Nikita\Documents\NetBeansProjects\Resume.pdf" download>
                                                    <i class="fa fa-user" aria-hidden="true"></i> Download Resume</a>
                                            </button>
                                        </div>
                                        <div class="btn-group btn-space">
                                            <button class="btn btn-secondary btn-sm " type="button">
                                                <a href="candProfile.jsp?cid=<%= beanCandidate.getCandPublicId()%>">
                                                    <i class="fa fa-user" aria-hidden="true"></i> View Profile </a>
                                            </button>
                                        </div>
                                    </td>


                                    <%
//                                        if (trBean.getActivity() == 1) {
                                    %>
                                    <!--<td>Applied for Job</td>-->
                                    <%
//                                    } else if (trBean.getActivity() == 2) {
                                    %>
                                    <!--<td>Saved Jobs</td>-->
                                    <%//                                    } else {
                                    %>
                                    <!--<td>Favourite Jobs</td>-->
                                    <%//                                        }
                                    %>


                                    </tbody>
                                    <%                                            }
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
<script src="../assets/lib/jquery/jquery.min.js" type="text/javascript"></script>
<script src="../assets/lib/perfect-scrollbar/js/perfect-scrollbar.min.js" type="text/javascript"></script>
<script src="../assets/lib/bootstrap/dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
<script src="../assets/js/app.js" type="text/javascript"></script>

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
        App.init();
        App.dataTables();
    });
</script>





