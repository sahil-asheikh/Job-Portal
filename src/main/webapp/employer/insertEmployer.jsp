<%-- 
    Document   : index.jsp
    Created on : 25 Jan, 2020, 1:20:06 PM
    Author     : win8.1
--%>

<%@page import="com.qt.jobportal.beans.TblSubscription"%>
<%@page import="com.qt.jobportal.models.Subscription"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="description" content="">       
        <title>Employer</title>
        <%@include file="head.jsp" %> 
       
        <link rel="stylesheet" type="text/css" href="assets/lib/datatables/datatables.net-bs4/css/dataTables.bootstrap4.css"/>
        <link rel="stylesheet" type="text/css" href="assets/lib/datatables/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css"/>
    
        <link rel="stylesheet" type="text/css" href="../assets/lib/perfect-scrollbar/css/perfect-scrollbar.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/material-design-icons/css/material-design-iconic-font.min.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/datatables/datatables.net-bs4/css/dataTables.bootstrap4.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/datatables/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css"/>
        <link rel="stylesheet" href="../assets/css/app.css" type="text/css"/>

        

    </head>
    <body>
     
<%      
            Subscription subMol = new Subscription();
           TblSubscription beanSub = subMol.selectById(request.getParameter("subscription_id"));

%>


            <%-- content starts here --%>
            
                <div class="main-content"> 
                   
                                    <div class="card card-border-color card-border-color-primary">
                                        <div class="card-header card-header-divider text-center">Company Registration</div>
                                        <div class="card-body">
                                            <form action="../EmployerController" method="post">
                                                <input type="hidden" name="action" value="insert">
                                                 <input type="hidden" name="EmployerId" value="<%= session.getAttribute("EmployerId") %>">
                                                    <input class="form-control" type="text" name="txtSubscription" value=${param.subscription_id}>
                      ${param.subscription_id}  
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="txtCompanyName">Company Name</label>
                                                            <input class="form-control form-control-sm" id="txtCompanyName" type="text" name="txtCompanyName" placeholder="Enter Company Name">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="txtContactPerson">Contact Person</label>
                                                            <input class="form-control form-control-sm" id="txtContactPerson" type="text"  name="txtContactPerson" placeholder="Enter Contact Person Name" >
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="txtPhoneNumber">Phone Number</label>
                                                            <input class="form-control form-control-sm" id="txtPhoneNo" maxlength="10"  type="text" name="txtPhoneNo" placeholder="Enter Phone Number" onkeypress='validate(event)'>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="txtEmailId">Email Id</label>
                                                            <input class="form-control form-control-sm" id="txtEmailId" type="email" name="txtEmailId" placeholder="Enter Email Id">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="txtPassword">Password</label>
                                                            <input class="form-control form-control-sm" id="txtPassword" type="password" name="txtPassword" placeholder="">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="txtSubscription">Subscription</label>
                                                            <input class="form-control form-control-sm" id="txtSubscription" type="text" name="txtSubscription" placeholder="">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtJobAddress">Address</label>
                                                    <div class="col-12 col-md-6">
                                                        <textarea class="form-control form-control-sm" id="txtJobAddress" name="txtJobAddress"></textarea>
                                                    </div>
                                                </div>  
                                                <div class="row pt-3">
                                                    <div class="col-lg-10 pb-4 pb-lg-0">
                                                        <div class="be-checkbox custom-control custom-checkbox">
                                                            <input class="custom-control-input" type="checkbox" id="check1">
                                                            <label class="custom-control-label" for="check1">I Accept Terms And Conditions and Privacy Policy.*</label>
                                                               <button class="btn btn-space btn-primary offset-3" type="submit">Submit</button>
                                                            <button class="btn btn-space btn-secondary">Cancel</button>
                                                            
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-6">6
                                                        <p class="text-right">
                                                        </p>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                           
                      
                   
                
                        <!-- content ends here -->


                    <script src="assets/lib/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
                    <script src="assets/lib/jquery.nestable/jquery.nestable.js" type="text/javascript"></script>
                    <script src="assets/lib/moment.js/min/moment.min.js" type="text/javascript"></script>
                    <script src="assets/lib/datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
                    <script src="assets/lib/select2/js/select2.min.js" type="text/javascript"></script>
                    <script src="assets/lib/select2/js/select2.full.min.js" type="text/javascript"></script>
                    <script src="assets/lib/bootstrap-slider/bootstrap-slider.min.js" type="text/javascript"></script>
                    <script src="assets/lib/bs-custom-file-input/bs-custom-file-input.js" type="text/javascript"></script>
                    <script type="text/javascript">
                                                                $(document).ready(function () {
                                                                    //-initialize the javascript
                                                                    App.init();
                                                                    App.formElements();
                                                                });
                    </script>



                    </body>
                    </html>

