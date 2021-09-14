<%-- 
    Document   : adminLoginPage
    Created on : 12 Feb, 2020, 12:38:09 PM
    Author     : Zoya
--%>
<%
    if (session.getAttribute("AdminId") == null || session.getAttribute("AdminId") == "null") {
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <!--     sweatalert       -->

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
             <div class="card-header "><!--<img class="logo-img" src="assets/img/logo-xx.png" alt="logo" width="{conf.logoWidth}" height="27">-->
                 <span class="text-info"><b>Admin Login</b></span>
                 <span class="splash-description">${param.msg}</span></div>
                 <span class="splash-description">${param.message}</span></div>
              <div class="card-body">
                <form method="get" action="AdminController" name="frm">
                     <input type="hidden" name="action" value="login">
                  <div class="login-form">
                    <div class="form-group">
                      <input class="form-control" id="txtPhoneNo" type="text" name="txtPhoneNo" placeholder="Username" autocomplete="off">
                    </div>
                    <div class="form-group">
                      <input class="form-control" id="txtPassword" type="password"name="txtPassword" placeholder="Password">
                    </div>
                    <div class="form-group row login-tools">
                      <div class="col-6 login-remember">
                        <div class="custom-control custom-checkbox">
                          <input class="custom-control-input" type="checkbox" id="check1">
                          <label class="custom-control-label" for="check1">Remember Me</label>
                        </div>
                      </div>
                      <div class="col-6 login-forgot-password"><a href="pages-forgot-password.html">Forgot Password?</a></div>
                    </div>
                    <div class="form-group row login-submit">
<!--                        <div class="col-6">-->
<!--                            <a class="btn btn-secondary btn-xl"  href="admin/candidateRegister.jsp" data-dismiss="modal" type="submit">Register</a></div>-->
                        <div class="col-6 offset-3">
                             <button class="btn btn-primary btn-xl"  type="submit" data-dismiss="modal" onclick="LoginValidation();">
                                Sign in
                                </button>
                        </div>
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
        response.sendRedirect("admin/adminDash.jsp?msg=" + request.getParameter("msg"));
    }
%>
