<%-- 
    Document   : sidebar
    Created on : Feb 1, 2020, 12:01:09 PM
    Author     : Os
--%>
<%@page import="com.qt.jobportal.beans.TblCandidate"%>
<%@page import="com.qt.jobportal.models.CandidateModel"%>
<%
 String  uri = null, pageName = null;
    try {
        uri = request.getRequestURI();
        pageName = uri.substring(uri.lastIndexOf("/") + 1).replace(".jsp", "");
        // get current page Name
            session.setAttribute("PAGENAME", uri.substring(uri.lastIndexOf("/")+1));
            System.out.println("pagname : "+session.getAttribute("PAGENAME"));
    } catch (Exception e) {
        System.out.println("Page URI : " + e.getMessage());
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="be-left-sidebar">
    <div class="left-sidebar-wrapper"><a class="left-sidebar-toggle" href="#">Job Portal</a>
        <div class="left-sidebar-spacer">
            <div class="left-sidebar-scroll">
                <div class="left-sidebar-content">
                    <ul class="sidebar-elements">
                        <li class="divider">Candidate</li>
                        <li class="<%= (pageName.equals("candidateDash")) ? "active" : ""%>"><a href="candidateDash.jsp"><i class="icon mdi mdi-home"></i><span>Dashboard</span></a>
                        </li>
                        <li ><a href="../jobsSearch.jsp"><i class="icon mdi mdi-search"></i><span>Find Jobs</span></a>

                        <li class="<%= (pageName.equals("profile")) ? "active" : ""%>"><a href="profile.jsp?id=<%= session.getAttribute("CandidateId") %> "><i class="icon mdi mdi-face"></i><span>Profile</span></a>


                        <!--activites menu-->

                        <li class="<%= (pageName.equals("candidateAccount")) ? "active" : ""%>"><a href="candidateAccount.jsp"><i class="icon mdi mdi-face"></i><span>Activities</span></a>
                                                   </li>
                                                   <li class="<%= (pageName.equals("candidateWallet")) ? "active" : ""%>"><a href="candidateWallet.jsp "><i class="fa fa-google-wallet" aria-hidden="true"></i><span> &nbsp; &nbsp;Wallet </span></a>
                                                   </li>
                       <%
                          CandidateModel candidate = new CandidateModel();
                          TblCandidate candBean = candidate.selectById(String.valueOf(session.getAttribute("CandidateId")));
                           if (candBean.getSubscriptionId() == null || candBean.getSubscriptionId() == "null" || candBean.getSubscriptionId()== ""){
                           
                       %>
                        
                        <li class="<%= (pageName.equals("candidateSubscription")) ? "active" : ""%>"><a href="candidateSubscription.jsp "><i class="icon mdi mdi-face" aria-hidden="true"></i><span>Get Plans</span></a>
                                                   </li>
                         <%}else{%>
                         <li class="<%= (pageName.equals("candidateSubscription")) ? "active" : ""%>"><a href="candidateSubscription.jsp "><i class="icon mdi mdi-face" aria-hidden="true"></i><span>My Plan</span></a>
                                                   </li>
                         <%}%>
.                        <li><a href="../CandidateController?action=logout"><i class="icon mdi mdi-power"></i><span>Logout</span></a>
                        </li>                       
                    </ul>
                </div>
            </div>
        </div>

    </div>
</div>