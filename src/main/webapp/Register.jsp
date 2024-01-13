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
<style>
   
    .btn-color {
  background-color: #0e1c36;
  color: #fff;
}
.btn-color:hover{
    background-color: white;
    color:#333;
}

.profile-image-pic {
  height: 120px;
  width: 120px;
  object-fit: cover;
}

.card-body-color {
  background-color: #ebf2fa;
}

a {
  text-decoration: none;
}



.cardbody-color {
  background-color: #ebf2fa;
}

.form-label {
  text-align: left;
}

.form-control {
  margin-bottom: 15px;
}

.input-group-text {
  width: 90px}
.btn-sign-in {
        margin-right: 10px; 
    }


@media (max-width: 276px) {
  .input-group-text {
    width: 50%;
  }
}
</style>
    </head>
    <body>
        
<div class="container">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            
            <div class="card my-4">
                <form class="card-body cardbody-color p-lg-5" action="RegisterServlet" method="post">

                    <div class="text-center">
                        <img src="img/studenticon.png"
                            class="img-fluid profile-image-pic img-thumbnail rounded-circle my-3" 
                            alt="Profile Image">
                        <h2 class="text-center text-dark">Registration Form</h2>
                    </div>

                    <div class="mb-3">
                        <label for="StudentName" class="form-label">Student Name</label>
                        <input type="text" class="form-control" id="StudentName" placeholder="Enter Your Name" required>
                    </div>

                   <div class="mb-3">
    <label class="form-label d-block">Choose Your Gender</label>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" value="Male" id="Male" name="Gender">
        <label class="form-check-label" for="Male">Male</label>
    </div>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" value="Female" id="Female" name="Gender">
        <label class="form-check-label" for="Female">Female</label>
    </div>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" value="other" id="other" name="Gender">
        <label class="form-check-label" for="other">Others</label>
    </div>
</div>

                    <div class="mb-3">
                        <label for="Date_of_Birth" class="form-label">Date of Birth</label>
                        <input type="date" class="form-control" id="Date_of_Birth" required>
                    </div>

                    <div class="mb-3">
                        <label for="RollNumber" class="form-label ">Roll Number</label>
                        <input type="number" class="form-control" id="RollNumber" placeholder="Enter Roll Number" required>
                    </div>

                    <div class="mb-3">
                        <label for="RegistrationNumber" class="form-label ">Registration Number</label>
                        <input type="number" class="form-control" id="RegistrationNumber" placeholder="Enter Registration Number" required>
                    </div>

                    <div class="mb-3">
                        <label for="FatherName" class="form-label">Father's Name</label>
                        <input type="text" class="form-control" id="FatherName" placeholder="Enter Father's Name" required>
                    </div>

                    <div class="mb-3">
                        <label for="PhoneNumber" class="form-label">Phone Number</label>
                        <input type="tel" class="form-control" id="PhoneNumber" placeholder="Enter Phone Number" required>
                    </div>

                    <div class="mb-3">
                        <label for="Address" class="form-label">Address</label>
                        <input type="text" class="form-control" id="Address" placeholder="Enter Address" required>
                    </div>

                    <div class="mb-3">
                        <label for="Branch" class="form-label">Branch</label>
                        <input type="text" class="form-control" id="Branch" placeholder="Enter Branch" required>
                    </div>
                    <br>
                    <div class="d-flex justify-content-center">
                        <button type="reset" class="btn btn-color px-5 mb-3" style="margin-right: 10px;">Reset</button>
                        <button type="submit" class="btn btn-color px-5 mb-3" style="margin-left: 10px;">Sign In</button>
                    </div>
  <div id="emailHelp" class="form-text text-center mb-5 text-dark">Already
              Registered? <a href="LoginPage.jsp" class="text-dark fw-bold">Login</a>
            </div>
                </form>
              

            </div>
        </div>
    </div>
</div>

    </body>
</html>