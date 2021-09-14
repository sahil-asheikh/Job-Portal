<%-- 
    Document   : vacancyupdate
    Created on : Feb 5, 2020, 6:20:56 PM
    Author     : Lenovo
--%>

<%@page import="com.qt.jobportal.controllers.VacancyController"%>
<%@page import="com.qt.jobportal.beans.TblVacancy"%>
<%@page import="com.qt.jobportal.models.Vacancy"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="description" content="">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Vacancy</title>
        <link rel="shortcut icon" href="../assets/img/logo-fav.png">
        <%@include file="head.jsp" %>
        <link rel="stylesheet" type="text/css" href="../assets/lib/datetimepicker/css/bootstrap-datetimepicker.min.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/select2/css/select2.min.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/bootstrap-slider/css/bootstrap-slider.min.css"/>
        <link rel="stylesheet" href="../assets/mycss/sweetalert.css" type="text/css"/>
        <script src="../assets/myjs/cities.js"></script>
        <script src="../assets/myjs/sweetalert.js" type="text/javascript"></script>
        <script src="../assets/myjs/vacancyValidation.js" type="text/javascript"></script>

    </head>
    <body>

        <%
            Vacancy vacmod = new Vacancy();
            TblVacancy vacancy = vacmod.selectById(request.getParameter("vid"));

        %>

        <h1>Update Job Portal</h1>
        <div class="be-wrapper">

            <%@include file="navbar.jsp" %>

            <%@include file="sidebar.jsp" %>
            <%-- content starts here --%>
            <div class="be-content">
                <div class="main-content container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card card-border-color card-border-color-primary">
                                <div class="card-header card-header-divider text-center">Basic Job Details</div>
                                <div class="card-body">
                                    <form method="get" action="../VacancyController">
                                        <input type="hidden" name="action" value="update"/>
                                        <input type="hidden" name="id" value="<%= vacancy.getId()%>"> <br> <br>
                                        <div class="form-row">
                                            <div class="col-md-6">
                                                <div class="form-group pt-2">
                                                    <label for="txtTitle">Job Title</label>
                                                    <input required="" class="form-control form-control-sm" id="txtTitle" type="text" name="txtTitle" value="<%= vacancy.getTitle()%>" >
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group pt-2">
                                                    <label for="txtNoOfOpening">No.of Openings</label>
                                                    <input required="" class="form-control form-control-sm" id="txtNoOfOpening" type="number" name="txtNoOfOpening" value="<%= vacancy.getNoOfOpening()%>">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtMinSalary">Minimum Salary</label>
                                                    <input required="" class="form-control form-control-sm" id="txtMinSalary" type="number" name="txtMinSalary" value="<%= vacancy.getMinSalary()%>">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtMaxSalary">Maximum Salary</label>
                                                    <input required="" class="form-control form-control-sm" id="txtMaxSalary" type="number" name="txtMaxSalary" value="<%= vacancy.getMaxSalary()%>">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="">Job In State</label>

                                                    <input required="" type="text" id ="sts" name ="txtJobInState" class="form-control form-control-sm" required value="<%= vacancy.getJobState()%>">

                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="">Job In City</label>

                                                    <input required="" type="text" class="form-control form-control-sm" required name="txtJobInCity" value="<%= vacancy.getJobCity()%>">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-row">
                                            <div class="col-md-6 offset-0">
                                                <div class="form-group">
                                                    <label for="txtJobInArea">Job In Area</label>
                                                    <textarea required="" class="form-control form-control-sm" id="txtJobInArea" name="txtJobInArea" ><%= vacancy.getJobArea()%></textarea>                                        
                                                </div>
                                            </div>
                                        </div>                                    
                                </div>
                            </div>
                        </div>
                    </div>  
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card card-border-color card-border-color-primary">
                                <div class="card-body">
                                    <div class="card-header card-header-divider text-center">Additional Job Details</div>
                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="">Minimum Qualification</label>
                                                <select required="" class="form-control form-control-sm" id="slMinQualification" name="txtMinQualification" >
                                                    <option value="BCA" <%= vacancy.getMinQualification().equals("BCA") ? "selected" : ""%>>BCA</option>
                                                    <option value="BE" <%= vacancy.getMinQualification().equals("BE") ? "selected" : ""%>>BE</option>
                                                    <option value="BCOM" <%= vacancy.getMinQualification().equals("BCOM") ? "selected" : ""%>>B.Com</option>
                                                    <option value="DIPLOMA" <%= vacancy.getMinQualification().equals("DIPLOMA") ? "selected" : ""%>>Diploma</option>
                                                    <option value="BSC" <%= vacancy.getMinQualification().equals("BSC") ? "selected" : ""%>>B.Sc</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="">Experience</label>
                                                <select required="" class="form-control form-control-sm" id="slExperience" name="txtExperience" >

                                                    <option value="Fresher" <%= vacancy.getExperience().equals("Fresher") ? "selected" : ""%>>Fresher</option>
                                                    <option value="1 Years of Experience" <%= vacancy.getExperience().equals("1 Years of Experience") ? "selected" : ""%>>1 Years of Experience</option>
                                                    <option value="1-2 Years of Experience" <%= vacancy.getExperience().equals("1-2 Years of Experience") ? "selected" : ""%>>1-2 Years of Experience</option>
                                                    <option value="2-3 Years of Experience" <%= vacancy.getExperience().equals("2-3 Years of Experience") ? "selected" : ""%>>2-3 Years of Experience</option>
                                                    <option value="3-4 Years of Experience" <%= vacancy.getExperience().equals("3-4 Years of Experience") ? "selected" : ""%>>3-4 Years of Experience</option>
                                                    <option value="4-5  Years of Experience" <%= vacancy.getExperience().equals("4-5  Years of Experience") ? "selected" : ""%>>4-5  Years of Experience</option>
                                                    <option value="More Than five years" <%= vacancy.getExperience().equals("More Than five years") ? "selected" : ""%>>More Than five years</option>


                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="">English Accuracy</label>
                                                <input required="" type="text" class="form-control form-control-sm" id="slEnglishAccuracy" name="txtEnglishAccuracy" value="<%= vacancy.getEnglishAccuracy()%>">

                                            </div>  
                                        </div>



                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="">Skill Set</label>
                                                <input required="" type="text" class="tags form-control form-control-sm" multiple="" id="slSkillSet" name="txtSkillSet" value="<%= vacancy.getSkillSet()%>">

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="txtJobDescription">Job Description</label>
                                                <textarea required="" rows="3" class="form-control form-control-sm" id="txtJobDescription" name="txtJobDescription" ><%= vacancy.getJobDescription()%></textarea>                                              
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-left pt-4">Gender</label>
                                                <div class="col-12 col-sm-8 col-lg-6">
                                                    <div class="form-check form-check-inline">
                                                        <label class="custom-control custom-radio custom-radio-icon custom-control-inline">
                                                            <input required="" class="custom-control-input" name="rdGender" type="radio" value="female" checked=""><span class="custom-control-label"><i class="mdi mdi-female"></i></span>
                                                        </label>
                                                        <label class="custom-control custom-radio custom-radio-icon custom-control-inline">
                                                            <input required="" class="custom-control-input" name="rdGender" type="radio" value="male"><span class="custom-control-label"><i class="mdi mdi-male-alt"></i></span>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card card-border-color card-border-color-primary">
                                <div class="card-body">
                                    <div class="form-row pt-2">
                                        <div class="col-md-6">
                                            <label for="">Job Timings</label>
                                            <textarea required="" class="form-control form-control-sm" id="txtJobTimings"  name="txtJobTiming" ><%= vacancy.getJobTiming()%></textarea>
                                        </div>
                                        <div class="col-md-6">                                         
                                            <label for="">Interview Details</label>
                                            <textarea required="" class="form-control form-control-sm" id="txtInterviewDetails"  name="txtInterviewDetail" ><%= vacancy.getInterviewDetails()%></textarea>                                               
                                        </div>
                                    </div>  
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card card-border-color card-border-color-primary">
                                <div class="card-header card-header-divider text-center">About Your Company</div>
                                <div class="card-body">
                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="txtCompanyName">Company Name</label>
                                                <input required="" class="form-control form-control-sm" id="txtCompanyName" type="text" name="txtCompanyName" value="<%= vacancy.getCompanyName()%>">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="txtContactPerson">Contact Person</label>
                                                <input required="" class="form-control form-control-sm" id="txtContactPerson" type="text" name="txtContactPerson" value="<%= vacancy.getContactPerson()%>">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="txtPhoneNumber">Phone Number</label>
                                                <input required="" class="form-control form-control-sm" id="txtPhoneNumber" type="number" name="txtPhoneNumber" value="<%= vacancy.getPhoneNo()%>">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="txtEmailId">Email Id</label>
                                                <input required="" class="form-control form-control-sm" id="txtEmailId" type="email" name="txtEmailId" value="<%= vacancy.getEmailId()%>">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="col-md-6 offset-0">
                                            <div class="form-group">
                                                <label for="txtJobAddress">Job Address</label>
                                                <textarea required="" class="form-control form-control-sm" id="txtJobAddress" name="txtJobAddress" ><%= vacancy.getJobAddress()%></textarea>                                        
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <p class="mt-8">
                                                <!--<button class="btn btn-space btn-primary" type="submit">Update</button>-->
                                                <button class="btn btn-space btn-primary" type="submit" onclick="return vacancyValidation();"  >Update</button>
                                                <button class="btn btn-space btn-secondary">Cancel</button> ${param.message}
                                            </p>
                                        </div>
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
        <%@include file="footer.jsp" %>
        <script src="assets/lib/datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
        <script src="assets/lib/select2/js/select2.min.js" type="text/javascript"></script>
        <script src="assets/lib/select2/js/select2.full.min.js" type="text/javascript"></script>
        <script src="assets/lib/bs-custom-file-input/bs-custom-file-input.js" type="text/javascript"></script>
        <script src="assets/lib/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
        <script language="javascript">print_state("sts");</script>

        <script type="text/javascript">
            $(document).ready(function () {
                //-initialize the javascript
                App.formElements();
            });
        </script>

    </body>
</html>

<!--<form method="post" action="VacancyController">
    <input type="hidden" name="action" value="update"/>
    <input type="hidden" name="id" value="<%= vacancy.getId()%>"> <br> <br>
    Title:<input type="text" name="txtTitle" placeholder=" enter Title" value="<%= vacancy.getTitle()%>"> <br> <br>
    Minimum Salary:<input type="text" name="txtMinSalary" placeholder=" enter Minimum Salary" value="<%= vacancy.getMinSalary()%>"> <br> <br>
    Maximum Salary:<input type="text" name="txtMaxSalary" placeholder=" enter Maximum Salary" value="<%= vacancy.getMaxSalary()%>"> <br> <br>
    Number of Opening:<input type="text"  name = "txtNoOfOpening" placeholder="enter Opening number" value="<%= vacancy.getNoOfOpening()%>"> <br> <br>
    Job State:<input type="text"  name = "txtJobInState" placeholder=" enter Job State" value="<%= vacancy.getJobState()%>"><br> <br>
    Job City:<input type="text"  name = "txtJobInCity" placeholder="enter Job City" value="<%= vacancy.getJobCity()%>"> <br><br>
    Job Area:<input type="text"  name = "txtJobInArea" placeholder=" enter Job Area" value="<%= vacancy.getJobArea()%>" <br> <br>
    Job Address:<input type="text" name="txtJobAddress" placeholder="enter Job Address" value="<%= vacancy.getJobAddress()%>"> <br> <br>
    Job Description:<input type="text"  name = "txtJobDescription" placeholder=" Job Description" value="<%= vacancy.getJobDescription()%>"><br> <br>
    Minimum Qualification:<select id="slMinQualification"  name="txtMinQualification">
        <option value="bca">BCA</option>
        <option value="be">BE</option>
        <option value="bcom">Bcom</option>
        <option value="diploma">Diploma</option>
        <option value="bsc">BSC</option>
    </select>
    Experience:<input type="number" name="txtExperience" value="<%= vacancy.getExperience()%>"> <br> <br>
    Gender<input type="radio" name="sex" value="male"/>Male <input type="radio" name="sex" value="female"/>Female </td></tr>

English Accuracy:<select id="slEnglishAccuracy" name="txtEnglishAccuracy">
<option value="slBasic">Basic</option>
<option value="slIntermediate">Intermediate</option>
<option value="slFluent">Fluent</option>
</select>
Skill Set:<input type="text"  name = "txtSkillSet" placeholder=" Skill Set" value="<%= vacancy.getSkillSet()%>"><br><br>
Job Timing:<select id="slJobTiming" name="txtJobTiming">
<option value="9am-6pm">9AM-6PM</option>
<option value="7pm-4am">7PM-4Am</option>
<option value="6am-3pm">6Am-3PM</option>
<option value="4pm-12am">4PM-12AM</option>
<option value="11am-9pm">11AM-9PM</option>
</select>
Interview Details:<input type="text" name="txtInterviewDetail" placeholder="enter Interview Details" value="<%= vacancy.getInterviewDetails()%>"><br><br>
Company Name:<input type="text" name="txtCompanyName" placeholder="enter Company Name" value="<%= vacancy.getCompanyName()%>"><br> <br>
Contact Person:<input type="text" name="txtContactPerson" value="<%= vacancy.getContactPerson()%>"><br> <br>
Phone No.:<input type="number" name="txtPhoneNo" value="<%= vacancy.getPhoneNo()%>"><br> <br>
Email Id:<input type="email" name="txtEmailId" value="<%= vacancy.getEmailId()%>"><br><br>

<td colspan="2"> <input type="submit" value="Update"

</td>
</form> -->






