<%-- 
    Document   : candidateSetting
    Created on : 23 Mar, 2020, 4:42:59 PM
    Author     : Nikita
--%>

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

    </head>
    <body>
        <div class="be-wrapper">
        
        <%@include file="navbar.jsp" %>
        <%@include file="sidebar.jsp" %>
        <div class="be-content">
<div class="col-lg-6">
              <div class="card card-border-color card-border-color-primary">
                <div class="card-header card-header-divider">Add Job Role<span class="card-subtitle"></span></div>
                <div class="card-body">
                  <form method="post" action="../SystemSettingController">
                             <input type="hidden" name="action" value="insert"/>
       
                    <div class="form-group row mt-2">
                      <label class="col-3 col-lg-2 col-form-label text-right" >Job Role</label>
                      <div class="col-9 col-lg-10">
                        <input class="form-control" id="" name="txtJobRole"  type="text">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label class="col-3 col-lg-2 col-form-label text-right" >Job Skills</label>
                      <div class="col-9 col-lg-10">
                        <input class="form-control" type="text" name="txtJobSkills">
                      </div>
                    </div>
                    <div class="row pt-3 mt-1">
                      <div class="col-sm-6 col-lg-6 pb-4 pb-lg-0">
                        <div class="be-checkbox custom-control custom-checkbox">
                          <input class="custom-control-input" type="checkbox" id="check2">
                          <label class="custom-control-label" for="check2">Remember me</label>
                        </div>
                      </div>
                      <div class="col-sm-6">
                        <p class="text-right">
                          <button class="btn btn-space btn-primary" type="submit">Add</button>
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
<!--        <form method="post" action="../SystemSettingController">
              <input type="hidden" name="action" value="insert"/>
              Job Role:<innput type="text" name="txtJobRole" >
              Job Skills:<innput type="text" name="txtJobSkills" >   
        </form>    -->
    <%@include file="footer.jsp" %>
    
    </body>
</html>
