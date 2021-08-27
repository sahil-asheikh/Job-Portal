<%-- 
    Document   : subscriptionCandidate
    Created on : 28 Mar, 2020, 3:26:28 PM
    Author     : Nikita
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
                                    <form action="../SubscriptionCandidateController" name="frm" method="post">
                                        <input type="hidden" name="action" value="insert">
                                        <div class="form-group pt-2">
                                            <label for="txtTitle">Title</label>
                                            <input class="form-control form-control-sm" id="txtTitle" type="text" name="txtTitle" placeholder="Enter Title">
                                        </div>
                                        <div class="form-row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="">Price</label>
                                                    <input class="form-control form-control-sm" id="txtPrice" type="number" name="txtPrice" placeholder="Enter Price">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtValidity">Validity</label>
                                                    <input class="form-control form-control-sm" id="txtValidity" type="text" name="txtValidity" placeholder="Enter Validity">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtActiveJobLimit">Per Apply Price</label>
                                                    <input class="form-control form-control-sm" id="txtActiveJobLimit" type="number" name="txtPerApplyPrice" placeholder="Enter Active Job Limit">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="">Suggestion</label>
                                                    <input class="form-control form-control-sm" id="txtResponseLimit" type="text" name="txtSuggestion" placeholder="Enter Response Limit">
                                                </div> 
                                            </div>
                                        </div> 
                                       
                                         <div class="form-row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label >Visibility</label>
                                                    <input class="form-control form-control-sm"  type="text" name="txtVisibility" placeholder="Enter visibility">
                                                </div> 
                                            </div>
                                            
                                        </div>
<!--                                        <div class="form-group">
                                            <label for="txtSuggestion">Suggestion</label>
                                            <input class="form-control form-control-sm" id="txtSuggestion" type="text" name="txtSuggestion" placeholder="Enter Suggestion">
                                        </div> 
                                        <div class="form-group">
                                            <label for="txttxtField1">Field 1</label>
                                            <input class="form-control form-control-sm" id="txtField1" type="text" name="txtField1" value="sample" placeholder="Enter Field 1">
                                        </div> 
                                        <div class="form-group">
                                            <label for="txtField2">Field 2</label>
                                            <input class="form-control form-control-sm" id="txtField2" type="text" name="txtField2" value="sample" placeholder="Enter Field 2">
                                        </div> 
                                        <div class="form-group">
                                            <label for="txtField3">Field 3</label>
                                            <input class="form-control form-control-sm" id="txtField3" type="text" name="txtField3" value="sample" placeholder="Enter Field 3">
                                        </div> 
                                        <div class="form-group">
                                            <label for="txtVisibility">Visibility</label>
                                            <input class="form-control form-control-sm" id="txtVisibility" type="text" name="txtVisibility" placeholder="Enter Visibility">
                                        </div>-->
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

    </body>
</html>
  
