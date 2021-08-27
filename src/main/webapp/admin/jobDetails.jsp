<%-- 
    Document   : jobDetails
    Created on : 25 Feb, 2020, 1:36:13 PM
    Author     : Zoya
--%>

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

        <link rel="stylesheet" type="text/css" href="../assets/lib/perfect-scrollbar/css/perfect-scrollbar.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/material-design-icons/css/material-design-iconic-font.min.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/datatables/datatables.net-bs4/css/dataTables.bootstrap4.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/datatables/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css"/>
        <link rel="stylesheet" href="../assets/css/app.css" type="text/css"/>

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
    </head>
    <body>

        <%
            Vacancy vacmod = new Vacancy();
            TblVacancy vacancy = vacmod.selectById(request.getParameter("id"));


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
                                                <img class="logo-img" src="../assets/img/logo-xx.png" alt="logo" width="102" height="27">
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="text-right">
                                                <a class="" href="#">
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


                    <div class="row">

                        <div class="col-lg-12">
                            <div class="card ">
                                <div class="card-body">
                                    <div class="container">
                                        <span class="splash-title pb-4"><%= vacancy.getTitle()%></span>
                                        <table class="table table-borderless table-sm">
                                            <tbody>
                                            <input type="hidden" name="id" value="<%= vacancy.getId()%>">
                                            <tr>
                                                <td><div class="icon"><span class="mdi mdi-case mt-2" ><%= vacancy.getJobDescription()%> </span></div></td>
                                                <td <div class="icon"><span class="mdi mdi-pin mt-2 "> <%= vacancy.getJobCity()%> </span></div></td>
                                            </tr>
                                            <tr>
                                                <td><div><i class="fa fa-building mt-2" style="font-size: 15px"><span><%= vacancy.getCompanyName()%></span></i></div></td>
                                                <td ><div> <i class="fa fa-rupee mt-2 " style="font-size:15px"><span> <%= vacancy.getMinSalary()%>-<%= vacancy.getMaxSalary()%></span></i></div></td>

                                            </tr>
                                            <tr>
                                                <td><div class="icon"><span class="mdi mdi-graduation-cap mt-2"><%= vacancy.getMinQualification()%> </span></div></td>
                                                <td> <div class="icon"><span class="mdi mdi-translate mt-2 mr-1"><%= vacancy.getEnglishAccuracy()%></span></div></td>
                                            </tr>
                                            <tr>
                                                <td><div><i class="fa fa-list-alt mt-2" style="font-size: 15px"><span>&nbsp;<%= vacancy.getExperience()%></span></i></div></td>
                                                <td><button type="button" class="btn-primary">Apply</button></td>
                                            </tr>

                                            </tbody>
                                        </table>
                                        <span class="offset-9">Posten ON:</span>

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
                                            <h4><strong>Job Timing</strong></h4>
                                            <span><%= vacancy.getJobTiming()%></span>


                                            <h4><strong>Interview Timings</strong></h4>
                                            <span><%= vacancy.getInterviewDetails()%></span>


                                            <h4><strong>Skills</strong></h4>
                                            <span><%= vacancy.getSkillSet()%></span>

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
                                            <h4><strong>Job Description</strong></h4>
                                            <p class="text-justify">
                                                <%--Write Discription here --%> 
                                                Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                                                Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                                                when an unknown printer took a galley of type and scrambled it to make a type specimen book. 

                                            </p>
                                            <h4><strong>Responsibilities and Duties</strong></h4>
                                            <p class="text-justify">
                                                Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                                                Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                                                when an unknown printer took a galley of type and scrambled it to make a type specimen book. 

                                            </p>
                                            <h4><strong>Qualifications and Skills</strong></h4>
                                            <p class="text-justify">
                                                Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                                                Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                                                when an unknown printer took a galley of type and scrambled it to make a type specimen book. 
                                            </p>
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
                                    <h5 class="mt-2">Help your friends, Share this job!</h5>
                                    <br>
                                    <br>
                                    <br>
                                    <br>
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="container">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-telegram" aria-hidden="true"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-whatsapp" aria-hidden="true"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                                                   
                                                </ul>
                                            </div>
                                        </div>

                                    </div>

                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>



        <!-- Modal start -->

        <div class="modal-container modal-effect-9" id="md-flipV">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close modal-close" type="button" data-dismiss="modal" aria-hidden="true"><span class="mdi mdi-close"></span></button>
                </div>
                <div class="modal-body">
                    <div class="text-center">
                        <h4 class="mb-4">Login</h4>
                        <form>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="">Phone Number</label>
                                        <input class="form-control form-control-sm" type="number" name="PhoneNumber" placeholder="Enter Phone Nmuber">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="">Password</label>
                                        <input class="form-control form-control-sm" type="password" name="password" placeholder="Enter Password">
                                    </div>
                                </div>
                            </div>
                            <button class="btn btn-primary btn-space modal-close" type="button" data-dismiss="modal">Login</button>
                        </form>
                        <ul class="timeline timeline-variant">
                            <li class="timeline-month"><span>Or</span></li>
                        </ul>
                        <h4>Login with OTP</h4>
                        <form> 
                            <div class="row">
                                <div class="col-sm-6 offset-3">
                                    <label>Phone Number</label>
                                    <div class="input-group mb-3">

                                        <input class="form-control form-control-sm" type="number">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary md-trigger modal-close" data-modal="md-flipVOTP" type="button">Send OTP</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
                <div class="modal-footer"></div>
            </div>
        </div>
        <div class="modal-overlay"></div>
        <!-- modal end -->
        <div class="modal-container modal-effect-4" id="md-flipVOTP">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close modal-close" type="button" data-dismiss="modal" aria-hidden="true"><span class="mdi mdi-close"></span></button>
                </div>

                <form>
                    <div class="row">
                        <div class="col-sm-6 offset-3">
                            <div class="form-group">
                                <center><label for="">Enter OTP</label></center>
                                <input class="form-control form-control-sm" type="number" name="PhoneNumber" placeholder="Enter 6-digit OTP">
                            </div>
                            <center><button class="btn btn-primary btn-space modal-close" type="button" data-dismiss="modal">Submit</button></center>
                        </div>
                    </div>

                </form>


            </div>
        </div>
        <div class="modal-footer"></div>


        <div class="modal-overlay"></div>



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

        <script src="../assets/lib/jquery.niftymodals/js/jquery.niftymodals.js" type="text/javascript"></script>
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