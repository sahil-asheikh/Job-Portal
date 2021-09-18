<%-- 
    Document   : candidateView
    Created on : 19 Feb, 2020, 11:58:33 AM
    Author     : win8.1
--%>

<%@page import="com.qt.jobportal.beans.TblCandidate"%>
<%@page import="com.qt.jobportal.models.CandidateModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
       <link rel="stylesheet" type="text/css" href="../assets/lib/perfect-scrollbar/css/perfect-scrollbar.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/material-design-icons/css/material-design-iconic-font.min.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/datatables/datatables.net-bs4/css/dataTables.bootstrap4.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/datatables/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css"/>
        <link rel="stylesheet" href="../assets/css/app.css" type="text/css"/>

        <meta name="description" content="">
        <title>View More</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>
        <%
            CandidateModel candidate = new CandidateModel();
            TblCandidate beanCandidate = candidate.selectById(request.getParameter("cid"));

        %>

        <div class="be-wrapper">
            <%@include file="navbar.jsp" %>
            <%@include file="sidebar.jsp" %>

            <div class="be-content">
                <div class="main-content container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card card-border-color card-border-color-primary">
                                <div class="card-header card-header-divider text-center">Subscription Details</div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <table class="table table-sm table-striped">

                                                <tbody>
                                                    <tr>
                                                        <td class="icon"><span class="mdi mdi-star"></span></td>
                                                        <td class="item">Full Name<span class="icon s7-phone"></span></td>
                                                        <td><%= (beanCandidate.getFullName() == null || beanCandidate.getFullName() == "null" || beanCandidate.getFullName() == "") ? "Haven't added" : beanCandidate.getFullName()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="icon"><span class="mdi mdi-accounts"></span></td>
                                                        <td class="item">Phone Number<span class="icon s7-phone"></span></td>
                                                        <td><%= (beanCandidate.getPhone_No() == null || beanCandidate.getPhone_No() == "null" || beanCandidate.getPhone_No() == "") ? "Haven't added" : beanCandidate.getPhone_No()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="icon"><span class="mdi mdi-accounts"></span></td>
                                                        <td class="item">State<span class="icon s7-phone"></span></td>
                                                        <td><%= (beanCandidate.getState() == null || beanCandidate.getState() == "null" || beanCandidate.getState() == "") ? "Haven't added" : beanCandidate.getState()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="icon"><span class="mdi mdi-accounts"></span></td>
                                                        <td class="item">City<span class="icon s7-phone"></span></td>
                                                        <td><%= (beanCandidate.getCity() == null || beanCandidate.getCity() == "null" || beanCandidate.getCity() == "") ? "Haven't added" : beanCandidate.getCity()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="icon"><span class="mdi mdi-skype"></span></td>
                                                        <td class="item">Address<span class="icon s7-phone"></span></td>
                                                        <td><%= (beanCandidate.getAddress() == null || beanCandidate.getAddress() == "null" || beanCandidate.getAddress() == "") ? "Haven't added" : beanCandidate.getAddress()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="icon"><span class="mdi mdi-globe"></span></td>
                                                        <td class="item">Age<span class="icon s7-phone"></span></td>
                                                        <td><%= (beanCandidate.getAge() == 0) ? "Haven't added" : beanCandidate.getAge()%></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-sm-6">
                                            <table class="table table-sm table-striped">
                                                <tbody>
                                                    <tr>
                                                        <td class="icon"><span class=" fa fa-globe"></span></td>
                                                        <td class="item">Gender<span class="icon s7-phone"></span></td>
                                                        <td><%= (beanCandidate.getGender() == null || beanCandidate.getGender() == "null" || beanCandidate.getGender() == "") ? "Haven't added" : beanCandidate.getGender()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="icon"><span class="mdi mdi-globe"></span></td>
                                                        <td class="item">Qualification<span class="icon s7-phone"></span></td>
                                                        <td><%= (beanCandidate.getQualification() == null || beanCandidate.getQualification() == "null" || beanCandidate.getQualification() == "") ? "Haven't added" : beanCandidate.getQualification()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="icon"><span class="mdi mdi-globe"></span></td>
                                                        <td class="item">School Medium<span class="icon s7-phone"></span></td>
                                                        <td><%= (beanCandidate.getSchoolMedium() == null || beanCandidate.getSchoolMedium() == "null" || beanCandidate.getSchoolMedium() == "") ? "Haven't added" : beanCandidate.getSchoolMedium()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="icon"><span class="mdi mdi-city"></span></td>
                                                        <td class="item">English Skill<span class="icon s7-phone"></span></td>
                                                        <td><%= (beanCandidate.getEnglishSkill() == null || beanCandidate.getEnglishSkill() == "null" || beanCandidate.getEnglishSkill() == "") ? "Haven't added" : beanCandidate.getEnglishSkill()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="icon"><span class="mdi mdi-globe"></span></td>
                                                        <td class="item">Fresher/Experience<span class="icon s7-phone"></span></td>
                                                        <td><%= (beanCandidate.getFresherExperience() == null || beanCandidate.getFresherExperience() == "null" || beanCandidate.getFresherExperience() == "") ? "Haven't added" : beanCandidate.getFresherExperience()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="icon"><span class="mdi mdi-globe"></span></td>
                                                        <td class="item">Job Role<span class="icon s7-phone"></span></td>
                                                        <td><%= (beanCandidate.getJobRole() == null || beanCandidate.getJobRole() == "null" || beanCandidate.getJobRole() == "") ? "Haven't added" : beanCandidate.getJobRole()%></td>
                                                    </tr>

                                                </tbody>
                                            </table>
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
</div>
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
                                        <div class="user"><a href="#"><img src="assets/img/avatar1.png" alt="Avatar">
                                                <div class="user-data"><span class="status away"></span><span class="name">Claire Sassu</span><span class="message">Can you share the...</span></div></a></div>
                                        <div class="user"><a href="#"><img src="assets/img/avatar2.png" alt="Avatar">
                                                <div class="user-data"><span class="status"></span><span class="name">Maggie jackson</span><span class="message">I confirmed the info.</span></div></a></div>
                                        <div class="user"><a href="#"><img src="assets/img/avatar3.png" alt="Avatar">
                                                <div class="user-data"><span class="status offline"></span><span class="name">Joel King		</span><span class="message">Ready for the meeti...</span></div></a></div>
                                    </div>
                                    <h2>Contacts</h2>
                                    <div class="contact-list">
                                        <div class="user"><a href="#"><img src="assets/img/avatar4.png" alt="Avatar">
                                                <div class="user-data2"><span class="status"></span><span class="name">Mike Bolthort</span></div></a></div>
                                        <div class="user"><a href="#"><img src="assets/img/avatar5.png" alt="Avatar">
                                                <div class="user-data2"><span class="status"></span><span class="name">Maggie jackson</span></div></a></div>
                                        <div class="user"><a href="#"><img src="assets/img/avatar6.png" alt="Avatar">
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
                            <div class="user"><img src="assets/img/avatar2.png" alt="Avatar">
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
<%@include file="footer.jsp" %> </body>
</html>
