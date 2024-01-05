<%-- 
    Document   : StudentHome
    Created on : Dec 5, 2023, 7:32:49 PM
    Author     : 91731
--%>
<%@page import="com.mycompany.exam_seating_arrangement.entities.Student"%>
<%
    Student student=(Student)session.getAttribute("current-user");
    if(student==null){
    session.setAttribute("message", "LoginFirst");
    response.sendRedirect("LoginPage.jsp");
    return;
    }else{
    if(student.getType()=="admin"){
    session.setAttribute("message","Denied");
    response.sendRedirect("LoginPage.jsp");
    return;
    }
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
        <div class="row">
         <div class="col-sm-7">
        <div class="card" style="margin-top: 10px;margin-right:100px;margin-left: 100px;">
            <h5 class="card-header" style="text-align: center;">Student Details</h5>
  <div class="card-body">
      <p class="card-text"><b>Student Name:</b>&nbsp;&nbsp;<%=student.getStudentName()%></p>
      <p class="card-text"><b>Student Roll Number:</b>&nbsp;&nbsp;<%=student.getRollNumber()%></p>
      <p class="card-text"><b>Student Registration Number:</b>&nbsp;&nbsp;<%=student.getRegistrationNumber()%></p>
      <p class="card-text"><b>Student Branch:</b>&nbsp;&nbsp;<%=student.getBranch()%></p>
      <p class="card-text"><b>Student Contact Number:</b>&nbsp;&nbsp;<%=student.getContactNumber()%></p>
      <p class="card-text"><b>Student Date of Birth:</b>&nbsp;&nbsp;<%=student.getDOB()%></p>
      <p class="card-text"><b>Student Gender:</b>&nbsp;&nbsp;<%=student.getGender()%></p>
      <p class="card-text"><b>Student Father's Name:</b>&nbsp;&nbsp;<%=student.getFatherName()%></p>
      <p class="card-text"><b>Student Address:</b>&nbsp;&nbsp;<%=student.getAddress()%></p>
      <%
          if(student.getClassRoom()==null){
      %>
      <p class="font-monospace" style="color: #ff3333">Sorry Till now you have not alloted any classroom</p>
      <%
          }else{
      %>
      <p class="font-monospace" style="color: #33cc00">The ClassRoom is Alloted</p>
      <%
          }
      %>
    <a href="LogoutServlet" class="btn btn-primary">Log Out</a>
  </div>
</div>
         </div>
    <div class="col-sm-5">
        <div class="card" style="margin-top: 10px;margin-right:100px;">
            <h5 class="card-header" style="text-align: center;">ClassRoom Details</h5>
  <div class="card-body">
      <%
          if(student.getClassRoom()==null){
      %>
      <p class="font-monospace" style="color: #ff3333">Sorry Till now you have not alloted any classroom</p>
      <%
          }else{
      %>
      <p class="card-text"><b>ClassRoom Number:</b>&nbsp;&nbsp;<%=student.getClassRoom().getClassroomNumber()%></p>
      <p class="card-text"><b>Exam Time:</b>&nbsp;&nbsp;<%=student.getClassRoom().getExamTime()%></p>
      <p class="card-text"><b>Exam duration:</b>&nbsp;&nbsp;<%=student.getClassRoom().getExamDuration()%></p>
      <p class="card-text"><b>Exam date</b>&nbsp;&nbsp;<%=student.getClassRoom().getExamDate()%></p>
      <p class="card-text"><b>Invigilator name:</b>&nbsp;&nbsp;<%=student.getClassRoom().getAssignedInvigilators()%></p>      
      <%
          }
      %>
  </div>
</div>
         </div>
        </div>
    </body>
</html>
