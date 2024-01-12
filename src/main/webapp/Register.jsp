<%-- 
    Document   : Register
    Created on : Dec 4, 2023, 11:02:25 PM
    Author     : 91731
--%>

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
        <div class="card mx-auto" style="width: 30rem; margin-top: 8%; margin-bottom: 5%">
  <div class="card-body">
      <h5 class="card-title" style="text-align: center">Registration Page</h5>
    <h6 class="card-subtitle mb-2 text-muted" style="text-align: center">Student Information</h6>
    <form action="RegisterServlet" method="post">
    <div class="mb-3">
    <label for="StudentName" class="form-label">Student Name</label>
    <input name="StudentName" placeholder="Enter your Name" class="form-control" id="StudentName" required>
    
  </div>
        <div class="mb-3">
        <p class="form-label">Choose Your Gender</p>
        <div class="input-group">
            
            <div class="input-group-text" >
      <input class="form-check-input mt-0" type="radio" value="Male" id="Male" name="Gender">
      <label for="Male">Male</label>
  </div>
          
  <div class="input-group-text">
      <input class="form-check-input mt-0" type="radio" value="Female" id="Female" name="Gender">
      <label for="Male">Female</label>
  </div>
   <div class="input-group-text">
      <input class="form-check-input mt-0" type="radio" value="other" id="other" name="Gender">
      <label for="other">Others</label>
  </div>
</div>
        </div>
        <div class="mb-3">
    <label for="Date_of_Birth" class="form-label">Date of Birth</label>
    <input  type="date" name="Date_of_Birth" placeholder="Date_of_Birth" class="form-control" id="Date_of_Birth" required>
    
  </div>
  <div class="mb-3">
    <label for="RollNumber" class="form-label">Roll Number</label>
    <input type="number" name="RollNumber" placeholder="Enter RollNumber" class="form-control" id="RollNumber" required>
  </div>
        <div class="mb-3">
    <label for="RegistrationNumber" class="form-label">Registration Number</label>
    <input name="RegistrationNumber" type="number" placeholder="Enter Registration Number" class="form-control" id="RegistrationNumber" required>
  </div>
    <div class="mb-3">
    <label for="FatherName" class="form-label">Father's Name</label>
    <input name="FatherName" placeholder="Enter your Father's Name" class="form-control" id="FatherName" required>
    
  </div>
        <div class="mb-3">
    <label for="PhoneNumber" class="form-label">Phone Number</label>
    <input name="PhoneNumber" placeholder="Enter your Phone Number" class="form-control" id="PhoneNumber" required>
    
  </div>
        <div class="mb-3">
    <label for="Address" class="form-label">Enter Your Address</label>
    <input name="Address" placeholder="Enter your Address" class="form-control" id="Address" required>
    
  </div>
        <div class="mb-3">
    <label for="Branch" class="form-label">Enter Your Branch</label>
    <input name="Branch" placeholder="Enter your Branch" class="form-control" id="Branch" required>
    
  </div>
        <div style="text-align: center;">    
   <button type="reset" class="btn btn-outline-primary">Reset</button>
   <button type="submit" class="btn btn-outline-primary">Sign In</button>
        </div>

    </form>
    <p style="text-align: center; margin-top: 3%">Already Registered? <a href="LoginPage.jsp" class="card-link">Login</a></p>
  </div>
</div>
    </body>
</html>
