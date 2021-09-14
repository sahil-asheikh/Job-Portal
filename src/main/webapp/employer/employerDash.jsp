<%-- 
    Document   : employerDash
    Created on : 17 Feb, 2020, 5:04:00 PM
            sql = "UPDATE tblcandidate, tblcandidatedetails SET tblcandidate.fresherExperience = ? tblcandidatedetails.experience_details = ? WHERE candidate_id = ? ";

    Author     : win8.1
--%>

<%@page import="com.qt.jobportal.beans.TblEmployerDetails"%>
<%@page import="com.qt.jobportal.beans.TblSubscription"%>
<%@page import="com.qt.jobportal.models.Subscription"%>
<%@page import="com.qt.jobportal.beans.TblEmployer"%>
<%@page import="com.qt.jobportal.models.EmployerModel"%>
<%@page import="java.lang.Integer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.qt.jobportal.models.Vacancy"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <%@include file="head.jsp" %>
        <title>Job Portal</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


        <style>
            .symbol1{
                font-size: 50px;
            }
            .symbol2{
                font-size: 40px;
            }
            .symbol3{
                font-size: 30px;
            }

        </style>

    </head>
    <body>
        <div class="be-wrapper">
            <%@ include file = "navbar.jsp" %>
            <%@include file="sidebar.jsp" %>
            <div class="be-content">


                <div class="main-content container-fluid">

                    <!-- Main content starts here-->

                    <%
                        Vacancy vac = new Vacancy();
                        String empId = (String) session.getAttribute("EmployerId");
                        System.out.println(empId);
                        ArrayList<Integer> vCount = vac.VacancyCount(empId);

                        EmployerModel candMol = new EmployerModel();
                        TblEmployer bean = candMol.selectById(String.valueOf(session.getAttribute("EmployerId")));

                        TblEmployerDetails empDetails = candMol.selectEmployerDetailsById(String.valueOf(session.getAttribute("EmployerId")));

                        Subscription subMol = new Subscription();
                        TblSubscription subscription = subMol.selectById(bean.getSubscriptionId());

                    %>


                    <div class="row">
                        <div class="col-md-4">
                            <div class="widget widget-tile">
                                <div class="chart sparkline"><i class= "fa fa-bell text-warning symbol1"></i></div>
                                <div class="data-info">
                                    <div class="desc"><strong>Total Responses</strong></div>
                                    <div class="value"><span class="indicator indicator-equal mdi mdi-chevron-right"></span>
                                        <span class="number" data-toggle="" ><%= vCount.get(0)%></span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="widget widget-tile">
                                <div class="chart sparkline"><i class="mdi mdi-accounts-list-alt text-primary symbol1"></i></div>
                                <div class="data-info">
                                    <div class="desc"><strong>Total Jobs</strong></div>
                                    <div class="value">
                                        <span class="indicator indicator-positive mdi mdi-chevron-right"></span>
                                        <span class="number" data-toggle=""><%= vCount.get(0)%></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>   
                    <div class="row">
                        <div class="col-md-4">
                            <div class="widget widget-tile">
                                <div class="chart sparkline"><i class="text-info fa fa-users symbol1"></i></div>
                                <div class="data-info">
                                    <div class="desc"><strong>Active Jobs</strong></div>
                                    <div class="value"><span class="indicator indicator-positive mdi mdi-chevron-right"></span>
                                        <span class="number" data-toggle=""><%= vCount.get(1)%></span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="widget widget-tile">
                                <div class="chart sparkline"><span class="mdi mdi-collection-plus text-success symbol1"></span></div>
                                <div class="data-info">
                                    <div class="desc"><strong> De-active Jobs</strong></div>
                                    <div class="value"><span class="indicator indicator-positive mdi mdi-chevron-right"></span>
                                        <span class="number" data-toggle="" ><%= vCount.get(2)%></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <%

                        int stat = 20;

                        if (bean.getSubscriptionId() != null && bean.getSubscriptionId() != "null" && bean.getSubscriptionId() != "") {
                            stat += 20;
                        }
                        if (bean.getPhoneNo() != null && bean.getPhoneNo() != "null" && bean.getPhoneNo() != "") {
                            stat += 30;
                        }
                        if (empDetails.getCompany_summary() != null && empDetails.getCompany_summary() != "null" && empDetails.getCompany_summary() != "") {
                            stat += 30;
                        }
                    %>


                    <%
                        if (bean.getSubscriptionId() == null || bean.getSubscriptionId() == "null") {
                    %>
                    <div class="card mt-3">
                        <div class="card-header">Profile Status</div>
                        <div class="row">
                            <div class="col-8">
                                <div class="progress mb-4 ml-2">
                                    <div class="progress-bar bg-grey progress-bar-striped progress-bar-animated" role="progressbar" style="width: <%= stat%>%;" aria-valuenow="<%= stat%>" aria-valuemin="0" aria-valuemax="100">Completed <%= stat%></div>
                                </div>
                            </div>
                            <div class="col-3">
                                <a class="btn btn-primary text-light btn-sm" href="updateEmployer.jsp">Complete</a> 
                            </div>
                            <div class="col-1"></div>
                        </div>
                    </div>                
                    <div class="card ">
                        <div class="user-info-list">
                            <div class="card-header card-header-divider"> Subscription<span class="card-subtitle">Have not  subscribe any plan <br> To Subscribe <a href="subscriptionPrice.jsp" type="button">Plan</a></span></div>

                        </div>
                    </div>
                    <%
                    } else {
                    %>
                    <div class="card mt-3"> 
                        <div class="card-header">Profile Status</div>
                        <div class="row">

                            <%
                                if (stat == 100) {
                            %>

                            <div class="col-8">
                                <div class="progress mb-4 ml-2">
                                    <div class="progress-bar bg-success progress-bar-striped progress-bar-animated" role="progressbar" style="width: 100%;" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">Completed 100%</div>
                                </div>
                            </div>

                            <div class="">
                                <p class="btn-success text-light btn-sm">Completed</p>
                            </div>
                            <%
                            } else if (stat == 70) {
                            %>
                            <div class="col-8">
                                <div class="progress mb-4 ml-2">
                                    <div class="progress-bar bg-primary progress-bar-striped progress-bar-animated" role="progressbar" style="width: <%= stat%>%;" aria-valuenow="<%= stat%>" aria-valuemin="0" aria-valuemax="100">Completed <%= stat%>%</div>
                                </div>
                            </div>

                            <div class="col-3">
                                <a class="btn btn-primary text-light btn-sm" href="profile.jsp">Complete</a> 
                            </div>
                            <%
                            } else if (stat == 40) {
                            %>
                            <div class="col-8">
                                <div class="progress mb-4 ml-2">
                                    <div class="progress-bar bg-warning progress-bar-striped progress-bar-animated" role="progressbar" style="width: <%= stat%>%;" aria-valuenow="<%= stat%>" aria-valuemin="0" aria-valuemax="100">Completed <%= stat%>%</div>
                                </div>
                            </div>

                            <div class="col-3">
                                <a class="btn btn-warning text-light btn-sm" href="profile.jsp">Complete</a> 
                            </div>

                            <%
                            } else if (stat == 20) {
                            %>
                            <div class="col-8">
                                <div class="progress mb-4 ml-2">
                                    <div class="progress-bar bg-grey progress-bar-striped progress-bar-animated" role="progressbar" style="width: <%= stat%>%;" aria-valuenow="<%= stat%>" aria-valuemin="0" aria-valuemax="100">Completed <%= stat%>%</div>
                                </div>
                            </div>

                            <div class="col-3">
                                <a class="btn btn-grey text-light btn-sm" href="profile.jsp">Complete</a> 
                            </div>
                            <%
                            } else {
                            %>

                            <div class="col-8">
                                <div class="progress mb-4 ml-2">
                                    <div class="progress-bar bg-danger progress-bar-striped progress-bar-animated" role="progressbar" style="width: <%= stat%>%;" aria-valuenow="<%= stat%>" aria-valuemin="0" aria-valuemax="100">Completed <%= stat%>%</div>
                                </div>
                            </div>

                            <div class="col-3">
                                <a class="btn btn-danger text-light btn-sm" href="profile.jsp">Complete</a> 
                            </div>
                            <%
                                }
                            %>

                            <div class="col-1"></div>
                        </div>
                    </div>     
                    <div class="row">
                        <div class="col-6">
                            <div class="card card-contrast">
                                <div class="card-header  text-primary card-header-contrast card-header-featured">Active Plan</div>
                                <ul class="pricing-table-features text-center">
                                    <li class="blueEffect2"><%= subscription.getTitle()%></li>
                                    <li class="blueEffect2">2 Featured jobs</li>
                                    <li class="blueEffect2">1 Renew Jobs</li>
                                    <li class="blueEffect2">10 Days Duration</li>
                                    <li class="blueEffect2">Email Alert</li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="card card-contrast">
                                <div class="card-header  text-primary card-header-contrast card-header-featured">Wallet Balance</div>
                                <div class="pricing-table-price text-center"><span class="currency"></span>
                                    <span class="value blueEffect ">&#8377; <%= bean.getBalance()%></span></div>
                                <div class="card-divider card-divider-xl"></div>

                                <ul class="pricing-table-features">
                                    <li class="blueEffect2 text-center">Valid Till : 04/04/2020</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <%}%>

            </div>
        </div>
        <!-- Main content ends here -->

        <nav class="be-right-sidebar">
            <div class="sb-content">
                <div class="tab-navigation">
                    <ul class="nav nav-tabs nav-justified" role="tablist">
                        <li class="nav-item" role="presentation"><a class="nav-link active" href="#tab1" aria-controls="tab1" role="tab" data-toggle="tab">Chat</a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="#tab2" aria-controls="tab2" role="tab" data-toggle="tab">Todo</a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="#tab3" aria-controls="tab3" role="tab" data-toggle="tab">Settings</a></li>
                    </ul>
                </div>
                <div class="tab-panel">
                    <div class="tab-content">
                        <div class="tab-pane tab-chat active" id="tab1" role="tabpanel">
                            <div class="chat-contacts">
                                <div class="chat-sections">
                                    <div class="be-scroller-chat">
                                        <div class="content">
                                            <h2>Recent</h2>
                                            <div class="contact-list contact-list-recent">
                                                <div class="user"><a href="#"><img src="../assets/img/avatar1.png" alt="Avatar">
                                                        <div class="user-data"><span class="status away"></span><span class="name">Claire Sassu</span><span class="message">Can you share the...</span></div></a></div>
                                                <div class="user"><a href="#"><img src="../assets/img/avatar2.png" alt="Avatar">
                                                        <div class="user-data"><span class="status"></span><span class="name">Maggie jackson</span><span class="message">I confirmed the info.</span></div></a></div>
                                                <div class="user"><a href="#"><img src="../assets/img/avatar3.png" alt="Avatar">
                                                        <div class="user-data"><span class="status offline"></span><span class="name">Joel King		</span><span class="message">Ready for the meeti...</span></div></a></div>
                                            </div>
                                            <h2>Contacts</h2>
                                            <div class="contact-list">
                                                <div class="user"><a href="#"><img src="../assets/img/avatar4.png" alt="Avatar">
                                                        <div class="user-data2"><span class="status"></span><span class="name">Mike Bolthort</span></div></a></div>
                                                <div class="user"><a href="#"><img src="../assets/img/avatar5.png" alt="Avatar">
                                                        <div class="user-data2"><span class="status"></span><span class="name">Maggie jackson</span></div></a></div>
                                                <div class="user"><a href="#"><img src="../assets/img/avatar6.png" alt="Avatar">
                                                        <div class="user-data2"><span class="status offline"></span><span class="name">Jhon Voltemar</span></div></a></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="bottom-input">
                                    <input type="text" placeholder="Search..." name="q"><span class="mdi mdi-search"></span>
                                </div>
                            </div>
                            <div class="chat-window">
                                <div class="title">
                                    <div class="user"><img src="../assets/img/avatar2.png" alt="Avatar">
                                        <h2>Maggie Jackson</h2><span>Active 1h ago</span>
                                    </div><span class="icon return mdi mdi-chevron-left"></span>
                                </div>
                                <div class="chat-messages">
                                    <div class="be-scroller-messages">
                                        <div class="content">
                                            <ul>
                                                <li class="friend">
                                                    <div class="msg">Hello</div>
                                                </li>
                                                <li class="self">
                                                    <div class="msg">Hi, how are you?</div>
                                                </li>
                                                <li class="friend">
                                                    <div class="msg">Good, I'll need support with my pc</div>
                                                </li>
                                                <li class="self">
                                                    <div class="msg">Sure, just tell me what is going on with your computer?</div>
                                                </li>
                                                <li class="friend">
                                                    <div class="msg">I don't know it just turns off suddenly</div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="chat-input">
                                    <div class="input-wrapper"><span class="photo mdi mdi-camera"></span>
                                        <input type="text" placeholder="Message..." name="q" autocomplete="off"><span class="send-msg mdi mdi-mail-send"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane tab-todo" id="tab2" role="tabpanel">
                            <div class="todo-container">
                                <div class="todo-wrapper">
                                    <div class="be-scroller-todo">
                                        <div class="todo-content"><span class="category-title">Today</span>
                                            <ul class="todo-list">
                                                <li>
                                                    <div class="custom-checkbox custom-control custom-control-sm"><span class="delete mdi mdi-delete"></span>
                                                        <input class="custom-control-input" type="checkbox" checked="" id="tck1">
                                                        <label class="custom-control-label" for="tck1">Initialize the project</label>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="custom-checkbox custom-control custom-control-sm"><span class="delete mdi mdi-delete"></span>
                                                        <input class="custom-control-input" type="checkbox" id="tck2">
                                                        <label class="custom-control-label" for="tck2">Create the main structure							</label>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="custom-checkbox custom-control custom-control-sm"><span class="delete mdi mdi-delete"></span>
                                                        <input class="custom-control-input" type="checkbox" id="tck3">
                                                        <label class="custom-control-label" for="tck3">Updates changes to GitHub							</label>
                                                    </div>
                                                </li>
                                            </ul><span class="category-title">Tomorrow</span>
                                            <ul class="todo-list">
                                                <li>
                                                    <div class="custom-checkbox custom-control custom-control-sm"><span class="delete mdi mdi-delete"></span>
                                                        <input class="custom-control-input" type="checkbox" id="tck4">
                                                        <label class="custom-control-label" for="tck4">Initialize the project							</label>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="custom-checkbox custom-control custom-control-sm"><span class="delete mdi mdi-delete"></span>
                                                        <input class="custom-control-input" type="checkbox" id="tck5">
                                                        <label class="custom-control-label" for="tck5">Create the main structure							</label>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="custom-checkbox custom-control custom-control-sm"><span class="delete mdi mdi-delete"></span>
                                                        <input class="custom-control-input" type="checkbox" id="tck6">
                                                        <label class="custom-control-label" for="tck6">Updates changes to GitHub							</label>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="custom-checkbox custom-control custom-control-sm"><span class="delete mdi mdi-delete"></span>
                                                        <input class="custom-control-input" type="checkbox" id="tck7">
                                                        <label class="custom-control-label" for="tck7" title="This task is too long to be displayed in a normal space!">This task is too long to be displayed in a normal space!							</label>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="bottom-input">
                                    <input type="text" placeholder="Create new task..." name="q"><span class="mdi mdi-plus"></span>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane tab-settings" id="tab3" role="tabpanel">
                            <div class="settings-wrapper">
                                <div class="be-scroller-settings"><span class="category-title">General</span>
                                    <ul class="settings-list">
                                        <li>
                                            <div class="switch-button switch-button-sm">
                                                <input type="checkbox" checked="" name="st1" id="st1"><span>
                                                    <label for="st1"></label></span>
                                            </div><span class="name">Available</span>
                                        </li>
                                        <li>
                                            <div class="switch-button switch-button-sm">
                                                <input type="checkbox" checked="" name="st2" id="st2"><span>
                                                    <label for="st2"></label></span>
                                            </div><span class="name">Enable notifications</span>
                                        </li>
                                        <li>
                                            <div class="switch-button switch-button-sm">
                                                <input type="checkbox" checked="" name="st3" id="st3"><span>
                                                    <label for="st3"></label></span>
                                            </div><span class="name">Login with Facebook</span>
                                        </li>
                                    </ul><span class="category-title">Notifications</span>
                                    <ul class="settings-list">
                                        <li>
                                            <div class="switch-button switch-button-sm">
                                                <input type="checkbox" name="st4" id="st4"><span>
                                                    <label for="st4"></label></span>
                                            </div><span class="name">Email notifications</span>
                                        </li>
                                        <li>
                                            <div class="switch-button switch-button-sm">
                                                <input type="checkbox" checked="" name="st5" id="st5"><span>
                                                    <label for="st5"></label></span>
                                            </div><span class="name">Project updates</span>
                                        </li>
                                        <li>
                                            <div class="switch-button switch-button-sm">
                                                <input type="checkbox" checked="" name="st6" id="st6"><span>
                                                    <label for="st6"></label></span>
                                            </div><span class="name">New comments</span>
                                        </li>
                                        <li>
                                            <div class="switch-button switch-button-sm">
                                                <input type="checkbox" name="st7" id="st7"><span>
                                                    <label for="st7"></label></span>
                                            </div><span class="name">Chat messages</span>
                                        </li>
                                    </ul><span class="category-title">Workflow</span>
                                    <ul class="settings-list">
                                        <li>
                                            <div class="switch-button switch-button-sm">
                                                <input type="checkbox" name="st8" id="st8"><span>
                                                    <label for="st8"></label></span>
                                            </div><span class="name">Deploy on commit</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </nav>

    </div>
    <%@include file="footer.jsp" %>
    <script src="../assets/lib/countup/countUp.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            //-initialize the javascript
            App.dashboard();

        });
    </script>

</body>
</html>
