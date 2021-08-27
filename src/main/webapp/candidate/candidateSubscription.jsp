<%-- 
    Document   : candidateSubscription-1
    Created on : 17 Nov, 2020, 1:51:11 PM
    Author     : Zoya
--%>

<%@page import="com.qt.jobportal.beans.tblSubscriptionCandidate"%>
<%@page import="com.qt.jobportal.models.SubscriptionCandidateModel"%>
<%@page import="com.qt.jobportal.beans.TblCandidatePlan"%>
<%@page import="com.qt.jobportal.beans.TblCandidate"%>
<%@page import="com.qt.jobportal.models.CandidateModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.qt.jobportal.beans.TblSubscription"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.qt.jobportal.models.Subscription"%>

<!DOCTYPE html>
<html>
    <head>
          <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="../assets/img/logo-fav.png">
        <title>Job Portal</title>
        <script src="../assets/myjs/cities.js"></script>
        <link rel="stylesheet" type="text/css" href="../assets/lib/perfect-scrollbar/css/perfect-scrollbar.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/material-design-icons/css/material-design-iconic-font.min.css"/>
        <link rel="stylesheet" href="../assets/css/app.css" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="assets/myjs/cities.js"></script>
       </head>
    <body>
   
        <div class="be-wrapper">
            <%@ include file = "navbar.jsp" %>
            <%@include file="sidebar.jsp" %>
             <div class="be-content">
                <%       CandidateModel cnadidate = new CandidateModel();
                        TblCandidate beans = cnadidate.selectById(String.valueOf( session.getAttribute("CandidateId")));

                    SubscriptionCandidateModel subCandMol = new SubscriptionCandidateModel();
                    ArrayList<tblSubscriptionCandidate> subscriptionCand = subCandMol.select();

                    if (beans.getSubscriptionId() == "null" || beans.getSubscriptionId() == null) {

                %>
                <div class="row">
                    <%  for (tblSubscriptionCandidate subCandBean : subscriptionCand) {
                            if (subCandBean.getSerialNo() == -1 || subCandBean.getSerialNo() == 0) {
                    %>
                    <div class="col-sm-3">
                        <div class="pricing-table pricing-table-primary">
                            <div class="pricing-table-title blueEffect">Basic</div>
                            <div class="card-divider card-divider-xl"></div>
                            <div class="pricing-table-price "><span class="currency">&#8377;</span><span class="value blueEffect">5</span><span class="frecuency">/mo</span></div>
                            <div class="card-divider card-divider-xl"></div>
                            <ul class="pricing-table-features">
                                <li class="blueEffect2"><%= subCandBean.getException()%> Jobs Posting</li>
                                <li class="blueEffect2"><%= subCandBean.getException()%> Featured jobs</li>
                                <li class="blueEffect2"><%= subCandBean.getException()%> Renew Jobs</li>
                                <li class="blueEffect2"><%= subCandBean.getException()%> Days Duration</li>
                                <li class="blueEffect2"><%= subCandBean.getException()%>Email Alert</li>
                            </ul><a class="btn btn-outline-primary" href="">Get Started</a>
                        </div>
                    </div>
                    <%
                    } else {
                    %>
                    <div class="col-sm-3">
                        <div class="pricing-table pricing-table-warning">
                            <div class="pricing-table-title yellowEffect"><%= subCandBean.getTitle()%></div>
                            <div class="card-divider card-divider-xl"></div>
                            <div class="pricing-table-price "><span class="currency">&#8377;</span><span class="value yellowEffect"><%= subCandBean.getPrice()%></span><span class="frecuency"></span></div>
                            <div class="card-divider card-divider-xl"></div>
                            <ul class="pricing-table-features">
                                <li class="yellowEffect2"><span class="currency">&#8377;</span><%= subCandBean.getPer_apply_price()%> Per apply</li>
                                <li class="yellowEffect2"> <%= subCandBean.getValidity()%> </li>
                                <li class="yellowEffect2"><%= subCandBean.getSuggestion()%></li>
                                <li class="yellowEffect2">Email Alert</li>
                            </ul><a class="btn btn-outline-warning" href="../CandidateController?action=pricing&candidateId=<%= session.getAttribute("CandidateId")%>&subscriptionId=<%= subCandBean.getSubCandPublicId()%> ">Get Started</a>
                        </div>
                    </div>
                    <%
                            }
                        }
                    %>   

                    <%
                    } else {

                        CandidateModel candMod = new CandidateModel();
                        TblCandidate cand = candMod.selectById(String.valueOf(session.getAttribute("CandidateId")));

                        TblCandidatePlan myPlan = candMod.selectMyPlan(String.valueOf(session.getAttribute("CandidateId")));

                        System.out.println("cid=" + cand.getSubscriptionId());
                    %>
                    <div class="row">
                        <div class="col">
                            <div class="pricing-table pricing-table-warning">
                                <div class="pricing-table-title yellowEffect"><%= myPlan.getPlanTitle()%></div>
                                <div class="card-divider card-divider-xl"></div>
                                <div class="pricing-table-price "><span class="currency">&#8377;</span><span class="value yellowEffect"><%= myPlan.getPlanAmout()%></span><span class="frecuency"></span></div>
                                <div class="card-divider card-divider-xl"></div>
                                <ul class="pricing-table-features">
                                    <li class="yellowEffect2">Available Balance: <%= myPlan.getAvailableBalance()%> </li>
                                    <li class="yellowEffect2">Per Apply Deduction: <%= myPlan.getPerApplyDeduction()%> </li>

                                    <li class="yellowEffect2">Activation Date: <%= myPlan.getStartDate()%> </li>
                                    <li class="yellowEffect2">Expiry Date: <%= myPlan.getEndDate()%></li>
                                </ul>   
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>
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
