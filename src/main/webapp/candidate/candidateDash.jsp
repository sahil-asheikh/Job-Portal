<%-- 
    Document   : candidateDash
    Created on : 17 Feb, 2020, 5:06:14 PM
    Author     : win8.1
--%>

<%@page import="com.qt.jobportal.beans.TblCandidateDetails"%>
<%@page import="com.qt.jobportal.beans.TblCandidatePlan"%>
<%@page import="com.qt.jobportal.beans.tblSubscriptionCandidate"%>
<%@page import="com.qt.jobportal.models.SubscriptionCandidateModel"%>
<%@page import="com.qt.jobportal.beans.TblJobActivity"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.qt.jobportal.models.JobActivity"%>
<%@page import="com.qt.jobportal.beans.TblCandidate"%>
<%@page import="com.qt.jobportal.models.CandidateModel"%>
<%
    if (session.getAttribute("CandidateId") == "null" || session.getAttribute("CandidateId") == null) {
        response.sendRedirect("../index.jsp?msg=Login Frist");
    }
%>
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
        <style>
            .blueEffect:hover {
                color:#146fff ;
                font-size: 40px;
                font-style: arial;
            }
            .blueEffect2:hover {
                color:#146fff ;
                font-size: 20px;
                font-style: arial;
            }

        </style>

    </head>
    <body>
        <%
            CandidateModel candMol = new CandidateModel();
            TblCandidate bean = candMol.selectById(String.valueOf(session.getAttribute("CandidateId")));
            System.out.println(session.getAttribute("CandidateId"));

            JobActivity jobMod = new JobActivity();
            //          TblJobActivity beans=actMod.selectById(String.valueOf(session.getAttribute("CandidateId")));
            ArrayList<TblJobActivity> beans = jobMod.selectByCandidateIds(String.valueOf(session.getAttribute("CandidateId")));
            System.out.println(session.getAttribute("CandidateId"));

            SubscriptionCandidateModel subMol = new SubscriptionCandidateModel();
            tblSubscriptionCandidate subscription = subMol.selectById(bean.getSubscriptionId());


        %>   
        <div class="be-wrapper">
            <%@ include file = "navbar.jsp" %>
            <%@include file="sidebar.jsp" %>
            <!-- Main content starts here-->
            <div class="be-content">
                <div class="main-content container-fluid">

                    <div class="col-lg-10 offset-1">
                        <div class="user-profile">
                            <div class="user-display">
                                <div class="user-display-bg"><img src="../assets/img/user-profile-display.png" alt="Profile Background"></div>
                                <div class="user-display-bottom">
                                    <div class="user-display-avatar"><img src="../assets/img/avatar-150.png" alt="Avatar"></div>
                                    <div class="user-display-info">
                                        <input type="hidden" name="CandidateId" value="<%= session.getAttribute("CandidateId")%>" >
                                        <div class="name"> <%= session.getAttribute("CandidateName")%> </div>

                                        <div  class="blockquote"><span class="mdi mdi-account">&nbsp;<%= bean.getEmailId()%></span> </div>
                                        <p class="text-success text-right">${param.msg}</p>
                                    </div>

                                    <div class="row">
                                        <div class="col-4 offset-8">
<!--                                            <a class="btn btn-secondary btn-sm btn-warning " type="button"   href="candidateUpdate.jsp?id=<%= session.getAttribute("CandidateId")%>">

                                                <div class="icon-sm">
                                                    <span class="mdi mdi-edit"> &nbsp;Edit Profile</span>
                                                </div>
                                            </a>-->
                                            <a class="btn btn-secondary btn-sm btn-info " type="button"   href="passwordUpdate.jsp?id=<%= session.getAttribute("CandidateId")%>">

                                                <div class="icon-sm">
                                                    <span class="mdi mdi-edit">&nbsp;Change Password</span>
                                                </div>
                                            </a>
                                            <!--condition for resume-->
                                            <%
                                                boolean checkResume = CandidateModel.resumeAvailable(session.getAttribute("CandidateId").toString());
                                                if (checkResume) {
                                                    String resumeDownloadPath = CandidateModel.getResume(session.getAttribute("CandidateId").toString()).toString();
                                            %>
                                            <!--Pending work: have to shift storage folder inside the project-->
                                            <input type="hidden" name="id" value="${param.id}">
                                            <a class="btn btn-secondary btn-sm btn-info " type="button" href="<%= resumeDownloadPath%>" download>
                                                <!--<a class="btn btn-secondary btn-sm btn-info " type="button" href="candActivity.jsp" download>-->
                                                <div class="icon-sm">
                                                    <span class="mdi mdi-edit"> See Resume</span>
                                                </div>
                                            </a>

                                            <%
                                                }
                                            %>
                                            <!--condition for resume-->
                                        </div>

                                    </div>


                                </div>
                            </div>

                            <!--=================================================================================================================================================================================-->
                            <!--=================================================================================================================================================================================-->


                            <div class="card mt-3">
                                <div class="card-header">Profile Status</div>
                                <div class="row">

                                    <div class="col-8">
                                        <div class="progress mb-4 ml-2">

                                            <%
                                                TblCandidateDetails candidateDetails = CandidateModel.selectCandDet(session.getAttribute("CandidateId").toString());

                                                int percentage = 20;

                                                if (bean.getSubscriptionId() != null && bean.getSubscriptionId() != "null" && bean.getSubscriptionId() != "") {
                                                    percentage += 20;
                                                }
                                                if (candidateDetails.getSummary() != null && candidateDetails.getSummary() != "null" && candidateDetails.getSummary() != "") {
                                                    percentage += 10;
                                                }
                                                if (bean.getJobRole() != null && bean.getJobRole() != "null" && bean.getJobRole() != "") {
                                                    percentage += 10;
                                                }
                                                if (bean.getSchoolMedium() != null && bean.getSchoolMedium() != "null" && bean.getSchoolMedium() != "") {
                                                    percentage += 10;
                                                }
                                                if (candidateDetails.getExperience() != null && candidateDetails.getExperience() != "null" && candidateDetails.getExperience() != "") {
                                                    percentage += 10;
                                                }
                                                if (bean.getSkillSet() != null && bean.getSkillSet() != "null" && bean.getSkillSet() != "") {
                                                    percentage += 10;
                                                }
                                                if (bean.getAddress() != null && bean.getAddress() != "null" && bean.getAddress() != "") {
                                                    percentage += 10;
                                                }


                                            %>

                                            <% if (percentage == 20) {%>
                                            <div class="progress-bar bg-grey progress-bar-striped progress-bar-animated" role="progressbar" style="width: 20%;" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">Completed 20%</div>
                                            <%} else if (percentage == 30) {%>
                                            <div class="progress-bar bg-secondary progress-bar-striped progress-bar-animated" role="progressbar" style="width: 30%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">Completed 30%</div>
                                            <%} else if (percentage == 40) {%>
                                            <div class="progress-bar bg-secondary progress-bar-striped progress-bar-animated" role="progressbar" style="width: 40%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">Completed 40%</div>
                                            <%} else if (percentage == 50) {%>
                                            <div class="progress-bar bg-warning progress-bar-striped progress-bar-animated" role="progressbar" style="width: 50%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">Completed 50%</div>
                                            <%} else if (percentage == 60) {%>
                                            <div class="progress-bar bg-warning progress-bar-striped progress-bar-animated" role="progressbar" style="width: 60%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">Completed 60%</div>
                                            <%} else if (percentage == 70) {%>
                                            <div class="progress-bar bg-primary progress-bar-striped progress-bar-animated" role="progressbar" style="width: 70%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">Completed 70%</div>
                                            <%} else if (percentage == 80) {%>
                                            <div class="progress-bar bg-primary progress-bar-striped progress-bar-animated" role="progressbar" style="width: 80%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">Completed 80%</div>
                                            <%} else if (percentage == 90) {%>
                                            <div class="progress-bar bg-success progress-bar-striped progress-bar-animated" role="progressbar" style="width: 90%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">Completed 90%</div>
                                            <%} else if (percentage == 100) {%>
                                            <div class="progress-bar bg-success progress-bar-striped progress-bar-animated" role="progressbar" style="width: 100%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">Completed 100%</div>
                                            <%}%>
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <% if (percentage == 100) {%>
                                        <a class="btn btn-success text-light btn-sm" >Completed</a>
                                        <% } else { %>
                                        <a class="btn btn-primary text-light btn-sm" href="../candidate/profile.jsp">Complete</a> 
                                        <% } %>
                                    </div>
                                    <div class="col-1"></div>
                                </div>
                            </div>

                            <%if (bean.getSubscriptionId() == null || bean.getSubscriptionId() == "null" || bean.getSubscriptionId() == "") {%>
                            <div class="card ">
                                <div class="user-info-list">
                                    <div class="card-header card-header-divider"> Subscription<span class="card-subtitle">Have not  subscribe any plan <br> To Subscribe <a href="candidateSubscription.jsp" type="button">Plan</a></span></div>

                                </div>
                            </div>
                            <%} else {
                                CandidateModel eMol = new CandidateModel();
                                TblCandidatePlan myPlan = eMol.selectMyPlan(String.valueOf(session.getAttribute("CandidateId")));
                            %>

                            <div class="row">
                                <div class="col-6">
                                    <div class="card card-contrast">
                                        <div class="card-header  text-primary card-header-contrast card-header-featured">Active Plan</div>
                                        <ul class="pricing-table-features text-center">
                                            <li class="blueEffect2 text-info"><b><%= myPlan.getPlanTitle()%></b></li>
                                            <li class="yellowEffect2">Available Balance: <%= myPlan.getAvailableBalance()%> </li>
                                            <li class="yellowEffect2">Per Apply Deduction: <%= myPlan.getPerApplyDeduction()%> </li>

                                            <li class="yellowEffect2">Activation Date: <%= myPlan.getStartDate()%> </li>

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
                                            <li class="yellowEffect2"><center>Expiry Date : <%= myPlan.getEndDate()%></center></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%}%>
                        <!--             End Mian Content --->
                    </div>
                </div>

            </div>
        </div>
        <!-- Main content ends here -->
        <!-- sidebar start here-->
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
                                        <h2>Maggie jackson</h2><span>Active 1h ago</span>
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
