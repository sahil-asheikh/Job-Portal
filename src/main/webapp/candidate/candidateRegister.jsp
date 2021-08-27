
<%@page import="com.qt.jobportal.beans.tblSubscriptionCandidate"%>
<%@page import="com.qt.jobportal.models.SubscriptionCandidateModel"%>
<%-- 
    Document   : candidateRegister
    Created on : 5 Feb, 2020, 4:15:41 PM
    Author     : win8.1
--%>

<%@page import="com.qt.jobportal.beans.TblSystemSetting"%>
<%@page import="com.qt.jobportal.models.SystemSettingModel"%>

<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.jsp" %>
        <link rel="stylesheet" type="text/css" href="../assets/lib/perfect-scrollbar/css/perfect-scrollbar.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/material-design-icons/css/material-design-iconic-font.min.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/datetimepicker/css/bootstrap-datetimepicker.min.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/select2/css/select2.min.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/bootstrap-slider/css/bootstrap-slider.min.css"/>

        <script src="../assets/myjs/cities.js"></script>


        <link rel="stylesheet" href="../assets/mycss/sweetalert.css" type="text/css"/>
        <script src="../assets/myjs/sweetalert.js" type="text/javascript"></script>
        <script src="../assets/myjs/candidateValidation.js" type="text/javascript"></script>



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

    <body class="be-splash-screen">

        <%      
//            SubscriptionCandidateModel subCandMol = new SubscriptionCandidateModel();
//           tblSubscriptionCandidate beanSubCandidate = subCandMol.selectById(request.getParameter("cpid"));

         %>

        
         
        <div class="be-wrapper be-login be-signup">
            <div class="be-content">

                <div class="main-content container-fluid">
                    <div class="splash-container sign-up">
                        <form action="../CandidateController"  name="frm" method="post">
                            <input type="hidden" name="action" value="insert">
                            <input type="hidden" name="id" value="${param.id}">

                            <div class="card card-border-color card-border-color-primary">
                                <div class="card-header"><img class="logo-img" src="../assets/img/logo-xx.png" alt="logo" width="102" height="27"></div>
                                <div class="card-body">

                                    <span class="splash-title pb-4">Create A New Account</span>
                                    <span class="splash-description">For Candidates Only</span>
                                    <hr>
                                    <span class="splash-title pb-4">Personal Details</span>
                                    
                                       
                                      <input class="form-control" type="hidden" name="txtSubscription" value="<%// beanSubCandidate.getSubCandPublicId()%>">
                        
                                    <div class="form-group">
                                        <input class="form-control" type="text" name="txtFullName" required placeholder="Enter Your Full Name" autocomplete="off">
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group-prepend"><span class="input-group-text">+91</span>
                                            <input class="form-control" type="text" name="txtPhoneNo" required placeholder="Enter your Phone No" autocomplete="off">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <input class="form-control" type="text" name="txtPassword" required placeholder="Enter Your password" autocomplete="off">
                                    </div>

                                    <div class="form-group">
                                        <input class="form-control" type="text" name="txtEmailId" required placeholder="Enter Your email id" autocomplete="off">
                                    </div>

                                    <div class="form-group mt-4">
                                        <input class="form-control" type="number" name="txtAge" required="" placeholder="Enter your Age">
                                    </div>
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


                            <div class="card card-border-color card-border-color-primary">
                                <div class="card-body">
                                    <span class="splash-title pb-4">Enter your Education Details</span>
                                    <br>
                                    <select class=" form-control pt-1" name="slQualification" required>

                                        <option selected disabled value="" >Select Your Qualification</option>
                                        <option value="BelowTen">Below 10th pass</option>
                                        <option value="Ten">10th pass</option>
                                        <option value="Twelve">12th pass and above</option>
                                        <option value="Graduate">Graduate</option>
                                        <option value="PostGraduate">Post Graduate</option>
                                    </select>
                                    <br>
                                    <select class=" form-control" name="slSchoolMedium" required>
                                        <option selected disabled value="" >Select Your School Medium</option>
                                        <option value="English">English</option>
                                        <option value="Hindi">Hindi</option>
                                        <option value="Marathi">Marathi</option>
                                        <option value="Urdu">Urdu</option>
                                        <option value="Others">Others</option>
                                    </select>
                                    <br>
                                    <select class=" form-control" name="slEnglishAccuracy" required>
                                        <option selected disabled value="" >Select Your English Accuracy</option>
                                        <option value="NoEnglish">No English</option>
                                        <option value="thoda">Thoda</option>
                                        <option value="good">Good</option>
                                        <option value="fluent">Fluent</option>
                                    </select>
                                    <br>
                                     <select class=" form-control" name="rdFE" required onchange="workExp()">
                                        <option selected disabled value="" >Select You are Fresher/Experience</option>
                                        <option value="Fresher">Fresher</option>
                                        <option value="Exp-(0-6month)">Exp-(0-6month)</option>
                                        <option value="Exp-(0-1year)">Exp-(0-1year)</option>
                                        <option value="Exp-(0-2year)">Exp-(0-2year)</option>
                                        <option value="Exp-(0-3year)">Exp-(0-3year)</option>
                                        <option value="Exp-(0-4year)">Exp-(0-4year)</option>
                                        <option value="Exp-(4year+)">Exp-(4year+)</option>


                                    </select>

                                </div>
                            </div>
                            <div class="card card-border-color card-border-color-primary">
                                <div class="card-body">
                                    <div class="form-group row">
                                        <div class="col-12">
                                            <span class="splash-title pb-4">Choose Your Job Role(maximum 4 roles)</span>
                                        </div>
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

                             
                                    <div id="dynamicExperience"></div>
                                    <div class="form-group">
                                        <div class="form-group">
                                            <select onchange="print_city('state', this.selectedIndex);" id ="sts" name="txtState" class="form-control form-control-sm" required>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="form-group">
                                            <select id="state" class="form-control form-control-sm" required name="txtCity">                                                  </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-12 col-lg-12 ">
                                            <textarea class="form-control" name="txtAddress" title="Enter your Address" placeholder="Enter Your Address"></textarea>
                                        </div>
                                    </div>

                                </div>

                            </div>
                        
                        </form></div>

                </div>

                <div class="form-group pt-3 mb-3">
                    <div class="be-checkbox custom-control custom-checkbox">
                        <input type="checkbox" name="chkTerms">
                        <label class="custom-control-label" for="checkbox">By creating an account, you agree the <a href="#">terms and conditions</a>.</label>



                    </div>
                </div>


                <div class="form-group pt-2 mt-2">
                    <button class="btn btn-block btn-primary btn-xl" type="submit" onclick="return candidateValidation();">Register Here</button>
                                                    <button class="btn btn-space btn-danger" type="reset">Reset</button>
                    <span>${param.message}</span>

                </div>


            </div>
        </div>
                    
   




<script language="javascript">print_state("sts");</script>

<%@include file="footer.jsp" %>

<script src="../assets/lib/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="../assets/lib/jquery.nestable/jquery.nestable.js" type="text/javascript"></script>
<script src="../assets/js/app.js" type="text/javascript"></script>
<script src="../assets/lib/moment.js/min/moment.min.js" type="text/javascript"></script>
<script src="../assets/lib/datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<script src="../assets/lib/select2/js/select2.min.js" type="text/javascript"></script>
<script src="../assets/lib/select2/js/select2.full.min.js" type="text/javascript"></script>
<script src="../assets/lib/bootstrap-slider/bootstrap-slider.min.js" type="text/javascript"></script>
<script src="../assets/lib/bs-custom-file-input/bs-custom-file-input.js" type="text/javascript"></script>

</body>
</html>
