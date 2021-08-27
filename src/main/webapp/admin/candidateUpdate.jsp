
<%-- 
    Document   : candidateUpdate
    Created on : 6 Feb, 2020, 5:23:06 PM
    Author     : win8.1
--%>

<%@page import="com.qt.jobportal.beans.TblCandidate"%>
<%@page import="com.qt.jobportal.models.CandidateModel"%>
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
    </head>
    <body>
        <%
            CandidateModel candidate = new CandidateModel();
            TblCandidate beanCandidate = candidate.selectById(request.getParameter("cid"));

        %>

        <%@include file="navbar.jsp" %>
        <%@include file="sidebar.jsp" %>

        <div class="main-content container-fluid">
            <div class="splash-container sign-up">
                <form method="post" action="../CandidateController">
                    <input type="hidden" name="action" value="update"/>
                    <input type="hidden" name="id" value="<%= beanCandidate.getId()%>">

                    <div class="card card-border-color card-border-color-primary">
                        <div class="card-header">
                            <img class="logo-img" src="../assets/img/logo-xx.png" alt="logo" width="102" height="27"></div>
                        <div class="card-body">

                            <span class="splash-title pb-4">Update Account</span>
                            <hr>

                            <span class="splash-title pb-4">Personal Details</span>


                            <div class="form-group">
                                <input class="form-control" type="text" name="txtFullName" value="<%= beanCandidate.getFullName()%>">
                            </div>
                            
                            <div class="form-group">
                                
                                <input class="form-control form-control-sm" id="txtEmailId" type="email" name="txtEmailId" value="<%= beanCandidate.getEmailId()%>">
                            </div>

                            <div class="form-group mt-4">
                                <input class="form-control" type="number" name="txtAge" required="" value="<%= beanCandidate.getAge()%>">
                            </div>
                            <div class="form-group row pt-3">
                               
                                <div class="col-12 col-sm-8 col-lg-6">
                                    <div class="form-check form-check-inline">
                                        <label class="custom-control custom-radio custom-radio-icon custom-control-inline">
                                            <input class="custom-control-input" name="rdGender" type="radio" checked="female" value="female"<%= beanCandidate.getGender().equals("female") ? "selected" : ""%>  >
                                            <span class="custom-control-label">
                                                <i class="mdi mdi-female mt-1"></i>
                                            </span>
                                        </label>
                                        <label class="custom-control custom-radio custom-radio-icon custom-control-inline">
                                            <input class="custom-control-input" name="rdGender" type="radio" value="male" <%= beanCandidate.getGender().equals("male") ? "selected" : ""%>  >
                                            <span class="custom-control-label">
                                                <i class="mdi mdi-male-alt mt-1"></i>
                                            </span>
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
                            <select class=" form-control pt-1" name="slQualification"  value="<%= beanCandidate.getQualification()%>" required>

                                <option selected disabled value="" >Select Your Qualification</option>
                                <option value="BelowTen" <%= beanCandidate.getQualification().equals("BelowTen") ? "selected" : ""%>>Below 10th pass</option>
                                <option value="Ten" <%= beanCandidate.getQualification().equals("Ten") ? "selected" : ""%>>10th pass</option>
                                <option value="Twelve" <%= beanCandidate.getQualification().equals("Twelve") ? "selected" : ""%>>12th pass and above</option>
                                <option value="Graduate" <%= beanCandidate.getQualification().equals("Graduate") ? "selected" : ""%>>Graduate</option>
                                <option value="PostGraduate" <%= beanCandidate.getQualification().equals("PostGraduate") ? "selected" : ""%>>Post Graduate</option>
                            </select>
                            <br>
                            <select class=" form-control" name="slSchoolMedium">
                                <option selected disabled value="" >Select Your School Medium</option>
                                <option value="English" <%= beanCandidate.getSchoolMedium().equals("English") ? "selected" : ""%>>English</option>
                                <option value="Hindi" <%= beanCandidate.getSchoolMedium().equals("Hindi") ? "selected" : ""%>>Hindi</option>
                                <option value="Marathi" <%= beanCandidate.getSchoolMedium().equals("Marathi") ? "selected" : ""%>>Marathi</option>
                                <option value="Others" <%= beanCandidate.getSchoolMedium().equals("Others") ? "selected" : ""%>>Others</option>
                            </select>
                            <br>
                            <select class=" form-control" name="slEnglishAccuracy" value="<%= beanCandidate.getEnglishSkill()%>" required>
                                <option selected disabled value=""  >Select Your English Accuracy</option>
                                <option value="NoEnglish" <%= beanCandidate.getEnglishSkill().equals("NoEnglish") ? "selected" : ""%>>No English</option>
                                <option value="thoda" <%= beanCandidate.getEnglishSkill().equals("thoda") ? "selected" : ""%>>Thoda</option>
                                <option value="good" <%= beanCandidate.getEnglishSkill().equals("good") ? "selected" : ""%>>Good</option>
                                <option value="fluent" <%= beanCandidate.getEnglishSkill().equals("fluent") ? "selected" : ""%>>Fluent</option>
                            </select>
                            <br>
                            <select class=" form-control" name="rdFE"  value="<%= beanCandidate.getFresherExperience()%>" required>
                                <option selected disabled value="" >Select You are Fresher/Experience</option>
                                <option value="fresher" <%= beanCandidate.getFresherExperience().equals("fresher") ? "selected" : ""%>>Fresher</option>
                                <option value="experience" <%= beanCandidate.getFresherExperience().equals("experience") ? "selected" : ""%>>Experience</option>

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
                                    <select class=" form-control" name="txtJobRole"  value="<%= beanCandidate.getJobRole()%>" required>
                                        <!--<select class="tags" multiple="" name="txtJobRole">-->
                                        <option vlaue="BackOffice" <%= beanCandidate.getJobRole().equals("BackOffice") ? "selected" : ""%>>Back Office</option>
                                        <option value="OfficeBoy/Peon" <%= beanCandidate.getJobRole().equals("OfficeBoy/Peon") ? "selected" : ""%>>Office Boy/Peon</option>
                                        <option value="CounterSales" <%= beanCandidate.getJobRole().equals("CounterSales") ? "selected" : ""%>>Counter Sales</option>
                                        <option value="Accounts" <%= beanCandidate.getJobRole().equals("Accounts") ? "selected" : ""%>>Accounts</option>
                                        <option value="Delivery" <%= beanCandidate.getJobRole().equals("Delivery") ? "selected" : ""%>>Delivery</option>
                                        <option value="4">Telecalling</option>
                                        <option value="4">....</option>
                                    </select>
                                    <br>
                                    <br>
                                    <div class="form-group">
                                        <input class="form-control" type="text" name="txtSkillSet" value="<%= beanCandidate.getSkillSet()%>">
                                    </div>



                                    <input class="form-control" type="text" name="txtState" required value="<%= beanCandidate.getState()%>">

                                    </select>
                                    <br>
                                    <input class="form-control" name="txtCity" value="<%= beanCandidate.getCity()%>" required>
                                    <br>
                                    <div class="form-group">
                                       
                                        <textarea class="form-control form-control-sm" id="txtAddress" name="txtAddress" ><%= beanCandidate.getAddress()%></textarea>                                        
                                    </div>



                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group pt-2 mt-2">
                        <button class="btn btn-block btn-primary btn-xl" type="submit"> Save Changes </button>
                    </div>
                </form>
                    <div class="form-group pt-3 mb-3">
                        <div class="custom-control custom-checkbox">
                            <input class="custom-control-input" type="checkbox" name="check1">
                            <label class="custom-control-label" for="check1">By creating an account, you agree the <a href="#">terms and conditions</a>.</label>
                        </div>
                    </div>
            </div>
        </div>
   




    <%@include file="footer.jsp" %>

    




</body>
</html>
