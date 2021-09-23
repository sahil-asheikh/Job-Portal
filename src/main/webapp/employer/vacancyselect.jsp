<%-- 
    Document   : newjsp
    Created on : Feb 5, 2020, 1:45:51 PM
    Author     : Lenovo
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.qt.jobportal.beans.TblVacancy"%>
<%@page import="com.qt.jobportal.models.Vacancy"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>

        <%@include file="head.jsp" %>
        <script src="../assets/myjs/cities.js"></script>

        <meta name="description" content="">
        <link rel="stylesheet" type="text/css" href="../assets/lib/datatables/datatables.net-bs4/css/dataTables.bootstrap4.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/datatables/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css"/>
        <link rel="stylesheet" href="../assets/mycss/sweetalert.css" type="text/css"/>
        <script src="../assets/myjs/sweetalert.js" type="text/javascript"></script>
        <script src="../assets/myjs/sweetAlertDelete.js" type="text/javascript"></script>

    </head>
    <body>
        <%
            EmployerModel empMod = new EmployerModel();
            boolean checkBalanceStatus = empMod.checkEmployerBalance(session.getAttribute("EmployerId").toString());
            Vacancy vacmod = new Vacancy();
            ArrayList<TblVacancy> vacc = vacmod.selectByEmployerId("" + session.getAttribute("EmployerId"));
        %>
        ${param.message}
        <div class="be-wrapper">

            <%@include file="navbar.jsp" %>
            <%@include file="sidebar.jsp" %>
            <%-- content starts here --%>
            <div class="be-content">
                <div class="main-content container-fluid">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card card-table">
                                <div class="card-header">Vacancy Details
                                    <div class="tools dropdown"><span class="icon mdi mdi-download"></span><a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown"><span class="icon mdi mdi-more-vert"></span></a>
                                        <div class="dropdown-menu" role="menu"><a class="dropdown-item" href="#">Action</a><a class="dropdown-item" href="#">Another action</a><a class="dropdown-item" href="#">Something else here</a>
                                            <div class="dropdown-divider"></div><a class="dropdown-item" href="#">Separated link</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <table class="table table-striped table-hover table-fw-widget" id="table3">
                                        <thead>
                                            <tr>
                                                <th>Title </th>
                                                <th>Salary</th>                  
                                                <th>No Of Opening</th>
                                                <th>Min Qualification </th>
                                                <th>Experience</th>
                                                <th>Active/Inactive</th>
                                                <th >Action</th>
                                            </tr>
                                        </thead>



                                        <%  for (TblVacancy vacancy : vacc) {
                                                if (vacancy.getSerialNo() == -1) {

                                        %>
                                        <tr>
                                            <td colspan="6">
                                                <%=  vacancy.getException()%>
                                            </td>  

                                            <%
                                            } else if (vacancy.getSerialNo() == 0) {

                                            %>
                                        <tr>
                                            <td colspan="6"> <%=  vacancy.getException()%>   </td>
                                        </tr>
                                        <%
                                        } else {
                                        %>
                                        <% if (vacancy.getEmployerId() == null || vacancy.getEmployerId() == "null") {
                                        %>
                                        <a href="vacancy.jsp" type="button" >Post Job</a>
                                        <%
                                        } else {
                                        %>
                                        <tbody>
                                            <tr class="odd gradeC ">
                                                <td><%= vacancy.getTitle()%></td>
                                                <td><%= vacancy.getMinSalary()%>-<%= vacancy.getMaxSalary()%></td>
                                                <td><%= vacancy.getNoOfOpening()%></td>
                                                <td><%= vacancy.getMinQualification()%></td>
                                                <td><%= vacancy.getExperience()%></td>

                                                <td>
                                                    <div class="btn-group btn-space">
                                                        <%
                                                            if (checkBalanceStatus) {
                                                                int vidStatus = vacancy.getJobStatus();
                                                                if (vidStatus == 1) {
                                                        %>
                                                        <div class="row align-middle">
                                                            <form action="../VacancyController" method="post">
                                                                <button class="btn btn-success btn-space" type="submit" name="action" value="visibility" disabled="">
                                                                    <input type="hidden" name="vid" value="<%= vacancy.getVacancyPublicId()%>">
                                                                    <input type="hidden" name="status" value="1">
                                                                    <input type="hidden" name="empID" value="<%= vacancy.getEmployerId()%>">
                                                                    <div class="icon-sm">
                                                                        <span class="mdi mdi-check" style="color: white"></span>
                                                                    </div>
                                                                </button>
                                                            </form>

                                                            <form action="../VacancyController" method="post">
                                                                <button class="btn btn-danger btn-space" type="submit" name="action" value="visibility">
                                                                    <input type="hidden" name="vid" value="<%= vacancy.getVacancyPublicId()%>">
                                                                    <input type="hidden" name="status" value="0">
                                                                    <div class="icon-sm">
                                                                        <span class="mdi mdi-close" style="color: white"></span>
                                                                    </div>
                                                                </button>
                                                            </form>

                                                            <span class="text-success ">
                                                                <div class="icon-sm">
                                                                    <p class="font-weight-bold text-justify">ACTIVE</p>
                                                                </div>
                                                            </span>
                                                        </div>
                                                        <%
                                                        } else {
                                                        %>
                                                        <form action="../VacancyController" method="post">
                                                            <button class="btn btn-success btn-space" type="submit" name="action" value="visibility">
                                                                <input type="hidden" name="vid" value="<%= vacancy.getVacancyPublicId()%>">
                                                                <input type="hidden" name="status" value="1">
                                                                <input type="hidden" name="empID" value="<%= vacancy.getEmployerId()%>">
                                                                <div class="icon-sm">
                                                                    <span class="mdi mdi-check" style="color: white"></span>
                                                                </div>
                                                            </button>
                                                        </form>

                                                        <form action="../VacancyController" method="post">
                                                            <button class="btn btn-danger btn-space" type="submit" name="action" value="visibility" disabled="">
                                                                <input type="hidden" name="vid" value="<%= vacancy.getVacancyPublicId()%>">
                                                                <input type="hidden" name="status" value="0">
                                                                <div class="icon-sm">
                                                                    <span class="mdi mdi-close" style="color: white"></span>
                                                                </div>
                                                            </button>
                                                        </form>

                                                        <span class="text-danger ">
                                                            <div class="icon-sm">
                                                                <p class="font-weight-bold text-justify">DEACTIVATED</p>
                                                            </div>
                                                        </span>
                                                        <%
                                                            }
                                                        } else {
                                                        %>
                                                        <div class="row align-middle">
                                                            <button class="btn btn-success btn-space" type="submit" name="action" value="visibility" disabled="">
                                                                <div class="icon-sm">
                                                                    <span class="mdi mdi-check" style="color: white"></span>
                                                                </div>
                                                            </button>

                                                            <button class="btn btn-danger btn-space" type="submit" name="action" value="visibility" disabled="">
                                                                <div class="icon-sm">
                                                                    <span class="mdi mdi-close" style="color: white"></span>
                                                                </div>
                                                            </button>

                                                            <span class="text-danger ">
                                                                <div class="icon-sm">
                                                                    <p class="font-weight-bold text-justify">INSUFFICIENT BALANCE</p>
                                                                </div>
                                                            </span>
                                                        </div>
                                                        <%
                                                            }
                                                        %>
                                                    </div>
                                                </td>

                                                <td colspan="3">
                                                    <div class="btn-group btn-space">
                                                        <button class="btn btn-sm btn-primary" type="button" data-toggle="modal" data-target="#exampleModalCenter"> 
                                                            <a href="viewMore.jsp?vid=<%= vacancy.getVacancyPublicId()%>">
                                                                <div class="icon-sm">
                                                                    <span class="mdi mdi-eye" style="color: white"></span>
                                                                </div>
                                                            </a>
                                                        </button>
                                                    </div>
                                                    <div class="btn-group btn-space">
                                                        <a class="btn btn-sm btn-warning" href="vacancyupdate.jsp?vid=<%= vacancy.getVacancyPublicId()%>">
                                                            <div class="icon-sm">
                                                                <span class="mdi mdi-edit" style="color: white"></span>
                                                            </div>
                                                        </a>
                                                    </div>
                                                    <div class="btn-group btn-space">
                                                        <a class="btn btn-secondary btn-sm btn-danger" href="../VacancyController?action=delete&vid=<%= vacancy.getVacancyPublicId()%>" onclick="return confirmDelete();">
                                                            <span class="mdi mdi-delete" style="color: white"></span>
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>

                                        </tbody>
                                        <%
                                                    }
                                                }
                                            }
                                        %>
                                    </table>
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
    <!--            </div>
            </div>-->

    <script src="../assets/lib/jquery/jquery.min.js" type="text/javascript"></script>
    <script src="../assets/lib/perfect-scrollbar/js/perfect-scrollbar.min.js" type="text/javascript"></script>
    <script src="../assets/lib/bootstrap/dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
    <script src="../assets/js/app.js" type="text/javascript"></script>

    <script src="../assets/lib/datatables/datatables.net/js/jquery.dataTables.js" type="text/javascript"></script>
    <script src="../assets/lib/datatables/datatables.net-bs4/js/dataTables.bootstrap4.js" type="text/javascript"></script>
    <script src="../assets/lib/datatables/datatables.net-buttons/js/dataTables.buttons.min.js" type="text/javascript"></script>
    <script src="../assets/lib/datatables/datatables.net-buttons/js/buttons.flash.min.js" type="text/javascript"></script>
    <script src="../assets/lib/datatables/jszip/jszip.min.js" type="text/javascript"></script>
    <script src="../assets/lib/datatables/pdfmake/pdfmake.min.js" type="text/javascript"></script>
    <script src="../assets/lib/datatables/pdfmake/vfs_fonts.js" type="text/javascript"></script>
    <script src="../assets/lib/datatables/datatables.net-buttons/js/buttons.colVis.min.js" type="text/javascript"></script>
    <script src="../assets/lib/datatables/datatables.net-buttons/js/buttons.print.min.js" type="text/javascript"></script>
    <script src="../assets/lib/datatables/datatables.net-buttons/js/buttons.html5.min.js" type="text/javascript"></script>
    <script src="../assets/lib/datatables/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js" type="text/javascript"></script>
    <script src="../assets/lib/datatables/datatables.net-responsive/js/dataTables.responsive.min.js" type="text/javascript"></script>
    <script src="../assets/lib/datatables/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js" type="text/javascript"></script>
    <script language="javascript">print_state("sts");</script>

    <script type="text/javascript">
        $(document).ready(function () {
            //-initialize the javascript
            App.init();
            App.dataTables();
            App.formElements();

        });
    </script>
</body>
</html>
