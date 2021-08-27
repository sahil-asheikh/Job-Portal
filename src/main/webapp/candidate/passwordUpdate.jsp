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

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="stylesheet" href="../assets/mycss/sweetalert.css" type="text/css"/>
        <script src="../assets/myjs/sweetalert.js" type="text/javascript"></script>
        <script src="../assets/myjs/passwordValidation.js" type="text/javascript"></script>

        <script>

            var check1 = function () {


                var newPwd = document.getElementById("newPwd").value;
                var confirmPwd = document.getElementById("confirmPwd").value;

                if (newPwd === confirmPwd)
                {
                    document.getElementById('message').style.color = 'green';
                    document.getElementById('message').innerHTML = 'Password Matched';
                } else {
                    document.getElementById('message').style.color = 'red';
                    document.getElementById('message').innerHTML = 'Not Mached';
                }
            }
        </script>



    </head>
    <body>
        <div class="be-wrapper">

            <%@include file="navbar.jsp" %>

            <%@include file="sidebar.jsp" %>

            <%
                CandidateModel candMol = new CandidateModel();
                TblCandidate bean = candMol.selectById(String.valueOf(session.getAttribute("CandidateId")));
            %>
            <%-- content starts here --%>
            <div class="be-content mt-2">
                <div class="col-lg-8 ">
                    <div class="card card-border-color card-border-color-primary">
                        <div class="card-header card-header-divider">Password Update<span class="card-subtitle"></span></div>
                        <div class="card-body">
                            
                            <form action="../CandidateController" method="get" name="frm">
                                <input type="hidden" name="action" value="passwordUpdate">
                                <input type="hidden" name="id" value="${param.id}">
                                <div class="form-group row">
                                    <label class="col-3 col-lg-2 col-form-label text-right" >Password</label>
                                    <div class="col-9 col-lg-10">
                                        <input class="form-control" name="validPassword"  type="text" required=""  placeholder="Enter the password you remember">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-3 col-lg-2 col-form-label text-right" > New Password</label>
                                    <div class="col-9 col-lg-10">
                                        <input class="form-control" name="newPassword" id="newPwd" type="password"  onkeyup="check1();" placeholder="Enter new password">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-3 col-lg-2 col-form-label text-right" >Confirm password</label>
                                    <div class="col-9 col-lg-10">
                                        <span id="message"></span>
                                        <input class="form-control" name="confirmPassword" id="confirmPwd" type="password"  onkeyup="check1();" placeholder="ReEnter password">
                                    </div>
                                </div>
                                <div class="col-sm-6 pl-0">
                                    <p class="text-right">
                                        <button class="btn btn-space btn-primary" type="submit" onclick=" return passwordValidation();">Submit</button>
                                        <button class="btn btn-space btn-secondary">Cancel</button>
                                    </p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
        
    </body>
</html>
