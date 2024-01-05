<%-- 
    Document   : Admin
    Created on : Dec 5, 2023, 10:30:31 PM
    Author     : 91731
--%>
<%@page import="com.mycompany.exam_seating_arrangement.entities.ClassRoom"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.exam_seating_arrangement.Dao.ClassRoomDao"%>
<%@page import="com.mycompany.exam_seating_arrangement.helper.FactoryProvider"%>
<%@page import="com.mycompany.exam_seating_arrangement.entities.Student"%>
<%
    Student s4=(Student)session.getAttribute("current-user");
    if(s4==null){
    session.setAttribute("message", "LoginFirst");
    response.sendRedirect("LoginPage.jsp");
    return;
    }else{
    String s2=s4.getType();
    if(s2.trim().equals("student")){
    session.setAttribute("message","notAllowed");
    response.sendRedirect("index.jsp");
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
        <%@include file="components/customCss.jsp" %>
        <%@include file="components/navbar.jsp" %>
        <%@include file="components/msg.jsp" %>
    </head>
    <body>
        
        <div class="row" style="margin-top: 50px; margin-right: 25px; margin-left: 25px;">
  <div class="col-sm-4">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">Add Student Details</h5>
        <p class="card-text">Here we modify or allot the room to the students </p>
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#SelectRoom">
  Modify
</button>
      </div>
    </div>
  </div>
  <div class="col-sm-4">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">Add Room Details</h5>
        <p class="card-text">Here we Add Room details </p>
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#AddroomDetails">
  Add Details
</button>
      </div>
    </div>
  </div>
            <div class="col-sm-4">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">See Room Details</h5>
        <p class="card-text">Here we can See ALl Room details and How many Students are there in this room </p>
        <a href="ClassRoomDetails.jsp" class="btn btn-primary">See Details</a>
      </div>
    </div>
  </div>
</div>
        
        
        
        
        
       

<!-- Modal -->
<div class="modal fade" id="AddroomDetails" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Room Details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
        <form action="AddRoomDetails" method="post">
      <div class="modal-body">
        <div class="mb-3">
    <label for="norows" class="form-label">Enter The Number of Rows of The Class</label>
    <input type="number" name="norows" placeholder="Enter The Number" class="form-control" id="norows" required>
    
  </div>
          <div class="mb-3">
    <label for="nocolumns" class="form-label">Enter The Number of Columns of The Class</label>
    <input  type="number" name="nocolumns" placeholder="Enter the Number" class="form-control" id="nocolumns" required>
    
  </div>
        <div class="mb-3">
    <label for="examduration" class="form-label">Enter The Exam Duration</label>
    <input name="examduration" placeholder="Enter the Duration" class="form-control" id="examduration" required>
    
  </div>
          <div class="mb-3">
    <label for="ExamDate" class="form-label">Enter The Exam Date</label>
    <input  type="date" name="ExamDate" class="form-control" id="ExamDate" required>
    
  </div>
       <div class="mb-3">
    <label for="examtime" class="form-label">Enter The Exam Time</label>
    <input type="time" name="examtime" placeholder="Enter the Exam Time" class="form-control" id="examtime" required>
    
  </div>
          <div class="mb-3">
    <label for="assignedInvigilators" class="form-label">Enter The Invigilators Name</label>
    <input name="assignedInvigilators" placeholder="Enter the Name" class="form-control" id="assignedInvigilators" required>
    
  </div>
      </div>
      <div class="modal-footer">
          <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save changes</button>
      </div>
        </form>
    </div>
  </div>
</div> 
        







<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="SelectRoom" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Select Room Number</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
        <div class="modal-body" style="text-align:center">
        <%
            ClassRoomDao classRoomDao =new ClassRoomDao(FactoryProvider.getFactory());
            List<ClassRoom> crs=classRoomDao.getAllClassRoom();
            int i=0;
            for(ClassRoom cl:crs){
        %>
        
        <form method="post" action="AssignStudents.jsp">
            <input type="hidden" value="<%=cl.getClassroomNumber()%>" name="Roomnumber">
            <button class="cshover" type="submit"><%=cl.getClassroomNumber()%></button>
        </form>
        <%
            }
        %>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
       
        
        
        
    </body>
</html>
