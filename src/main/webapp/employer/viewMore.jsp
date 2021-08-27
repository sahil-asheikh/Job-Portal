<%-- 
    Document   : viewMore
    Created on : Feb 12, 2020, 1:14:02 PM
    Author     : Os
--%>

<%@page import="com.qt.jobportal.models.Vacancy"%>
<%@page import="com.qt.jobportal.beans.TblVacancy"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="description" content="">
        <title>View More</title>
        <%@include file="head.jsp" %>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="../assets/lib/datatables/datatables.net-bs4/css/dataTables.bootstrap4.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/datatables/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css"/>
   
    </head>
    <body>
        <%
            Vacancy vacmod = new Vacancy();
            TblVacancy vacancy = vacmod.selectById(request.getParameter("vid"));

        %>
        <div class="be-wrapper">
            <%@include file="navbar.jsp" %>

            <%@include file="sidebar.jsp" %>

            <div class="be-content">
                <div class="main-content container-fluid">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card card-border-color card-border-color-primary">
                                <div class="card-header card-header-divider text-center">Basic Job Details</div>
                                <div class="card-body">
                                    <table class="table table-sm table-striped">

                                        <tbody>
                                            <tr>
                                                <td class="icon"><span class="mdi mdi-star"></span></td>
                                                <td class="item">Job Title<span class="icon s7-phone"></span></td>
                                                <td><%= vacancy.getTitle()%></td>
                                            </tr>
                                            <tr>
                                                <td class="icon"><span class="mdi mdi-accounts"></span></td>
                                                <td class="item">No. Of Openings<span class="icon s7-phone"></span></td>
                                                <td><%= vacancy.getNoOfOpening()%></td>
                                            </tr>
                                            <tr>
                                                <td class="icon"><span class="mdi mdi-skype"></span></td>
                                                <td class="item">Salary<span class="icon s7-phone"></span></td>
                                                <td><%= vacancy.getMinSalary()%>-<%= vacancy.getMaxSalary()%></td>
                                            </tr>
                                            <tr>
                                                <td class="icon"><span class="mdi mdi-globe"></span></td>
                                                <td class="item">Job in State<span class="icon s7-phone"></span></td>
                                                <td><%= vacancy.getJobState()%></td>
                                            </tr>
                                            <tr>
                                                <td class="icon"><span class="mdi mdi-city"></span></td>
                                                <td class="item">Job in City/Area<span class="icon s7-phone"></span></td>
                                                <td><%= vacancy.getJobCity()%>/<%= vacancy.getJobArea()%></td>
                                            </tr>
                                        </tbody>
                                    </table>

                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card card-border-color card-border-color-primary">
                                <div class="card-header card-header-divider text-center">About Your Company</div>
                                <div class="card-body">
                                    <table class="table table-sm table-striped">


                                        <tbody>
                                            <tr>
                                                <td class="icon"><span class="mdi mdi-city-alt"></span></td>
                                                <td class="item">Company Name<span class="icon s7-phone"></span></td>
                                                <td><%= vacancy.getCompanyName()%></td>
                                            </tr>
                                            <tr>
                                                <td class="icon"><span class="mdi mdi-account-box"></span></td>
                                                <td class="item">Contact Person<span class="icon s7-phone"></span></td>
                                                <td><%= vacancy.getContactPerson()%></td>
                                            </tr>
                                            <tr>
                                                <td class="icon"><span class="mdi mdi-phone"></span></td>
                                                <td class="item">Phone Number<span class="icon s7-phone"></span></td>
                                                <td><%= vacancy.getPhoneNo()%></td>
                                            </tr>
                                            <tr>
                                                <td class="icon"><span class="mdi mdi-email"></span></td>
                                                <td class="item">Email Id<span class="icon s7-phone"></span></td>
                                                <td><%= vacancy.getEmailId()%></td>
                                            </tr>
                                            <tr>
                                                <td class="icon"><span class="mdi mdi-pin"></span></td>
                                                <td class="item">Job Address<span class="icon s7-phone"></span></td>
                                                <td><%= vacancy.getJobAddress() %> </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card card-border-color card-border-color-primary">
                                <div class="card-header card-header-divider text-center">Additional Job Details</div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <table class="table table-sm table-striped">
                                                <tbody>
                                                    <tr>
                                                        <td class="icon"><span class="mdi mdi-graduation-cap"></span></td>
                                                        <td class="item">Minimum Qualification<span class="icon s7-phone"></span></td>
                                                        <td><%= vacancy.getMinQualification()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="icon"><span class="mdi mdi-collection-add"></span></td>
                                                        <td class="item">Experience<span class="icon s7-phone"></span></td>
                                                        <td><%= vacancy.getExperience()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="icon"><span class="mdi mdi-translate"></span></td>
                                                        <td class="item">English Accuracy<span class="icon s7-phone"></span></td>
                                                        <td><%= vacancy.getEnglishAccuracy()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="icon"><span class="mdi mdi-group-work"></span></td>
                                                        <td class="item">Skill Set<span class="icon s7-phone"></span></td>
                                                        <td><%= vacancy.getSkillSet()%></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-sm-6">
                                            <table class="table table-sm table-striped">
                                                <tbody>
                                                    <tr>
                                                        <td class="icon"><span class="mdi mdi-format-align-justify"></span></td>
                                                        <td class="item">Job Description<span class="icon s7-phone"></span></td>
                                                        <td><%= vacancy.getJobDescription()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="icon"><span class="mdi mdi-male-female"></span></td>
                                                        <td class="item">Gender<span class="icon s7-phone"></span></td>
                                                        <td><%= vacancy.getGender()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="icon"><span class="mdi mdi-time"></span></td>
                                                        <td class="item">Job Timing<span class="icon s7-phone"></span></td>
                                                        <td><%= vacancy.getJobTiming()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="icon"><span class="mdi mdi-format-align-center"></span></td>
                                                        <td class="item">Interview Details<span class="icon s7-phone"></span></td>
                                                        <td><%= vacancy.getInterviewDetails()%></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>



                                </div>
                            </div>

                        </div>
                    </div>

                    <!-- <div class="row">
               <div class="col-lg-6 offset-3">
                     <div class="user-info-list card">
                         <div class="card-header card-header-divider">About Me<span class="card-subtitle">I am a web developer and designer based in Montreal - Canada, I like read books, good music and nature.</span></div>
                         <div class="card-body">
                             <table class="no-border no-strip skills">
                                 <tbody class="no-border-x no-border-y">
                                     <tr>
                                         <td class="icon"><span class="mdi mdi-city"></span></td>
                                         <td class="item">Job in State/City<span class="icon s7-phone"></span></td>
                                         <td>(999) 999-9999</td>
                                     </tr>
                                     <tr>
                                         <td class="icon"><span class="mdi mdi-translate"></span></td>
                                         <td class="item">English Accuracy<span class="icon s7-map-marker"></span></td>
                                         <td>Montreal, Canada</td>
                                     </tr>
                                      <tr>
                                         <td class="icon"><span class="mdi mdi-group-work"></span></td>
                                         <td class="item">Skill Set<span class="icon s7-global"></span></td>
                                         <td>www.website.com</td>
                                     </tr>
                                     <tr>
                                         <td class="icon"><span class="mdi mdi-format-align-justify"></span></td>
                                         <td class="item">Job Description<span class="icon s7-global"></span></td>
                                         <td>www.website.com</td>
                                     </tr>
                                     <tr>
                                         <td class="icon"><span class="mdi mdi-male-female"></span></td>
                                         <td class="item">Gender<span class="icon s7-global"></span></td>
                                         <td>www.website.com</td>
                                     </tr>
                                     <tr>
                                         <td class="icon"><span class="mdi mdi-time"></span></td>
                                         <td class="item">Job Timing<span class="icon s7-global"></span></td>
                                         <td>www.website.com</td>
                                     </tr> 
                                     <tr>
                                         <td class="icon"><span class="mdi mdi-format-align-center"></span></td>
                                         <td class="item">Interview Details<span class="icon s7-global"></span></td>
                                         <td>www.website.com</td>
                                     </tr>
                                     <tr>
                                         <td <i class="fa fa-building"></i></td>
                                         <td class="item">Company Name<span class="icon s7-global"></span></td>
                                         <td>www.website.com</td>
                                     </tr><tr>
                                         <td <i class="fa fa-address-book"></i></td>
                                         <td class="item">Contact Person<span class="icon s7-global"></span></td>
                                         <td>www.website.com</td>
                                     </tr>
                                     <tr>
                                         <td class="icon"><span class="mdi mdi-phone"></span></td>
                                         <td class="item">Phone Number<span class="icon s7-global"></span></td>
                                         <td>www.website.com</td>
                                     </tr>   
                                     <tr>
                                         <td class="icon"><span class="mdi mdi-email"></span></td>
                                         <td class="item">Email Id<span class="icon s7-global"></span></td>
                                         <td>www.website.com</td>
                                     </tr> 
                                     
                                     <tr>
                                         <td class="icon"><span class="mdi mdi-pin"></span></td>
                                         <td class="item">Job Address<span class="icon s7-global"></span></td>
                                         <td>www.website.com</td>
                                     </tr>                        
                                 </tbody>
                             </table>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
             </div>
         </div>-->



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

                        <script src="../assets/lib/jquery/jquery.min.js" type="text/javascript"></script>-->
                                                                    <script src="../assets/lib/perfect-scrollbar/js/perfect-scrollbar.min.js" type="text/javascript"></script>
                                                                    <script src="../assets/lib/bootstrap/dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
                                                                    <script src="../assets/js/app.js" type="text/javascript"></script>
 
    <script type="text/javascript">
                                                                        $(document).ready(function () {
                                                                            //-initialize the javascript
                                                                            App.init();
                                                                            App.dataTables();
                                                                             App.formElements();
               
                                                                        });
                                                                   
    </body>


</html>