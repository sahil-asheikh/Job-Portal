 
<%@page import="com.qt.jobportal.beans.TblSystemSetting"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.qt.jobportal.models.SystemSettingModel"%>
<%
    SystemSettingModel systemModel = new SystemSettingModel();

    TblSystemSetting systemBean = systemModel.keySkills(request.getParameter("jobrole"));
%>



<% String keySkills = systemBean.getJobSkills();
    String[] kSkill = keySkills.split(","); //   splits the string by comma
%>

<% for (String ks : kSkill) {%>
<input type="checkbox" name="txtSkillSet" value="<%=ks%>"> <%= ks%> &nbsp;&nbsp;  
<%
        // System.out.println(ks); 
    }
%>
