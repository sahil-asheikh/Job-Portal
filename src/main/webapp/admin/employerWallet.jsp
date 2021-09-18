<%@page import="com.qt.jobportal.beans.tblEmployerPlan"%>
<%@page import="com.qt.jobportal.beans.TblJobActivity"%>
<%@page import="com.qt.jobportal.models.JobActivity"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.qt.jobportal.beans.TblEmployer"%>
<%@page import="com.qt.jobportal.models.EmployerModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    EmployerModel empMol = new EmployerModel();
    TblEmployer bean = empMol.selectById(request.getParameter("id"));

    tblEmployerPlan empPlan = empMol.selectEmployerPlanById(request.getParameter("id"));
%>
<div class="pricing-table card-table">
    <%
        if ((bean.getSubscriptionId() == null) || (bean.getSubscriptionId() == "null") || (bean.getSubscriptionId() == "")) {
    %>
    <div class="text-center font-weight-bold">
        Subscription haven't purchased by the user
    </div>
    <%
    } else {
    %>
    <div class="card-header font-weight-bold text-primary text-left">Employer Plan</div>
    <div class="row">

        <div class="col-sm-6 text-left">
            <ul class="pricing-table-features">
                <li class="blueEffect2">
                    <span class="font-weight-bold">Company Name: </span>
                    <%= bean.getCompanyName()%></li>
                <li class="blueEffect2">
                    <span class="font-weight-bold">Company Email: </span>
                    <%= bean.getEmailId()%></li>
                <li class="blueEffect2">
                    <span class="font-weight-bold">Plan Title: </span>
                    <%= empPlan.getPlan_title()%></li>
                <li class="blueEffect2">
                    <span class="font-weight-bold">Per Post Deduction: </span>
                    <%= empPlan.getJob_post_deduction()%></li>
                <li class="blueEffect2">
                    <span class="font-weight-bold">Response Deduction: </span>
                    <%= empPlan.getResponse_deduction()%></li>
                <li class="blueEffect2">
                    <span class="font-weight-bold">Plan Suggestion: </span>
                    <%= empPlan.getPlan_suggestion()%></li>
            </ul>
        </div>
        <div class="col-sm-6 text-left">
            <div class="blueEffect2">Available Balance</div>
            <div class="pricing-table-price"><span class="currency">&#8377;</span><span class="value blueEffect"><%= bean.getBalance()%></span></div>
            <div class="card-divider card-divider-xl"></div>

            <ul class="pricing-table-features">
                <li class="blueEffect2">
                    <span class="font-weight-bold">Purchased on: </span>
                    <%= empPlan.getStart_date()%></li>
                <li class="blueEffect2">
                    <span class="font-weight-bold">Valid Till: </span>
                    <%= empPlan.getEnd_date()%></li>
            </ul>
        </div>
    </div>
    <%
        }
    %>
</div>
