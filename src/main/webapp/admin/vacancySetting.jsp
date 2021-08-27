<%-- 
    Document   : vacancySetting
    Created on : 23 Mar, 2020, 4:43:28 PM
    Author     : Nikita
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="../assets/img/logo-fav.png">
        <title>Beagle</title>
        <%@include file="head.jsp" %>
        <link rel="stylesheet" type="text/css" href="../assets/lib/datetimepicker/css/bootstrap-datetimepicker.min.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/select2/css/select2.min.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/lib/bootstrap-slider/css/bootstrap-slider.min.css"/>
       
        <script src="../assets/myjs/cities.js"></script>

</head>
    <body>
        <div class="be-wrapper">
    
        <%@include file="navbar.jsp" %>
        <%@include file="sidebar.jsp" %>
        <div class="be-content">
            
        <form action="../SystemSettingController" method="get" name="frm">
                                    <input type="hidden" name="action" value="insertVacancy">
                                    <div class="col-md-6">
                                            <div class="form-group pt-2">
                                                <label for="txtTitle">Job Title</label>

                                                <input class="form-control form-control-sm" id="txtTitle" type="text" name="txtTitle" placeholder="Enter Job Title" >
                                            </div>
                                        </div>
                                         
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Skill Set</label>
                                            <select class="tags form-control form-control-sm" multiple="" id="slSkillSet" name="txtJobSkills">
                                                <option value="">option 1</option>
                                                <option value="java">option 2</option>
                                                <option value="">option 3</option>
                                            </select>  
                                        </div>
                                    </div>
                                    <button type="submit"> Submit</button>
        </form>
        </div>
        </div>
        <%@include file="footer.jsp" %>

         <script language="javascript">print_state("sts");</script>

        <script src="../assets/lib/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
        <script src="../assets/lib/jquery.nestable/jquery.nestable.js" type="text/javascript"></script>
        <script src="../assets/lib/moment.js/min/moment.min.js" type="text/javascript"></script>
        <script src="../assets/lib/datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
        <script src="../assets/lib/select2/js/select2.min.js" type="text/javascript"></script>
        <script src="../assets/lib/select2/js/select2.full.min.js" type="text/javascript"></script>
        <script src="../assets/lib/bootstrap-slider/bootstrap-slider.min.js" type="text/javascript"></script>
        <script src="../assets/lib/bs-custom-file-input/bs-custom-file-input.js" type="text/javascript"></script>
        <script type="text/javascript">
                                                $(document).ready(function () {
                                                    //-initialize the javascript
                                                    App.init();
                                                    App.formElements();
                                                });
        </script>
        </body>
</html>
