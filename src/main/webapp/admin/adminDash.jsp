<%-- 
    Document   : adminDash
    Created on : 17 Feb, 2020, 5:09:11 PM
    Author     : win8.1
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.qt.jobportal.models.AdminModel"%>
<%
    if (session.getAttribute("AdminId") == "null" || session.getAttribute("AdminId") == null) {
        response.sendRedirect("../adminLogin.jsp?msg=Login Frist");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
    <head>
  
        
        <link rel="stylesheet" type="text/css" href="../assets/lib/perfect-scrollbar/css/perfect-scrollbar.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/material-design-icons/css/material-design-iconic-font.min.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/datatables/datatables.net-bs4/css/dataTables.bootstrap4.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/datatables/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css"/>
        <link rel="stylesheet" href="../assets/css/app.css" type="text/css"/>

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
                    <%
                        AdminModel adm = new AdminModel();
                        ArrayList<Integer> adminCount = adm.AdminCount();
                    %>
                  
        
            <div class="be-wrapper">
            <%@ include file = "navbar.jsp" %>
            <%@include file="sidebar.jsp" %>
            <div class="be-content">

                <div class="main-content container-fluid">

                    <!-- Main content starts here-->
                    <div class="row">
                        <div class="col-md-4">
                            <div class="widget widget-tile">
                                <div class="chart sparkline"><i class= "fa fa-bell text-warning symbol1"></i></div>
                                <div class="data-info">
                                    <div class="desc">Employer</div>
                                    <div class="value"><span class="indicator indicator-positive mdi mdi-chevron-right"></span>
                                        <span class="number" data-toggle=""><%= adminCount.get(0)%></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="widget widget-tile">
                                <div class="chart sparkline"><i class="mdi mdi-accounts-list-alt text-primary symbol1"></i></div>
                                <div class="data-info">
                                    <div class="desc">Candidate</div>
                                   <div class="value"><span class="indicator indicator-positive mdi mdi-chevron-right"></span>
                                        <span class="number" data-toggle=""><%= adminCount.get(1)%></span>
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
                                    <div class="desc">Subscription</div>
                                   <div class="value"><span class="indicator indicator-positive mdi mdi-chevron-right"></span>
                                        <span class="number" data-toggle=""><%= adminCount.get(2)%></span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="widget widget-tile">
                                <div class="chart sparkline"><span class="mdi mdi-collection-plus text-success symbol1"></span></div>
                                <div class="data-info">
                                    <div class="desc">Vacancies</div>
                                   <div class="value"><span class="indicator indicator-positive mdi mdi-chevron-right"></span>
                                        <span class="number" data-toggle=""><%= adminCount.get(3)%></span>
                                    </div>
                                </div> 
                            </div>
                        </div>
                    </div>


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
