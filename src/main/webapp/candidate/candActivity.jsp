<%-- 
    Document   : candActivity
    Created on : 25 Apr, 2020, 5:36:36 PM
    Author     : Nikita
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.jsp" %>    
    </head>
    <body>
         <div class="be-wrapper">
                <%@include file="navbar.jsp" %>
                  <%@include file="sidebar.jsp" %>
                   <div class="be-content">
                      <div class="main-content container-fluid">   
        <div class="row">
            <div class=" col-sm-12 col-lg-12">
              <div class="tab-container">
                <ul class="nav nav-tabs nav-tabs-classic" role="tablist">
                  <li class="nav-item"><a class="nav-link active" href="#classic_icon_home" data-toggle="tab" role="tab"><span class="icon mdi mdi-home"></span></a></li>
                  <li class="nav-item"><a class="nav-link" href="#classic_icon_profile" data-toggle="tab" role="tab"><span class="icon mdi mdi-face"></span></a></li>
                  <li class="nav-item"><a class="nav-link" href="#classic_icon_messages" data-toggle="tab" role="tab"><span class="icon mdi mdi-email"></span></a></li>
                </ul>
                <div class="tab-content">
                  <div class="tab-pane active" id="classic_icon_home" role="tabpanel">
                    <h4>Classic Icon Top Tabs</h4>
                    <p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam porta lacus ipsum, tempus consequat turpis auctor sit amet. Pellentesque porta mollis nisi, pulvinar convallis tellus tristique nec.</p>
                    <p> Nam aliquet consequat quam sit amet dignissim. Quisque vel massa est. Donec dictum nisl dolor, ac malesuada tellus efficitur non. Pellentesque pellentesque odio neque, eget imperdiet eros vehicula lacinia.</p>
                  </div>
                  <div class="tab-pane" id="classic_icon_profile" role="tabpanel">
                    <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima praesentium laudantium ipsa, enim maxime placeat, dolores quos sequi nisi iste velit perspiciatis rerum eveniet voluptate laboriosam perferendis ipsum. Expedita, maiores.</p>
                    <p> Consectetur adipisicing elit. Minima praesentium laudantium ipsa, enim maxime placeat, dolores quos sequi nisi iste velit perspiciatis rerum eveniet voluptate laboriosam perferendis ipsum. Expedita, maiores.</p>
                  </div>
                  <div class="tab-pane" id="classic_icon_messages" role="tabpanel">
                    <p>Consectetur adipisicing elit. Ipsam ut praesentium, voluptate quidem necessitatibus quam nam officia soluta aperiam, recusandae.</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos facilis laboriosam, vitae ipsum tenetur atque vel repellendus culpa reiciendis velit quas, unde soluta quidem voluptas ipsam, rerum fuga placeat rem error voluptate eligendi modi. Delectus, iure sit impedit? Facere provident expedita itaque, magni, quas assumenda numquam eum! Sequi deserunt, rerum.</p><a href="#">Read more  </a>
                  </div>
                </div>
              </div>
            </div>
        </div>
        </div>
                      </div>
         </div>
            <a class="btn btn-secondary btn-sm btn-danger" href="../JobActivityController?action=updateActivity?id=5">Apply now                                           
            </a>
            <%@include file="footer.jsp"%>
              </body>
</html>
