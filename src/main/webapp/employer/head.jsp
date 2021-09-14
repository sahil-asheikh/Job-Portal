<%-- 
    Document   : head
    Created on : Feb 1, 2020, 11:57:42 AM
    Author     : Os
--%>



<%
    if (session.getAttribute("EmployerId") == "null" || session.getAttribute("EmployerId") == null) {
        response.sendRedirect("../employerLogin.jsp?msg=Login Frist");
    } else {
%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="author" content="">
<link rel="shortcut icon" href="../assets/img/logo-fav.png">

<link rel="stylesheet" type="text/css" href="../assets/lib/perfect-scrollbar/css/perfect-scrollbar.css"/>
<link rel="stylesheet" type="text/css" href="../assets/lib/material-design-icons/css/material-design-iconic-font.min.css"/>
<link rel="stylesheet" type="text/css" href="../assets/lib/datatables/datatables.net-bs4/css/dataTables.bootstrap4.css"/>
<link rel="stylesheet" type="text/css" href="../assets/lib/datatables/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css"/>
<link rel="stylesheet" href="../assets/css/app.css" type="text/css"/>

<%}%>