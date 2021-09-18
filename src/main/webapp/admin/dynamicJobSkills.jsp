<%-- 
    Document   : dynamicJobSkills
    Created on : 16 Sep, 2021, 5:45:06 PM
    Author     : LENOVO
--%>

<%@page import="com.qt.jobportal.models.SystemSettingModel"%>
<%
    try {
        SystemSettingModel systemModel = new SystemSettingModel();
%>
<form method="post" action="../SystemSettingController" name="jobeRoleSkills">
    <input type="hidden" name="action" value="jobeRoleSkills">
    <div class="form-group row">
        <label class="col-3 col-lg-2 col-form-label text-right" >Already job skills</label>
        <div class="col-9 col-lg-10">
            <div class="border border-dark pl-2 pt-2">
                <p class="font-weight-bold"><%= systemModel.selectSkills(request.getParameter("jobRole"))%></p>
            </div>
        </div>
    </div>

    <div class="form-group row">
        <label class="col-3 col-lg-2 col-form-label text-right" >Add more job skills</label>
        <div class="col-9 col-lg-10">
            <input type="hidden" name="txtJobRole" value="<%= request.getParameter("jobRole")%>">
            <textarea required="" class="form-control" name="txtJobSkills" placeholder="write skills with ( , ) separated"></textarea>
        </div>
    </div>
    <div class="row pt-3 mt-1">
        <div class="col-sm-6">
            <p class="text-right">
                <button class="btn btn-space btn-primary" type="submit">Add</button>
            </p>
        </div>
    </div>
</form>
<%
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
