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
   <style>
     
       
     .btn-color{
  background-color: #0e1c36;
  color: #fff;
  
}

.profile-image-pic{
  height: 120px;
  width: 120px;
  object-fit: cover;
}



.cardbody-color{
  background-color: #ebf2fa;
}

a{
  text-decoration: none;
}
.btn-color:hover{
    background-color: white;
    color:black;
}
     
    </style>
    </head>
    <body>
        <!--new-->
        	<div class="container">
    <div class="row">
      <div class="col-md-6 offset-md-3">
        
        <div class="card my-3">

         <form action="LoginServlet" method="post" class="card-body cardbody-color p-lg-5">

            <div class="text-center">
              <img src="https://cdn.iconscout.com/icon/premium/png-512-thumb/user-1518-482296.png?f=webp&w=256" class="img-fluid profile-image-pic img-thumbnail rounded-circle my-3"
                 alt="profile">
            <h2 class="text-center text-dark">Login Form</h2>
            </div>
 
            <div class="mb-3">
                 <label for="StudentName" class="form-label">Student Name</label>
              <input type="text" name="StudentName" class="form-control" id="Username" aria-describedby="emailHelp"
                placeholder="Enter Your Name">
            </div>
            <div class="mb-3">
                 <label for="RollNo" class="form-label">Roll Number</label>
              <input type="password" name="RollNumber" class="form-control" id="password" placeholder="Enter Roll Number">
            </div>
            <div class="d-flex justify-content-center">
                        <button type="reset" class="btn btn-color px-5 mb-3" style="margin-right: 10px;">Reset</button>
                        <button type="submit" class="btn btn-color px-5 mb-3" style="margin-left: 10px;">Login</button>
                    </div>
            <div id="emailHelp" class="form-text text-center mb-5 text-dark">Not
              Registered? <a href="Register.jsp" class="text-dark fw-bold"> Create an Account</a>
            </div>
          </form>
        </div>

      </div>
    </div>
  </div>
      
    </body>
</html>

   