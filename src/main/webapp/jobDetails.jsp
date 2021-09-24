<%-- 
    Document   : jobDetails-test
    Created on : 13 Sep, 2021, 12:19:35 PM
    Author     : LENOVO
--%>

<%@page import="com.qt.jobportal.models.Subscription"%>
<%@page import="com.qt.jobportal.models.JobActivity"%>
<%@page import="com.qt.jobportal.models.SubscriptionCandidateModel"%>
<%@page import="com.qt.jobportal.commons.Utils"%>

<%@page import="com.qt.jobportal.beans.TblCandidate"%>
<%@page import="com.qt.jobportal.models.CandidateModel"%>
<%@page import="com.qt.jobportal.beans.TblVacancy"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.qt.jobportal.models.Vacancy"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <%
            Vacancy vacmod = new Vacancy();
            TblVacancy vacancy = vacmod.selectById(request.getParameter("id"));

            CandidateModel candidate = new CandidateModel();
            TblCandidate beanCandidate = candidate.selectById(String.valueOf(session.getAttribute("CandidateId")));
            boolean validCandidateChecked = CandidateModel.checkValidCandidate(String.valueOf(session.getAttribute("CandidateId")));
        %>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JOB DETAILS TEST</title>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="author" content="">
        <link rel="shortcut icon" href="../assets/img/logo-fav.png">

        <link rel="stylesheet" type="text/css" href="assets/lib/perfect-scrollbar/css/perfect-scrollbar.css"/>
        <link rel="stylesheet" type="text/css" href="assets/lib/material-design-icons/css/material-design-iconic-font.min.css"/>
        <link rel="stylesheet" type="text/css" href="assets/lib/datatables/datatables.net-bs4/css/dataTables.bootstrap4.css"/>
        <link rel="stylesheet" type="text/css" href="assets/lib/datatables/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css"/>
        <link rel="stylesheet" href="assets/css/app.css" type="text/css"/>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->

        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <script>
            var url = window.location.href;
            document.getElementById("currentURL").value = tbIndx;
        </script>

        <style>
            ul {
                position: absolute;
                top: 25%;
                left: 25%;
                transform: translate(-25%, -25%);
                margin: 0;
                padding: 0;
                display: flex;

            }

            ul li {
                list-style: none;
                margin: 0 20px;

            }

            ul li .fa {
                font-size: 20px;
                color: #262626;
                line-height: 40px;
                transition: .5s;

            }

            ul li a {
                position: relative;
                display: block;
                width: 40px;
                height: 40px;
                background-color: #fff;
                text-align: center;
                transform: perspective(50px) rotate(-30deg) skew(25deg) translate(0, 0);
                transition: .5s;
                box-shadow: -20px 20px 10px rgb(0, 0, 0, 0.5);
            }

            ul li a::before {
                content: "";
                position: absolute;
                top: 5px;
                left: -10px;
                height: 50%;
                width: 10px;
                background: #b1b1b1;
                transition: .5s;
                transform: rotate(0deg) skewY(-45deg);
            }

            ul li a::after {
                content: "";
                position: absolute;
                top: 20px;
                left: -6px;
                height: 5px;
                width: 25%;
                background: #b1b1b1;
                transition: .5s;
                transform: rotate(0deg) skewX(-45deg);
            }

            ul li a:hover {
                transform: perspective(1000px) rotate(-30deg) skew(25deg) translate(20px, -20px);
                box-shadow: -50px 50px 50px rgb(0, 0, 0, 0.5);
            }

            ul li:hover .fa {
                color: #fff;
            }

            ul li a:hover {
                transform: perspective(1000px) rotate(-30deg) skew(25deg) translate(20px, -20px);
                box-shadow: -50px 50px 50px rgb(0, 0, 0, 0.5);
            }

            ul li:hover:nth-child(1) a {
                background: #3b5999;
            }

            ul li:hover:nth-child(1) a:before {
                background: #2e4a86;
            }

            ul li:hover:nth-child(1) a:after {
                background: #4a69ad;
            }

            ul li:hover:nth-child(2) a {
                background: #55acee;
            }

            ul li:hover:nth-child(2) a:before {
                background: #4184b7;
            }

            ul li:hover:nth-child(2) a:after {
                background: #4d9fde;
            }

            ul li:hover:nth-child(3) a {
                background: #25D366;
            }

            ul li:hover:nth-child(3) a:before {
                background: #25D366;
            }

            ul li:hover:nth-child(3) a:after {
                background: #25D366;
            }

            ul li:hover:nth-child(4) a {
                background: #0077B5;
            }

            ul li:hover:nth-child(4) a:before {
                background: #036aa0;
            }

            ul li:hover:nth-child(4) a:after {
                background: #0d82bf;
            }

            ul li:hover:nth-child(5) a {
                background: #e4405f;
            }

            ul li:hover:nth-child(5) a:before {
                background: #d02d4c;
            }

            ul li:hover:nth-child(5) a:after {
                background: #f1395c;
            }
        </style>

    </head>
    <body>

        <div class="row">
            <div class="container">
                <div class="col-12 col-md-6 offset-md-3">
                    <div class="row">
                        <div class="col-12">
                            <div class="card card-border-color card-border-color-primary mt-4">
                                <div class="card-body">
                                    <div class="row mt-4">
                                        <div class="col-6">
                                            <div class="">
                                                <img class="logo-img" src="assets/img/logo-xx.png" alt="logo" width="102" height="27">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--new card -->   
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card mb-2">
                                <div class="card-body">
                                    <br>
                                    <span class="splash-title font-weight-bold py-1 text-primary"><%= vacancy.getTitle()%></span>
                                    <input type="hidden" name="id" value="<%= vacancy.getId()%>">
                                    <div class="form-group row">
                                        <div class="container ">
                                            <span> <h4>Company Name:&nbsp;
                                                    <strong><%= vacancy.getCompanyName()%></strong></h4></span>
                                            <span> <h4>Minimum Qualification: &nbsp;
                                                    <strong> <%= vacancy.getMinQualification()%></strong></h4></span>
                                            <span><h4>Minimum Experience: &nbsp;
                                                    <strong><%= vacancy.getExperience()%></strong></h4></span>
                                            <span><h4>English Accuracy: &nbsp;
                                                    <strong> <%= vacancy.getEnglishAccuracy()%></strong></h4></span>
                                            <span> <h4>Salary: &nbsp;
                                                    <strong><%= vacancy.getMinSalary()%>-<%= vacancy.getMaxSalary()%></strong></h4></span>
                                            <span> <h4>Location: &nbsp;
                                                    <strong><%= vacancy.getJobCity()%></strong></h4></span>
                                            <span> <h4>Posted on: &nbsp;
                                                    <strong><%= vacancy.getCreatedAt()%></strong></h4></span>       
                                            <br>

                                            <%
                                                if (validCandidateChecked) {
                                            %>
                                            <center>
                                                <span>
                                                    <%
                                                        JobActivity jobActivityCheck = new JobActivity();
                                                        boolean checkSaveActivity = jobActivityCheck.checkJobActivity(beanCandidate.getCandPublicId(), 2, vacancy.getVacancyPublicId());
                                                        if (checkSaveActivity) {
                                                    %>

                                                    <a class="btn btn-outline-warning btn-lg" href="#"  title="Already Saved" style="pointer-events: none;"><i class="fa fa-star mt-1 mr-1" style="font-size: 15px"></i>
                                                        Saved &nbsp;
                                                    </a>

                                                    <%
                                                    } else {
                                                    %>
                                                    <a class="btn btn-outline-warning btn-lg" href="JobActivityController?action=save&candidateid=<%=session.getAttribute("CandidateId")%>&title=<%= vacancy.getTitle()%>&employername=<%= vacancy.getCompanyName()%>&employerId=<%= vacancy.getEmployerId()%>&vacancyid=<%= vacancy.getVacancyPublicId()%>"  title="Save Job"><i class="fa fa-star mt-1 mr-1" style="font-size: 15px"></i>
                                                        Save
                                                    </a>
                                                    <%
                                                        }
                                                    %>
                                                </span>

                                                <span>
                                                    <%
                                                        boolean checkFavActivity = jobActivityCheck.checkJobActivity(beanCandidate.getCandPublicId(), 3, vacancy.getVacancyPublicId());
                                                        if (checkFavActivity) {
                                                    %>

                                                    <a class="btn btn-outline-danger btn-lg" href="#"   title="Already added to Favourite" style="pointer-events: none;"><i class="fa fa-heart mt-1 mr-1" style="font-size: 15px"></i>
                                                        Liked &nbsp;
                                                    </a>

                                                    <%
                                                    } else {
                                                    %>
                                                    <a class="btn btn-outline-danger btn-lg" href="JobActivityController?action=favCompany&candidateid=<%=session.getAttribute("CandidateId")%>&title=<%= vacancy.getTitle()%>&employername=<%= vacancy.getCompanyName()%>&employerId=<%= vacancy.getEmployerId()%>&vacancyid=<%= vacancy.getVacancyPublicId()%>"   title="Favorite Company"><i class="fa fa-heart mt-1 mr-1" style="font-size: 15px"></i>
                                                        Favorite
                                                    </a>
                                                    <%
                                                        }
                                                    %>
                                                </span>

                                                <span>
                                                    <%
                                                        boolean checkApplyActivity = jobActivityCheck.checkJobActivity(beanCandidate.getCandPublicId(), 1, vacancy.getVacancyPublicId());
                                                        if (checkApplyActivity) {
                                                    %>

                                                    <a class="btn btn-outline-primary btn-lg" href="#"  title="Already Applied" style="pointer-events: none;"><i class="fa fa-mouse-pointer mt-1 mr-1" style="font-size: 15px"></i>
                                                        Applied &nbsp;
                                                    </a>

                                                    <%
                                                    } else {
                                                    %>
                                                    <a class="btn btn-outline-primary btn-lg" href="#"  data-toggle="modal" data-target="#applyJob" title="Apply Now"><i class="fa fa-mouse-pointer mt-1 mr-1" style="font-size: 15px"></i>
                                                        Apply Now
                                                    </a>
                                                    <%
                                                        }
                                                    %>
                                                </span>

                                                <!--MODAL FOR APPLY BUTTON-->
                                                <div class="modal fade" id="applyJob" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">

                                                            <%
                                                                int balance = candidate.fetchBalanceCand(beanCandidate.getCandPublicId(), "tblcandidate");
                                                                if (balance >= 20) {
                                                            %>
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel"></h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="container" style="border: ridge">
                                                                    <div class="col-sm-9">
                                                                        <h5><%= (beanCandidate.getFullName() == null || beanCandidate.getFullName() == "null" || beanCandidate.getFullName() == "") ? "" : beanCandidate.getFullName()%></h5>
                                                                        <h5><%= (beanCandidate.getEmailId() == null || beanCandidate.getEmailId() == "null" || beanCandidate.getEmailId() == "") ? "" : beanCandidate.getEmailId()%></h5>

                                                                        <h5><%= (beanCandidate.getEmailId() == null || beanCandidate.getEmailId() == "null" || beanCandidate.getEmailId() == "") ? "" : beanCandidate.getEmailId()%></h5>
                                                                        <h5><%= (beanCandidate.getPhone_No() == null || beanCandidate.getPhone_No() == "null" || beanCandidate.getPhone_No() == "") ? "" : beanCandidate.getPhone_No()%></h5>
                                                                        <h5><%= (beanCandidate.getState() == null || beanCandidate.getState() == "null" || beanCandidate.getState() == "") ? "" : beanCandidate.getState()%></h5>
                                                                    </div>
                                                                    <br>
                                                                    <!--                                                                    <h5>Internship Training Details with Company Name</h5>
                                                                                                                                        <h5>College Details</h5>-->
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <a class="btn btn-primary" href="JobActivityController?action=apply&id=<%= vacancy.getVacancyPublicId()%>&candidateid=<%= beanCandidate.getCandPublicId()%>&deduction=<%= SubscriptionCandidateModel.deduction(beanCandidate.getSubscriptionId())%>&deduction_type=1&employerId=<%= vacancy.getEmployerId()%>&empdeduction_type=2&empname=<%= vacancy.getCompanyName()%>&jobtitle=<%= vacancy.getTitle()%>&candidateid=<%=beanCandidate.getCandPublicId()%>&title=<%= vacancy.getTitle()%>&employername=<%= vacancy.getCompanyName()%>&vacancyid=<%= vacancy.getVacancyPublicId()%>">
                                                                    Apply Now
                                                                </a>
                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                            </div>
                                                            <%
                                                            } else {
                                                            %>

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
                                                            <%
                                                                }
                                                            %>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--//MODAL FOR APPLY BUTTON-->

                                                <div class="container text-success">
                                                    <center>
                                                        <h4>
                                                            <strong>
                                                                ${param.msg}
                                                                ${param.message}
                                                            </strong>
                                                        </h4>
                                                    </center>
                                                </div>

                                            </center>
                                            <%
                                            } else {
                                            %>
                                            <center>
                                                <strong>
                                                    Please
                                                    <a href="candidateLogin.jsp" class="text-primary font-weight-bold text-justify" title="Please Login" >
                                                        Login
                                                    </a>
                                                    to apply
                                                </strong>
                                            </center>
                                            <%
                                                }
                                            %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <%
                        if (validCandidateChecked) {
                    %>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card mb-2">
                                <div class="container">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="container">
                                                <center>
                                                    <h4>
                                                        <strong>
                                                            Check your 
                                                            <a href="candidate/profile.jsp" class="text-primary font-weight-bold text-justify" title="View Profile" >
                                                                profile
                                                            </a>
                                                            before apply
                                                        </strong>
                                                    </h4>
                                                </center>
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

                    <!--===========================================================================================-->

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card mb-2">
                                <div class="container">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="container">
                                                <center>
                                                    <h4 class=""><strong>Help your friends, Share this job!</strong></h4>
                                                </center>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>           

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card mb-2">
                                <div class="container">
                                    <div class="card-body">
                                        <br><br><br>
                                        <div class="row">
                                            <div class="container">
                                                <center>
                                                    <ul>
                                                        <!--SHARE ON FACEBOOK-->
                                                        <li>
                                                            <a href="https://www.facebook.com/sharer/sharer.php?u=" onclick="location.href = this.href + url;return false;" target="_">
                                                                <i class="fa fa-facebook" aria-hidden="true">
                                                                </i>
                                                            </a>
                                                        </li>

                                                        <!--SHARE ON TELEGRAM-->
                                                        <li>
                                                            <a href="https://telegram.me/share/url?url=" onclick="location.href = this.href + url;return false;" target="_">
                                                                <i class="fa fa-telegram" aria-hidden="true">
                                                                </i>
                                                            </a>
                                                        </li>

                                                        <!--SHARE ON WHATSAPP-->
                                                        <li>
                                                            <a href="https://wa.me/?text=" onclick="location.href = this.href + url;return false;" target="_">
                                                                <i class="fa fa-whatsapp" aria-hidden="true">
                                                                </i>
                                                            </a>
                                                        </li>

                                                        <!--SHARE ON LINKEDIN-->
                                                        <li>
                                                            <a href="https://www.linkedin.com/shareArticle?mini=true&url=" onclick="location.href = this.href + '?key=' + url;return false;"  target="_">
                                                                <i class="fa fa-linkedin" aria-hidden="true">
                                                                </i>
                                                            </a>
                                                        </li>

                                                    </ul>
                                                </center>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card mb-2">
                                <div class="card-body">
                                    <div class="form-group row">
                                        <div class="container">
                                            <h4>Job Timing : &nbsp;
                                                <span><strong><%= vacancy.getJobTiming()%></strong></span></h4>
                                            <hr>
                                            <h4>Interview Timings : &nbsp;
                                                <span><strong><%= vacancy.getInterviewDetails()%></strong></span></h4>
                                            <hr>
                                            <h4>Skills : &nbsp;
                                                <span><strong><%= vacancy.getSkillSet()%></strong></span></h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card ">
                                <div class="card-body">
                                    <div class="form-group row">
                                        <div class="container">
                                            <h4>Job Description :<br>
                                                <strong><p class="offset-2">
                                                        <%= vacancy.getJobDescription()%>
                                                    </p></strong></h4>
                                            <!--<h4>Responsibilities and Duties :<br>
                                                <strong><p class="offset-2">
                                            <%= vacancy.getJobDescription()%>
                                        </p></strong></h4>
                                <h4>Qualifications and Skills :<br>
                                    <strong><p class="offset-2">
                                            <%= vacancy.getJobDescription()%>
                                        </p></strong></h4>-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--===========================================================================================-->

                </div>
            </div>
        </div>
    </div>

    <script src="assets/lib/jquery/jquery.min.js" type="text/javascript"></script>
    <script src="assets/lib/perfect-scrollbar/js/perfect-scrollbar.min.js" type="text/javascript"></script>
    <script src="assets/lib/bootstrap/dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
    <script src="assets/js/app.js" type="text/javascript"></script>
    <script type="text/javascript">
                                                                $(document).ready(function () {
                                                                    //-initialize the javascript
                                                                    App.init();
                                                                    App.formElements();
                                                                });
    </script>  

    <script src="assets/lib/jquery.niftymodals/js/jquery.niftymodals.js" type="text/javascript"></script>
    <script type="text/javascript">
                                                                $.fn.niftyModal('setDefaults', {
                                                                    overlaySelector: '.modal-overlay',
                                                                    contentSelector: '.modal-content',
                                                                    closeSelector: '.modal-close',
                                                                    classAddAfterOpen: 'modal-show'
                                                                });
    </script>
</body>
</html>
