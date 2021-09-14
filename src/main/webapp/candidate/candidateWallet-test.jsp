<%@page import="com.qt.jobportal.beans.tblSubscriptionCandidate"%>
<%@page import="com.qt.jobportal.models.SubscriptionCandidateModel"%>
<%@page import="com.qt.jobportal.beans.TblSubscription"%>
<%@page import="com.qt.jobportal.models.Subscription"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.qt.jobportal.beans.TblJobActivity"%>
<%@page import="com.qt.jobportal.models.JobActivity"%>
<%@page import="com.qt.jobportal.beans.TblCandidate"%>
<%@page import="com.qt.jobportal.models.CandidateModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.jsp" %>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta name="description" content="">

        <link rel="stylesheet" type="text/css" href="../assets/lib/datatables/datatables.net-bs4/css/dataTables.bootstrap4.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/datatables/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css"/>
        <style>
            .blueEffect:hover {
                color:#146fff ;
                font-size: 40px;
                font-style: arial;
            }
            .blueEffect2:hover {
                color:#146fff ;
                font-size: 20px;
                font-style: arial;
            }

        </style>
    </head>

    <body>
        <%
            CandidateModel candMol = new CandidateModel();
            TblCandidate bean = candMol.selectById(String.valueOf(session.getAttribute("CandidateId")));

            JobActivity jobMod = new JobActivity();
            ArrayList<TblJobActivity> beans = jobMod.selectByCandidateIds(String.valueOf(session.getAttribute("CandidateId")));

            SubscriptionCandidateModel subMol = new SubscriptionCandidateModel();
            tblSubscriptionCandidate subscription = subMol.selectById(bean.getSubscriptionId());

        %>   
        <div class="be-wrapper">

            <!--NAV BAR-->
            <nav class="navbar navbar-expand fixed-top be-top-header">
                <div class="container-fluid">
                    <div class="be-navbar-header"><a class="navbar-brand" href="index.html"></a>
                    </div>
                    <div class="page-title"><span>Job Portal</span></div> ${param.message}
                    <div class="be-right-navbar">
                        <ul class="nav navbar-nav float-right be-user-nav">
                            <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" role="button" aria-expanded="false"><img src="../assets/img/avatar.png" alt="Avatar"><span class="user-name"><%=session.getAttribute("CandidateName")%> </span></a>
                                <div class="dropdown-menu" role="menu">     
                                    <div class="user-info">
                                        <div class="user-name"><%= session.getAttribute("CandidateName")%></div>
                                        <div class="user-position online">Available</div>
                                    </div><a class="dropdown-item" href="profile.jsp?id=<%= session.getAttribute("CandidateId")%>">
                                        <span class="icon mdi mdi-face"></span>Account</a>
                                    <a class="dropdown-item" href="#"><span class="icon mdi mdi-settings"></span>Settings</a>
                                    <a class="dropdown-item" href="passwordUpdate.jsp?id=<%= session.getAttribute("CandidateId")%>"><span class="icon mdi mdi-settings"></span>Change Password</a>
                                    <a class="dropdown-item" href="../CandidateController?action=logout">
                                        <span class="icon mdi mdi-power"></span>Logout</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

            <!--SIDE BAR-->

            <!--SIDE BAR-->

            <div class="be-content">
                <div class="container">

                    <%
                        if (bean.getSubscriptionId().equals(null) || bean.getSubscriptionId().equals("null") || bean.getSubscriptionId().equals("")) {
                    %>
                    <div class="row">
                        <div class="col-sm-12 mt-2">
                            <div class="pricing-table card card-table">
                                <div class="card-header text-center">
                                    <strong>
                                        You haven't purchased any plan, please purchase a <b>
                                            <a class="text-primary" href="candidateSubscription.jsp" type="button">plan.</a>
                                        </b>
                                    </strong>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                    } else {
                    %>

                    <div class="row">
                        <div class="col-sm-12 mt-2">
                            <div class="pricing-table card card-table">
                                <div class="card-header text-primary text-left">Active Plan</div>
                                <div class="card-divider card-divider-xl"></div>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <ul class="pricing-table-features">
                                            <li class="blueEffect2"><%= subscription.getTitle()%></li>
                                            <li class="blueEffect2">2 Featured jobs</li>
                                            <li class="blueEffect2">1 Renew Jobs</li>
                                            <li class="blueEffect2">10 Days Duration</li>
                                            <li class="blueEffect2">Email Alert</li>
                                        </ul>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="blueEffect2">Available Balance</div>
                                        <div class="pricing-table-price "><span class="currency"></span><span class="value blueEffect">&#8377;<%= bean.getBalance()%></span></div>
                                        <div class="card-divider card-divider-xl"></div>

                                        <ul class="pricing-table-features">
                                            <li class="blueEffect2">Valid Till : 04/04/2020</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

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
                                                            <tr colspan="2">
                                                                <td><%= trBean.getSerialNo()%></td>
                                                                <td>&#8377; <%= trBean.getDeduction()%></td>

                                                                <td><%= trBean.getCreatedAt().substring(0, 10)%></td>

                                                            </tr>

                                                        </tbody>
                                                        <%
                                                                }
                                                            }
                                                        %>

                                                    </table>
                                                    <div> <a href="walletShow.jsp">Show More</a></div>

                                                </div>
                                            </div>
                                        </div>
                                    </div> 
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>
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