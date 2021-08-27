<%-- 
    Document   : applyNow
    Created on : 23 Mar, 2020, 5:01:23 PM
    Author     : Zoya
--%>
<%@page import="com.qt.jobportal.models.SubscriptionCandidateModel"%>
<%
    if (session.getAttribute("CandidateId") == "null" || session.getAttribute("CandidateId") == null) {
        response.sendRedirect("candidateLogin.jsp?page=" + session.getAttribute("PAGENAME") + "&msg=Login Frist");
    } else {
%>
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
            //   TblCandidate beanCandidate = candidate.selectById("45");
            TblCandidate beanCandidate = candidate.selectById(String.valueOf(session.getAttribute("CandidateId")));

            Vacancy vacmod = new Vacancy();
            TblVacancy vacancy = vacmod.selectById(request.getParameter("vacancyid"));


        %>

        <div class="row">
            <div class="col-sm-12 col-lg-6 offset-lg-3 ">
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
                                        <a  class=" btn btn-primary"  href="candidate/candidateUpdate.jsp?id=<%= session.getAttribute("CandidateId")%>">
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
                                int balance = util.fetchBalanceCand(beanCandidate.getCandPublicId(), "tblcandidate");
                                if (balance >= 20) {
                            %>   

                            <div class="col-12">
                                <a class="btn btn-outline-primary btn-lg" href="JobActivityController?action=apply&id=<%= vacancy.getVacancyPublicId()%>&candidateid=<%= beanCandidate.getCandPublicId()%>&deduction=<%= SubscriptionCandidateModel.deduction(beanCandidate.getSubscriptionId()) %>&deduction_type=1&employerId=<%= vacancy.getEmployerId()%>&empDeduction=20&empdeduction_type=2&empname=<%= vacancy.getCompanyName()%>&jobtitle=<%= vacancy.getTitle()%>&candidateid=<%=beanCandidate.getCandPublicId()%>&title=<%= vacancy.getTitle()%>&employername=<%= vacancy.getCompanyName()%>&vacancyid=<%= vacancy.getVacancyPublicId()%>  "  data-dismiss="modal"  >
                                    Apply Now
                                </a>
                                    
                                <a class="btn btn-outline-warning btn-lg" href="JobActivityController?action=save&candidateid=<%=session.getAttribute("CandidateId")%>&title=<%= vacancy.getTitle()%>&employername=<%= vacancy.getCompanyName()%>&employerId=<%= vacancy.getEmployerId()%>&vacancyid=<%= vacancy.getVacancyPublicId()%>"  title="Save Job"><i class="fa fa-star mt-1 mr-1" style="font-size: 15px"></i>
                                    Save
                                </a>
                                    
                                <a class="btn btn-outline-danger btn-lg" href="JobActivityController?action=favCompany&candidateid=<%=session.getAttribute("CandidateId")%>&title=<%= vacancy.getTitle()%>&employername=<%= vacancy.getCompanyName()%>&employerId=<%= vacancy.getEmployerId()%>&vacancyid=<%= vacancy.getVacancyPublicId()%>"   title="Favorite Company"><i class="fa fa-heart mt-1 mr-1" style="font-size: 15px"></i>
                                    Favorite
                                </a>
                            </div>
                                    
                            <%
                            } else { %>

                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                                Apply now
                            </button>

                            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel"></h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            In-Sufficient Balance
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%  }
                            %>
                            <h4> <a href="#" ><i class="fa fa-plus-circle">&nbsp; Add cover latter</i></a></h4>
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
                            </div>
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
<%
    }
%>