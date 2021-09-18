<%-- 
    Document   : vaccancy
    Created on : Jan 27, 2020, 5:08:02 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../assets/lib/perfect-scrollbar/css/perfect-scrollbar.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/material-design-icons/css/material-design-iconic-font.min.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/datatables/datatables.net-bs4/css/dataTables.bootstrap4.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/datatables/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css"/>
        <link rel="stylesheet" href="../assets/css/app.css" type="text/css"/>
        <title>Add Employer Subscription</title>
        <script src="../assets/myjs/cities.js"></script>

        <link rel="stylesheet" href="../assets/mycss/sweetalert.css" type="text/css"/>
        <script src="../assets/myjs/sweetalert.js" type="text/javascript"></script>
        <script src="../assets/myjs/subscriptionValidation.js" type="text/javascript"></script>


        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>
        <div class="be-wrapper">
            <%@include file="navbar.jsp" %>
            <%@include file="sidebar.jsp" %>

            <%-- content starts here --%>
            <div class="be-content">

                <div class="main-content container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card card-border-color card-border-color-primary">
                                <div class="card-header card-header-divider text-center">Subscription</div>
                                <div class="card-body">
                                    <form action="../SubscriptionController" name="frm" method="get">
                                        <input type="hidden" name="action" value="insert">
                                        <div class="form-group pt-2">
                                            <label for="txtTitle">Title</label>
                                            <input class="form-control form-control-sm" id="txtTitle" type="text" name="txtTitle" placeholder="Enter Subscription Name">
                                        </div>
                                        <div class="form-row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="">Price</label>
                                                    <input class="form-control form-control-sm" id="txtPrice" type="number" name="txtPrice" placeholder="Enter Subscription Price">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtValidity">Validity in days</label>
                                                    <input class="form-control form-control-sm" id="txtValidity" type="number" name="txtValidity" placeholder="Enter Validity in days">
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="form-row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="">Price per job deduction</label>
                                                    <input class="form-control form-control-sm" id="txtPrice" type="number" name="txtJobPostDeduction" placeholder="Enter price per job deduction">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtValidity">Price per job response deduction</label>
                                                    <input class="form-control form-control-sm" id="txtValidity" type="number" name="txtResponseDeduction" placeholder="Enter price per job response deduction">
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <input class="form-control form-control-sm" id="txtDatabaseLimit" type="hidden" value="0" name="txtActiveJobLimit" placeholder="Enter Active Job Limit">
                                        <input class="form-control form-control-sm" id="txtDatabaseLimit" type="hidden" value="0" name="txtResponseLimit" placeholder="Enter Response Limit">
                                        <input class="form-control form-control-sm" id="txtDatabaseLimit" type="hidden" value="0" name="txtDatabaseLimit" placeholder="Enter Database Limit">
                                        <input class="form-control form-control-sm" id="txtPhoneCallLimit" type="hidden" value="0" name="txtPhoneCallLimit" placeholder="Enter Phone Call Limit">
                                        <input class="form-control form-control-sm"  type="hidden" name="txtVisibility" value="0" placeholder="Enter visibility">

                                        <div class="form-row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label >Suggestion</label>

                                                    <textarea class="form-control" name="txtSuggestion" rows="3" placeholder="Write about your subscription pack"></textarea>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="row pt-3">
                                            <div class="col-sm-6">
                                                <p class="text-right">
                                                    <button class="btn btn-space btn-primary"  type="submit" onclick="return subscriptionValidation();">Submit</button>
                                                    <button class="btn btn-space btn-danger  " type="reset">Reset</button>
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
        </div>
        <%@include file="footer.jsp" %>



        <script src="../assets/lib/datatables/datatables.net/js/jquery.dataTables.js" type="text/javascript"></script>
        <script src="../assets/lib/datatables/datatables.net-bs4/js/dataTables.bootstrap4.js" type="text/javascript"></script>
        <script src="../assets/lib/datatables/datatables.net-buttons/js/dataTables.buttons.min.js" type="text/javascript"></script>
        <script src="../assets/lib/datatables/datatables.net-buttons/js/buttons.flash.min.js" type="text/javascript"></script>
        <script src="../assets/lib/datatables/jszip/jszip.min.js" type="text/javascript"></script>
        <script src="../assets/lib/datatables/pdfmake/pdfmake.min.js" type="text/javascript"></script>
        <script src="../assets/lib/datatables/pdfmake/vfs_fonts.js" type="text/javascript"></script>
        <script src="../assets/lib/datatables/datatables.net-buttons/js/buttons.colVis.min.js" type="text/javascript"></script>
        <script src="../assets/lib/datatables/datatables.net-buttons/js/buttons.print.min.js" type="text/javascript"></script>
        <script src="../assets/lib/datatables/datatables.net-buttons/js/buttons.html5.min.js" type="text/javascript"></script>
        <script src="../assets/lib/datatables/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js" type="text/javascript"></script>
        <script src="../assets/lib/datatables/datatables.net-responsive/js/dataTables.responsive.min.js" type="text/javascript"></script>
        <script src="../assets/lib/datatables/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js" type="text/javascript"></script>
        <script type="text/javascript">
                                                        $(document).ready(function () {
                                                            //-initialize the javascript

                                                            App.formElements();
                                                        });
        </script>

        <!--        
           <script src="../assets/lib/datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
           <script src="../assets/lib/select2/js/select2.min.js" type="text/javascript"></script>
           <script src="../assets/lib/select2/js/select2.full.min.js" type="text/javascript"></script>
           <script src="../assets/lib/bs-custom-file-input/bs-custom-file-input.js" type="text/javascript"></script>
           <script src="../assets/lib/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
           <script language="javascript">print_state("sts");</script>

           <script type="text/javascript">
               $(document).ready(function () {
                   //-initialize the javascript
                   App.formElements();
               });
           </script>
        -->

    </body>
</html>

