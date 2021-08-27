<%-- 

    Document   : subscriptionSelect
    Created on : 31 Jan, 2020, 4:33:59 PM
    Author     : win8.1
--%>

<%@page import="com.qt.jobportal.beans.TblEmployer"%>
<%@page import="com.qt.jobportal.models.EmployerModel"%>
<%@page import="com.qt.jobportal.models.Subscription"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.qt.jobportal.beans.TblSubscription"%>
<%@page import="com.qt.jobportal.commons.JobPortalDb"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
 <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="../assets/img/logo-fav.png">
        <%@include file="head.jsp" %>
 <title>Job Portal</title>
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>

        <%
             EmployerModel eMol=new EmployerModel();
            TblEmployer emp=eMol.selectById(String.valueOf( session.getAttribute("EmployerId") ));
   
            Subscription subMol = new Subscription();
            TblSubscription subscription = subMol.selectById(emp.getSubscriptionId());
            System.out.println("cid="+emp.getSubscriptionId());
           %>

        <div class="be-wrapper">

            <%@include file="navbar.jsp" %>

            <%@include file="sidebar.jsp" %>
            <%-- content starts here --%>

            <div class="be-content">

                <div class="row">
                    <div class="col">
                        <div class="pricing-table pricing-table-warning">
                            <div class="pricing-table-title yellowEffect"><%= subscription.getTitle()%></div>
                            <div class="card-divider card-divider-xl"></div>
                            <div class="pricing-table-price "><span class="currency">&#8377;</span><span class="value yellowEffect"><%= emp.getBalance() %></span><span class="frecuency"></span></div>
                            <div class="card-divider card-divider-xl"></div>
                            <ul class="pricing-table-features">
                                <li class="yellowEffect2"><%= subscription.getActive_job_limit()%> Jobs Posting</li>
                                <li class="yellowEffect2"> <%= subscription.getValidity_in_days()%> Validity</li>
                                <li class="yellowEffect2"><%= subscription.getSuggestion()%> </li>
                                <li class="yellowEffect2">Email Alert</li>
                            </ul>   
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
     
 