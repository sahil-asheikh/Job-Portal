
<%@page import="com.qt.jobportal.beans.TblSubscription"%>
<%@page import="com.qt.jobportal.models.Subscription"%>
<%@page import="com.qt.jobportal.beans.TblCandidate"%>
<%@page import="com.qt.jobportal.models.CandidateModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.qt.jobportal.models.Vacancy"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<%
    Subscription subscript = new Subscription();
    TblSubscription beanSub = subscript.selectById(request.getParameter("id"));
%>

<div class="card card-border-color card-border-color-primary">
    <div class="card-header card-header-divider text-center">Subscription Details</div>
    <div class="card-body">
        <table class="table table-sm table-striped">

            <tbody>

                <%
                    if ((beanSub.getSubscription_id() == null) || (beanSub.getSubscription_id() == "null") || (beanSub.getSubscription_id() == "")) {
                %>
            <td class="item">Subscription Title<span class="icon s7-phone"></span></td>
            <td><%= beanSub.getException()%></td>
            <%
            } else {
            %>
            <tr>
                <td class="item">Subscription Title<span class="icon s7-phone"></span></td>
                <td><%= (beanSub.getTitle() == null || beanSub.getTitle() == "null" || beanSub.getTitle() == "") ? "Haven't added" : beanSub.getTitle()%></td>
            </tr>
            <tr>
                <td class="item">Subscription Price<span class="icon s7-phone"></span></td>
                <td><%= beanSub.getPrice()%></td>
            </tr>
            <tr>
                <td class="item">Subscription Validity in days<span class="icon s7-phone"></span></td>
                <td><%= beanSub.getValidity_in_days() %></td>
            </tr>
            <tr>
                <td class="item">Per job post deduction<span class="icon s7-phone"></span></td>
                <td><%= beanSub.getJob_post_deduction() %></td>
            </tr>
            <tr>
                <td class="item">Per response deduction<span class="icon s7-phone"></span></td>
                <td><%= beanSub.getResponse_deduction() %></td>
            </tr>
            <tr>
                <td class="item">Suggestion<span class="icon s7-phone"></span></td>
                <td><%= beanSub.getSuggestion() %></td>
            </tr>
            <tr>
                <td class="item">Created at<span class="icon s7-phone"></span></td>
                <td><%= beanSub.getCreatedAt() %></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>
