<%@page import="com.qt.jobportal.beans.TblCandidateDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.qt.jobportal.models.CandidateModel"%>
<%@page import="com.qt.jobportal.beans.TblCandidate"%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="../assets/img/logo-fav.png">
        <title>Job Portal</title>

        <link rel="stylesheet" type="text/css" href="../assets/lib/perfect-scrollbar/css/perfect-scrollbar.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/material-design-icons/css/material-design-iconic-font.min.css"/>
        <link rel="stylesheet" href="../assets/css/app.css" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="../assets/myjs/cities.js"></script>

        <script>

            //Job search
            function keySkillChange() {
                var jobRole = document.getElementById("jobRole").value;

                // alert(jobRole);
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState === 4 && this.status === 200) {
                        document.getElementById("dynamicSkill").innerHTML =
                                this.responseText;
                    }
                };
                xhttp.open("GET", "dynamicJobSkill.jsp?jobrole=" + jobRole, true);
                xhttp.send();
            }
            //Checkbox [skilsset]
            var expanded = false;
            function showCheckboxes() {
                var checkboxes = document.getElementById("dynamicSkill");
                if (!expanded) {
                    checkboxes.style.display = "block";
                    expanded = true;
                } else {
                    checkboxes.style.display = "none";
                    expanded = false;
                }
            }

        </script>

    </head>
    <body>

        <div class="be-wrapper">
            <%@ include file = "navbar.jsp" %>
            <%@ include file="sidebar.jsp" %>

            <%
                CandidateModel candMol = new CandidateModel();
                TblCandidate bean = candMol.selectById(String.valueOf(session.getAttribute("CandidateId")));
                TblCandidateDetails candidateDetails = CandidateModel.selectCandDet(session.getAttribute("CandidateId").toString());
                System.out.println(candidateDetails.getExperience());
            %>

            <div class="be-content">
                <div class="main-content container-fluid">
                    <!--             Start Main Content --->
                    <div class="col-lg-10 offset-1">
                        <div class="user-profile">
                            <div class="user-display">
                                <div class="user-display-bg"><img src="../assets/img/user-profile-display.png" alt="Profile Background"></div>
                                <div class="user-display-bottom">
                                    <div class="user-display-avatar"><img src="../assets/img/avatar-150.png" alt="Avatar"></div>
                                    <div class="user-display-info">
                                        <input type="hidden" name="CandidateId" value="<%= session.getAttribute("CandidateId")%>" >
                                        <div class="name"> <%= session.getAttribute("CandidateName")%> </div>

                                        <div class="nick"><span class="mdi mdi-account">&nbsp;<%= bean.getEmailId()%></span> </div>
                                        <p class="text-success text-right">${param.message}</p>
                                        <p class="text-success text-right">${param.msg}</p>
                                    </div>

                                    <div class="row user-display-details">
                                        <!--   <div class="col-4">
                                               <div class="title">Issues</div>
                                               <div class="counter">26</div>
                                           </div> --> 
                                        <div class="col-4">
                                            <blockquote class="blockquote"><span class="text-info"> </span> <%// bean.getJobRole()%> </blockquote>
                                        </div>

                                        <div class="col-4 offset-4">
<!--                                            <a class="btn btn-secondary btn-sm btn-warning " type="button"   href="candidateUpdate.jsp?id=<%// session.getAttribute("CandidateId")%>">

                                                <div class="icon-sm">
                                                    <span class="mdi mdi-edit">Edit Profile</span>
                                                </div>
                                            </a>-->
                                            <!--condition for resume-->
                                            <!--Button to upload Resume-->
                                            <%
                                                boolean checkResume = CandidateModel.resumeAvailable(session.getAttribute("CandidateId").toString());
                                                if (checkResume) {
                                            %>
                                            <a class="btn btn-secondary btn-sm btn-info " data-toggle="modal" data-target="#resume_update" type="button"   href="#">
                                                <div class="icon-sm">
                                                    <span class="mdi mdi-edit"> Edit Resume</span>
                                                </div>
                                            </a>
                                            <%
                                            } else {
                                            %>
                                            <a class="btn btn-secondary btn-sm btn-info " data-toggle="modal" data-target="#resume_upload" type="button"   href="#">
                                                <div class="icon-sm">
                                                    <span class="mdi mdi-edit"> Upload Resume</span>
                                                </div>
                                            </a>
                                            <%
                                                }
                                            %>
                                            <!--/Button to upload Resume-->
                                            <!--/condition for resume-->
                                            <a class="btn btn-secondary btn-sm btn-info " type="button"   href="passwordUpdate.jsp?id=<%= session.getAttribute("CandidateId")%>">

                                                <div class="icon-sm">
                                                    <span class="mdi mdi-edit">Change Password</span>
                                                </div>
                                            </a>
                                        </div>
                                        <br>
                                        <br>
                                        <div class="col-4 offset-10">
                                        </div>
                                    </div>
                                    <div>
                                        <td colspan="3">
                                            <div class="btn-group btn-space">    
                                                <a href="../dashBoard.jsp"></a>
                                            </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <!--About me-->

                    <div class="col-lg-10 offset-1">
                        <div class="card card-border card-contrast">
                            <div class="card-header card-header-contrast">About Me &nbsp;<span class="icon mdi mdi-account"></span>
                                <div class="tools">
                                    <a  data-toggle="modal" data-target="#modalAboutMe" type="button" href="#">
                                        <div class="icon-sm">
                                            <span class="icon mdi mdi-edit btn-space text-primary  md-trigger" data-modal="summaryModalId" title="Add Summary"></span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <blockquote class="blockquote">
                                <div class="card-body">
                                    <span>
                                        <%= (candMol.findCandidateSummary(String.valueOf(session.getAttribute("CandidateId"))) == ("null")) || (candMol.findCandidateSummary(String.valueOf(session.getAttribute("CandidateId"))) == ("")) || (candMol.findCandidateSummary(String.valueOf(session.getAttribute("CandidateId"))) == (null)) ? "No Summary Available" : candMol.findCandidateSummary(String.valueOf(session.getAttribute("CandidateId")))%>
                                    </span>
                                </div>
                            </blockquote>
                        </div>
                    </div>

                    <!--JOB ROLE-->

                    <div class="col-lg-10 offset-1">
                        <div class="card card-border card-contrast">
                            <div class="card-header card-header-contrast">Job Role &nbsp;<span class="icon mdi mdi-account"></span>
                                <div class="tools">
                                    <a  data-toggle="modal" data-target="#modalJobRole" type="button" href="#">
                                        <div class="icon-sm">
                                            <span class="icon mdi mdi-edit btn-space text-primary  md-trigger" data-modal="summaryModalId" title="Add Job Role"></span>
                                        </div>
                                    </a>                            
                                </div>
                            </div>
                            <blockquote class="blockquote">
                                <div class="card-body">

                                    <span><%= candMol.findCandidateJobRole(String.valueOf(session.getAttribute("CandidateId")))%></span>
                                </div>
                            </blockquote>
                        </div>
                    </div>

                    <!--SCHOOL DETAILS-->
                    <%if (bean.getSchoolMedium() == null || bean.getQualification() == "null") {%>
                    <div class="col-lg-10 offset-1">
                        <div class="card card-contrast">
                            <div class="card-header card-header-contrast card-header-featured">Education &nbsp;<span class="icon mdi mdi-graduation-cap"></span></div>

                            <div class="card-body text-center">
                                <blockquote class="blockquote">
                                    <div class="icon-container">

                                        <a  data-toggle="modal" data-target="#modalEducation" type="button" href="#">
                                            <div class="icon-sm">
                                                <i class="icon"><span class="mdi mdi-plus md-trigger" data-modal="form-primary-3"></span></i>
                                            </div>
                                        </a>
                                        <p>Complete your <a class="text-primary">Education Details</a> Section</p>

                                    </div>                                
                                </blockquote>
                            </div>
                        </div>
                    </div>

                    <%} else {%>

                    <div class="col-lg-10 offset-1">
                        <div class="card card-border card-contrast">
                            <div class="card-header card-header-contrast">Education &nbsp;<span class="icon mdi mdi-graduation-cap"></span>
                                <div class="tools">

                                    <a  data-toggle="modal" data-target="#modalEducation" type="button" href="#">
                                        <div class="icon-sm">
                                            <i class="icon">

                                                <span class="icon mdi mdi-edit btn-space text-primary  md-trigger" data-modal="form-primary-3" title="Edit your Education Details"></span>

                                            </i>
                                        </div>
                                    </a>
                                    </span>
                                </div>
                            </div>

                            <div class="card-body">
                                <blockquote class="blockquote">

                                    <table  class="table">
                                        <tbody>
                                            <tr>
                                                <td class="text-info">School Medium :</td>
                                                <td> <%= (bean.getSchoolMedium().equals("null")) || (bean.getSchoolMedium().equals("")) || (bean.getSchoolMedium().equals(null)) ? "Not specified" : bean.getSchoolMedium()%></td>
                                            </tr>
                                            <tr>
                                                <td class="text-info">Qualification :</td>
                                                <td> <%= (bean.getQualification().equals("null")) || (bean.getQualification().equals("")) || (bean.getQualification().equals(null)) ? "Not specified" : bean.getQualification()%></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </blockquote>
                            </div>
                        </div>   
                    </div>

                    <%}%>

                    <!-- Experinece Card -->
                    <%if (candidateDetails.getExperience() == null || candidateDetails.getExperience() == "") {%>
                    <div class="col-lg-10 offset-1">
                        <div class="card card-contrast">
                            <div class="card-header card-header-contrast card-header-featured">Experience &nbsp;<span class="icon mdi mdi-case"></span></div>
                            <div class="card-body text-center">
                                <blockquote class="blockquote">
                                    <div class="icon-container">

                                        <a  data-toggle="modal" data-target="#modalExperience" type="button" href="#">
                                            <div class="icon-sm">
                                                <i class="icon"><span class="mdi mdi-plus md-trigger" data-modal="form-primary-3"></span></i>
                                            </div>
                                        </a>

                                        <p>Complete your <a class="text-primary">Experience Details</a> Section</p>

                                    </div>                                
                                </blockquote>
                            </div>
                        </div>
                    </div>

                    <%} else {%>

                    <div class="col-lg-10 offset-1">
                        <div class="card card-border card-contrast">
                            <!--<div class="card-header card-header-contrast">Education &nbsp;<span class="icon mdi mdi-graduation-cap"></span>-->
                            <div class="card-header card-header-contrast card-header-featured">Experience &nbsp;<span class="icon mdi mdi-case"></span>
                                <div class="tools">

                                    <a  data-toggle="modal" data-target="#modalExperience" type="button" href="#">
                                        <div class="icon-sm">
                                            <i class="icon">

                                                <span class="icon mdi mdi-edit btn-space text-primary  md-trigger" data-modal="form-primary-3" title="Edit your Experience Details"></span>

                                            </i>
                                        </div>
                                    </a>

                                </div>
                            </div>

                            <div class="card-body">
                                <blockquote class="blockquote">

                                    <table  class="table">
                                        <tbody>
                                            <tr>
                                                <td class="text-info">Year of Experience :</td>
                                                <td> <%= (candidateDetails.getExperience().equals("null")) || (candidateDetails.getExperience().equals("")) || (candidateDetails.getExperience().equals(null)) ? "Not specified" : candidateDetails.getExperience()%></td>
                                            </tr>
                                            <tr>
                                                <td class="text-info">Experience Detail :</td>
                                                <td> <%= (candidateDetails.getExperienceDetails().equals("null")) || (candidateDetails.getExperienceDetails().equals("")) || (candidateDetails.getExperienceDetails().equals(null)) ? "Not specified" : candidateDetails.getExperienceDetails()%></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </blockquote>
                            </div>
                        </div>   
                    </div>

                    <%}%>

                    <!--Skills-->
                    <%if (bean.getSkillSet() == null || bean.getSkillSet().equals("") || bean.getSkillSet().equals("null")) {%>
                    <div class="col-lg-10 offset-1">
                        <div class="card card-contrast">
                            <div class="card-header card-header-contrast card-header-featured">Skills And Expertise &nbsp;<span class="fa fa-star"></span></div>
                            <div class="card-body text-center">
                                <blockquote class="blockquote">
                                    <div class="icon-container">
                                        <a  data-toggle="modal" data-target="#modalSkills" type="button" href="uploadResume.jsp?id=<%= session.getAttribute("CandidateId")%>">
                                            <div class="icon-sm">
                                                <i class="icon"><span class="mdi mdi-plus md-trigger" data-modal="form-primary-3"></span></i>
                                            </div>
                                        </a>

                                        <p>Complete your <a class="text-primary">Skills</a> Section</p>

                                    </div>                                
                                </blockquote>
                            </div>
                        </div>
                    </div>

                    <%} else {%>

                    <div class="col-lg-10 offset-1">
                        <div class="card card-border card-contrast">
                            <div class="card-header card-header-contrast card-header-featured">Skills And Expertise &nbsp;<i class="fa fa-star"></i>
                                <div class="tools">

                                    <a  data-toggle="modal" data-target="#modalSkills" type="button" href="uploadResume.jsp?id=<%= session.getAttribute("CandidateId")%>">
                                        <div class="icon-sm">
                                            <i class="icon">

                                                <span class="icon mdi mdi-edit btn-space text-primary  md-trigger" data-modal="form-primary-3" title="Edit your Experience Details"></span>

                                            </i>
                                        </div>
                                    </a>

                                </div>
                            </div>

                            <div class="card-body">
                                <blockquote class="blockquote">
                                    <table  class="table">
                                        <tbody>
                                            <tr>
                                                <td class="text-info">English Skill :</td>
                                                <td> <%= bean.getEnglishSkill()%></td>
                                            </tr>
                                            <tr>
                                                <td class="text-info">Skill Set :</td>
                                                <td> <%= bean.getSkillSet()%></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </blockquote>
                            </div>
                        </div>   
                    </div>

                    <%}%>

                    <!-- personal details Card -->
                    <%if (bean.getAge() == 0) {%>

                    <div class="col-lg-10 offset-1">
                        <div class="card card-contrast">
                            <div class="card-header card-header-contrast card-header-featured">Personal Details &nbsp;<span class="icon mdi mdi-graduation-cap"></span></div>
                            <div class="card-body text-center">
                                <blockquote class="blockquote">
                                    <div class="icon-container">


                                        <a  data-toggle="modal" data-target="#modalPersonal" type="button" href="uploadResume.jsp?id=<%= session.getAttribute("CandidateId")%>">
                                            <div class="icon-sm">
                                                <i class="icon"><span class="mdi mdi-plus md-trigger" data-modal="form-primary-3"></span></i>
                                            </div>
                                        </a>

                                        <p>Complete your <a class="text-primary">Personal Details</a> Section</p>

                                    </div>                                
                                </blockquote>
                            </div>
                        </div>
                    </div>

                    <%} else {%>

                    <div class="col-lg-10 offset-1">
                        <div class="card card-border card-contrast">
                            <div class="card-header card-header-contrast card-header-featured">Personal Details &nbsp;<i class="icon mdi mdi-graduation-cap"></i>
                                <div class="tools">

                                    <a  data-toggle="modal" data-target="#modalPersonal" type="button" href="#">
                                        <div class="icon-sm">
                                            <i class="icon">

                                                <span class="icon mdi mdi-edit btn-space text-primary  md-trigger" data-modal="form-primary-3" title="Edit your Personal Info Details"></span>

                                            </i>
                                        </div>
                                    </a>

                                </div>
                            </div>

                            <div class="card-body">
                                <blockquote class="blockquote">

                                    <table  class="table">
                                        <tbody>
                                            <tr>
                                                <td class="text-info">Age :</td>
                                                <td> <%= bean.getAge()%></td>
                                            </tr>
                                            <tr>
                                                <td class="text-info">Gender :</td>
                                                <td> <%= bean.getGender()%></td>
                                            </tr>
                                            <tr>
                                                <td class="text-info">Address :</td>
                                                <td> <%= bean.getAddress()%></td>
                                            </tr>
                                            <tr>
                                                <td class="text-info">State :</td>
                                                <td> <%= bean.getState()%></td>
                                            </tr>
                                            <tr>
                                                <td class="text-info">City :</td>
                                                <td> <%= bean.getCity()%></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </blockquote>
                            </div>
                        </div>   
                    </div>

                    <%}%>

                    <!--===============================================================================================================================================-->
                    <!--End Mian Content-->
                    <!--===============================================================================================================================================-->

                    <!-- modal starts here --> 
                    <div class="modal-container colored-header colored-header-primary modal-effect-9" id="form-primary">
                        <div class="modal-content">
                            <div class="modal-header modal-header-colored">
                                <h3 class="modal-title">Add Summary</h3>
                                <button class="close modal-close" type="button" data-dismiss="modal" aria-hidden="true"><span class="mdi mdi-close"></span></button>
                            </div>
                            <div class="modal-body form">
                                <form action="../CandidateController" name="frm" method="post">
                                    <input type="hidden" name="action" value="summary">
                                    <input type="hidden" name="candidateId" value="<%= session.getAttribute("CandidateId")%>">
                                    <div class="form-group">
                                        <label>About Me</label>
                                        <textarea class="form-control" id="inputTextarea3" name="txtSummary" placeholder="'Enter story\n next line\n more'" rows="6"></textarea>
                                    </div>
                                    <div class="modal-footer">
                                        <button class="btn btn-secondary modal-close" type="reset" data-dismiss="modal">Cancel</button>
                                        <button class="btn btn-primary modal-close" type="submit" data-dismiss="modal">Submit</button>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                    <div class="modal-overlay"></div>

                    <div class="modal-container colored-header colored-header-primary modal-effect-9" id="form-primary-1">
                        <div class="modal-content">
                            <div class="modal-header modal-header-colored">
                                <h3 class="modal-title"> Experience Detail</h3>
                                <button class="close modal-close" type="button" data-dismiss="modal" aria-hidden="true"><span class="mdi mdi-close"></span></button>
                            </div>
                            <div class="modal-body form">
                                <div class="modal-body form">
                                    <form action="../CandidateController" name="frmEx" method="post">
                                        <input type="hidden" name="action" value="experience">
                                        <input type="hidden" name="candidateId" value="<%= session.getAttribute("CandidateId")%>">
                                        <div class="form-group">
                                            <label>Add Experience</label>
                                            <textarea class="form-control" id="inputTextarea3" name="txtExperience" placeholder="'Enter Experience\n next line\n more'" rows="6"></textarea>
                                        </div>
                                        <div class="modal-footer">
                                            <button class="btn btn-secondary modal-close" type="reset" data-dismiss="modal">Cancel</button>
                                            <button class="btn btn-primary modal-close" type="submit" data-dismiss="modal">Submit</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="modal-overlay"></div>
                        <!-- modal ends here --> 
                    </div>
                </div>
            </div>

            <!-- /Modal to open Resume update button-->
            <div class="modal fade" id="resume_update" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Update Resume</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="../CandidateController" method="post" name="frm" enctype="multipart/form-data">
                            <input type="hidden" name="id" value="${param.id}">
                            <div class="modal-body">
                                <div class="form-group row">
                                    <label class="col-3 col-lg-2 col-form-label text-right" >Select Your Resume</label>
                                    <div class="col-9 col-lg-10">
                                        <input class="form-control" name="resumeFile"  type="file" required="">
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-space btn-primary" type="submit" name="action" value="editResume" onclick="">Save Resume</button>
                                <button class="btn btn-space btn-secondary" type="submit" name="action" value="deleteResume">Delete Resume</button>
                                <button data-dismiss="modal" class="btn btn-space btn-secondary">Back</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- /Modal to open Resume update button-->

            <!-- Modal to open resume upload button-->
            <div class="modal fade" id="resume_upload" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Upload Resume</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="../CandidateController" method="post" name="frm" enctype="multipart/form-data">
                            <input type="hidden" name="id" value="${param.id}">
                            <div class="modal-body">
                                <div class="form-group row">
                                    <label class="col-3 col-lg-2 col-form-label text-right" >Select Your Resume</label>
                                    <div class="col-9 col-lg-10">
                                        <input class="form-control" name="resumeFile"  type="file" required="">
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-space btn-primary" type="submit" name="action" value="uploadResume" onclick="">Save Resume</button>
                                <button data-dismiss="modal" class="btn btn-space btn-secondary">Back</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- /Modal to open resume upload button-->

            <!-- Modal to open about me update button-->
            <div class="modal fade" id="modalAboutMe" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">About me</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="../CandidateController" method="post" name="frm">
                            <input type="hidden" name="id" value="${param.id}">
                            <div class="modal-body">
                                <div class="form-group row">
                                    <div class="col-9 col-lg-10">
                                        <textarea class="form-control" required="" name="aboutMe" placeholder="Write about yourself..." rows="3"><%= (candMol.findCandidateSummary(String.valueOf(session.getAttribute("CandidateId"))) == ("null")) || (candMol.findCandidateSummary(String.valueOf(session.getAttribute("CandidateId"))) == ("")) || (candMol.findCandidateSummary(String.valueOf(session.getAttribute("CandidateId"))) == (null)) ? "" : candMol.findCandidateSummary(String.valueOf(session.getAttribute("CandidateId")))%></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-space btn-primary" type="submit" name="action" value="saveAboutMe">Save Changes</button>
                                <button data-dismiss="modal" class="btn btn-space btn-secondary">Back</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- /Modal to open about me update button-->

            <!-- Modal to open job role update button-->
            <div class="modal fade" id="modalJobRole" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Abb Job Role</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="../CandidateController" method="post" name="frm">
                            <input type="hidden" name="id" value="${param.id}">
                            <div class="modal-body">
                                <div class="form-group row">
                                    <div class="col-9 col-lg-10">

                                        <div class="dropdown show">

                                            <select class=" form-control" name="jobRole" required>
                                                <option selected disabled value="<%= (bean.getJobRole() == ("null")) || (bean.getJobRole() == ("")) || (bean.getJobRole() == (null)) ? "" : bean.getJobRole()%>" ><%= (bean.getJobRole() == ("null")) || (bean.getJobRole() == ("")) || (bean.getJobRole() == (null)) ? "Select Job Role" : bean.getJobRole()%></option>
                                                <%
                                                    ArrayList<TblCandidate> candidates = candMol.selectJobRole();
                                                    for (TblCandidate candidateJobRole : candidates) {
                                                %>
                                                <option value="<%= candidateJobRole.getJobRole()%>"><%= candidateJobRole.getJobRole()%></option>
                                                <%
                                                    }
                                                %>
                                            </select>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-space btn-primary" type="submit" name="action" value="saveJobRole">Save Changes</button>
                                <button data-dismiss="modal" class="btn btn-space btn-secondary">Back</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- /Modal to open job role update button-->

            <!-- Modal to open education update button-->
            <div class="modal fade" id="modalEducation" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Education Details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="../CandidateController" method="post" name="frm">
                            <input type="hidden" name="id" value="${param.id}">
                            <div class="modal-body">
                                <div class="form-group row">
                                    <div class="col-9 col-lg-10">

                                        <div class="card card-border-color card-border-color-primary">
                                            <div class="card-body">
                                                <br>
                                                <select class=" form-control" name="schoolMedium" required>
                                                    <option value="<%= bean.getSchoolMedium() == "null" || bean.getSchoolMedium() == ("") || bean.getSchoolMedium() == (null) ? "" : bean.getSchoolMedium()%>" ><%= bean.getSchoolMedium() == "null" || bean.getSchoolMedium() == ("") || bean.getSchoolMedium() == (null) ? "Select Your School Medium" : bean.getSchoolMedium()%></option>
                                                    <option value="English">English</option>
                                                    <option value="Hindi">Hindi</option>
                                                    <option value="Marathi">Marathi</option>
                                                    <option value="Urdu">Urdu</option>
                                                    <option value="Others">Others</option>
                                                </select>
                                                <br>
                                                <select class=" form-control pt-1" name="qualification" required>
                                                    <option selected disabled value="<%= (bean.getQualification() == ("null")) || (bean.getQualification() == ("")) || (bean.getQualification() == (null)) ? "" : bean.getQualification()%>" ><%= (bean.getQualification() == ("null")) || (bean.getQualification() == ("")) || (bean.getQualification() == (null)) ? "Select Your Qualification" : bean.getQualification()%></option>
                                                    <option value="Below 10th Pass">Below 10th Pass</option>
                                                    <option value="10th Pass">10th Pass</option>
                                                    <option value="12th Pass and bove">12th Pass and bove</option>
                                                    <option value="Graduate">Graduate</option>
                                                    <option value="Post Graduate">Post Graduate</option>
                                                </select>
                                                <br>
                                                <br>
                                            </div>
                                        </div>
                                    </div>
                                </div>                                                            
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-primary btn-space" type="submit" name="action" value="saveEducationDetails">Save Changes</button>
                                <button data-dismiss="modal" class="btn btn-space btn-secondary">Back</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- /Modal to open education update button-->

            <!-- Modal to open experience update button-->
            <div class="modal fade" id="modalExperience" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Experience Details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="../CandidateController" method="post" name="frm">
                            <input type="hidden" name="id" value="${param.id}">
                            <div class="modal-body">
                                <div class="form-group row">
                                    <div class="col-9 col-lg-10">

                                        <div class="card card-border-color card-border-color-primary">
                                            <div class="card-body">
                                                <br>
                                                <select class=" form-control" name="experienceYear" required>
                                                    <option value="<%= (candidateDetails.getExperience() == ("null")) || (candidateDetails.getExperience() == ("")) || (candidateDetails.getExperience() == (null)) ? "" : candidateDetails.getExperience()%>" >
                                                        <%= (candidateDetails.getExperience() == ("null")) || (candidateDetails.getExperience() == ("")) || (candidateDetails.getExperience() == (null)) ? "Select Your Experience Year" : candidateDetails.getExperience()%>
                                                    </option>
                                                    <option value="Fresher">Fresher</option>
                                                    <option value="Exp-(0-6month)">Exp-(0-6month)</option>
                                                    <option value="Exp-(0-1year)">Exp-(0-1year)</option>
                                                    <option value="Exp-(0-2year)">Exp-(0-2year)</option>
                                                    <option value="Exp-(0-3year)">Exp-(0-3year)</option>
                                                    <option value="Exp-(0-4year)">Exp-(0-4year)</option>
                                                    <option value="Exp-(4year+)">Exp-(4year+)</option>
                                                </select>
                                                <br>

                                                <textarea class="form-control" required="" name="aboutexperianceDetail" placeholder="Write about yourself experience..." rows="3"><%= (candidateDetails.getExperienceDetails() == ("null")) || (candidateDetails.getExperienceDetails() == ("")) || (candidateDetails.getExperienceDetails() == (null)) ? "" : candidateDetails.getExperienceDetails()%></textarea>

                                                <br>
                                                <br>
                                            </div>
                                        </div>
                                    </div>
                                </div>                                                            
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-primary btn-space" type="submit" name="action" value="saveExperianceDetails">Save Changes</button>
                                <button data-dismiss="modal" class="btn btn-space btn-secondary">Back</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Modal to open experience update button-->

            <!-- Modal to open skills update button-->
            <div class="modal fade" id="modalSkills" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Skills And Expertise</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="../CandidateController" method="post" name="frm">
                            <input type="hidden" name="id" value="${param.id}">
                            <div class="modal-body">
                                <div class="form-group row">
                                    <div class="col-9 col-lg-10">

                                        <div class="card card-border-color card-border-color-primary">
                                            <div class="card-body">
                                                <br>

                                                <select class=" form-control" id="englishFluency" name="englishFluency" required>
                                                    <option value="<%= (bean.getEnglishSkill() == ("null")) || (bean.getEnglishSkill() == ("")) || (bean.getEnglishSkill() == (null)) ? "" : bean.getEnglishSkill()%>" >
                                                        <%= (bean.getEnglishSkill() == ("null")) || (bean.getEnglishSkill() == ("")) || (bean.getEnglishSkill() == (null)) ? "Select Your English Accuracy" : bean.getEnglishSkill()%>
                                                    </option>
                                                    <option value="None">None</option>
                                                    <option value="Poor">Poor</option>
                                                    <option value="Good">Good</option>
                                                    <option value="Fluent">Fluent</option>
                                                </select>
                                                <br>

                                                <div class="form-check">

                                                    <div class="form-group row">
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <input class="form-control" type="text" name="txtJobRole" id="jobRole" onchange="keySkillChange()" >

                                                                <div id="dynamicSkill">

                                                                    <select class="form-control" name="txtSkillSet" onclick="showCheckboxes()">
                                                                        <option  value="" >Select Skill</option>
                                                                    </select>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <br>
                                                    <br>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>                                                            
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-primary btn-space" type="submit" name="action" value="saveSkills">Save Changes</button>
                                <button data-dismiss="modal" class="btn btn-space btn-secondary">back</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Modal to open skills update button-->

            <!-- Modal to open personal info update button-->
            <div class="modal fade" id="modalPersonal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Personal Details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="../CandidateController" method="post" name="frm">
                            <input type="hidden" name="id" value="${param.id}">
                            <div class="modal-body">
                                <div class="form-group row">
                                    <div class="col-9 col-lg-10">

                                        <div class="card card-border-color card-border-color-primary">
                                            <div class="card-body">
                                                <br>
                                                <input type="number" class="form-control" placeholder="Enter your age" name="age" value="<%= ((bean.getAge() == 0) ? "" : bean.getAge())%>" required="">
                                                <br>

                                                <div id="dynamicExperience"></div>

                                                <input type="text" class="form-control" placeholder="Enter your address" name="address" value="<%= ((bean.getAddress() == null) ? "" : bean.getAddress())%>" required="">
                                                <br>


                                                <%
                                                    if (((bean.getState() == null || bean.getState() == "null" || bean.getState() == "")) && ((bean.getCity() == null || bean.getCity() == "null" || bean.getCity() == ""))) {
                                                %>
                                                <select onchange="print_city('state', this.selectedIndex);" id ="sts" name="txtState" class="form-control form-control-sm" required></select>
                                                <br>

                                                <select id="state" class="form-control form-control-sm" required name="txtCity"></select>
                                                <br>

                                                <%
                                                } else {
                                                %>
                                                <input type="text" class="form-control" placeholder="Enter your State" name="txtState" value="<%= ((bean.getState() == null || bean.getState() == "null" || bean.getState() == "") ? "" : bean.getState())%>" required="">
                                                <br>

                                                <input type="text" class="form-control" placeholder="Enter your City" name="txtCity" value="<%= ((bean.getCity() == null || bean.getCity() == "null" || bean.getCity() == "") ? "" : bean.getCity())%>" required="">
                                                <br>
                                                <%
                                                    }
                                                %>

                                                <h4 style="font-weight: bold">Select your gender</h4>
                                                <div class="form-check">

                                                    <%
                                                        if (((bean.getGender() == null || bean.getGender() == "null" || bean.getGender() == ""))) {
                                                    %>
                                                    <input type="radio" id="male" name="gender" value="Male" required="" >
                                                    <label  for="male">Male</label><br>

                                                    <input type="radio" id="female" name="gender" value="Female" required="" >
                                                    <label for="female">Female</label><br>
                                                    <%
                                                    } else {
                                                        if (bean.getGender().equals("Male")) {
                                                    %>
                                                    <input type="radio" id="male" name="gender" value="Male" required="" checked="">
                                                    <label  for="male">Male</label><br>

                                                    <input type="radio" id="female" name="gender" value="Female" required="" >
                                                    <label for="female">Female</label><br>

                                                    <%
                                                    } else if (bean.getGender().equals("Female")) {
                                                    %>
                                                    <input type="radio" id="male" name="gender" value="Male" required="" >
                                                    <label  for="male">Male</label><br>

                                                    <input type="radio" id="female" name="gender" value="Female" required="" checked="">
                                                    <label for="female">Female</label><br>

                                                    <%
                                                    } else {
                                                    %>
                                                    <input type="radio" id="male" name="gender" value="Male" required="" >
                                                    <label  for="male">Male</label><br>

                                                    <input type="radio" id="female" name="gender" value="Female" required="" >
                                                    <label for="female">Female</label><br>
                                                    <%
                                                            }
                                                        }
                                                    %>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>                                                            
                            </div>
                            <script language="javascript">print_state("sts");</script>
                            <div class="modal-footer">
                                <button class="btn btn-primary btn-space" type="submit" name="action" value="savePersonalDetails">Save Changes</button>
                                <button data-dismiss="modal" class="btn btn-space btn-secondary">Back</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- /Modal to open personal info update button-->
            
        </div>





            <script src="../assets/lib/jquery/jquery.min.js" type="text/javascript"></script>
            <script src="../assets/lib/perfect-scrollbar/js/perfect-scrollbar.min.js" type="text/javascript"></script>
            <script src="../assets/lib/bootstrap/dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
            <script src="../assets/js/app.js" type="text/javascript"></script>
            <script src="../assets/lib/jquery.niftymodals/js/jquery.niftymodals.js" type="text/javascript"></script>

            <script src="../assets/lib/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
            <script src="../assets/lib/jquery.nestable/jquery.nestable.js" type="text/javascript"></script>
            <script src="../assets/js/app.js" type="text/javascript"></script>
            <script src="../assets/lib/moment.js/min/moment.min.js" type="text/javascript"></script>
            <script src="../assets/lib/datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
            <script src="../assets/lib/select2/js/select2.min.js" type="text/javascript"></script>
            <script src="../assets/lib/select2/js/select2.full.min.js" type="text/javascript"></script>
            <script src="../assets/lib/bootstrap-slider/bootstrap-slider.min.js" type="text/javascript"></script>
            <script src="../assets/lib/bs-custom-file-input/bs-custom-file-input.js" type="text/javascript"></script>

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