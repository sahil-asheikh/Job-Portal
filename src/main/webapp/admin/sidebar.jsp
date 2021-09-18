<%-- 
    Document   : sidebar
    Created on : Feb 1, 2020, 12:01:09 PM
    Author     : Os
--%>
<%
    String uri = null, pageName = null;
    try {
        uri = request.getRequestURI();
        pageName = uri.substring(uri.lastIndexOf("/") + 1).replace(".jsp", "");
        // get current page Name
        session.setAttribute("PAGENAME", uri.substring(uri.lastIndexOf("/") + 1));
        System.out.println("pagname : " + session.getAttribute("PAGENAME"));
    } catch (Exception e) {
        System.out.println("Page URI : " + e.getMessage());
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<div class="be-left-sidebar">
    <div class="left-sidebar-wrapper">
        <a class="left-sidebar-toggle" href="#">Job Portal</a>
        <div class="left-sidebar-spacer">
            <div class="left-sidebar-scroll">
                <div class="left-sidebar-content">
                    <ul class="sidebar-elements">
                        <li class="divider">Menu</li>
                        <li class="<%= (pageName.equals("adminDash")) ? "active" : ""%>">
                            <a href="adminDash.jsp"><i class="icon mdi mdi-home"></i><span>Dashboard</span></a>
                        </li>
                        <li class="parent <%= (pageName.equals("subscription") || (pageName.equals("subscriptionSelect"))) ? "active" : ""%>">
                            <a href="#"><i class="fa fa-credit-card"></i><span>&nbsp;Subscription Employer</span></a>
                            <ul class="sub-menu">
                                <li class="<%= (pageName.equals("subscription")) ? "active" : ""%>">
                                    <a href="subscription.jsp"><i class="fa fa-plus-circle"></i><span>&nbsp;Add Subscription</span></a>
                                </li>
                                <li class="<%= (pageName.equals("subscriptionSelect")) ? "active" : ""%>">
                                    <a href="subscriptionSelect.jsp"><i class="fa fa-eye"></i><span>&nbsp;Show Subscription</span></a>
                                </li>
                            </ul>
                        </li>
                        <li class="parent"><a href="#"><i class="fa fa-credit-card-alt"></i><span>&nbsp;Subscription Candidate</span></a>
                            <ul class="sub-menu">
                                <li class="<%= (pageName.equals("subscriptionCandidate")) ? "active" : ""%>">
                                    <a href="subscriptionCandidate.jsp"><i class="fa fa-plus-circle"></i><span>&nbsp;Add Subscription</span></a>
                                </li>
                                <li class="<%= (pageName.equals("subscriptionCandidateSelect")) ? "active" : ""%>">
                                    <a href="subscriptionCandidateSelect.jsp"><i class="fa fa-eye"></i><span>&nbsp;Show Subscription</span></a>
                                </li>
                            </ul>
                        </li>
                        <li class="parent"><a href="#"><i class="fa fa-sliders"></i><span>&nbsp;System Setting</span></a>
                            <ul class="sub-menu">
                                <li class="<%= (pageName.equals("candidateSetting")) ? "active" : ""%>">
                                    <a href="candidateSetting.jsp"><i class="fa fa-gear"></i><span>&nbsp;Candidate Setting</span></a>
                                </li>
                            </ul>
                        </li>
                        <li class="<%= (pageName.equals("showEmployer")) ? "active" : ""%>"><a href="showEmployer.jsp"><i class="fa fa-building"></i><span> &nbsp;Employer</span></a>
                        </li>
                        <li class="<%= (pageName.equals("candidateShow")) ? "active" : ""%>"><a href="candidateShow.jsp"><i class="fa fa-graduation-cap"></i><span> &nbsp;Candidate</span></a>
                        </li>
                        <li class="parent"><a href="#"><i class="icon mdi mdi-card-membership"></i><span>Newsletter</span></a>
                            <ul class="sub-menu">
                                <li class="<%= (pageName.equals("showNotifyMe")) ? "active" : ""%>">
                                    <a href="showNotifyMe.jsp"><i class="fa fa-eye"></i><span>&nbsp;Show Subscriber</span></a>
                                </li>
                            </ul>
                        </li>
                        <li><a href="../AdminController?action=logout"><i class="icon mdi mdi-home"></i><span>Logout</span></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
