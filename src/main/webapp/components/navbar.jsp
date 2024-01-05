<%-- 
    Document   : navbar
    Created on : Dec 4, 2023, 10:45:49 PM
    Author     : 91731
--%>
<% Student stud=(Student)session.getAttribute("current-user");%>
<%@page import="com.mycompany.exam_seating_arrangement.entities.Student"%>
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #8A8AFF;">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
            <%
                if(stud!=null){
                if(stud.getType().equals("admin")){
            %>
          <a class="nav-link active" aria-current="page" href="Admin.jsp">Admin Page</a>
          <% }else{ %>
          <a class="nav-link active" aria-current="page" href="StudentHome.jsp">Home</a>
          <% }} %>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
        </li>
      </ul>
      <%
         
          if(stud==null){
      %>
      <div class="btn-group" role="group" aria-label="Basic example">
          <a href="LoginPage.jsp"><button type="button" class="btn btn-primary">Login</button></a>
          <a href="Register.jsp"><button type="button" class="btn btn-primary">Sign Up</button></a>
      </div>
      <%
          }else{
      %>
      <p class="fw-bold" style="color: white;">
          Hi&nbsp;&nbsp;<%= stud.getStudentName()%>
</p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <div class="btn-group" role="group" aria-label="Basic example">
          
          <a href="LogoutServlet"><button type="button" class="btn btn-primary">Logout</button></a>
      </div>
      <%
          }
      %>
    </div>
  </div>
    
</nav>
