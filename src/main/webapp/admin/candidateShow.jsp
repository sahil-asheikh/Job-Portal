<%-- 
    Document   : candidateShow
    Created on : 6 Feb, 2020, 5:30:27 PM
    Author     : win8.1
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.qt.jobportal.beans.TblCandidate"%>
<%@page import="com.qt.jobportal.models.CandidateModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         
        <%@include file="head.jsp" %>
    </head>
    <body>
        <%
            CandidateModel candMol = new CandidateModel();
            ArrayList<TblCandidate> candidate = candMol.select();
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
                                <div class="card-header">Export Functions
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
                                    <table class="table table-bordered table-hover table-fw-widget table-sm" id="table3">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Full Name</th>
                                                <th>Phone number</th>
                                                <th>State</th>
                                                <th>City</th>
                                                <th>Address</th>
                                                <th>Subscription</th>
                                                <th>Balance</th>
                                                <th>Qualification</th>
                                                <th>Job Role</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%   for (TblCandidate candidateBean : candidate) {
                                                    if (candidateBean.getSerialNo() == -1) {
                                            %>
                                            <tr>
                                                <td colspan="13"><%= candidateBean.getException()%></td>
                                            </tr>
                                            <%
                                            } else if (candidateBean.getSerialNo() == 0) {
                                            %>
                                            <tr>
                                                <td colspan="13"><%= candidateBean.getException()%></td>
                                            </tr>
                                            <%
                                            } else {
                                            %>

                                            <tr>
                                                <td><%=  candidateBean.getSerialNo()%></td>
                                                <td><%=  candidateBean.getFullName()%></td>
                                                <td><%=  candidateBean.getPhone_No()%></td>
                                                <td><%=  candidateBean.getState()%></td>
                                                <td><%=  candidateBean.getCity()%></td>
                                                <td><%= candidateBean.getAddress()%></td>
                                                <td><%=  candidateBean.getSubscriptionId()%></td>
                                                <td><%=  candidateBean.getBalance()%></td>
                                                <td><%=  candidateBean.getQualification()%></td>
                                                <td><%=  candidateBean.getJobRole()%></td>
                                                <td>
                                                    <div class="btn-group btn-space">         
                                                        <button class="btn btn-secondary btn-sm btn-primary" type="button" data-toggle="modal" data-target="#exampleModalCenter"> 
                                                          <a href="candidateView.jsp?cid=<%= candidateBean.getCandPublicId()%>">
                                                            
                                                            <div class="icon-sm">
                                                                <span class="mdi mdi-eye"></span>
                                                            </div>
                                                          </a>
                                                        </button>

                                                        <button class="btn btn-secondary btn-sm btn-warning " type="button">
                                                            <a href="candidateUpdate.jsp?cid=<%= candidateBean.getCandPublicId()%>">
                                                                <div class="icon-sm">
                                                                    <span class="mdi mdi-edit"></span>
                                                                </div>
                                                            </a>
                                                        </button>

                                                        <a class="btn btn-secondary btn-sm btn-danger" href="../CandidateController?action=delete&cid=<%= candidateBean.getCandPublicId()%>">
                                                            <span class="mdi mdi-delete"></span>
                                                        </a>

                                                    </div>
                                                </td>
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



    </body>
</html>
