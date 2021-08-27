<%-- 
    Document   : jobsSearch
    Created on : 20 Feb, 2020, 11:04:29 AM
    Author     : win8.1
--%>

<%@page import="com.qt.jobportal.beans.TblVacancy"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.qt.jobportal.models.Vacancy"%>
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
        <link rel="stylesheet" type="text/css" href="assets/lib/perfect-scrollbar/css/perfect-scrollbar.css"/>
        <link rel="stylesheet" type="text/css" href="assets/lib/material-design-icons/css/material-design-iconic-font.min.css"/>
        <link rel="stylesheet" href="assets/css/app.css" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="assets/myjs/cities.js"></script>


        <script>
            function searchByCity() {
                var jobCity = document.getElementById("state").value;

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState === 4 && this.status === 200) {
                        document.getElementById("dyamicJobs").innerHTML =
                                this.responseText;
                    }
                };
                xhttp.open("GET", "searchByCity.jsp?jobCity=" + jobCity, true);
                xhttp.send();

            }
            // Job Search By Keyword
            function searchByKeyword() {
                var keyword = document.getElementById("jobKeyword").value;

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState === 4 && this.status === 200) {
                        document.getElementById("dyamicJobs").innerHTML =
                                this.responseText;
                    }
                };
                xhttp.open("GET", "searchByKeyword.jsp?keyword=" + keyword, true);
                xhttp.send();

            }

// job Search By Category
            function searchByCategory(jobCategory) {

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState === 4 && this.status === 200) {
                        document.getElementById("dyamicJobs").innerHTML =
                                this.responseText;
                    }
                };
                xhttp.open("GET", "searchByCategory.jsp?category=" + jobCategory, true);
                xhttp.send();

            }

        </script>
        <style>
            .categoryH:hover {
                background-color: #146fff;

            }

            .blueEffect:hover {
                color:#146fff ;
                font-size: 50px;
                font-style: arial;
            }
            .blueEffect2:hover {
                color:#146fff ;
                font-size: 20px;
                font-style: arial;
            }
            .yellowEffect:hover {
                color:#ffcc00 ;
                font-size: 50px;
                font-style: arial;
            }
            .yellowEffect2:hover {
                color:#ffcc00 ;
                font-size: 20px;
                font-style: arial;
            }
            .greenEffect:hover {
                color:green ;
                font-size: 50px;
                font-style: arial;
            }
            .greenEffect2:hover {
                color:green ;
                font-size: 20px;
                font-style: arial;
            }
            .redEffect:hover {
                color:red ;
                font-size: 50px;
                font-style: arial;
            }
            .redEffect2:hover {
                color:red ;
                font-size: 20px;
                font-style: arial;
            }
        </style>
    </head>
    <body>

        <%
            Vacancy vacmod = new Vacancy();
            ArrayList<TblVacancy> vacc = vacmod.select();

            // TblVacancy vac = vacmod.searchByCity(request.getParameter("city"));

        %>
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-12">
                            <div class="card card-border-color">
                                <div class="card-body">

                                    <form action="VacancyController" method="post">
                                        <div class="form-group">

                                            <div class="row">
                                                <div class="col-6">
                                                    <div class="">
                                                        <img class="logo-img" src="assets/img/logo-xx.png" alt="logo" width="102" height="27">
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="text-right">
                                                        <a class="m-2" href="#">
                                                            <i class="icon mdi mdi-pin md-trigger" data-modal="md-flipVLOCATION">
                                                                <label>Location</label> 
                                                            </i>
                                                        </a>
                                                        <%                                                        if (session.getAttribute("CandidateId") == "null" || session.getAttribute("CandidateId") == null) {
                                                                //response.sendRedirect("../index.jsp?msg=Login Frist");
                                                        %>
                                                        <a class="" href="candidateLogin.jsp">
                                                            <i class="icon mdi mdi-account-add" >
                                                                <label>Login</label>  
                                                            </i>
                                                        </a>  

                                                        <%} else {%>
                                                        <a class="" href="candidate/candidateDash.jsp">
                                                            <i class="icon mdi mdi-account-add" >
                                                                <label>My Account</label>  
                                                            </i>
                                                        </a>
                                                        <%}%>
                                                    </div>
                                                </div>                                        


                                                <div class="container-fluid mt-2">
                                                    <div class="input-group input-search">
                                                        <input class="form-control" type="text" placeholder="Search By Keyword" id="jobKeyword"><span class="input-group-btn">
                                                            <button class="btn btn-secondary" > <a href="#" onclick="searchByKeyword()"><i class="icon mdi mdi-search"></i></a></button></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>

                            </div>

                        </div>
                    </div>

                    <section>
                        <div class="row">
                            <div class="col-lg-2">
                                <div class="card categoryH">
                                    <div class="card-body ">
                                        <a href="#" onclick="searchByCategory('Developer')">
                                            <div class="jp_top_jobs_category_wrapper jp_job_cate_left_border jp_job_cate_left_border_bottom">
                                                <div class="jp_top_jobs_category"> <span class="display-4 text-info"><center><i class="fa fa-code pt-2 "></i></center></span>
                                                    <h4 class="text-center text-light"> <span class="text-dark">Developer</span></h4>
                                                    <p class="text-center text-info">(240 jobs)</p>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="card categoryH">
                                    <div class="card-body ">
                                        <a href="#" onclick="searchByCategory('Technology')">
                                            <div class="jp_top_jobs_category_wrapper jp_job_cate_left_border jp_job_cate_left_border_bottom">
                                                <div class="jp_top_jobs_category"> <span class="display-4 text-info"><center><i class="fa fa-laptop pt-2 "></i></center></span>
                                                    <h4 class="text-center text-light"><span class="text-dark">Technology</span></h4>
                                                    <p class="text-center text-info">(240 jobs)</p>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="card categoryH">
                                    <div class="card-body ">
                                        <a href="#" onclick="searchByCategory('Marketing')">
                                            <div class="jp_top_jobs_category_wrapper jp_job_cate_left_border jp_job_cate_left_border_bottom">
                                                <div class="jp_top_jobs_category"> <span class="display-4 text-info"><center><i class="fa fa-bar-chart pt-2 "></i></center></span>
                                                    <h4 class="text-center text-light"><span class="text-dark">Marketing</span></h4>
                                                    <p class="text-center text-info">(240 jobs)</p>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="card categoryH">
                                    <div class="card-body ">
                                        <a href="#" onclick="searchByCategory('Medical')">
                                            <div class="jp_top_jobs_category_wrapper jp_job_cate_left_border jp_job_cate_left_border_bottom">
                                                <div class="jp_top_jobs_category"> <span class="display-4 text-info"><center><i class="fa fa-medkit pt-2 "></i></center></span>
                                                    <h4 class="text-center text-light"><span class="text-dark">Medical</span></h4>
                                                    <p class="text-center text-info">(240 jobs)</p>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="card categoryH">
                                    <div class="card-body ">
                                        <a href="#" onclick="searchByCategory('Government')">
                                            <div class="jp_top_jobs_category_wrapper jp_job_cate_left_border jp_job_cate_left_border_bottom">
                                                <div class="jp_top_jobs_category"> <span class="display-4 text-info"><center><i class="fa fa-university pt-2 "></i></center></span>
                                                    <h4 class="text-center text-light"><span class="text-dark">Government</span></h4>
                                                    <p class="text-center text-info">(240 jobs)</p>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="card categoryH">
                                    <div class="card-body ">
                                        <a href="jobsSearch.jsp">
                                            <div class="jp_top_jobs_category_wrapper jp_job_cate_left_border jp_job_cate_left_border_bottom">
                                                <div class="jp_top_jobs_category"> <span class="display-4 text-info"><center><i class="fa fa-th-large pt-2 "></i></center></span>
                                                    <h4 class="text-center text-light"><span class="text-dark">All Jobs</span></h4>
                                                    <p class="text-center text-info">(240 jobs)</p>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </section>

                    <div id="dyamicJobs">
                        <div class="row">


                            <%  for (TblVacancy vacancy : vacc) {
                                    if (vacancy.getSerialNo() == -1 || vacancy.getSerialNo() == 0) {
                            %>
                            <div class="col-lg-6">
                                <div class="card card-border-color card-border-color-primary">
                                    <a href="jobDetails.jsp"> <div class="card-body">
                                            <div class="form-group row">
                                                <div class="col-12">
                                                    <span class="splash-title pb-4"><%= vacancy.getException()%></span>
                                                </div>
                                                <table class="table table-sm table-hover table-striped">

                                                    <tbody>
                                                    <input type="hidden" name="id" value="<%= vacancy.getId()%>">

                                                    <tr>
                                                        <td><div class="icon"><span class="mdi mdi-case mt-2" ><%= vacancy.getException()%></span></div></td>
                                                        <td><div class="icon"><span class="mdi mdi-pin mt-2 "> <%= vacancy.getException()%> </span></div></td>

                                                    </tr>
                                                    <tr>
                                                        <td><div><i class="fa fa-building mt-2" style="font-size: 15px"><span>  <%= vacancy.getException()%>  </span></i></div></td>
                                                        <td ><div> <i class="fa fa-rupee mt-2 " style="font-size:15px"><span>  <%= vacancy.getException()%>  </span></i></div></td>

                                                    </tr>
                                                    <tr>
                                                        <td><div class="icon"><span class="mdi mdi-graduation-cap mt-2">  <%= vacancy.getException()%>  </span></div></td>
                                                        <td> <div class="icon"><span class="mdi mdi-translate mt-2 mr-1"> <%= vacancy.getException()%> </span></div></td>
                                                    </tr>
                                                    <tr>
                                                        <td><div><i class="fa fa-list-alt mt-2" style="font-size: 15px"><span>  <%= vacancy.getException()%>  </span></i></div></td>
                                                        <td></td>
                                                    </tr>

                                                    </tbody>
                                                </table>

                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <%
                            } else {
                            %>
                            <div class="col-lg-6">
                                <div class="card card-border-color card-border-color-primary">
                                    <!--<input type="hidden" name="id" value="<%= vacancy.getId()%>">-->

                                    <a href="jobDetails.jsp?id=<%= vacancy.getVacancyPublicId()%> "><div class="card-body">
                                            <div class="form-group row">
                                                <div class="col-12">
                                                    <span class="splash-title pb-4"><%= vacancy.getTitle()%></span>
                                                </div>
                                                <table class="table table-sm table-hover table-striped">

                                                    <tbody>

                                                        <tr>
                                                            <td><div><h3><small><i class="fa fa-building mt-2"></i> <%= vacancy.getCompanyName()%></small></h3></div></td>
                                                            <td <div><h3><small><i class="mdi mdi-pin mt-2 "> </i><%= vacancy.getJobCity()%></small></h3></div></td>

                                                        </tr>
                                                        <tr>
                                                            <td><div><h3><small> <i class="fa fa-list-alt mt-2 "> </i><%= vacancy.getExperience()%></small></h3></div></td>
                                                            <td><div><h3><small> <i class="fa fa-rupee mt-2 "> </i><%= vacancy.getMinSalary()%>-<%= vacancy.getMaxSalary()%></small></h3></div></td>

                                                        </tr>
                                                        <tr>
                                                            <td><div><h3><small><i class="mdi mdi-graduation-cap mt-2"></i> <%= vacancy.getMinQualification()%></small></h3></div></td>
                                                            <td> <div><h3><small><i class="mdi mdi-translate mt-2 mr-1"></i> <%= vacancy.getEnglishAccuracy()%></small></h3></div></td>
                                                        </tr>
                                                        <tr>

                                                            <td colspan="2">  <div><h3><small><i class="mdi mdi-case mt-2"> </i> <%= vacancy.getJobDescription()%></small></h3></div></td>

                                                        </tr>

                                                    </tbody>
                                                </table>

                                            </div>
                                        </div></a>
                                </div>

                            </div>


                            <%
                                    }
                                }
                            %> 




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
        <div class="modal-container modal-effect-4" id="md-flipVLOCATION">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close modal-close" type="button" data-dismiss="modal" aria-hidden="true"><span class="mdi mdi-close"></span></button>
                </div>

                <form action="JobSearchController" method="post">
                    <input type="hidden" name="action" value="searchByCity">                 
                    <div class="row">
                        <div class="col-sm-6 offset-3">
                            <select class=" form-control"  onchange="print_city('state', this.selectedIndex);" id="sts" name ="txtState" required >
                            </select>

                            <br>
                            <select id ="state" class="form-control" name="txtCity" required></select>
                            <br>
                            <center><button class="btn btn-primary btn-space modal-close" type="button" data-dismiss="modal">Submit</button></center>
                        </div>


                </form>

            </div>
        </div>
    </div>
    <div class="modal-footer"></div>


    <div class="modal-overlay"></div>
</div> 
<!--footer start here-->
<%@include file="footer.jsp" %>
<!--footer Wrapper End -->

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
