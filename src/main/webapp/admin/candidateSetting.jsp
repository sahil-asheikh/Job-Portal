<%-- 
    Document   : candidateSetting
    Created on : 23 Mar, 2020, 4:42:59 PM
    Author     : Nikita
--%>

<%@page import="com.qt.jobportal.beans.TblSystemSetting"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.qt.jobportal.models.SystemSettingModel"%>
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
        <script>
            function setSkills() {

                var jobRole = document.getElementById("txtJobRoleID").value;
                var url = "dynamicJobSkills.jsp?jobRole=" + jobRole;
                var xhttp = new XMLHttpRequest();

                xhttp.onreadystatechange = function () {
//                    to show the data
                    if (this.readyState === 4 && this.status === 200) {
                        document.getElementById("txtJobSkills").innerHTML =
                                this.responseText;
                    }
                };
//                send data to jsp file
                xhttp.open("GET", url, true);
                xhttp.send();
            }
        </script>

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
                                <input type="hidden" name="action" value="addJobRole"/>

                                <div class="form-group row mt-2">
                                    <label class="col-3 col-lg-2 col-form-label text-right" >Add Job Role</label>
                                    <div class="col-9 col-lg-10">
                                        <input required="" class="form-control" id="" name="txtJobRole"  type="text" placeholder="Add job role">
                                    </div>
                                </div>

                                <div class="row pt-3 mt-1">
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
                <div class="col-lg-6">
                    <div class="card card-border-color card-border-color-primary">
                        <div class="card-header card-header-divider">Add Job Skills<span class="card-subtitle"></span></div>
                        <div class="card-body">
                            <input type="hidden" name="action" value="insert"/>
                            <div class="form-group row mt-2">
                                <label class="col-3 col-lg-2 col-form-label text-right" >Select Job Role</label>
                                <div class="col-9 col-lg-10">
                                    <select name="txtJobRole" id="txtJobRoleID" onchange="setSkills()" class="custom-select" aria-label=".form-select-lg example" required="">
                                        <option selected>Select Job Role</option>
                                        <%                                                SystemSettingModel model = new SystemSettingModel();
                                            ArrayList<TblSystemSetting> roles = model.select();
                                            for (TblSystemSetting role : roles) {
                                        %>
                                        <option value="<%= role.getJobRole()%>"><%= role.getJobRole()%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>
                            <span id="txtJobSkills" ></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="footer.jsp" %>

</body>
</html>
