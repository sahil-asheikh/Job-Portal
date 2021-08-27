<%-- 
    Document   : uploadResume
    Created on : 18 Aug, 2021, 1:09:59 PM
    Author     : LENOVO
--%>

<%@page import="com.qt.jobportal.beans.TblCandidate"%>
<%@page import="com.qt.jobportal.models.CandidateModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.jsp" %>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Resume</title>

        <link rel="stylesheet" href="../assets/mycss/sweetalert.css" type="text/css"/>
        <script src="../assets/myjs/sweetalert.js" type="text/javascript"></script>
        <script src="../assets/myjs/passwordValidation.js" type="text/javascript"></script>

    </head>
    <body>
        <div class="be-wrapper">

            <%@include file="navbar.jsp" %>

            <%@include file="sidebar.jsp" %>

            <%                CandidateModel candMol = new CandidateModel();
                TblCandidate bean = candMol.selectById(String.valueOf(session.getAttribute("CandidateId")));
            %>

            <%-- content starts here --%>
            <div class="be-content mt-2">
                <div class="col-lg-8 ">
                    <div class="card card-border-color card-border-color-primary">
                        <div class="card-header card-header-divider">Update Resume<span class="card-subtitle"></span></div>
                        <div class="card-body">

                            <form action="../CandidateController" method="post" name="frm" enctype="multipart/form-data">
                                <input type="hidden" name="id" value="${param.id}">

                                <!--Button to upload Resume-->
                                    <div class="form-group row">
                                        <label class="col-3 col-lg-2 col-form-label text-right" >Select Your Resume</label>
                                        <div class="col-9 col-lg-10">
                                            <input class="form-control" name="resumeFile"  type="file" required="">
                                        </div>
                                    </div>
                                    <div class="col-sm-6 pl-0">
                                        <p class="text-right">
                                            <button class="btn btn-space btn-primary" type="submit" name="action" value="uploadResume" onclick="">Save Resume</button>
                                            <button class="btn btn-space btn-secondary">Delete</button>
                                        </p>
                                    </div>
                                <!--/Button to upload Resume-->
                            </form>
                                
                        </div>
                    </div>
                </div>
            </div>
            <%-- /content ends here --%>
        </div>

        <%@include file="footer.jsp" %>

    </body>
</html>

