<%-- 
    Document   : profile
    Created on : 12 Mar, 2020, 2:52:53 PM
    Author     : Nikita
--%>

<%@page import="com.qt.jobportal.beans.TblEmployerDetails"%>
<%@page import="com.qt.jobportal.beans.TblEmployer"%>
<%@page import="com.qt.jobportal.models.EmployerModel"%>
<%@page import="java.lang.String"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="../assets/img/logo-fav.png">
        <%@include file="head.jsp" %>
        <title>Job Portal</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <!--have to paste for states and cities-->
        <script src="../assets/myjs/cities.js"></script>
        <!--have to paste for states and cities-->

    </head>
    <body>

        <div class="be-wrapper">
            <%@include file="navbar.jsp" %>
            <%@include file="sidebar.jsp" %>
            <div class="be-content">
                <div class="main-content container-fluid">
                    <!--             Start Main Content --->



                    <%
                        EmployerModel empModel = new EmployerModel();
                        TblEmployer beanEmp = empModel.selectById(String.valueOf(session.getAttribute("EmployerId")));
                        TblEmployerDetails empDetails = empModel.selectEmployerDetailsById(String.valueOf(session.getAttribute("EmployerId")));

                    %>



                    <div class="col-lg-10">
                        <div class="user-profile">
                            <div class="user-display">
                                <div class="user-display-bg"><img src="../assets/img/user-profile-display.png" alt="Profile Background"></div>
                                <div class="user-display-bottom">
                                    <div class="user-display-avatar"><img src="../assets/img/avatar-150.png" alt="Avatar"></div>

                                    <div class="user-display-info">
                                        <div class="name"> <%= beanEmp.getCompanyName()%></div>
                                        <div class="nick"><span class="mdi mdi-account"></span> <%= beanEmp.getEmailId()%></div>

                                        <p class="text-success text-right">${param.message}</p>
                                        <p class="text-success text-right">${param.msg}</p>
                                    </div>
                                    <div class="row">
                                        <div class="col-4 offset-8">
                                            <a class="btn btn-secondary btn-sm btn-info " type="button"   href="updatePassword.jsp?id=<%= session.getAttribute("EmployerId")%> ">

                                                <div class="icon-sm">
                                                    <span class="mdi mdi-edit">Change Password</span>
                                                </div>
                                            </a>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="user-info-list card">
                                <div class="card-header card-header-divider">
                                    About Company &nbsp;
                                    <div class="tools">
                                        <a  data-toggle="modal" data-target="#modalCompanySummary" type="button" href="#">
                                            <div class="icon-sm">
                                                <i class="icon">
                                                    <span class="icon mdi mdi-edit btn-space text-primary  md-trigger" data-modal="form-primary-3" title="Edit your Personal Info Details"></span>
                                                </i>
                                            </div>
                                        </a>
                                    </div>
                                    <span class="card-subtitle">
                                        <%= (empDetails.getCompany_summary() == "null") || (empDetails.getCompany_summary() == "") || (empDetails.getCompany_summary() == null) ? "Company Summary is not Specified" : empDetails.getCompany_summary()%>
                                    </span>
                                </div>
                            </div>

                            <!--MODAL TO SAVE SUMMARY-->
                            <div class="modal fade" id="modalCompanySummary" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">About Company</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <form action="../EmployerController" method="post" name="frm">
                                            <input type="hidden" name="empid" value="<%= String.valueOf(session.getAttribute("EmployerId"))%>">
                                            <div class="modal-body">
                                                <div class="form-group row">
                                                    <div class="col-9 col-lg-10">
                                                        <textarea class="form-control" name="company_summary" placeholder="Write about your company..." rows="3"><%= (empDetails.getCompany_summary() == ("null")) || (empDetails.getCompany_summary() == ("")) || (empDetails.getCompany_summary() == (null)) ? "" : empDetails.getCompany_summary()%></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button class="btn btn-space btn-primary" type="submit" name="action" value="saveCompanySummary">Save Changes</button>
                                                <button data-dismiss="modal" class="btn btn-space btn-secondary">Back</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!--MODAL TO SAVE SUMMARY-->

                            <div class="user-info-list card">
                                <div class="card-header card-header-divider">
                                    Website &nbsp;
                                    <div class="tools">
                                        <a  data-toggle="modal" data-target="#modalCompanyWebsite" type="button" href="#">
                                            <div class="icon-sm">
                                                <i class="icon">
                                                    <span class="icon mdi mdi-edit btn-space text-primary  md-trigger" data-modal="form-primary-3" title="Edit your Personal Info Details"></span>
                                                </i>
                                            </div>
                                        </a>
                                    </div>
                                    <span class="card-subtitle">
                                        <%
                                            if ((empDetails.getWebsite() == "null") || (empDetails.getWebsite() == "") || (empDetails.getWebsite() == null)) {
                                        %>
                                        <p>Add your website</p>
                                        <%
                                        } else {
                                        %>
                                        <a href="<%= "https://" + empDetails.getWebsite()%>" class="link-primary font-weight-bold" target="_"><%= empDetails.getWebsite()%></a>
                                        <%
                                            }
                                        %>
                                    </span>
                                </div>
                            </div>

                            <!--MODAL TO SAVE WEBSITE-->
                            <div class="modal fade" id="modalCompanyWebsite" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Company Website</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <form action="../EmployerController" method="post" name="frm">
                                            <input type="hidden" name="empid" value="<%= String.valueOf(session.getAttribute("EmployerId"))%>">
                                            <div class="modal-body">
                                                <div class="form-group row">
                                                    <div class="col-9 col-lg-10">
                                                        <input type="text" class="form-control" name="website" placeholder="Enter your company website..." rows="3" value="<%= (empDetails.getWebsite() == ("null")) || (empDetails.getWebsite() == ("")) || (empDetails.getWebsite() == (null)) ? "" : empDetails.getWebsite()%>">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button class="btn btn-space btn-primary" type="submit" name="action" value="saveWebsite">Save Changes</button>
                                                <button data-dismiss="modal" class="btn btn-space btn-secondary">Back</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!--MODAL TO SAVE WEBSITE-->

                            <div class="user-info-list card">
                                <%if (beanEmp.getPhoneNo() == null || beanEmp.getPhoneNo() == "null" || beanEmp.getPhoneNo() == "") {%>
                                <div class="card card-contrast">
                                    <div class="card-header card-header card-header-featured"> Company Details &nbsp;
                                        <div class="card-body text-center">
                                            <blockquote class="blockquote">
                                                <div class="icon-container">


                                                    <a  data-toggle="modal" data-target="#modalCompanyDetails" type="button" href="uploadResume.jsp?id=<%= session.getAttribute("EmployerId")%>">
                                                        <div class="icon-sm">
                                                            <i class="icon"><span class="mdi mdi-plus md-trigger" data-modal="form-primary-3"></span></i>
                                                        </div>
                                                    </a>

                                                    <p>Complete your <a class="text-primary">Company Details</a> Section</p>

                                                </div>                                
                                            </blockquote>
                                        </div>
                                    </div>
                                </div>

                                <%} else {%>
                                <div class="card-header card-header card-header-featured"> Company Details &nbsp;
                                    <div class="tools">

                                        <a  data-toggle="modal" data-target="#modalCompanyDetails" type="button" href="#">
                                            <div class="icon-sm">
                                                <i class="icon">

                                                    <span class="icon mdi mdi-edit btn-space text-primary  md-trigger" data-modal="form-primary-3" title="Edit your Company Details"></span>

                                                </i>
                                            </div>
                                        </a>

                                    </div>
                                </div>

                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <table class="no-border no-strip skills">
                                                <tbody class="no-border-x no-border-y">
                                                    <tr>
                                                        <td class="icon"><span class="fa fa-building"></span></td>
                                                        <td class="item">Company Name<span class="icon s7-portfolio"></span></td>
                                                        <td><%= (beanEmp.getCompanyName() == "null") || (beanEmp.getCompanyName() == "") || (beanEmp.getCompanyName() == null) ? "Company Name is not Specified" : beanEmp.getCompanyName()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="icon"><span class="mdi mdi-smartphone-android"></span></td>
                                                        <td class="item">Phone No<span class="icon s7-gift"></span></td>
                                                        <td><%= (beanEmp.getPhoneNo() == "null") || (beanEmp.getPhoneNo() == "") || (beanEmp.getPhoneNo() == null) ? "Company number is not Specified" : beanEmp.getPhoneNo()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="icon"><span class="mdi mdi-email"></span></td>
                                                        <td class="item">Email<span class="icon s7-global"></span></td>
                                                        <td><%= (beanEmp.getEmailId() == "null") || (beanEmp.getEmailId() == "") || (beanEmp.getEmailId() == null) ? "Company email is not Specified" : beanEmp.getEmailId()%></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <%}%>
                            </div>
                            <!--MODAL TO SAVE COMPANY DETAILS-->
                            <div class="modal fade" id="modalCompanyDetails" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Company Details</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <form action="../EmployerController" method="post" name="frm">
                                            <input type="hidden" name="id" value="<%= String.valueOf(session.getAttribute("EmployerId"))%>">
                                            <div class="modal-body">
                                                <div class="form-group row">
                                                    <div class="col-9 col-lg-10">

                                                        <div class="form-group">
                                                            <label>Company Name: </label>
                                                            <input type="text" class="form-control" placeholder="Enter your company name" name="txtCompanyName" value="<%= (beanEmp.getCompanyName() == null) || (beanEmp.getCompanyName() == "null") || (beanEmp.getCompanyName() == "") ? "" : (beanEmp.getCompanyName())%>" required="">
                                                            <br>
                                                        </div>

                                                        <div class="form-group">
                                                            <label>Contact Person: </label>
                                                            <input type="number" class="form-control" placeholder="Enter contact person's number" name="txtContactPerson" value="<%= (beanEmp.getContactPerson() == null) || (beanEmp.getContactPerson() == "null") || (beanEmp.getContactPerson() == "") ? "" : (beanEmp.getContactPerson())%>" required="">
                                                            <br>
                                                        </div>

                                                        <div class="form-group">
                                                            <label>Company Phone No.: </label>
                                                            <input type="number" class="form-control" placeholder="Enter your company number" name="txtPhoneNo" value="<%= (beanEmp.getPhoneNo() == null) || (beanEmp.getPhoneNo() == "null") || (beanEmp.getPhoneNo() == "") ? "" : (beanEmp.getPhoneNo())%>" required="">
                                                            <br>
                                                        </div>

                                                        <div class="form-group">
                                                            <label>Company Email: </label>
                                                            <input type="email" class="form-control" placeholder="Enter your company email" name="txtEmailId" value="<%= (beanEmp.getEmailId() == null) || (beanEmp.getEmailId() == "null") || (beanEmp.getEmailId() == "") ? "" : (beanEmp.getEmailId())%>" required="">
                                                            <br>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button class="btn btn-space btn-primary" type="submit" name="action" value="update">Save Changes</button>
                                                <button data-dismiss="modal" class="btn btn-space btn-secondary">Back</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!--MODAL TO SAVE COMPANY DETAILS-->

                            <div class="user-info-list card">
                                <%if (empDetails.getCompany_state() == null || empDetails.getCompany_state() == "null" || empDetails.getCompany_state() == "") {%>

                                <div class="card card-contrast">
                                    <div class="card-header card-header card-header-featured"> Company Address &nbsp;
                                        <div class="card-body text-center">
                                            <blockquote class="blockquote">
                                                <div class="icon-container">


                                                    <a  data-toggle="modal" data-target="#modalCompanyAddress" type="button" href="uploadResume.jsp?id=<%= session.getAttribute("EmployerId")%>">
                                                        <div class="icon-sm">
                                                            <i class="icon"><span class="mdi mdi-plus md-trigger" data-modal="form-primary-3"></span></i>
                                                        </div>
                                                    </a>

                                                    <p>Complete your <a class="text-primary">Company Address</a> Section</p>

                                                </div>                                
                                            </blockquote>
                                        </div>
                                    </div>
                                </div>

                                <%} else {%>
                                <div class="card-header card-header card-header-featured"> Company Address &nbsp;
                                    <div class="tools">

                                        <a  data-toggle="modal" data-target="#modalCompanyAddress" type="button" href="#">
                                            <div class="icon-sm">
                                                <i class="icon">

                                                    <span class="icon mdi mdi-edit btn-space text-primary  md-trigger" data-modal="form-primary-3" title="Edit your Company Address"></span>

                                                </i>
                                            </div>
                                        </a>

                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <table class="no-border no-strip skills">
                                                <tbody class="no-border-x no-border-y">
                                                    <tr>
                                                        <td class="icon"><span class="fa fa-building"></span></td>
                                                        <td class="item">Company State<span class="icon s7-portfolio"></span></td>
                                                        <td><%= (empDetails.getCompany_state() == "null") || (empDetails.getCompany_state() == "") || (empDetails.getCompany_state() == null) ? "Company State is not Specified" : empDetails.getCompany_state()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="icon"><span class="fa fa-building"></span></td>
                                                        <td class="item">Company City<span class="icon s7-gift"></span></td>
                                                        <td><%= (empDetails.getCompany_city() == "null") || (empDetails.getCompany_city() == "") || (empDetails.getCompany_city() == null) ? "Company City is not Specified" : empDetails.getCompany_city()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="icon"><span class="fa fa-building"></span></td>
                                                        <td class="item">Company Details <span class="icon s7-global"></span></td>
                                                        <td><%= (empDetails.getCompany_address() == "null") || (empDetails.getCompany_address() == "") || (empDetails.getCompany_address() == null) ? "Company Address is not Specified" : empDetails.getCompany_address()%></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>

                                <%}%>
                                <!--MODAL TO SAVE COMPANY DETAILS-->
                                <div class="modal fade" id="modalCompanyAddress" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Company Details</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <form action="../EmployerController" method="post" name="frm">
                                                <input type="hidden" name="id" value="<%= String.valueOf(session.getAttribute("EmployerId"))%>">
                                                <div class="modal-body">
                                                    <div class="form-group row">
                                                        <div class="col-9 col-lg-10">

                                                            <div class="form-group">

                                                                <%
                                                                    if (((empDetails.getCompany_state() == null || empDetails.getCompany_state() == "null" || empDetails.getCompany_state() == "")) && ((empDetails.getCompany_state() == null || empDetails.getCompany_state() == "null" || empDetails.getCompany_state() == ""))) {
                                                                %>
                                                                <label>Company State: </label>
                                                                <select onchange="print_city('state', this.selectedIndex);" id ="sts" name="txtState" class="form-control form-control-sm" required></select>
                                                                <br>

                                                                <label>Company City: </label>
                                                                <select id="state" class="form-control form-control-sm" required name="txtCity"></select>
                                                                <br>

                                                                <%
                                                                } else {
                                                                %>
                                                                <label>Company State: </label>
                                                                <input type="text" class="form-control" placeholder="Enter your State" name="txtState" value="<%= ((empDetails.getCompany_state() == null || empDetails.getCompany_state() == "null" || empDetails.getCompany_state() == "") ? "" : empDetails.getCompany_state())%>" required="">
                                                                <br>

                                                                <label>Company City: </label>
                                                                <input type="text" class="form-control" placeholder="Enter your City" name="txtCity" value="<%= ((empDetails.getCompany_city() == null || empDetails.getCompany_city() == "null" || empDetails.getCompany_city() == "") ? "" : empDetails.getCompany_city())%>" required="">
                                                                <br>
                                                                <%
                                                                    }
                                                                %>

                                                                <label>Company Address: </label>
                                                                <input type="text" class="form-control" placeholder="Enter your company address" name="txtAddress" value="<%= (empDetails.getCompany_address() == null) || (empDetails.getCompany_address() == "null") || (empDetails.getCompany_address() == "") ? "" : (empDetails.getCompany_address())%>" required="">
                                                                <br>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button class="btn btn-space btn-primary" type="submit" name="action" value="updateCompanyAddress">Save Changes</button>
                                                        <button data-dismiss="modal" class="btn btn-space btn-secondary">Back</button>
                                                    </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <!--MODAL TO SAVE COMPANY DETAILS-->
                            </div>

                        </div>
                        <!--             End Mian Content --->
                        <nav class="be-right-sidebar">
                            <div class="sb-content">
                                <div class="tab-navigation">
                                    <ul class="nav nav-tabs nav-justified" role="tablist">
                                        <li class="nav-item" role="presentation"><a class="nav-link active" href="#tab1" aria-controls="tab1" role="tab" data-toggle="tab">Chat</a></li>
                                        <li class="nav-item" role="presentation"><a class="nav-link" href="#tab2" aria-controls="tab2" role="tab" data-toggle="tab">Todo</a></li>
                                        <li class="nav-item" role="presentation"><a class="nav-link" href="#tab3" aria-controls="tab3" role="tab" data-toggle="tab">Settings</a></li>
                                    </ul>
                                </div>
                                <div class="tab-panel">
                                    <div class="tab-content">
                                        <div class="tab-pane tab-chat active" id="tab1" role="tabpanel">
                                            <div class="chat-contacts">
                                                <div class="chat-sections">
                                                    <div class="be-scroller-chat">
                                                        <div class="content">
                                                            <h2>Recent</h2>
                                                            <div class="contact-list contact-list-recent">
                                                                <div class="user"><a href="#"><img src="assets/img/avatar1.png" alt="Avatar">
                                                                        <div class="user-data"><span class="status away"></span><span class="name">Claire Sassu</span><span class="message">Can you share the...</span></div></a></div>
                                                                <div class="user"><a href="#"><img src="assets/img/avatar2.png" alt="Avatar">
                                                                        <div class="user-data"><span class="status"></span><span class="name">Maggie jackson</span><span class="message">I confirmed the info.</span></div></a></div>
                                                                <div class="user"><a href="#"><img src="assets/img/avatar3.png" alt="Avatar">
                                                                        <div class="user-data"><span class="status offline"></span><span class="name">Joel King		</span><span class="message">Ready for the meeti...</span></div></a></div>
                                                            </div>
                                                            <h2>Contacts</h2>
                                                            <div class="contact-list">
                                                                <div class="user"><a href="#"><img src="assets/img/avatar4.png" alt="Avatar">
                                                                        <div class="user-data2"><span class="status"></span><span class="name">Mike Bolthort</span></div></a></div>
                                                                <div class="user"><a href="#"><img src="assets/img/avatar5.png" alt="Avatar">
                                                                        <div class="user-data2"><span class="status"></span><span class="name">Maggie jackson</span></div></a></div>
                                                                <div class="user"><a href="#"><img src="assets/img/avatar6.png" alt="Avatar">
                                                                        <div class="user-data2"><span class="status offline"></span><span class="name">Jhon Voltemar</span></div></a></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="bottom-input">
                                                    <input type="text" placeholder="Search..." name="q"><span class="mdi mdi-search"></span>
                                                </div>
                                            </div>
                                            <div class="chat-window">
                                                <div class="title">
                                                    <div class="user"><img src="assets/img/avatar2.png" alt="Avatar">
                                                        <h2>Maggie jackson</h2><span>Active 1h ago</span>
                                                    </div><span class="icon return mdi mdi-chevron-left"></span>
                                                </div>
                                                <div class="chat-messages">
                                                    <div class="be-scroller-messages">
                                                        <div class="content">
                                                            <ul>
                                                                <li class="friend">
                                                                    <div class="msg">Hello</div>
                                                                </li>
                                                                <li class="self">
                                                                    <div class="msg">Hi, how are you?</div>
                                                                </li>
                                                                <li class="friend">
                                                                    <div class="msg">Good, I'll need support with my pc</div>
                                                                </li>
                                                                <li class="self">
                                                                    <div class="msg">Sure, just tell me what is going on with your computer?</div>
                                                                </li>
                                                                <li class="friend">
                                                                    <div class="msg">I don't know it just turns off suddenly</div>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="chat-input">
                                                    <div class="input-wrapper"><span class="photo mdi mdi-camera"></span>
                                                        <input type="text" placeholder="Message..." name="q" autocomplete="off"><span class="send-msg mdi mdi-mail-send"></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane tab-todo" id="tab2" role="tabpanel">
                                            <div class="todo-container">
                                                <div class="todo-wrapper">
                                                    <div class="be-scroller-todo">
                                                        <div class="todo-content"><span class="category-title">Today</span>
                                                            <ul class="todo-list">
                                                                <li>
                                                                    <div class="custom-checkbox custom-control custom-control-sm"><span class="delete mdi mdi-delete"></span>
                                                                        <input class="custom-control-input" type="checkbox" checked="" id="tck1">
                                                                        <label class="custom-control-label" for="tck1">Initialize the project</label>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="custom-checkbox custom-control custom-control-sm"><span class="delete mdi mdi-delete"></span>
                                                                        <input class="custom-control-input" type="checkbox" id="tck2">
                                                                        <label class="custom-control-label" for="tck2">Create the main structure</label>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="custom-checkbox custom-control custom-control-sm"><span class="delete mdi mdi-delete"></span>
                                                                        <input class="custom-control-input" type="checkbox" id="tck3">
                                                                        <label class="custom-control-label" for="tck3">Updates changes to GitHub</label>
                                                                    </div>
                                                                </li>
                                                            </ul><span class="category-title">Tomorrow</span>
                                                            <ul class="todo-list">
                                                                <li>
                                                                    <div class="custom-checkbox custom-control custom-control-sm"><span class="delete mdi mdi-delete"></span>
                                                                        <input class="custom-control-input" type="checkbox" id="tck4">
                                                                        <label class="custom-control-label" for="tck4">Initialize the project</label>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="custom-checkbox custom-control custom-control-sm"><span class="delete mdi mdi-delete"></span>
                                                                        <input class="custom-control-input" type="checkbox" id="tck5">
                                                                        <label class="custom-control-label" for="tck5">Create the main structure</label>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="custom-checkbox custom-control custom-control-sm"><span class="delete mdi mdi-delete"></span>
                                                                        <input class="custom-control-input" type="checkbox" id="tck6">
                                                                        <label class="custom-control-label" for="tck6">Updates changes to GitHub</label>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="custom-checkbox custom-control custom-control-sm"><span class="delete mdi mdi-delete"></span>
                                                                        <input class="custom-control-input" type="checkbox" id="tck7">
                                                                        <label class="custom-control-label" for="tck7" title="This task is too long to be displayed in a normal space!">This task is too long to be displayed in a normal space!							</label>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="bottom-input">
                                                    <input type="text" placeholder="Create new task..." name="q"><span class="mdi mdi-plus"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane tab-settings" id="tab3" role="tabpanel">
                                            <div class="settings-wrapper">
                                                <div class="be-scroller-settings"><span class="category-title">General</span>
                                                    <ul class="settings-list">
                                                        <li>
                                                            <div class="switch-button switch-button-sm">
                                                                <input type="checkbox" checked="" name="st1" id="st1"><span>
                                                                    <label for="st1"></label></span>
                                                            </div><span class="name">Available</span>
                                                        </li>
                                                        <li>
                                                            <div class="switch-button switch-button-sm">
                                                                <input type="checkbox" checked="" name="st2" id="st2"><span>
                                                                    <label for="st2"></label></span>
                                                            </div><span class="name">Enable notifications</span>
                                                        </li>
                                                        <li>
                                                            <div class="switch-button switch-button-sm">
                                                                <input type="checkbox" checked="" name="st3" id="st3"><span>
                                                                    <label for="st3"></label></span>
                                                            </div><span class="name">Login with Facebook</span>
                                                        </li>
                                                    </ul><span class="category-title">Notifications</span>
                                                    <ul class="settings-list">
                                                        <li>
                                                            <div class="switch-button switch-button-sm">
                                                                <input type="checkbox" name="st4" id="st4"><span>
                                                                    <label for="st4"></label></span>
                                                            </div><span class="name">Email notifications</span>
                                                        </li>
                                                        <li>
                                                            <div class="switch-button switch-button-sm">
                                                                <input type="checkbox" checked="" name="st5" id="st5"><span>
                                                                    <label for="st5"></label></span>
                                                            </div><span class="name">Project updates</span>
                                                        </li>
                                                        <li>
                                                            <div class="switch-button switch-button-sm">
                                                                <input type="checkbox" checked="" name="st6" id="st6"><span>
                                                                    <label for="st6"></label></span>
                                                            </div><span class="name">New comments</span>
                                                        </li>
                                                        <li>
                                                            <div class="switch-button switch-button-sm">
                                                                <input type="checkbox" name="st7" id="st7"><span>
                                                                    <label for="st7"></label></span>
                                                            </div><span class="name">Chat messages</span>
                                                        </li>
                                                    </ul><span class="category-title">Workflow</span>
                                                    <ul class="settings-list">
                                                        <li>
                                                            <div class="switch-button switch-button-sm">
                                                                <input type="checkbox" name="st8" id="st8"><span>
                                                                    <label for="st8"></label></span>
                                                            </div><span class="name">Deploy on commit</span>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </nav>
                    </div>

                    <!--have to paste for states and cities--> 
                    <script language="javascript">print_state("sts");</script>
                    <!--have to paste for states and cities--> 

                    <%@include file="footer.jsp" %>

                    <script type="text/javascript">
                        $.fn.niftyModal('setDefaults', {
                            overlaySelector: '.modal-overlay',
                            contentSelector: '.modal-content',
                            closeSelector: '.modal-close',
                            classAddAfterOpen: 'modal-show'
                        });

                        $(document).ready(function () {
                            //-initialize the javascript
                            App.init();
                        });
                    </script>

                    </body>

                    </html>