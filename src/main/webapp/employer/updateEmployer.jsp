<%-- 
    Document   : employer.jsp
    Created on : 23 Jan, 2020, 4:42:19 PM
    Author     : Asus
--%>

<%@page import="com.qt.jobportal.beans.TblSubscription"%>
<%@page import="com.qt.jobportal.models.Subscription"%>
<%@page import="com.qt.jobportal.beans.TblEmployer"%>
<%@page import="com.qt.jobportal.models.EmployerModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="description" content="">
        <title>Employer</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="../assets/lib/perfect-scrollbar/css/perfect-scrollbar.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/material-design-icons/css/material-design-iconic-font.min.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/datatables/datatables.net-bs4/css/dataTables.bootstrap4.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/datatables/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css"/>
        <link rel="stylesheet" href="../assets/css/app.css" type="text/css"/>
        <script src="../assets/myjs/cities.js"></script>


        <link rel="stylesheet" type="text/css" href="../assets/lib/datetimepicker/css/bootstrap-datetimepicker.min.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/select2/css/select2.min.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/bootstrap-slider/css/bootstrap-slider.min.css"/>
        <script src="../assets/myjs/cities.js"></script>


    </head>
    <body>

        <%

            EmployerModel em = new EmployerModel();
            //    TblEmployer employer = em.selectById(request.getParameter("eid"));
            TblEmployer employer = em.selectById(String.valueOf(session.getAttribute("EmployerId")));


        %>


        <div class="be-wrapper">

            <%@include file="navbar.jsp" %>

            <%@include file="sidebar.jsp" %>
            <%-- content starts here --%>
            <div class="be-content">
                <div class="main-content container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="card card-border-color card-border-color-primary">
                                        <div class="card-header card-header-divider text-center">About Your Company</div>
                                        <div class="card-body">
                                            <form action="../EmployerController" method="post">
                                                <input type="hidden" name="action" value="update">
                                                <input type="hidden" name="id"  value="<%=  employer.getId()%>">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label >Company Name</label>
                                                            <input class="form-control form-control-sm"  type="text"  name="txtCompanyName" value="<%=  employer.getCompanyName()%>">

                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>Contact Person</label>
                                                            <input class="form-control form-control-sm"  type="text" name="txtContactPerson"  value="<%=  employer.getContactPerson()%>">
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label >Phone Number</label>
                                                            <input class="form-control form-control-sm"  type="text"  name="txtPhoneNo"  onkeypress='validate(event)' value="<%=  employer.getPhoneNo()%>" >
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label >Email Id</label>
                                                            <input class="form-control form-control-sm"   type="email" name="txtEmailId"    value="<%=  employer.getEmailId()%>">
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-row">
                                                    <!--                                                    <div class="col-md-6">
                                                                                                            <div class="form-group">
                                                                                                                <label >Password</label>
                                                                                                                <input class="form-control form-control-sm" name="txtPassword"  value="<%=  employer.getPassword()%>">
                                                                                                            </div>
                                                                                                        </div>-->


                                                    <div class="col-md-6">
                                                        <p class="mt-5">
                                                            <button class="btn btn-space btn-primary" type="submit">Update</button>
                                                            <button class="btn btn-space btn-secondary">Cancel</button>
                                                        </p>
                                                    </div>

                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%-- content ends here --%>

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
                                                                        <div class="user-data"><span class="status offline"></span><span class="name">Joel King</span><span class="message">Ready for the meeti...</span></div></a></div>
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
                                                                        <label class="custom-control-label" for="tck2">Create the main structure</label>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="custom-checkbox custom-control custom-control-sm"><span class="delete mdi mdi-delete"></span>
                                                                        <input class="custom-control-input" type="checkbox" id="tck3">
                                                                        <label class="custom-control-label" for="tck3">Updates changes to GitHub</label>
                                                                    </div>
                                                                </li>
                                                            </ul><span class="category-title">Tomorrow</span>
                                                            <ul class="todo-list">
                                                                <li>
                                                                    <div class="custom-checkbox custom-control custom-control-sm"><span class="delete mdi mdi-delete"></span>
                                                                        <input class="custom-control-input" type="checkbox" id="tck4">
                                                                        <label class="custom-control-label" for="tck4">Initialize the project</label>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="custom-checkbox custom-control custom-control-sm"><span class="delete mdi mdi-delete"></span>
                                                                        <input class="custom-control-input" type="checkbox" id="tck5">
                                                                        <label class="custom-control-label" for="tck5">Create the main structure</label>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="custom-checkbox custom-control custom-control-sm"><span class="delete mdi mdi-delete"></span>
                                                                        <input class="custom-control-input" type="checkbox" id="tck6">
                                                                        <label class="custom-control-label" for="tck6">Updates changes to GitHub</label>
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
                                                                    <label for="st3"></label></span 
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
                    <script src="../assets/lib/datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
                    <script src="../assets/lib/select2/js/select2.min.js" type="text/javascript"></script>
                    <script src="../assets/lib/select2/js/select2.full.min.js" type="text/javascript"></script>
                    <script type="text/javascript">
                                                                $(document).ready(function () {
                                                                    //-initialize the javascript
                                                                    App.formElements();
                                                                });
                    </script>

                    </body>
                    </html>
