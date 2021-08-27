<%-- 
    Document   : jobsSearch
    Created on : 20 Feb, 2020, 11:04:29 AM
    Author     : win8.1
--%>

<%@page import="com.qt.jobportal.models.CandidateModel"%>
<%@page import="com.qt.jobportal.models.CandidateModel"%>
<%@page import="com.qt.jobportal.beans.tblSubscriptionCandidate"%>
<%@page import="com.qt.jobportal.models.SubscriptionCandidateModel"%>
<%@page import="com.qt.jobportal.beans.TblSubscription"%>
<%@page import="com.qt.jobportal.models.Subscription"%>
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

            //Job City
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
            
            Subscription subMol = new Subscription();
            ArrayList<TblSubscription> subscription = subMol.select();
           
            SubscriptionCandidateModel subCandMol = new SubscriptionCandidateModel();
            ArrayList<tblSubscriptionCandidate> subscriptionCand = subCandMol.select();
            
            CandidateModel member = new CandidateModel();
            ArrayList<Integer> membCount = member.MemberCount();

        %>

        <div class="container">
            <section class="search-sec">

                <div class="row">
                    <div class="col-lg-12">
                        <div class="tab-container">
                            <ul class="nav nav-tabs nav-tabs-classic" role="tablist">
                                <li class="nav-item"><a class="nav-link active" href="#findJobs" data-toggle="tab" role="tab">Find Jobs</a></li>
                                <li class="nav-item"><a class="nav-link" href="#candidate" data-toggle="tab" role="tab">Candidate</a></li>
                                <li class="nav-item"><a class="nav-link" href="#company" data-toggle="tab" role="tab">Company</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="findJobs" role="tabpanel">
                                    <div class="form-row">
                                        <div class="col-md-4">
                                            <input type="text" class="  search-query form-control" placeholder="Job Designation"/>  
                                        </div>                                      
                                        <div class="col-md-4">
                                            <select class=" form-control"  onchange="print_city('state', this.selectedIndex);" id="sts" name ="txtState" required >
                                            </select>  
                                        </div>                             
                                        <div class="col-md-4">   
                                            <div class="form-row">
                                                <div class="col-md-8">
                                                    <select id ="state" class="form-control" name="txtCity" required></select>
                                                </div>
                                                <div class="col-md-4">
                                                    <button class="btn btn-primary form-control" id="jobKeyword"><i class="icon mdi mdi-search" style="font-size:30px "></i><a href="#" onclick="searchByKeyword()" ></a></button>
                                                </div>
                                            </div> 
                                        </div>                               
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mt-3">
                                        <div class="jp_banner_main_jobs_wrapper">
                                            <div class="jp_banner_main_jobs">
                                                <ul>
                                                    <i class="fa fa-tags"></i> Trending Keywords :

                                                    <a href="#">Java,</a>

                                                    <a href="#">UI Designer,</a>

                                                    <a href="#">Developer,</a>

                                                    <a href="#">Senior</a>

                                                    <a href="#">IT Company,</a>

                                                    <a href="#">Design,</a>

                                                    <a href="#">Call Center</a>

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="candidate" role="tabpanel">
                                    <form method="post" action="CandidateController" name="frm">
                                        <div class="form-row">
                                            <div class="col-md-6">
                                                <input type="hidden" name="action" value="login">
                                                <input type="number" class=" form-control" placeholder="Phone Number" name ="txtPhoneNo" required>
                                            </div>                             
                                            <div class="col-md-6">   
                                                <div class="form-row">
                                                    <div class="col-md-8">
                                                        <input type="password" class=" form-control" placeholder="Password" name ="txtPassword" required>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <button type="submit" class="btn btn-primary form-control">Login</button>    </div>
                                                </div> 
                                            </div>
                                        </div>
                                    </form>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mt-3">
                                        <div class="jp_banner_main_jobs_wrapper">
                                            <div class="jp_banner_main_jobs">
                                                <ul>
                                                    <i class="fa fa-user"></i> Candidate :

                                                    <a href="candidate/candidateRegister.jsp">Sign up</a> ${param.msg}


                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="tab-pane" id="company" role="tabpanel">
                                    <form method="post" action="EmployerController" name="frm">
                                        <div class="form-row">
                                            <div class="col-md-6">
                                                <input type="hidden" name="action" value="login">
                                                <input type="number" class=" form-control" placeholder="Phone Number" name ="txtPhoneNo" required>
                                            </div>                             
                                            <div class="col-md-6">   
                                                <div class="form-row">
                                                    <div class="col-md-8">
                                                        <input type="password" class=" form-control" placeholder="Password" name ="txtPassword" required>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <button type="submit" class="btn btn-primary form-control">Login</button>
                                                    </div>
                                                </div> 
                                            </div>
                                        </div>
                                    </form>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mt-3">
                                        <div class="jp_banner_main_jobs_wrapper">
                                            <div class="jp_banner_main_jobs">
                                                <ul>
                                                    <i class="fa fa-building"></i> New Company :

                                                    <a href="employer/insertEmployer.jsp">Company Registration</a> ${param.msg}

                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </section>
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
            <!--Jobs card start here-->
            <section>
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
                                                    <td><div class="icon"><span class="mdi mdi-case mt-2">   <%= vacancy.getException()%>  </span></div></td>
                                                    <td <div class="icon"><span class="mdi mdi-pin mt-2 "> <%= vacancy.getException()%> </span></div></td>

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
                                    </div></a>
                            </div>

                        </div>
                        <%
                        } else {
                        %>
                        <div class="col-lg-6">
                            <div class="card card-border-color card-border-color-primary">
                                <input type="hidden" name="id" value="<%= vacancy.getId()%>">

                                <a href="jobDetails.jsp?id=<%= vacancy.getId()%> "><div class="card-body">
                                        <div class="form-group row">
                                            <div class="col-12">
                                                <span class="splash-title pb-4"><%= vacancy.getTitle()%></span>
                                            </div>
                                            <table class="table table-sm table-hover table-striped">

                                                <tbody>

                                                    <tr>
                                                        <td><div class="icon"><span class="mdi mdi-case mt-2">  <%= vacancy.getJobDescription()%>  </span></div></td>
                                                        <td <div class="icon"><span class="mdi mdi-pin mt-2 "> <%= vacancy.getJobCity()%> </span></div></td>

                                                    </tr>
                                                    <tr>
                                                        <td><div><i class="fa fa-building mt-2" style="font-size: 15px"><span> <%= vacancy.getCompanyName()%>  </span></i></div></td>
                                                        <td ><div> <i class="fa fa-rupee mt-2 " style="font-size:15px"><span>  <%= vacancy.getMinSalary()%>-<%= vacancy.getMaxSalary()%> </span></i></div></td>

                                                    </tr>
                                                    <tr>
                                                        <td><div class="icon"><span class="mdi mdi-graduation-cap mt-2">  <%= vacancy.getMinQualification()%>  </span></div></td>
                                                        <td> <div class="icon"><span class="mdi mdi-translate mt-2 mr-1"> <%= vacancy.getEnglishAccuracy()%> </span></div></td>
                                                    </tr>
                                                    <tr>
                                                        <td><div><i class="fa fa-list-alt mt-2" style="font-size: 15px"><span>  <%= vacancy.getExperience()%>  </span></i></div></td>
                                                        <td></td>
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
            </section>
            <!--Jobs card ends here-->

            <!-- counter jobs,company,candidates,members-->
            <section>
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Counter</h2>
                                <p>This is Photoshop's version of Lorem Ipsum. Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin,
                                    lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit.
                                    Duis sed odio sit amet nibh vulputate cursus a sit amet mauris. Morbi accumsan ipsum velit.
                                    Nam nec tellus a odio tincidunt auctor a ornare odio. Sed non enim.</p>
                                <a href="#" class="btn btn-primary">Get Started</a>
                            </div>
                            <div class="col-sm-6 pt-2">
                                <div class="row text-light ">
                                    <div class="col-sm-6">
                                        <div class="widget widget-tile bg-info ">

                                            <div class="chart sparkline " id="spark1"><span class="display-4 text-light"><i class="fa fa-star pt-2 "></i></span></div>
                                            <div class="data-info">
                                                <div class="desc">Jobs</div>
                                                <div class="value"><span class="indicator indicator-equal mdi mdi-chevron-right text-light"></span><span class="number" data-toggle="counter" data-end="113"><%= membCount.get(0)%></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="widget widget-tile bg-info">
                                            <div class="chart sparkline" id="spark1"><span class="display-4 text-light"><i class="fa fa-user pt-2 "></i></span></div>
                                            <div class="data-info">
                                                <div class="desc">Members</div>
                                                <div class="value"><span class="indicator indicator-equal mdi mdi-chevron-right text-light"></span><span class="number" data-toggle="counter" data-end="113"><%= membCount.get(1)%></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="widget widget-tile bg-info">
                                            <div class="chart sparkline" id="spark1"><span class="display-4 text-light"><i class="fa fa-paste pt-2 "></i></span></div>
                                            <div class="data-info">
                                                <div class="desc">Resumes</div>
                                                <div class="value"><span class="indicator indicator-equal mdi mdi-chevron-right text-light"></span><span class="number" data-toggle="counter" data-end="113"><%= membCount.get(2)%></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="widget widget-tile bg-info">
                                            <div class="chart sparkline" id="spark1"><span class="display-4 text-light"><i class="fa fa-building pt-2 "></i></span></div>
                                            <div class="data-info">
                                                <div class="desc">Companies</div>
                                                <div class="value"><span class="indicator indicator-equal mdi mdi-chevron-right text-light"></span><span class="number" data-toggle="counter" data-end="113"><%= membCount.get(3)%></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>   
                        </div>
                    </div>
                </div>
            </section>
            <!--counter ends here-->
            <!--plans starts here-->
            <div class="row">
                <%  for (TblSubscription subBean : subscription) {
                        if (subBean.getSerialNo() == -1 || subBean.getSerialNo() == 0) {
                %>

                <div class="col-sm-3">
                    <div class="pricing-table pricing-table-primary">
                        <div class="pricing-table-title blueEffect">Basic</div>
                        <div class="card-divider card-divider-xl"></div>
                        <div class="pricing-table-price "><span class="currency">&#8377;</span><span class="value blueEffect">5</span><span class="frecuency">/mo</span></div>
                        <div class="card-divider card-divider-xl"></div>
                        <ul class="pricing-table-features">
                            <li class="blueEffect2"><%= subBean.getException()%> Jobs Posting</li>
                            <li class="blueEffect2"><%= subBean.getException()%> Featured jobs</li>
                            <li class="blueEffect2"><%= subBean.getException()%> Renew Jobs</li>
                            <li class="blueEffect2"><%= subBean.getException()%> Days Duration</li>
                            <li class="blueEffect2"><%= subBean.getException()%>Email Alert</li>
                        </ul><a class="btn btn-outline-primary" href="employerLogin.jsp">Get Started</a>
                    </div>
                </div>
                <%
                } else {
                %>
                <div class="col-sm-3">
                    <div class="pricing-table pricing-table-warning">
                        <div class="pricing-table-title yellowEffect"><%= subBean.getTitle() %></div>
                        <div class="card-divider card-divider-xl"></div>
                        <div class="pricing-table-price "><span class="currency">&#8377;</span><span class="value yellowEffect">12</span><span class="frecuency">/mo</span></div>
                        <div class="card-divider card-divider-xl"></div>
                        <ul class="pricing-table-features">
                            <li class="yellowEffect2"><%= subBean.getActive_job_limit()%> Jobs Posting</li>
                            <li class="yellowEffect2"> <%= subBean.getSuggestion() %> Featured jobs</li>
                            <li class="yellowEffect2"><%= subBean.getVisibility()%> Renew Jobs</li>
                            <li class="yellowEffect2"><%= subBean.getSuggestion()%> Days Duration</li>
                            <li class="yellowEffect2">Email Alert</li>
                        </ul><a class="btn btn-outline-warning" href="employerLogin.jsp">Get Started</a>
                    </div>
                </div>
                <%
                        }
                    }
                %>   
               
                <hr>    

             
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
                        </ul><a class="btn btn-outline-primary" href="candidateLogin.jsp">Get Started</a>
                    </div>
                </div>
                <%
                } else {
                %>
                <div class="col-sm-3">
                    <div class="pricing-table pricing-table-warning">
                        <div class="pricing-table-title yellowEffect"><%= subCandBean.getTitle() %></div>
                        <div class="card-divider card-divider-xl"></div>
                        <div class="pricing-table-price "><span class="currency">&#8377;</span><span class="value yellowEffect">12</span><span class="frecuency">/mo</span></div>
                        <div class="card-divider card-divider-xl"></div>
                        <ul class="pricing-table-features">
                            <li class="yellowEffect2"><%= subCandBean.getPer_apply_price()%> Jobs Posting</li>
                            <li class="yellowEffect2"> <%= subCandBean.getValidity()%> Featured jobs</li>
                            <li class="yellowEffect2"><%= subCandBean.getVisibility()%> Renew Jobs</li>
                            <li class="yellowEffect2"><%= subCandBean.getSuggestion()%> Days Duration</li>
                            <li class="yellowEffect2">Email Alert</li>
                        </ul><a class="btn btn-outline-warning" href="candidateLogin.jsp?id=<%= subCandBean.getId() %>">Get Started</a>
                    </div>
                </div>
                <%
                        }
                    }
                %>   

                 
                <!--plans ends here-->
                <!--notification start here-->
                 <div class="container">
            <div class="card">
                <div class="card-body">
                        <form action="NotifyController" method="post">
                            <div class="row" id="notify">
                                <div class="col-sm-1">
                                    <i class="fa fa-bell p-2" style="font-size:30px"></i>
                                </div>
                                <div class="col-sm-11  pt-2 pb-2">
                                    <a href="#" class="text-dark">Get Jobs Notifications
                                        Free Subscribe Our Newsletter Now</a> <span>${param.message}</span>
                                </div>
                            </div>
                               <div class="row">
                                <div class="col-sm-3">
                                    
                                        <div class="form-group">
                                            <input type="hidden" name="action" value="insert" >
                                            <input type="text"  name="txtName" class="form-control mt-3" id="comment" placeholder="Enter Your Name">
                                        </div>
                                </div>
                                <div class="col-sm-3">
                                   
                                        <div class="form-group">
                                            <input type="email" name="txtEmail" class="form-control mt-3" id="comment" placeholder="Enter Your Email">
                                        </div>
                                </div>
                                <div class="col-sm-3">
                                            <div class="form-group row pt-1 mt-2 ml-1">
                                                <select class="form-control" name="sltCategory">
                                                        <option disabled>Select your Category</option>
                                                        <option value="All Jobs">All jobs</option>
                                                        <option value="Developer">Developer</option>
                                                        <option value="Technology">Technology</option>
                                                        <option value="Marketing">Marketing</option>
                                                        <option value="Government">Government</option>
                                                        <option value="Medical">Medical</option>
                                                    </select>
                                            </div>
                                </div>
                        <div class="col-sm-3">
                            <input class="btn btn-lg btn-primary btn-block mt-3" type="submit" value="Notify Me">
                        </div>
                           </div>  
                       </form>
                     </div>
               </div>
                    </div>
                    <!--footer start here-->
                    <div class="container bg-dark text-light">
                        <div class="row">
                            <div class="col-sm-3">
                                <h2>Who We Are</h2>
                                <p>This is Photoshop's version of Lom Ipsum. Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum.
                                    <br>
                                    <br>Proin akshay handge vel velit auctor aliquet. Aenean sollicitudin,</p>
                                <ul>
                                    <i class="fa fa-plus-circle"></i>  <a href="#">READ MORE</a>

                                </ul>
                            </div>
                            <div class="col-sm-3">
                                <h2>For candidate</h2>
                                <ul>
                                    <a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i> Add a Resume</a>
                                    <br>
                                    <a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i> candidate Dashboard</a>
                                    <br>
                                    <a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i> Past Applications</a>
                                    <br> 
                                    <a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i> Job Alerts</a>
                                    <br>
                                    <a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i> Bookmarks</a>
                                    <br>
                                    <a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i> My Account</a>
                                    <br>
                                    <a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i> Your Jobs</a>

                                </ul>
                            </div>
                            <div class="col-sm-3">
                                <h2>For Employers</h2>
                                <ul>
                                    <a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i> Browse candidates</a>
                                    <br>
                                    <a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i> Employer Dashboard</a>
                                    <br>
                                    <a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i> Add Job</a>
                                    <br>
                                    <a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i> Job Page</a>
                                    <br>
                                    <a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i> Job Packages</a>
                                    <br>
                                    <a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i> Work Process</a>
                                    <br>
                                    <a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i> My Account</a>

                                </ul>
                            </div>
                            <div class="col-sm-3">
                                <h2>Information</h2>
                                <ul>
                                    <a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i> About Us</a>
                                    <br>
                                    <a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i> Terms & Conditions</a>
                                    <br>
                                    <a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i> Privacy Policy</a>
                                    <br>
                                    <a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i> Careers with Us</a>
                                    <br> 
                                    <a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i> Sitemap</a>
                                    <br>
                                    <a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i> Contact Us</a>
                                    <br>
                                    <a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i> FAQs</a>

                                </ul>
                            </div>
                        </div>

                    </div>

                    <!--footer Wrapper End -->
                </div>
                <!--notification ends here-->

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
            <%--Shrutika file start
            <div class="row">
                <div class="col-12 col-md-8 offset-md-2">

                <div class="row">
                    <div class="col-12">
                        <div class="card card-border-color">
                            <div class="card-body">
                                <!--                                <form action="VacancyController" method="post">-->
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
                                                <a class="" href="#">
                                                    <i class="icon mdi mdi-account-add md-trigger" data-modal="md-flipV">
                                                        <label>profile</label>  
                                                    </i>
                                                </a>
                                            </div>
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

                    <div class="row">
                        <div class="col-sm-6 offset-3">
                            <select class=" form-control"  onchange="print_city('state', this.selectedIndex);" id="sts" name ="txtState" required >
                            </select>

                            <br>
                            <select id ="state" class="form-control" name="txtCity" required></select>
                            <br>
                            <center><button class="btn btn-primary btn-space modal-close" type="button"  data-dismiss="modal"
                                            <a href="#" onclick="searchByCity()" >Submit</button></center>
                        </div>
                    </div>


                </div>

            </div>
            <div class="modal-footer"></div>


            <div class="modal-overlay"></div>
        </div> --%>
    </body>
</html>
