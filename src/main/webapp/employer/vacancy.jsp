<%-- 
    Document   : index.jsp
    Created on : 25 Jan, 2020, 1:20:06 PM
    Author     : win8.1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="../assets/img/logo-fav.png">
        <title>Beagle</title>
        <%@include file="head.jsp" %>
        <link rel="stylesheet" type="text/css" href="../assets/lib/datetimepicker/css/bootstrap-datetimepicker.min.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/select2/css/select2.min.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/bootstrap-slider/css/bootstrap-slider.min.css"/>
        <script src="../assets/myjs/cities.js"></script>
        <link rel="stylesheet" href="../assets/mycss/sweetalert.css" type="text/css"/>
        <script src="../assets/myjs/sweetalert.js" type="text/javascript"></script>
        <script src="../assets/myjs/vacancyValidation.js" type="text/javascript"></script>

    </head>


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
                                <form action="../VacancyController" method="get" name="frm">
                                    <input type="hidden" name="action" value="insert">
                                     <input type="hidden" name="employerId" value="<%= session.getAttribute("EmployerId")%>">
                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <div class="form-group pt-2">
                                                <label for="txtTitle">Job Title</label>
                                                <input class="form-control form-control-sm" id="txtTitle" type="text" name="txtTitle" placeholder="Enter Job Title" >
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group pt-2">
                                                <label for="txtNoOfOpening">No.of Openings</label>
                                                <input class="form-control form-control-sm" id="txtNoOfOpening" type="number" name="txtNoOfOpening" placeholder="Enter No.of Openings">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="txtMinSalary">Minimum Salary</label>
                                                <input class="form-control form-control-sm" id="minsal" type="number" name="txtMinSalary" onkeyup="check();" placeholder="Enter Minimum Salary">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="txtMaxSalary">Maximum Salary</label>&nbsp;&nbsp;&nbsp;<span id="message"></span>
                                                <input class="form-control form-control-sm" id="maxsal" type="number" name="txtMaxSalary" onkeyup="check();" placeholder="Enter Maximum Salary">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="">Job In State</label>

                                                <select onchange="print_city('state', this.selectedIndex);" id ="sts" name ="txtJobInState" class="form-control form-control-sm" required>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="">Job In City</label>

                                                <select id="state" class="form-control form-control-sm" required name="txtJobInCity">                                                  </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="col-md-6 offset-0">
                                            <div class="form-group">
                                                <label for="txtJobInArea">Job In Area</label>
                                                <textarea class="form-control form-control-sm" id="txtJobInArea" name="txtJobInArea"></textarea>                                        
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
                                            <select class="form-control form-control-sm" id="slMinQualification" name="txtMinQualification">
                                                <option selected disabled value="">Select Qualification...</option>
                                                <option value="bca">B.C.A</option>
                                                <option value="be">B.E</option>
                                                <option value="bcom">B.Com</option>
                                                <option value="diploma">Diploma</option>
                                                <option value="bsc">B.Sc</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Experience</label>
                                             <select class="form-control form-control-sm" id="slExperience" name="txtExperience">
                                               <option selected disabled value="">Experience</option>
                                               <option value="Fresher">Fresher</option>
                                               <option value="1 Years of Experience">1 Years of Experience</option>
                                               <option value="1-2 Years of Experience">1 - 2 Years of Experience</option>
                                               <option value="2-3 Years of Experience">2 - 3 Years of Experience</option>
                                               <option value="3-4 Years of Experience">3 - 4 Years of Experience</option>
                                               <option value="4-5  Years of Experience">5 Years of Experience</option>
                                               <option value="More Than five years">More Than five years</option>
                                             </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">English Accuracy</label>
                                            <select class="form-control form-control-sm" id="EnglishAccuracy" name="txtEnglishAccuracy">
                                                <option selected disabled value="">Select Accuracy...</option>
                                                <option value="Basic">Basic</option>
                                                <option value="Intermediate">Intermediate</option>
                                                <option value="fluent">Fluent</option>
                                            </select>
                                        </div>  
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Skill Set</label>
                                            <select class="tags form-control form-control-sm" multiple="" id="slSkillSet" name="txtSkillSet">
                                                <option value="">option 1</option>
                                                <option value="java">option 2</option>
                                                <option value="">option 3</option>
                                            </select>  
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtJobDescription">Job Description</label>
                                            <textarea rows="3" class="form-control form-control-sm" id="txtJobDescription" name="txtJobDescription"></textarea>                                              
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-left pt-4">Gender</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <div class="form-check form-check-inline">
                                                    <label class="custom-control custom-radio custom-radio-icon custom-control-inline">
                                                        <input class="custom-control-input" name="rdGender" type="radio" value="female" checked=""><span class="custom-control-label"><i class="mdi mdi-female"></i></span>
                                                    </label>
                                                    <label class="custom-control custom-radio custom-radio-icon custom-control-inline">
                                                        <input class="custom-control-input" name="rdGender" type="radio" value="male"><span class="custom-control-label"><i class="mdi mdi-male-alt"></i></span>
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
                                        <textarea class="form-control form-control-sm" id="txtJobTimings" placeholder=" Ex:9:30 am - 6:30pm | Monday to Saturday" name="txtJobTiming"></textarea>
                                    </div>
                                    <div class="col-md-6">                                         
                                        <label for="">Interview Details</label>
                                        <textarea class="form-control form-control-sm" id="txtInterviewDetails" placeholder="Ex:11:00 am - 4:00pm | Monday to Saturday" name="txtInterviewDetail"></textarea>                                               
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
                                            <input class="form-control form-control-sm" id="txtCompanyName" type="text" name="txtCompanyName" placeholder="Enter Company Name">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtContactPerson">Contact Person</label>
                                            <input class="form-control form-control-sm" id="txtContactPerson" type="text" name="txtContactPerson" placeholder="Enter Contact Person Name">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtPhoneNumber">Phone Number</label>
                                            <input class="form-control form-control-sm" id="txtPhoneNumber" type="number" name="txtPhoneNumber" placeholder="Enter Phone Number">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtEmailId">Email Id</label>
                                            <input class="form-control form-control-sm" id="txtEmailId" type="email" name="txtEmailId" placeholder="Enter Email Id">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="col-md-6 offset-0">
                                        <div class="form-group">
                                            <label for="txtJobAddress">Job Address</label>
                                            <textarea class="form-control form-control-sm" id="txtJobAddress" name="txtJobAddress"></textarea>                                        
                                        </div>
                                    </div>
                                </div>                                    
                                <div class="row pt-3">
                                    <div class="col-lg-6 pb-4 pb-lg-0">
                                        <div class="be-checkbox custom-control custom-checkbox">
                                            <input class="custom-control-input" type="checkbox" id="check1" name="chkTerm">
                                            <label class="custom-control-label" for="check1">I Accept Terms And Conditions and Privacy Policy.*</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <p class="text-right">
                                            <button class="btn btn-space btn-primary" type="submit" onclick="return vacancyValidation();"  >Submit</button>
                                            <button class="btn btn-space btn-secondary">Cancel </button> ${param.message}
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

         <script language="javascript">print_state("sts");</script>

        <script src="../assets/lib/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
        <script src="../assets/lib/jquery.nestable/jquery.nestable.js" type="text/javascript"></script>
        <script src="../assets/lib/moment.js/min/moment.min.js" type="text/javascript"></script>
        <script src="../assets/lib/datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
        <script src="../assets/lib/select2/js/select2.min.js" type="text/javascript"></script>
        <script src="../assets/lib/select2/js/select2.full.min.js" type="text/javascript"></script>
        <script src="../assets/lib/bootstrap-slider/bootstrap-slider.min.js" type="text/javascript"></script>
        <script src="../assets/lib/bs-custom-file-input/bs-custom-file-input.js" type="text/javascript"></script>
        <script type="text/javascript">
                                                $(document).ready(function () {
                                                    //-initialize the javascript
                                                    App.init();
                                                    App.formElements();
                                                });
        </script>
    </body>

</html>
