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
        <script src="../assets/myjs/sweetAlertDelete.js"></script>
        <script>
            function candidateViewDetails(id) {

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState === 4 && this.status === 200) {
                        document.getElementById("showData").innerHTML =
                                this.responseText;
                    }
                };
                xhttp.open("GET", "candidateViewDetail.jsp?id=" + id, true);
                xhttp.send();

            }
        </script>
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
                                                <!--<th>Subscription</th>-->
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
                                                <td><%= candidateBean.getSerialNo()%></td>
                                                <td>
                                                    <%= (candidateBean.getFullName() == null || candidateBean.getFullName() == "null" || candidateBean.getFullName() == "") ? "Haven't added" : candidateBean.getFullName()%>
                                                </td>
                                                <td>
                                                    <%= (candidateBean.getPhone_No() == null || candidateBean.getPhone_No() == "null" || candidateBean.getPhone_No() == "") ? "Haven't added" : candidateBean.getPhone_No()%>
                                                </td>
                                                <td>
                                                    <%= (candidateBean.getState() == null || candidateBean.getState() == "null" || candidateBean.getState() == "") ? "Haven't added" : candidateBean.getState()%>
                                                </td>
                                                <td>
                                                    <%= (candidateBean.getCity() == null || candidateBean.getCity() == "null" || candidateBean.getCity() == "") ? "Haven't added" : candidateBean.getCity()%>
                                                </td>
                                                <td>
                                                    <%= (candidateBean.getAddress() == null || candidateBean.getAddress() == "null" || candidateBean.getAddress() == "") ? "Haven't added" : candidateBean.getAddress()%>
                                                </td>
                                                <!--<td><%//  candidateBean.getSubscriptionId()%></td>-->
                                                <td>
                                                    <%= (candidateBean.getBalance() == 0) ? "Zero balance" : candidateBean.getBalance()%>
                                                </td>
                                                <td>
                                                    <%= (candidateBean.getQualification() == null || candidateBean.getQualification() == "null" || candidateBean.getQualification() == "") ? "Haven't added" : candidateBean.getQualification()%>
                                                </td>
                                                <td>
                                                    <%= (candidateBean.getJobRole() == null || candidateBean.getJobRole() == "null" || candidateBean.getJobRole() == "") ? "Haven't added" : candidateBean.getJobRole()%>
                                                </td>
                                                <td>
                                                    <div class="btn-group btn-space">
                                                        <a class="btn btn-secondary btn-sm btn-primary mr-1"  href="#" data-toggle="modal" data-target="#exampleModal" onclick="candidateViewDetails('<%= candidateBean.getCandPublicId() %>')">
                                                        <!--<a class="btn btn-secondary btn-sm btn-primary mr-1"  href="candidateView.jsp?cid=<%= candidateBean.getCandPublicId()%>">-->
                                                            <div class="icon-sm">
                                                                <span class="mdi mdi-eye"></span>
                                                            </div>
                                                        </a>

                                                        <a class="btn btn-secondary btn-sm btn-danger" href="../CandidateController?action=delete&cid=<%= candidateBean.getCandPublicId()%>" onclick="return confirmDelete();">
                                                            <div class="icon-sm">
                                                                <span class="mdi mdi-delete"></span>
                                                            </div>
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

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"> <b></b></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div id="showData">

                        </div>
                    </div>
                    <div class="modal-footer">
                    </div>
                </div>
            </div>
        </div>
        <!-- //Modal -->

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
