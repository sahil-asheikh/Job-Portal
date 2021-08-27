<%-- 
    Document   : candidateWallet2
    Created on : 7 May, 2020, 1:08:38 AM
    Author     : Zoya
--%>

<%@page import="com.qt.jobportal.beans.TblJobActivity"%>
<%@page import="com.qt.jobportal.models.JobActivity"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.qt.jobportal.beans.TblEmployer"%>
<%@page import="com.qt.jobportal.models.EmployerModel"%>
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
                EmployerModel empMol = new EmployerModel();
                 TblEmployer bean = empMol.selectById(request.getParameter("eid"));
        
                 JobActivity tranMod=new JobActivity();
       //          TblJobActivity beans=actMod.selectById(String.valueOf(session.getAttribute("CandidateId")));
                ArrayList<TblJobActivity> beans = tranMod.selectByEmployerId(request.getParameter("id"));
                
        %>
          <div class="be-wrapper">
                <%@include file="navbar.jsp" %>
                <%@include file="sidebar.jsp" %>
             <div class="be-content">
        
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12 mt-2">
                            <div class="pricing-table card-table">
                                <div class="card-header text-primary text-left">Active Plan</div>
                                <div class="card-divider card-divider-xl"></div>
                                <div class="row">
                                    <div class="col-sm-6">
                                         <ul class="pricing-table-features">
                                        <li class="blueEffect2"><%= bean.getSubscriptionId()%></li>
                                        <li class="blueEffect2">2 Featured jobs</li>
                                        <li class="blueEffect2">1 Renew Jobs</li>
                                        <li class="blueEffect2">10 Days Duration</li>
                                        <li class="blueEffect2">Email Alert</li>
                                    </ul>
                                </div>
                                <div class="col-sm-6">
                                     <div class="blueEffect2">Available Balance</div>
                                        <div class="pricing-table-price "><span class="currency">&#8377;</span><span class="value blueEffect"><%= bean.getBalance()%></span></div>
                                    <div class="card-divider card-divider-xl"></div>
                                     
                                    <ul class="pricing-table-features">
                                        <li class="blueEffect2">Valid Till : 04/04/2020</li>
                                    </ul>
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