<%-- 
    Document   : savedJob
    Created on : 28 Mar, 2020, 7:18:41 PM
    Author     : Zoya
--%>



<%@page import="com.qt.jobportal.models.SubscriptionCandidateModel"%>
<%@page import="com.qt.jobportal.beans.TblVacancy"%>
<%@page import="com.qt.jobportal.models.Vacancy"%>
<%@page import="com.qt.jobportal.commons.Utils"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.qt.jobportal.beans.TblJobActivity"%>

<%@page import="com.qt.jobportal.models.JobActivity"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.jsp" %>
        <meta name="description" content="">
        <title>Candidate Activities</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="author" content="">
        <link rel="shortcut icon" href="../assets/img/logo-fav.png">
        <script src="../assets/myjs/cities.js"></script>
        <link rel="stylesheet" type="text/css" href="../assets/lib/perfect-scrollbar/css/perfect-scrollbar.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/material-design-icons/css/material-design-iconic-font.min.css"/>
        <link rel="stylesheet" href="../assets/css/app.css" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="assets/myjs/cities.js"></script>

        <link rel="stylesheet" href="../assets/mycss/sweetalert.css" type="text/css"/>
        <script src="../assets/myjs/sweetalert.js" type="text/javascript"></script>
        <script src="../assets/myjs/sweetAlertDelete.js" type="text/javascript"></script>

    <body>

        <%

            JobActivity jobAct = new JobActivity();
            ArrayList<TblJobActivity> save = jobAct.selectByLimit(2, String.valueOf(session.getAttribute("CandidateId")));
            ArrayList<TblJobActivity> apply = jobAct.selectByLimit(1, String.valueOf(session.getAttribute("CandidateId")));
            ArrayList<TblJobActivity> fav = jobAct.selectByLimit(3, String.valueOf(session.getAttribute("CandidateId")));

            Vacancy vacmod = new Vacancy();
            TblVacancy vacancy = vacmod.selectById(request.getParameter("id"));

            CandidateModel cand = new CandidateModel();
            TblCandidate beanCandidate = cand.selectById(String.valueOf(session.getAttribute("CandidateId")));

        %>

        <div class="be-wrapper">
            <%@include file="navbar.jsp" %>
            <%@include file="sidebar.jsp" %>

            <div class="be-content">
                <div class="main-content container-fluid">
                    <div class="row">
                        <div class="col-sm-9 ">
                            <div class="be-content">
                                <div class="main-content container-fluid">
                                    <div class="tab-container">
                                        <ul class="nav nav-tabs nav-tabs-classic" role="tablist">
                                            <li class="nav-item"><a class="nav-link active" href="#classic_home" data-toggle="tab" role="tab">Saved &nbsp;</a></li>
                                            <li class="nav-item"><a class="nav-link" href="#classic_profile" data-toggle="tab" role="tab">Applied &nbsp;</a></li>
                                            <li class="nav-item"><a class="nav-link" href="#classic_messages" data-toggle="tab" role="tab">Favourite Company</a></li>
                                        </ul>


                                        <div class="tab-content">
                                            <div class="tab-pane active" id="classic_home" role="tabpanel">
                                                <center><h4>My  Save Jobs</h4></center>

                                                <% for (TblJobActivity bean : save) {
                                                        if (bean.getSerialNo() == -1 || bean.getSerialNo() == 0) {
                                                %>
                                                <tr>
                                                    <td>
                                                        <%=  bean.getException()%>
                                                    </td>  

                                                    <%
                                                    } else if (bean.getSerialNo() == 0) {

                                                    %>
                                                <tr>
                                                    <td> <%=  bean.getException()%>   </td>
                                                </tr>
                                                <%
                                                } else {
                                                %>
                                                <div class="container" style="border: ridge">

                                                    <div class="row">
                                                        <div class="col-sm-4">
                                                            <br>
                                                            <td><%= bean.getJobTitle()%></td>
                                                            <br>
                                                            <td><%= bean.getEmployerName()%></td>
                                                        </div>
                                                        <div class="col-sm-5">
                                                            <br>
                                                            <h6 class="mt-2">Saved on <%= bean.getCreatedAt().substring(0, 10)%></h6>
                                                        </div>
                                                        <div class="col-sm-3 mt-3 pb-2">

                                                                <!--<a type="button" href="../JobActivityController?action=updateActivity&employername=<%= bean.getEmployerName()%>&vacancyid=<%= bean.getVacancyId()%>&title=<%= bean.getJobTitle()%>&employerId=<%= bean.getEmployerId()%>&candidateid=<%= bean.getCandidateId()%>" class="btn btn-primary" title="Apply Now" >-->
                                                            <span>
                                                                <%
                                                                    JobActivity jobActivityCheck = new JobActivity();
                                                                    boolean checkActivity = jobActivityCheck.checkJobActivity(bean.getCandidateId(), 1, bean.getVacancyId());

                                                                    if (checkActivity) {
                                                                %>
                                                                <a href="#" class="text-primary font-weight-bold text-justify" title="Already Applied" style="pointer-events: none" >
                                                                    Applied &nbsp;
                                                                </a>
                                                                <%
                                                                } else {
                                                                %>
                                                                <a type="button" href="../jobDetails.jsp?id=<%= bean.getVacancyId()%>" class="btn btn-primary" title="Apply Now" >
                                                                    Apply Now
                                                                </a>
                                                                <%
                                                                    }
                                                                %>
                                                            </span>
                                                            <span>
                                                                <a type="button" href="../JobActivityController?action=deleteActivity&candidateid=<%= bean.getCandidateId()%>&activity=2&vacancyid=<%= bean.getVacancyId()%> " class="btn btn-danger" title="Delete Job" onclick="return confirmDelete();">
                                                                    Delete
                                                                </a>
                                                            </span>

                                                        </div>
                                                    </div>
                                                </div>
                                                <% }
                                                    } %> 
                                                <div class="text-right mt-2"><a href="savedJob.jsp">Show More</a></div>
                                            </div>
                                            <div class="tab-pane" id="classic_profile" role="tabpanel">
                                                <center><h4>My apply Jobs</h4></center>

                                                <%  for (TblJobActivity bean : apply) {
                                                        if (bean.getSerialNo() == -1 || bean.getSerialNo() == 0) {
                                                %>
                                                <tr>
                                                    <td>
                                                        <%=  bean.getException()%>
                                                    </td>
                                                    <%
                                                    } else if (bean.getSerialNo() == 0) {
                                                    %>
                                                <tr>
                                                    <td> <%=  bean.getException()%>   </td>
                                                </tr>
                                                <%
                                                } else {
                                                %>
                                                <div class="container" style="border: ridge">
                                                    <div class="row">
                                                        <div class="col-sm-4">
                                                            <br>
                                                            <td><%= bean.getJobTitle()%></td>
                                                            <br>
                                                            <td><%= bean.getEmployerName()%></td>
                                                        </div>
                                                        <div class="col-sm-5"> 
                                                            <br>
                                                            <h6 class="mt-2">Applied on <%= bean.getCreatedAt().substring(0, 10)%></h6>
                                                        </div>
                                                        <div class="col-sm-3 mt-3 pb-2">
                                                            <!--                                                                <span class="btn btn-primary form-control">Applied</span>-->
                                                            <span class="text-primary ">
                                                                <div class="icon-sm">
                                                                    <p class="font-weight-bold text-justify">Applied</p>
                                                                </div>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <% }
                                                    } %>
                                                <div class="text-right mt-2"><a href="appliedJob.jsp">Show More</a></div>
                                            </div>
                                            <div class="tab-pane" id="classic_messages" role="tabpanel">
                                                <center><h4>My favorite  Company</h4></center>

                                                <%
                                                    for (TblJobActivity bean : fav) {
                                                        if (bean.getSerialNo() == -1 || bean.getSerialNo() == 0) {
                                                %>
                                                <tr>
                                                    <td>
                                                        <%=  bean.getException()%>
                                                    </td>
                                                    <%
                                                    } else if (bean.getSerialNo() == 0) {

                                                    %>
                                                <tr>
                                                    <td> <%=  bean.getException()%>   </td>
                                                </tr>
                                                <%
                                                } else {
                                                %>
                                                <div class="container" style="border: ridge">
                                                    <div class="row">
                                                        <div class="col-sm-4">
                                                            <br>
                                                            <td><%= bean.getJobTitle()%></td>
                                                            <br>
                                                            <td><%= bean.getEmployerName()%></td>
                                                        </div>
                                                        <div class="col-sm-5">
                                                            <br>
                                                            <h6 class="mt-2">Favorite on <%= bean.getCreatedAt().substring(0, 10)%></h6>
                                                        </div>
                                                        <div class="col-sm-3 mt-3 pb-2">

                                                            <span>
                                                                <%
                                                                    JobActivity jobActivityCheck = new JobActivity();
                                                                    boolean checkActivity = jobActivityCheck.checkJobActivity(bean.getCandidateId(), 1, bean.getVacancyId());

                                                                    if (checkActivity) {
                                                                %>
                                                                <a href="#" class="text-primary font-weight-bold text-justify" title="Already Applied" style="pointer-events: none" >
                                                                    Applied &nbsp;
                                                                </a>
                                                                <%
                                                                } else {
                                                                %>
                                                                <a type="button" href="../jobDetails.jsp?id=<%= bean.getVacancyId()%>" class="btn btn-primary" title="Apply Now" >
                                                                    Apply Now
                                                                </a>
                                                                <%
                                                                    }
                                                                %>
                                                            </span>
                                                            <span>
                                                                <a type="button" href="../JobActivityController?action=deleteActivity&candidateid=<%= bean.getCandidateId()%>&activity=3&vacancyid=<%= bean.getVacancyId()%> " class="btn btn-danger" title="Delete Job" onclick="return confirmDelete();">
                                                                    Delete
                                                                </a>
                                                            </span>

                                                        </div>
                                                    </div>
                                                </div>
                                                <%
                                                        }
                                                    }
                                                %>
                                                <div class="text-right mt-2"><a href="favCompany.jsp">Show More</a></div>
                                            </div>
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

