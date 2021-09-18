
<%@page import="com.qt.jobportal.beans.TblEmployer"%>
<%@page import="com.qt.jobportal.models.EmployerModel"%>
<%@page import="com.qt.jobportal.beans.TblVacancy"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.qt.jobportal.models.Vacancy"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<%
    EmployerModel em = new EmployerModel();
    TblEmployer employer = em.selectById(request.getParameter("id"));
%>

<div class="card card-border-color card-border-color-primary">
    <div class="card-header card-header-divider text-center">About Your Company</div>
    <div class="card-body">
        <table class="table table-sm table-striped" id="productSizes">
            <tbody>
                <tr>
                    <td class="icon"><span class="mdi mdi-city-alt"></span></td>
                    <td class="item">Company Name<span class="icon s7-phone"></span></td>
                    <td><%= (employer.getCompanyName() == null || employer.getCompanyName() == "null" || employer.getCompanyName() == "") ? "Haven't added" : employer.getCompanyName()%></td>
                </tr>
                <tr>
                    <td class="icon"><span class="mdi mdi-account-box"></span></td>
                    <td class="item">Contact Person<span class="icon s7-phone"></span></td>
                    <td><%= (employer.getContactPerson() == null || employer.getContactPerson() == "null" || employer.getContactPerson() == "") ? "Haven't added" : employer.getContactPerson()%></td>
                </tr>
                <tr>
                    <td class="icon"><span class="mdi mdi-phone"></span></td>
                    <td class="item">Phone Number<span class="icon s7-phone"></span></td>
                    <td><%= (employer.getPhoneNo() == null || employer.getPhoneNo() == "null" || employer.getPhoneNo() == "") ? "Haven't added" : employer.getPhoneNo()%></td>
                </tr>
                <tr>
                    <td class="icon"><span class="mdi mdi-email"></span></td>
                    <td class="item">Email Id<span class="icon s7-phone"></span></td>
                    <td><%= (employer.getEmailId() == null || employer.getEmailId() == "null" || employer.getEmailId() == "") ? "Haven't added" : employer.getEmailId()%></td>
                </tr>
                <tr>
                    <td class="icon"><span class="fa fa-address-card"></span></td>
                    <td class="item">Job Address<span class="icon s7-phone"></span></td>
                    <td><%= (employer.getJobAddress() == null || employer.getJobAddress() == "null" || employer.getJobAddress() == "") ? "Haven't added" : employer.getJobAddress()%></td>
                </tr>
                <tr>
                    <td class="icon"><span class="mdi mdi-pin"></span></td>
                    <td class="item">Subscription<span class="icon s7-phone"></span></td>
                    <td><%= (employer.getSubscription() == null || employer.getSubscription() == "null" || employer.getSubscription() == "") ? "Not purchased" : "Purchased"%></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
