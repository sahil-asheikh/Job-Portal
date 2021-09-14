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
        <script src="assets/myjs/cities.js"></script>


    </head>
    <body>




        <div class="be-wrapper">
            <%@ include file = "navbar.jsp" %>
            <%@include file="sidebar.jsp" %>

            <%                CandidateModel candMol = new CandidateModel();
                TblCandidate bean = candMol.selectById(request.getParameter("cid"));

                // System.out.println(bean.getSerialNo());
                // System.out.println(bean.getException());
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
                                        <input type="hidden" name="CandidateId" value="<%= bean.getFullName()%>" >
                                        <div class="name"> <%= bean.getFullName()%> </div>

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
                                            <blockquote class="blockquote"><span class="text-info"> Job Role :</span> <%= bean.getJobRole()%> </blockquote>
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
                    <div class="col-lg-10 offset-1">
                        <div class="card card-border card-contrast">
                            <div class="card-header card-header-contrast">About Me &nbsp;<span class="icon mdi mdi-account"></span></div>
                            <blockquote class="blockquote">
                                <div class="card-body">
                                    <!--                                <span class="card-subtitle">I am a web developer and designer based in Montreal - Canada, I like read books, good music and nature.</span>-->
                                    <span><%= candMol.findCandidateSummary(String.valueOf(session.getAttribute("CandidateId")))%></span>
                                </div>
                            </blockquote>
                        </div>
                    </div>
                    <div class="col-lg-10 offset-1">
                        <div class="card card-border card-contrast">
                            <div class="card-header card-header-contrast ">Education &nbsp;<span class="icon mdi mdi-graduation-cap"></span></div>
                                <%if (bean.getSubscriptionId() == null || bean.getSubscriptionId() == "null") {%>

                            <%} else {%>
                            <blockquote class="blockquote">
                                <div class="card-body">
                                    <table  class="table">
                                        <tbody>
                                            <tr>
                                                <td class="text-info">School Medium :</td>
                                                <td> <%= bean.getSchoolMedium()%></td>
                                            </tr>
                                            <tr>
                                                <td class="text-info">Qualification :</td>
                                                <td> <%= bean.getQualification()%></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </blockquote>
                            <%}%>
                        </div>
                    </div>
                    <div class="col-lg-10 offset-1">
                        <div class="card card-border card-contrast">
                            <div class="card-header card-header-contrast">Experience &nbsp;<span class="icon mdi mdi-case"></span>
                            </div>
                            <div class="card-body">
                                <blockquote class="blockquote">
                                    <table  class="table">
                                        <tbody>
                                            <tr>
                                                <td><span class="text-info">Experience Year :</span></td>
                                                <td> <span class=""> <%= ((bean.getFresherExperience() == null || bean.getFresherExperience() == "null" || bean.getFresherExperience() == "") ? "No Experience" : bean.getFresherExperience())%></span></td>

                                            </tr>
                                            <tr>
                                                <td><span class="text-info">Experience Detail :</span></td>
                                                <td><%= candMol.findCandidateExperience(String.valueOf(session.getAttribute("CandidateId")))%></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </blockquote>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-10 offset-1">
                        <div class="card card-contrast">
                            <div class="card-header card-header-contrast card-header-featured">Skills And Expertise &nbsp;<i class="fa fa-star"></i></div>
                            <div class="card-body">
                                <blockquote class="blockquote">
                                    <table  class="table">
                                        <tbody>

                                            <tr>
                                                <td class="text-info">English Skill :</td>
                                                <td> 
                                                    <%= bean.getEnglishSkill()%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><span class="text-info">Skill Set :</span>&nbsp;</td>
                                                <td><%= bean.getSkillSet()%></td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </blockquote></div>
                        </div>   
                    </div>
                            <div class="col-lg-10 offset-1">
                                <div class="card card-contrast">
                                    <div class="card-header card-header-contrast card-header-featured">Personal Details &nbsp;<i class="fa fa-user-circle"></i></div>
                                    <div class="card-body">
                                        <blockquote class="blockquote">
                                            <table  class="table">
                                                <tbody>
                                                    <tr>
                                                        <td class="text-info">Phone No :</td>
                                                        <td>
                                                            <%= bean.getPhone_No()%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-info">Age :</td>
                                                        <td colspan="2">
                                                            <%= bean.getAge()%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-info">Gender :</td>
                                                        <td colspan="2">
                                                            <%= bean.getGender()%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-info">Address :</td>
                                                        <td colspan="2">
                                                            <%= bean.getAddress()%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-info">City :</td>
                                                        <td colspan="2">
                                                            <%= bean.getCity()%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-info">State :</td>
                                                        <td colspan="2">
                                                            <%= bean.getState()%>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </blockquote>
                                    </div>
                                </div>   
                            </div>
                    <!-- End Main Content --->

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




            <script src="../assets/lib/jquery/jquery.min.js" type="text/javascript"></script>
            <script src="../assets/lib/perfect-scrollbar/js/perfect-scrollbar.min.js" type="text/javascript"></script>
            <script src="../assets/lib/bootstrap/dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
            <script src="../assets/js/app.js" type="text/javascript"></script>
            <script src="../assets/lib/jquery.niftymodals/js/jquery.niftymodals.js" type="text/javascript"></script>
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