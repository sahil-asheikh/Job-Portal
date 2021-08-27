
<%@page import="com.qt.jobportal.beans.TblVacancy"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.qt.jobportal.models.Vacancy"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <%
            Vacancy vacmod = new Vacancy();
            ArrayList<TblVacancy> vacc = vacmod.selectByEmployerId(request.getParameter("id"));
        %>
    
        <form action="../VacancyController" method="post">
                                    
                               
                <div class="row">
                      
                      
                    <%  for (TblVacancy vacancy : vacc) {
                            if (vacancy.getSerialNo() == -1 || vacancy.getSerialNo() == 0) {
                    %>
                    <div class="col-lg-6">
                        <div class="card card-border-color card-border-color-primary">
                            <a href="jobDetails.jsp"> <div class="card-body">
                                <div class="form-group row">
                                    <div class="col-12">
                                        <span class="splash-title pb-4"><%= vacancy.getException()%></span>
                                    </div>
                                    <table class="table table-sm table-hover table-striped">

                                        <tbody>
                                             <input type="hidden" name="id" value="<%= vacancy.getId() %>">
                                  
                                            <tr>
                                                <td><div class="icon"><span class="mdi mdi-case mt-2">   <%= vacancy.getException()%>  </span></div></td>
                                                <td <div class="icon"><span class="mdi mdi-pin mt-2 "> <%= vacancy.getException()%> </span></div></td>

                                            </tr>
                                            <tr>
                                                <td><div><i class="fa fa-building mt-2" style="font-size: 15px"><span>  <%= vacancy.getException()%>  </span></i></div></td>
                                                <td ><div> <i class="fa fa-rupee mt-2 " style="font-size:15px"><span>  <%= vacancy.getException()%>  </span></i></div></td>

                                            </tr>
                                            <tr>
                                                <td><div class="icon"><span class="mdi mdi-graduation-cap mt-2">  <%= vacancy.getException()%>  </span></div></td>
                                                <td> <div class="icon"><span class="mdi mdi-translate mt-2 mr-1"> <%= vacancy.getException()%> </span></div></td>
                                            </tr>
                                            <tr>
                                                <td><div><i class="fa fa-list-alt mt-2" style="font-size: 15px"><span>  <%= vacancy.getException()%>  </span></i></div></td>
                                                <td></td>
                                            </tr>

                                        </tbody>
                                    </table>

                                </div>
                                </div></a>
                        </div>

                    </div>
                    <%
                    } else {
                    %>
                    <div class="col-lg-6">
                        <div class="card card-border-color card-border-color-primary">
                             <input type="hidden" name="id" value="<%= vacancy.getId() %>">
                                  
                            <a href="jobDetails.jsp?id=<%= vacancy.getId() %> "><div class="card-body">
                                <div class="form-group row">
                                    <div class="col-12">
                                        <span class="splash-title pb-4"><%= vacancy.getTitle()%></span>
                                    </div>
                                    <table class="table table-sm table-hover table-striped">

                                        <tbody>
                                            
                                            <tr>
                                                <td><div class="icon"><span class="mdi mdi-case mt-2">  <%= vacancy.getJobDescription()%>  </span></div></td>
                                                <td <div class="icon"><span class="mdi mdi-pin mt-2 "> <%= vacancy.getJobCity()%> </span></div></td>

                                            </tr>
                                            <tr>
                                                <td><div><i class="fa fa-building mt-2" style="font-size: 15px"><span> <%= vacancy.getCompanyName()%>  </span></i></div></td>
                                                <td ><div> <i class="fa fa-rupee mt-2 " style="font-size:15px"><span>  <%= vacancy.getMinSalary()%>-<%= vacancy.getMaxSalary()%> </span></i></div></td>

                                            </tr>
                                            <tr>
                                                <td><div class="icon"><span class="mdi mdi-graduation-cap mt-2">  <%= vacancy.getMinQualification()%>  </span></div></td>
                                                <td> <div class="icon"><span class="mdi mdi-translate mt-2 mr-1"> <%= vacancy.getEnglishAccuracy()%> </span></div></td>
                                            </tr>
                                            <tr>
                                                <td><div><i class="fa fa-list-alt mt-2" style="font-size: 15px"><span>  <%= vacancy.getExperience()%>  </span></i></div></td>
                                                <td></td>
                                            </tr>

                                        </tbody>
                                    </table>

                                </div>
                                 </div></a>
                        </div>

                    </div>
                                                
                                                
                    <%
                            }
                        }
                    %> 




                </div>
            </div>
        </div>
  