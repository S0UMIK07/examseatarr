<%-- 
    Document   : LoginPage
    Created on : Dec 4, 2023, 10:57:48 PM
    Author     : 91731
--%>
<%
          Student stu=(Student)session.getAttribute("current-user");
          if(stu!=null){
          session.setAttribute("message", "logoutFirst");
          response.sendRedirect("index.jsp");
          return;
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="components/common_css_js.jsp" %>
        <%@include file="components/navbar.jsp" %>
        <%@include file="components/msg.jsp" %>
    </head>
    <body>
        <div class="card mx-auto" style="width: 30rem; margin-top: 12%; margin-bottom: 5%">
  <div class="card-body">
      <h5 class="card-title" style="text-align: center">Login Page</h5>
    <h6 class="card-subtitle mb-2 text-muted" style="text-align: center">Student Login</h6>
    <form action="LoginServlet" method="post">
    <div class="mb-3">
    <label for="StudentName" class="form-label">Student Name</label>
    <input name="StudentName" placeholder="Enter your Name" class="form-control" id="StudentName" required>
    
  </div>
  <div class="mb-3">
    <label for="RollNo" class="form-label">Roll Number</label>
    <input type="password" name="RollNumber" placeholder="Enter RollNumber" class="form-control" id="RollNumber" required>
  </div>
        
        <div style="text-align: center;">    
   <button type="reset" class="btn btn-outline-primary">Reset</button>
   <button type="submit" class="btn btn-outline-primary">Login</button>
        </div>

    </form>
    <p style="text-align: center; margin-top: 3%">Not Registered? <a href="Register.jsp" class="card-link">Sign Up</a></p>
  </div>
</div>
    </body>
</html>
