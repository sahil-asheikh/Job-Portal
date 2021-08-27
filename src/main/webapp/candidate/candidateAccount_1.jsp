<%-- 
    Document   : candidateAccount
    Created on : 24 Mar, 2020, 5:14:21 PM
    Author     : Zoya
--%>

<%@page import="com.qt.jobportal.beans.TblJobActivity"%>
<%@page import="com.qt.jobportal.models.JobActivity"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <%@include file="head.jsp" %>
    </head>
    <body>
        <%

            JobActivity jobAct = new JobActivity();
            ArrayList<TblJobActivity> save = jobAct.selectByLimit(2, String.valueOf(session.getAttribute("CandidateId")));
            ArrayList<TblJobActivity> apply = jobAct.selectByLimit(1, String.valueOf(session.getAttribute("CandidateId")));
            ArrayList<TblJobActivity> fav = jobAct.selectByLimit(3, String.valueOf(session.getAttribute("CandidateId")));


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
                                    <li class="nav-item"><a class="nav-link" href="#classic_messages" data-toggle="tab" role="tab">Fav.Comp.</a></li>
                                </ul>


                                <div class="tab-content">
                                    <div class="tab-pane active" id="classic_home" role="tabpanel">
                                        <center><h4>My  Save Jobs</h4></center>

                                        <%                                for (TblJobActivity bean : save) {
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
                                                    <h6 class="mt-2">Moved to saved Dated on <%= bean.getCreatedAt().substring(0, 10)%></h6>
                                                </div>
                                                <div class="col-sm-3 mt-3 pb-2">
                                                    <a href="../JobActivityController?action=updateActivity&employername=<%= bean.getEmployerName()%>&vacancyid=<%= bean.getVacancyId() %>" class="btn btn-outline-primary form-control">Apply Now</a>
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
                                                    <h6 class="mt-2">Moved to Applied  dated on <%= bean.getCreatedAt().substring(0, 10)%></h6>
                                                </div>
                                                <div class="col-sm-3 mt-3 pb-2">
                                                    <a href=href="../JobActivityController?action=delete&id=<%= bean.getId() %>" class="btn btn-outline-primary form-control">Delete</a>

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
                                        <div class="container mt-2" style="border: ridge">
                                            <div class="row">
                                                <div class="col-sm-4">
                                                    <br>
                                                    <td><%= bean.getEmployerName()%></td>
                                                </div>
                                                <div class="col-sm-5">
                                                    <br>
                                                    <h6 class="mt-2">Moved to Favorite Dated on <%= bean.getCreatedAt().substring(0, 10)%></h6>
                                                </div>
                                                <div class="col-sm-3 mt-3 pb-2">
                                                    <!--                                                <a href="#" class="btn btn-outline-primary form-control">Apply Now</a>-->

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