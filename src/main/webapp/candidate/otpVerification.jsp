<%-- 
    Document   : otpVerification
    Created on : 12 Oct, 2020, 1:09:46 PM
    Author     : Zoya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <%@include file="head.jsp" %>
        <link rel="stylesheet" type="text/css" href="../assets/lib/perfect-scrollbar/css/perfect-scrollbar.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/material-design-icons/css/material-design-iconic-font.min.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/datetimepicker/css/bootstrap-datetimepicker.min.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/select2/css/select2.min.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/bootstrap-slider/css/bootstrap-slider.min.css"/
        <script src="../assets/myjs/cities.js"></script>
        <link rel="stylesheet" href="../assets/mycss/sweetalert.css" type="text/css"/>
        <script src="../assets/myjs/sweetalert.js" type="text/javascript"></script>
        <script src="../assets/myjs/otpValidation.js" type="text/javascript"></script>
    </head>
    <body class="be-splash-screen">
        <div class="be-wrapper">
            <div class="be-content">
                <div class="main-content container">
                   
                    <div class="container col-sm-5 mt-4 ">
                         <div class="card card-contrast">
                            <div class="card-header  card-header-contrast "><span class="text-success"><b>${param.phMsg}</b></span>
                            </div>
                            ${param.page}                           
                            <div class="card-body">
                                <form method="post" action="../ResetPasswordController" name="frm">
                                    <input type="hidden" name="action" value="candidateOTP">
                                    <div class="login-form">
                                        <div class="form-group">
                                            <label>OTP is send to your Mobile Number</label>
                                            <input class="form-control"   name="txtOTP" type="text" placeholder="Enter OTP"  required autocsomplete="off">
                                        </div>
                                        <p class="text-danger text-right">${param.veriMsg}</p>
                                        <div class="form-group">
                                            <p class="text-right">
                                            <button class="btn btn-space btn-primary" type="submit" onclick=" return OTPvalidation();">
                                                Verify OTP
                                            </button>
                                            </p>
                                        </div>
                                       
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

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
