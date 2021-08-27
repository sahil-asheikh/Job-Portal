<%-- 
    Document   : subscriptionPrice
    Created on : 3 Sep, 2020, 3:52:11 PM
    Author     : Nikita
--%>

<%@page import="com.qt.jobportal.beans.TblSubscription"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.qt.jobportal.models.Subscription"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
          <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="assets/img/logo-fav.png">
        <title>Beagle</title>
        <link rel="stylesheet" type="text/css" href="../assets/lib/perfect-scrollbar/css/perfect-scrollbar.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/material-design-icons/css/material-design-iconic-font.min.css"/>
        <link rel="stylesheet" href="../assets/css/app.css" type="text/css"/>
        <link rel="stylesheet" href="../https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       </head>
    <body>
   <%
                EmployerModel empMol = new EmployerModel();
                 TblEmployer bean = empMol.selectById(String.valueOf(session.getAttribute("EmployerId")));
       
       
    if (bean.getSubscriptionId() == "null" || bean.getSubscriptionId() == null) {
       
%>

        
        <%
           
            Subscription subMol = new Subscription();
            ArrayList<TblSubscription> subscription = subMol.select();
        %>
        <div class="be-wrapper">
            <%@ include file = "navbar.jsp" %>
            <%@include file="sidebar.jsp" %>
            <div class="be-content">
                
                   <div class="row">
                <%  for (TblSubscription subBean : subscription) {
                        if (subBean.getSerialNo() == -1 || subBean.getSerialNo() == 0) {
                %>

                <div class="col-sm-3">
                    <div class="pricing-table pricing-table-primary">
                        <div class="pricing-table-title blueEffect">Basic</div>
                        <div class="card-divider card-divider-xl"></div>
                        <div class="pricing-table-price "><span class="currency">&#8377;</span><span class="value blueEffect"></span><span class="frecuency">/mo</span></div>
                        <div class="card-divider card-divider-xl"></div>
                        <ul class="pricing-table-features">
                            <li class="blueEffect2"><%= subBean.getException()%> Jobs Posting</li>
                            <li class="blueEffect2"><%= subBean.getException()%> Featured jobs</li>
                            <li class="blueEffect2"><%= subBean.getException()%> Renew Jobs</li>
                            <li class="blueEffect2"><%= subBean.getException()%> Days Duration</li>
                            <li class="blueEffect2"><%= subBean.getException()%>Email Alert</li>
                        </ul><a class="btn btn-outline-primary" href="">Get Started</a>
                    </div>
                </div>
                <%
                } else {
                %>
                <div class="col-sm-3">
                    <div class="pricing-table pricing-table-warning">
                        <div class="pricing-table-title yellowEffect"><%= subBean.getTitle() %></div>
                        <div class="card-divider card-divider-xl"></div>
                        <div class="pricing-table-price "><span class="currency">&#8377;</span><span class="value yellowEffect"><%= subBean.getPrice()%></span><span class="frecuency"></span></div>
                        <div class="card-divider card-divider-xl"></div>
                        <ul class="pricing-table-features">
                            <li class="yellowEffect2"><%= subBean.getActive_job_limit()%> Jobs Posting</li>
                            <li class="yellowEffect2"> <%= subBean.getValidity_in_days()%> Validity</li>
                            <li class="yellowEffect2"><%= subBean.getSuggestion()%> </li>
                            <li class="yellowEffect2">Email Alert</li>
                        </ul><a class="btn btn-outline-warning" href="../EmployerController?action=pricing&employer_id=<%= session.getAttribute("EmployerId") %>&subscription_id=<%= subBean.getSubscription_id() %> ">Get Started</a>
                    </div>
                </div>
          
                <%
                        }
                    }
                %>   
            </div> 
                
            </div>
        </div>
            
                <%
                      }else{
                    %>
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
                <%
                      }
                    %>
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
