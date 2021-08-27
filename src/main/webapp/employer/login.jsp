<%-- 
    Document   : login
    Created on : 17 Feb, 2020, 12:27:40 PM
    Author     : win8.1
--%>
<%
    if (session.getAttribute("EmployerId") == null || session.getAttribute("EmployerId") == "null") {
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        ${param.msg}
        <br>
        Id : <%= session.getAttribute("EmployerId")%>
        Name : <%= session.getAttribute("EmployerName")%>
        <form method="post" action="../EmployerController">
            <input type="hidden" name="action" value="login">
            <input type="text" name="txtPhoneNo">
            <input type="password" name="txtPassword">

            <button type="submit">submit</button>
            <h2>${param.msg}</h2>
        </form>
    </body>
</html>
<%
    } else {
        response.sendRedirect("employerDash.jsp?msg="+request.getParameter("msg"));
    }
%>



