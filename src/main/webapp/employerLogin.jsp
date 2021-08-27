<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("EmployerId") == null || session.getAttribute("EmployerId") == "null") {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="author" content="">
                <link rel="stylesheet" type="text/css" href="assets/lib/perfect-scrollbar/css/perfect-scrollbar.css"/>
        <link rel="stylesheet" type="text/css" href="assets/lib/material-design-icons/css/material-design-iconic-font.min.css"/>
        <link rel="stylesheet" type="text/css" href="assets/lib/datatables/datatables.net-bs4/css/dataTables.bootstrap4.css"/>
        <link rel="stylesheet" type="text/css" href="assets/lib/datatables/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css"/>
        <link rel="stylesheet" href="assets/css/app.css" type="text/css"/>

        <link rel="stylesheet" href="assets/mycss/sweetalert.css" type="text/css"/>
        <script src="assets/myjs/sweetalert.js" type="text/javascript"></script>

        <script src="assets/myjs/loginVal.js" type="text/javascript"></script>

    </head>
    <body class="be-splash-screen">
        <div class="be-wrapper be-login">
            <div class="be-content">
                <div class="main-content container-fluid">
                    <div class="splash-container">
                        <div class="card card-border-color card-border-color-primary">
                            <!--              <div class="card-header"><img class="logo-img" src="assets/img/logo-xx.png" alt="logo" width="{conf.logoWidth}" height="27"><span class="splash-description">Please enter your user information.</span></div>-->
                            <div class="card-header"><span class="text-info"><b>Employer Login</b></span></div>
                            <div class="card-body">
${param.msg}                                
                               
                                <form method="post" action="EmployerController" name="frm">
                                    <input type="hidden" name="action" value="login">
                                    <div class="login-form">
                                        <div class="form-group">
                                            <input class="form-control"   name="txtPhoneNo" type="number" placeholder="Phone Number"  required autocsomplete="off">
                                        </div>
                                        <div class="form-group">
                                            <input class="form-control"  type="password"  name="txtPassword" placeholder="Password" required>
                                        </div>
                                        <p class="text-right text-success">${param.message}</p>
                                        <div class="form-group row login-submit">
                                           
                                            <button class="btn btn-primary btn-xl"  value="request.getParameter('id')" type="submit" data-dismiss="modal" onclick=" return LoginValidation();">
                                                Sign in
                                            </button>
                                        </div>
                                        <div class="form-group row login-tools">
                                            <div class="col-6 login-remember">
                                                
                                                <a href="employer/employerSignUp.jsp" >Register Here</a> 

                                            </div>
                                            <div class="col-6 login-forgot-password"><a href="employer/forgetPassword.jsp">Forgot Password?</a></div>
                                        </div>


                                    </div>
                                </form>

                            </div>
                        </div>  
                    </div>
                </div>
            </div>
        </div>


        <script src="assets/lib/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="assets/lib/perfect-scrollbar/js/perfect-scrollbar.min.js" type="text/javascript"></script>
        <script src="assets/lib/bootstrap/dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="assets/js/app.js" type="text/javascript"></script>

        <script src="assets/lib/datatables/datatables.net/js/jquery.dataTables.js" type="text/javascript"></script>
        <script src="assets/lib/datatables/datatables.net-bs4/js/dataTables.bootstrap4.js" type="text/javascript"></script>
        <script src="assets/lib/datatables/datatables.net-buttons/js/dataTables.buttons.min.js" type="text/javascript"></script>
        <script src="assets/lib/datatables/datatables.net-buttons/js/buttons.flash.min.js" type="text/javascript"></script>
        <script src="assets/lib/datatables/jszip/jszip.min.js" type="text/javascript"></script>
        <script src="assets/lib/datatables/pdfmake/pdfmake.min.js" type="text/javascript"></script>
        <script src="assets/lib/datatables/pdfmake/vfs_fonts.js" type="text/javascript"></script>
        <script src="assets/lib/datatables/datatables.net-buttons/js/buttons.colVis.min.js" type="text/javascript"></script>
        <script src="assets/lib/datatables/datatables.net-buttons/js/buttons.print.min.js" type="text/javascript"></script>
        <script src="assets/lib/datatables/datatables.net-buttons/js/buttons.html5.min.js" type="text/javascript"></script>
        <script src="assets/lib/datatables/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js" type="text/javascript"></script>
        <script src="assets/lib/datatables/datatables.net-responsive/js/dataTables.responsive.min.js" type="text/javascript"></script>
        <script src="assets/lib/datatables/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js" type="text/javascript"></script>
        <script type="text/javascript">
                                                $(document).ready(function () {
                                                    //-initialize the javascript
                                                    App.init();
                                                    App.dataTables();
                                                });
        </script>
    </body>
</html>

<%
    } else {
        response.sendRedirect("employer/employerDash.jsp?msg=" + request.getParameter("msg"));
    }
%>
