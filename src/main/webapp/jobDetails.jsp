<%-- 
    Document   : jobDetails
    Created on : 25 Feb, 2020, 1:36:13 PM
    Author     : Zoya
--%>
<%
    String uri = null, pageName = null;
    try {
        uri = request.getRequestURI();
        pageName = uri.substring(uri.lastIndexOf("/") + 1).replace(".jsp", "");
        // get current page Name
        session.setAttribute("PAGENAME", uri.substring(uri.lastIndexOf("/") + 1));
        //  System.out.println("pagname : "+session.getAttribute("PAGENAME"));
    } catch (Exception e) {
        System.out.println("Page URI : " + e.getMessage());
    }
%>

<%@page import="com.qt.jobportal.beans.TblCandidate"%>
<%@page import="com.qt.jobportal.models.CandidateModel"%>
<%@page import="com.qt.jobportal.beans.TblVacancy"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.qt.jobportal.models.Vacancy"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
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

        <script>
            var url = window.location.href;
            document.getElementById("currentURL").value = tbIndx;
        </script>

        <script language="javascript" type="text/javascript">
            var scrt_var = 10;
            var url = window.location.href;
        </script>



    </head>
    <body>

        <%
            Vacancy vacmod = new Vacancy();
            TblVacancy vacancy = vacmod.selectById(request.getParameter("id"));

            //   CandidateModel candidate = new CandidateModel();S
            //   TblCandidate beanCandidate = candidate.selectById(String.valueOf(session.getAttribute("CandidateId")));

        %>


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
                                        <div class="col-6">
                                            <div class="text-right">
                                                <a class="" href="candidate/profile.jsp">
                                                    <i class="icon mdi mdi-account-add md-trigger"style="font-size: 25px" data-modal="md-flipV">
                                                        <label><h4>profile</h4></label>  
                                                    </i>
                                                </a>
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
                            <div class="card ">
                                <div class="card-body">
                                    <span class="splash-title pb-4 text-primary"><strong><%= vacancy.getTitle()%></strong></span>
                                    <input type="hidden" name="id" value="<%= vacancy.getId()%>">
                                    <div class="form-group row">
                                        <div class="container">
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
                                                    <strong><%= vacancy.getJobCity()%></strong></h4>
                                                <a href="applyNow.jsp?vacancyid=<%= vacancy.getVacancyPublicId()%>"  class="btn btn-outline-primary form-control-sm"  title="Apply" ><i class="fa fa-mouse-pointer mt-1" style="font-size: 15px"></i>&nbsp;Apply</a>
                                                <span class="offset-5">Posted ON:<%=vacancy.getCreatedAt()%></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Share job -->

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card mb-2">
                                <div class="container">

                                    <div class="card-body">
                                        <div class="row">
                                            <div class="container">
                                                <center>
                                                    <h4 class="mt-2"><strong>Help your friends, Share this job!</h4></strong>

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
                                                            <a href="https://www.facebook.com/sharer/sharer.php?u=" onclick="location.href = this.href + url;return false;" target="_blank">
                                                                <i class="fa fa-facebook" aria-hidden="true">
                                                                </i>
                                                            </a>
                                                        </li>

                                                        <!--SHARE ON TELEGRAM-->
                                                        <li>
                                                            <a href="https://telegram.me/share/url?url=" onclick="location.href = this.href + url;return false;" target="_blank">
                                                                <i class="fa fa-telegram" aria-hidden="true">
                                                                </i>
                                                            </a>
                                                        </li>
                                                        
                                                        <!--SHARE ON WHATSAPP-->
                                                        <li>
                                                            <a href="https://wa.me/?text=" onclick="location.href = this.href + url;return false;" target="_blank">
                                                                <i class="fa fa-whatsapp" aria-hidden="true">
                                                                </i>
                                                            </a>
                                                        </li>
                                                        
                                                        <!--SHARE ON LINKEDIN-->
                                                        <li>
                                                            <a href="https://www.linkedin.com/shareArticle?mini=true&url=" onclick="location.href = this.href + '?key=' + url;return false;"  target="_blank">
                                                                <i class="fa fa-linkedin" aria-hidden="true">
                                                                </i>
                                                            </a>
                                                        </li>
                                                        
                                                    </ul>

                                                    <br>
                                                </center>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- -->

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card ">
                                <div class="card-body">
                                    <div class="form-group row">
                                        <div class="container">
                                            <h4>Job Timing : &nbsp;
                                                <span><strong><%= vacancy.getJobTiming()%></strong></span></h4>
                                            <hr>

                                            <h4>Interview Timings : &nbsp;
                                                <span><strong><%= vacancy.getInterviewDetails()%></strong></span></h4>
                                            <hr>

                                            <h4>Skills : <br>
                                                <span class="offset-1"><strong><%= vacancy.getSkillSet()%></strong></span></h4>
                                            <hr>
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
                                            <h4>Responsibilities and Duties :<br>
                                                <strong><p class="offset-2">
                                                        <%= vacancy.getJobDescription()%> Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                                                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                                                    </p></strong></h4>
                                            <h4>Qualifications and Skills :<br>
                                                <strong><p class="offset-2">
                                                        <%= vacancy.getJobDescription()%> Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                                                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                                                    </p></strong></h4>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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
        <!--footer start here-->

        <!--footer Wrapper End -->

    </body>
</html>
