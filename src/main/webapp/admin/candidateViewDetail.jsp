
<%@page import="com.qt.jobportal.beans.TblCandidate"%>
<%@page import="com.qt.jobportal.models.CandidateModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.qt.jobportal.models.Vacancy"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<%
    CandidateModel candidate = new CandidateModel();
    TblCandidate beanCandidate = candidate.selectById(request.getParameter("id"));
%>

<div class="card card-border-color card-border-color-primary">
    <div class="card-header card-header-divider text-center">Subscription Details</div>
    <div class="card-body">
        <table class="table table-sm table-striped">

            <tbody>
                <tr>
                    <td class="icon"><span class="mdi mdi-star"></span></td>
                    <td class="item">Full Name<span class="icon s7-phone"></span></td>
                    <td><%= (beanCandidate.getFullName() == null || beanCandidate.getFullName() == "null" || beanCandidate.getFullName() == "") ? "Haven't added" : beanCandidate.getFullName()%></td>
                </tr>
                <tr>
                    <td class="icon"><span class="mdi mdi-accounts"></span></td>
                    <td class="item">Phone Number<span class="icon s7-phone"></span></td>
                    <td><%= (beanCandidate.getPhone_No() == null || beanCandidate.getPhone_No() == "null" || beanCandidate.getPhone_No() == "") ? "Haven't added" : beanCandidate.getPhone_No()%></td>
                </tr>
                <tr>
                    <td class="icon"><span class="mdi mdi-accounts"></span></td>
                    <td class="item">State<span class="icon s7-phone"></span></td>
                    <td><%= (beanCandidate.getState() == null || beanCandidate.getState() == "null" || beanCandidate.getState() == "") ? "Haven't added" : beanCandidate.getState()%></td>
                </tr>
                <tr>
                    <td class="icon"><span class="mdi mdi-accounts"></span></td>
                    <td class="item">City<span class="icon s7-phone"></span></td>
                    <td><%= (beanCandidate.getCity() == null || beanCandidate.getCity() == "null" || beanCandidate.getCity() == "") ? "Haven't added" : beanCandidate.getCity()%></td>
                </tr>
                <tr>
                    <td class="icon"><span class="mdi mdi-skype"></span></td>
                    <td class="item">Address<span class="icon s7-phone"></span></td>
                    <td><%= (beanCandidate.getAddress() == null || beanCandidate.getAddress() == "null" || beanCandidate.getAddress() == "") ? "Haven't added" : beanCandidate.getAddress()%></td>
                </tr>
                <tr>
                    <td class="icon"><span class="mdi mdi-globe"></span></td>
                    <td class="item">Age<span class="icon s7-phone"></span></td>
                    <td><%= (beanCandidate.getAge() == 0) ? "Haven't added" : beanCandidate.getAge()%></td>
                </tr>
                <tr>
                    <td class="icon"><span class=" fa fa-globe"></span></td>
                    <td class="item">Gender<span class="icon s7-phone"></span></td>
                    <td><%= (beanCandidate.getGender() == null || beanCandidate.getGender() == "null" || beanCandidate.getGender() == "") ? "Haven't added" : beanCandidate.getGender()%></td>
                </tr>
                <tr>
                    <td class="icon"><span class="mdi mdi-globe"></span></td>
                    <td class="item">Qualification<span class="icon s7-phone"></span></td>
                    <td><%= (beanCandidate.getQualification() == null || beanCandidate.getQualification() == "null" || beanCandidate.getQualification() == "") ? "Haven't added" : beanCandidate.getQualification()%></td>
                </tr>
                <tr>
                    <td class="icon"><span class="mdi mdi-globe"></span></td>
                    <td class="item">School Medium<span class="icon s7-phone"></span></td>
                    <td><%= (beanCandidate.getSchoolMedium() == null || beanCandidate.getSchoolMedium() == "null" || beanCandidate.getSchoolMedium() == "") ? "Haven't added" : beanCandidate.getSchoolMedium()%></td>
                </tr>
                <tr>
                    <td class="icon"><span class="mdi mdi-city"></span></td>
                    <td class="item">English Skill<span class="icon s7-phone"></span></td>
                    <td><%= (beanCandidate.getEnglishSkill() == null || beanCandidate.getEnglishSkill() == "null" || beanCandidate.getEnglishSkill() == "") ? "Haven't added" : beanCandidate.getEnglishSkill()%></td>
                </tr>
                <tr>
                    <td class="icon"><span class="mdi mdi-globe"></span></td>
                    <td class="item">Fresher/Experience<span class="icon s7-phone"></span></td>
                    <td><%= (beanCandidate.getFresherExperience() == null || beanCandidate.getFresherExperience() == "null" || beanCandidate.getFresherExperience() == "") ? "Haven't added" : beanCandidate.getFresherExperience()%></td>
                </tr>
                <tr>
                    <td class="icon"><span class="mdi mdi-globe"></span></td>
                    <td class="item">Job Role<span class="icon s7-phone"></span></td>
                    <td><%= (beanCandidate.getJobRole() == null || beanCandidate.getJobRole() == "null" || beanCandidate.getJobRole() == "") ? "Haven't added" : beanCandidate.getJobRole()%></td>
                </tr>

            </tbody>
        </table>
    </div>
</div>
