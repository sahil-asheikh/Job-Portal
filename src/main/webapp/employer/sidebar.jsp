<%-- 
    Document   : sidebar
    Created on : Feb 1, 2020, 12:01:09 PM
    Author     : Os
--%>
<%@page import="com.qt.jobportal.models.CandidateModel"%>
<%@page import="com.qt.jobportal.beans.TblEmployer"%>
<%@page import="com.qt.jobportal.models.EmployerModel"%>
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
<%
    EmployerModel emm = new EmployerModel();
    TblEmployer empB = emm.selectById(String.valueOf(session.getAttribute("EmployerId")));
%>

 ${param.session.getAttribute("EmployerName")}
                
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="be-left-sidebar">
    <div class="left-sidebar-wrapper"><a class="left-sidebar-toggle" href="#">Job Portal</a>
        <div class="left-sidebar-spacer">
            <div class="left-sidebar-scroll">
                <div class="left-sidebar-content">
                    <ul class="sidebar-elements">
                        <li class="divider">Menu</li>
                       
                         <% if (empB.getSubscriptionId() == null || empB.getSubscriptionId() == "null") {
                        %>
                          <li class="<%= (pageName.equals("employerDash")) ? "active" : ""%>"><a href="employerDash.jsp"><i class="icon mdi mdi-home"></i><span>Dashboard</span></a>
                        </li>
                        <li class="<%= (pageName.equals("profile")) ? "active" : ""%>"><a href="profile.jsp"><i class="icon mdi mdi-home"></i><span>Profile</span></a>
                        </li>
                        <li class="<%= (pageName.equals("subscriptionPrice")) ? "active" : ""%>"><a href="subscriptionPrice.jsp"><i class="icon mdi mdi-home"></i><span>Pricing</span></a>
                        </li>
                        <li><a href="../EmployerController?action=logout"><i class="icon mdi mdi-home"></i><span>Logout</span></a>
                        </li>
                        <%
                        } else {
                        %>
                        <li class="<%= (pageName.equals("employerDash")) ? "active" : ""%>"><a href="employerDash.jsp"><i class="icon mdi mdi-home"></i><span>Dashboard</span></a>
                        </li>
                        <li class="<%= (pageName.equals("profile")) ? "active" : ""%>"><a href="profile.jsp"><i class="icon mdi mdi-home"></i><span>Profile</span></a>
                        </li>
                        <li class="parent"><a href=""><i class="icon mdi mdi-face"></i><span>Jobs</span></a>
                            <ul class="sub-menu">
                                <li class="<%= (pageName.equals("vacancy")) ? "active" : ""%>"><a href="vacancy.jsp">Post New Job</a>
                                </li>
                                <li class="<%= (pageName.equals("vacancyselect")) ? "active" : ""%>"><a href="vacancyselect.jsp">Show Jobs</a>
                                </li>  
                            </ul>
                        </li>
                        <li class="<%= (pageName.equals("responseCandidate")) ? "active" : ""%>"><a href="responseCandidate.jsp"><i class="icon mdi mdi-face"></i><span>Responses</span></a>

                        <li class="<%= (pageName.equals("subscriptionSelect")) ? "active" : ""%>" ><a href="subscriptionSelect.jsp " ><i class="icon mdi mdi-face"></i><span>My Plan</span></a>
                        </li>
                        <li class="<%= (pageName.equals("employerWallet")) ? "active" : ""%>"><a href="employerWallet.jsp?eid=<%= session.getAttribute("EmployerId")%>"><i class="fa fa-google-wallet mr-2" aria-hidden="true"></i><span>Wallet </span></a>
                        </li>
                           <li><a href="../EmployerController?action=logout"><i class="icon mdi mdi-home"></i><span>Logout</span></a>
                        </li>
                        <%}%>
                        </li>

                    </ul>


                </div>
            </div>
        </div>

    </div>
</div>