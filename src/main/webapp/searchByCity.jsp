<%@page import="com.qt.jobportal.models.EmployerModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.qt.jobportal.beans.TblVacancy"%>
<%@page import="com.qt.jobportal.models.Vacancy"%>

<p> <%= request.getParameter("jobCity")%></p>
<%
    Vacancy vacmod = new Vacancy();
    ArrayList<TblVacancy> vacc = vacmod.searchByCity((request.getParameter("jobCity")));
%>
<%  for (TblVacancy vacancy : vacc) {
        if (vacancy.getSerialNo() == -1 || vacancy.getSerialNo() == 0) {
%>
<div class="col-lg-12">
    <div class="card card-border-color card-border-color-primary">
        <a href="jobDetails.jsp"> <div class="card-body">
                <div class="form-group row">
                    <div class="col-12">
                        <span class="splash-title pb-4"><%= vacancy.getException()%></span>
                    </div>
                </div>
            </div>
        </a>
    </div>
</div>
<%
} else {
    EmployerModel empMod = new EmployerModel();
    boolean checkBalanceStatus = empMod.checkEmployerBalance(vacancy.getEmployerId());
    if (checkBalanceStatus) {
%>
<div class="col-lg-6">
    <div class="card card-border-color card-border-color-primary">
        <input type="hidden" name="id" value="<%= vacancy.getId()%>">

        <a href="jobDetails.jsp?id=<%= vacancy.getId()%> "><div class="card-body">
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
            </div>
        </a>
    </div>
</div>
<%
            }
        }
    }
%>
<nav aria-label="...">
    <ul class="pagination justify-content-center">
        <li class="page-item disabled">
            <span class="page-link">Previous</span>
        </li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item active">
            <span class="page-link">
                2
                <span class="sr-only">(current)</span>
            </span>
        </li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item">
            <a class="page-link" href="#">Next</a>
        </li>
    </ul>
</nav>
