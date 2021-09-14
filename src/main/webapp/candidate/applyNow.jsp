<%-- 
    Document   : applyNow
    Created on : 23 Mar, 2020, 5:01:23 PM
    Author     : Zoya
--%>

<%@page import="com.qt.jobportal.commons.Utils"%>
<%@page import="com.qt.jobportal.beans.TblVacancy"%>
<%@page import="com.qt.jobportal.models.Vacancy"%>
<%@page import="com.qt.jobportal.beans.TblCandidate"%>
<%@page import="com.qt.jobportal.models.CandidateModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="assets/img/logo-fav.png">
        <title>Beagle</title>
        <link rel="stylesheet" type="text/css" href="assets/lib/perfect-scrollbar/css/perfect-scrollbar.css"/>
        <link rel="stylesheet" type="text/css" href="assets/lib/material-design-icons/css/material-design-iconic-font.min.css"/>
        <link rel="stylesheet" href="assets/css/app.css" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="assets/myjs/cities.js"></script>
    </head>
    <body>


        <%
            CandidateModel candidate = new CandidateModel();
            TblCandidate beanCandidate = candidate.selectById(String.valueOf(session.getAttribute("CandidateId")));

            Vacancy vacmod = new Vacancy();
            TblVacancy vacancy = vacmod.selectById(request.getParameter("vacancyid"));


        %>

        <div class="row">
            <div class="col-lg-6 offset-3 ">
                <div class="card">
                    <div class="splash-container sign-up">


                        <div class="card-body card-border-color card-border-color-primary mt-2">

                            <h3><%= vacancy.getTitle()%></h3>
                            <h5><%=vacancy.getJobAddress()%></h5>

                            <div class="container" style="border: ridge">
                                <div class="row">
                                    <div class="col-sm-9">
                                        <h4> <%= beanCandidate.getFullName()%></h4> 
                                        <h5> <%= beanCandidate.getEmailId()%></h5>
                                        <h5><%= beanCandidate.getPhone_No()%></h5>
                                        <h5><%= beanCandidate.getState()%></h5>
                                    </div>
                                    <div class="col-sm-3 mt-1">
                                        <a  class=" btn btn-primary"  href="candidate/candidateUpdate.jsp?id=<%= beanCandidate.getId()%>">
                                            <div class="icon-sm">
                                                <span class="mdi mdi-edit"></span>
                                            </div>

                                            <a href="#" >Not you? sign out</a>
                                    </div>
                                </div>
                                <br>
                                <h5>Internship Trainig Details with Company Name</h5>
                                <h5>College Details</h5>

                            </div>
                            <h5><span>Attaching a resume is optional.</span> <a href="#">Apply with a different resume </a></h5>
                            <%
                                Utils util = new Utils();
                                int balance = util.fetchBalance(beanCandidate.getId(), "tblcandidate");
                                if (balance >= 50) {
                            %>

                            <div class="col-6">
                                <a class="btn btn-primary btn-xl" href="TransactionController?action=jobTx&id=<%= vacancy.getId()%>&candidateid=<%= beanCandidate.getId()%>&deduction=30&deduction_type=1&employer_id=<%= vacancy.getEmployerId()%>&empDeduction=20&empdeduction_type=2&empname=<%= vacancy.getCompanyName()%>&jobtitle=<%= vacancy.getTitle()%>"  data-dismiss="modal"  >
                                    Apply Now!!!
                                </a>
                            </div>

                            <%
                                } else {
                                    String msg = "insuffient balance";
                                }
                            %>
                            <!--<h4> <a href="#" ><i class="fa fa-plus-circle">&nbsp; Add cover latter</i></a></h4>
                                <div class="be-checkbox custom-control custom-checkbox">
                                    <input class="custom-control-input" type="checkbox" id="check1">
                                    <label class="custom-control-label" for="check1">candidate_id
                                        Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                                        when an unknown printer took a galley of type and scrambled it to make a type specimen book. 
                                    </label>
                                </div>
                                <div class="be-checkbox custom-control custom-checkbox">
                                    <input class="custom-control-input" type="checkbox" id="check2">
                                    <label class="custom-control-label" for="check2">
                                        Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                                        when an unknown printer took a galley of type and scrambled it to make a type specimen book. 
                                    </label>
                                </div>-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script language="javascript">print_state("sts");</script>
        <script src="assets/lib/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="assets/lib/perfect-scrollbar/js/perfect-scrollbar.min.js" type="text/javascript"></script>
        <script src="assets/lib/bootstrap/dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="assets/js/app.js" type="text/javascript"></script>
        <script src="assets/lib/jquery.niftymodals/js/jquery.niftymodals.js" type="text/javascript"></script>
        <script type="text/javascript">
            $.fn.niftyModal('setDefaults', {
                overlaySelector: '.modal-overlay',
                contentSelector: '.modal-content',
                closeSelector: '.modal-close',
                classAddAfterOpen: 'modal-show'
            });

            $(document).ready(function () {
                //-initialize the javascript
                App.init();
            });
        </script>
    </body>
</html>
