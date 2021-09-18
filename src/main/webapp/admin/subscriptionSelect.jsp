<%-- 

    Document   : subscriptionSelect
    Created on : 31 Jan, 2020, 4:33:59 PM
    Author     : win8.1
--%>

<%@page import="com.qt.jobportal.models.Subscription"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.qt.jobportal.beans.TblSubscription"%>
<%@page import="com.qt.jobportal.commons.JobPortalDb"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>

        <%@include file="head.jsp" %>
        <title>Employer Subscriptions</title>
        <link rel="stylesheet" type="text/css" href="../assets/lib/perfect-scrollbar/css/perfect-scrollbar.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/material-design-icons/css/material-design-iconic-font.min.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/datetimepicker/css/bootstrap-datetimepicker.min.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/select2/css/select2.min.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/bootstrap-slider/css/bootstrap-slider.min.css"/>
        <script src="../assets/myjs/sweetAlertDelete.js" type="text/javascript"></script>

        <script>
            function candidateSubscriptionViewDetails(id) {

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState === 4 && this.status === 200) {
                        document.getElementById("showData").innerHTML =
                                this.responseText;
                    }
                };
                xhttp.open("GET", "employerSubscriptionView.jsp?id=" + id, true);
                xhttp.send();

            }
        </script>

    </head>
    <body>

        <%
            Subscription subMol = new Subscription();
            ArrayList<TblSubscription> subscription = subMol.selectAllEmpSub();
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
                                                <th>Title</th>
                                                <th>Price</th>
                                                <th>Validity in days</th>
                                                <th>Active/Inactive</th>
                                                <th >Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%   for (TblSubscription subBean : subscription) {
                                                    if (subBean.getSerialNo() == -1) {
                                            %>
                                            <tr>
                                                <td colspan="13"><%= subBean.getException()%></td>
                                            </tr>
                                            <%
                                            } else if (subBean.getSerialNo() == 0) {
                                            %>
                                            <tr>
                                                <td colspan="13"><%= subBean.getException()%></td>
                                            </tr>
                                            <%
                                            } else {
                                            %>


                                            <tr>
                                                <td class="center"><%=  subBean.getSerialNo()%></td>
                                                <td class="center"><%=  subBean.getTitle()%></td>
                                                <td class="center"><%=  subBean.getPrice()%></td>
                                                <td class="center"><%=  subBean.getValidity_in_days()%></td>
                                                <td>
                                                    <div class="btn-group btn-space">
                                                        <%
                                                            int subscriptionStatus = subBean.getVisibility();
                                                            if (subscriptionStatus >= 1) {
                                                        %>
                                                        <form action="../SubscriptionController" method="post">
                                                            <button class="btn btn-success btn-space" type="submit" name="action" value="visibility" disabled="">
                                                                <input type="hidden" name="status" value="1">
                                                                <input type="hidden" name="sid" value="<%= subBean.getSubscription_id()%>">
                                                                <div class="icon-sm">
                                                                    <span class="mdi mdi-check" style="color: white"></span>
                                                                </div>
                                                            </button>
                                                        </form>

                                                        <form action="../SubscriptionController" method="post">
                                                            <button class="btn btn-danger btn-space" type="submit" name="action" value="visibility">
                                                                <input type="hidden" name="sid" value="<%= subBean.getSubscription_id()%>">
                                                                <input type="hidden" name="status" value="0">
                                                                <div class="icon-sm">
                                                                    <span class="mdi mdi-close" style="color: white"></span>
                                                                </div>
                                                            </button>
                                                        </form>

                                                        <span class="text-success ">
                                                            <div class="icon-sm">
                                                                <p class="font-weight-bold text-justify">ACTIVE</p>
                                                            </div>
                                                        </span>
                                                        <%
                                                        } else {
                                                        %>
                                                        <form action="../SubscriptionController" method="post">
                                                            <button class="btn btn-success btn-space" type="submit" name="action" value="visibility">
                                                                <input type="hidden" name="status" value="1">
                                                                <input type="hidden" name="sid" value="<%= subBean.getSubscription_id()%>">
                                                                <div class="icon-sm">
                                                                    <span class="mdi mdi-check" style="color: white"></span>
                                                                </div>
                                                            </button>
                                                        </form>

                                                        <form action="../SubscriptionController" method="post">
                                                            <button class="btn btn-danger btn-space" type="submit" name="action" value="visibility" disabled="">
                                                                <input type="hidden" name="sid" value="<%= subBean.getSubscription_id()%>">
                                                                <input type="hidden" name="status" value="0">
                                                                <div class="icon-sm">
                                                                    <span class="mdi mdi-close" style="color: white"></span>
                                                                </div>
                                                            </button>
                                                        </form>

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
                                                <td>

                                                    <div class="btn-group btn-space">

                                                        <a class="btn btn-sm btn-primary mr-1" href="#"  data-toggle="modal" data-target="#exampleModal" onclick="candidateSubscriptionViewDetails('<%= subBean.getSubscription_id() %>')">
                                                            <div class="icon-sm">
                                                                <span class="mdi mdi-eye" style="color: white"></span>
                                                            </div>
                                                        </a>

                                                        <a class="btn btn-sm btn-warning mr-1" href="subscriptionUpdate.jsp?sid=<%= subBean.getSubscription_id()%>">
                                                            <div class="icon-sm">
                                                                <span class="mdi mdi-edit" style="color: white"></span>
                                                            </div>
                                                        </a>

                                                        <a class="btn btn-sm btn-danger" href="../SubscriptionController?action=delete&sid=<%= subBean.getSubscription_id()%>" onclick="return confirmDelete();">
                                                            <div class="icon-sm">
                                                                <span class="mdi mdi-delete" style="color: white"></span>
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
