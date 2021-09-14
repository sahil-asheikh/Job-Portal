<%-- 
    Document   : employerSignUp
    Created on : 31 Aug, 2020, 4:48:48 PM
    Author     : Nikita
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <title>Employer Registration</title>
        <link rel="shortcut icon" href="../assets/img/logo-fav.png">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="author" content="">

        <link rel="stylesheet" type="text/css" href="../assets/lib/datetimepicker/css/bootstrap-datetimepicker.min.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/select2/css/select2.min.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/bootstrap-slider/css/bootstrap-slider.min.css"/>
        <link rel="stylesheet" href="../assets/mycss/sweetalert.css" type="text/css"/>
        <link rel="shortcut icon" href="../assets/img/logo-fav.png">
        <link rel="stylesheet" type="text/css" href="../assets/lib/perfect-scrollbar/css/perfect-scrollbar.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/material-design-icons/css/material-design-iconic-font.min.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/datatables/datatables.net-bs4/css/dataTables.bootstrap4.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/datatables/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css"/>
        <link rel="stylesheet" href="../assets/css/app.css" type="text/css"/>
        <script src="../assets/myjs/sweetalert.js" type="text/javascript"></script>
        <script src="../assets/myjs/employerValidation.js" type="text/javascript"></script>
        <script src="../assets/myjs/cities.js"></script>
        

    </head>
    <body class="be-splash-screen">
        <div class="main-content container-fluid">
            <div class="splash-container sign-up">
                <form action="../EmployerController" name="frm" method="post">
                    <input type="hidden" name="action" value="signUp">

                    <div class="card card-border-color card-border-color-primary">
                        <div class="card-body">
                            <span class="splash-title pb-4">Create A New Account</span>


                            <div class="form-group">
                                <input class="form-control" type="text" name="txtCompanyName" required placeholder="Enter Your Comapny Name" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <div class="input-group-prepend"><span class="input-group-text">+91</span>
                                    <input class="form-control" type="text" name="txtPhoneNo" required placeholder="Enter your Phone No" autocomplete="off">
                                </div>
                            </div>


                            <div class="form-group">
                                <input class="form-control" type="email" name="txtEmailId" required placeholder="Enter Your email id" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="password" name="txtPassword" required placeholder="Enter Your password" autocomplete="off">
                            </div>
                            <div class="form-group pt-2 mt-2">
                                <button class="btn btn-block btn-primary btn-xl" type="submit" onclick="return employerValidation();">Register Here</button>
                                <span>${param.message}</span>
                                <span>${param.msg}</span>

                            </div>


                        </div>
                    </div>
                </form>
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
