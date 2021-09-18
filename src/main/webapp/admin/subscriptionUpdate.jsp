<%-- 
    Document   : SubsriptionUpdate
    Created on : 31 Jan, 2020, 12:02:38 PM
    Author     : win8.1
--%>

<%@page import="com.qt.jobportal.beans.TblSubscription"%>
<%@page import="com.qt.jobportal.models.Subscription"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.jsp" %>
        <meta name="description" content="">
        <title>Update Subscription</title>
        <link rel="stylesheet" type="text/css" href="../assets/lib/datatables/datatables.net-bs4/css/dataTables.bootstrap4.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/datatables/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css"/>
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
            <%-- content starts here --%>
            <div class="be-content">
                <%-- content starts here --%>
                <div class="main-content container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card card-border-color card-border-color-primary">
                                <div class="card-header card-header-divider text-center">Subscription</div>
                                <div class="card-body">
                                    <form action="../SubscriptionController" method="post">
                                        <input type="hidden" name="action" value="update">

                                        <%                                            Subscription subscript = new Subscription();
                                            TblSubscription beanSub = subscript.selectById(request.getParameter("sid"));
                                        %>


                                        <tr>

                                        <input type="hidden" name="id" value="<%= beanSub.getId()%>"><br><br>

                                        </tr>


                                        <div class="form-group pt-2">
                                            <label for="txtTitle">Title</label>
                                            <input class="form-control form-control-sm" id="txtTitle" type="text" name="txtTitle" value="<%= beanSub.getTitle()%>">
                                        </div>
                                        <div class="form-row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtPrice">Price</label>
                                                    <input class="form-control form-control-sm" id="txtPrice" type="number" name="txtPrice" value="<%= beanSub.getPrice()%>">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtValidity">Validity in days</label>
                                                    <input class="form-control form-control-sm" id="txtValidity" type="text" name="txtValidity" value="<%= beanSub.getValidity_in_days()%>">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtActiveJobLimit">Job Deduction</label>
                                                    <input class="form-control form-control-sm" id="txtJobDeduction" type="number" name="txtJobDeduction" value="<%= beanSub.getJob_post_deduction()%>">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtResponseLimit">Response Deduction</label>
                                                    <input class="form-control form-control-sm" id="txtResponseLimit" type="number" name="txtResponseDeduction" value="<%= beanSub.getResponse_deduction()%>">
                                                </div> 
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtSuggestion">Suggestion</label>
                                            <textarea class="form-control" name="txtSuggestion" rows="3" placeholder="Write about your subscription pack"><%= beanSub.getSuggestion()%></textarea>
                                        </div>
                                        <div class="row pt-3">
                                            <div class="col-sm-6">
                                                <p class="text-right">
                                                    <button class="btn btn-space btn-primary" type="submit">Update</a></button>
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
            <%-- content ends here --%>
            <%@include file="footer.jsp" %>
            <%@include file="datatableScript.html" %>





    </body>
</html>
