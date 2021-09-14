<%-- 
    Document   : jobsSearch
    Created on : 20 Feb, 2020, 11:04:29 AM
    Author     : win8.1
--%>

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

<%
    //if (session.getAttribute("EmployerId") == null || session.getAttribute("EmployerId") == "null"  || session.getAttribute("CandidateId") == null || session.getAttribute("CandidateId") == "null") {
%>

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="assets/img/logo-fav.png">
        <title>Job Protal</title>
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
                            <div class="container card mt-3 p-2">
                            <div class="row">
                                <div class="col-6">
                                    <a href="candidateLogin.jsp" class="btn btn-lg btn-block btn-info mt-3 mb-3 text-light">Candidate Login</a>
                                     <i class="fa fa-user"></i>New Candidate :
                                     <a href="candidate/candidateSignUp.jsp" > Registration</a> 

                                    </div>
                                    <div class="col-6">

                                        <a href="employerLogin.jsp" class="btn btn-lg btn-block btn-info mt-3 mb-3 text-light">Employer Login</a>
                                        <i class="fa fa-building"></i> New Company :
                                        <a href="#companyPlan">Employer Subscription</a>
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
                                <a href="jobsSearch.jsp?title=Developer" onclick="searchByCategory('Developer')">
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
                                <a href="jobsSearch.jsp" onclick="searchByCategory('Technology')">
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
                                <a href="jobsSearch.jsp" onclick="searchByCategory('Marketing')">
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
                                <a href="jobsSearch.jsp" onclick="searchByCategory('Medical')">
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
                                <a href="jobsSearch.jsp" onclick="searchByCategory('Government')">
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
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div id="companyPlan">
                                <h1>Company plans</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

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
                        </ul><a class="btn btn-outline-primary" href="employerSignUp.jsp">Get Started</a>
                    </div>
                </div>
                <%
                } else {
                %>
                <div class="col-sm-3">
                    <div class="pricing-table pricing-table-warning">
                        <div class="pricing-table-title yellowEffect"><%= subBean.getTitle()%></div>
                        <div class="card-divider card-divider-xl"></div>
                        <div class="pricing-table-price "><span class="currency">&#8377;</span><span class="value yellowEffect"><%= subBean.getPrice()%></span><span class="frecuency"></span></div>
                        <div class="card-divider card-divider-xl"></div>
                        <ul class="pricing-table-features">
                            <li class="yellowEffect2"><%= subBean.getActive_job_limit()%> Jobs Posting</li>
                            <li class="yellowEffect2"> <%= subBean.getValidity_in_days()%> Validity</li>
                            <li class="yellowEffect2"><%= subBean.getSuggestion()%> </li>
                            <li class="yellowEffect2">Email Alert</li>
                        </ul><a class="btn btn-outline-warning" href="employer/employerSignUp.jsp?subscription_id=<%= subBean.getSubscription_id()%>">Get Started</a>
                    </div>
                </div>

                <%
                        }
                    }
                %>   
            </div> 

            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div id="candidatePlan">
                                <h1>Candidate plans</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br>

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
                        </ul><a class="btn btn-outline-primary" href="candidate/candidateRegister.jsp">Get Started</a>
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
                        </ul><a class="btn btn-outline-warning" href="candidate/candidateSignUp.jsp?cpid=<%= subCandBean.getSubCandPublicId()%>">Get Started</a>
                    </div>
                </div>

                <%
                        }
                    }
                %>   
            </div>
        </div>

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
                                            <input type="text"  name="txtName" class="form-control mt-3" id="comment" placeholder="Enter Your Name" required="">
                                        </div>
                                </div>
                                <div class="col-sm-3">
                                   
                                        <div class="form-group">
                                            <input type="email" name="txtEmail" class="form-control mt-3" id="comment" placeholder="Enter Your Email" required="">
                                        </div>
                                </div>
                                <div class="col-sm-3">
                                            <div class="form-group row pt-1 mt-2 ml-1">
                                                <select class="form-control" name="sltCategory" required="">
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
        <%@include file="footer.jsp" %>
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
</body>
</html>
<%
    // }else{
    //         if(session.getAttribute("EmployerId") == null || session.getAttribute("EmployerId") == "null"){
    //    response.sendRedirect("employer/employerDash.jsp?msg="+request.getParameter("msg"));
    //}else{
    //     response.sendRedirect("candidate/candidateDash.jsp?msg="+request.getParameter("msg"));
//} 
    //  }
%>  
