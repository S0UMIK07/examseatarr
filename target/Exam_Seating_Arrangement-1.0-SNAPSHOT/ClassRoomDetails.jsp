<%-- 
    Document   : ClassRoomDetails
    Created on : Dec 6, 2023, 10:38:47 AM
    Author     : 91731
--%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.exam_seating_arrangement.entities.ClassRoom"%>
<%@page import="com.mycompany.exam_seating_arrangement.helper.FactoryProvider"%>
<%@page import="com.mycompany.exam_seating_arrangement.Dao.ClassRoomDao"%>
<%@page import="com.mycompany.exam_seating_arrangement.entities.Student"%>
<%
    Student student=(Student)session.getAttribute("current-user");
    if(student==null){
    session.setAttribute("message", "LoginFirst");
    response.sendRedirect("LoginPage.jsp");
    return;
    }else{
    if(student.getType()=="student"){
    session.setAttribute("message","notAllowed");
    response.sendRedirect("LoginPage.jsp");
    return;
    }
    }
    String s1=request.getParameter("id");
    ClassRoomDao classRoomDao =new ClassRoomDao(FactoryProvider.getFactory());
    List<ClassRoom> crs=classRoomDao.getAllClassRoom();
    int temp;
    if(s1==null){
    temp=0;
    }else{
    temp=Integer.parseInt(s1.trim());
    }
    ClassRoom cl1=classRoomDao.getClassRoomByRoomNumber(temp);
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
        <div class="row" style="margin-left: 5px;margin-right: 5px;margin-top: 2px;">
  <div class="col-sm-2">
    <div class="card">
      <div class="card-body">
        <h5 class="card-header">Class Room Number</h5>
        <div class="list-group">
                    <%
                    for(ClassRoom cr:crs)
                    {
                %>
                <a href="ClassRoomDetails.jsp?id=<%=cr.getClassroomNumber()%>" class="list-group-item list-group-item-action">Class Room Number <%=cr.getClassroomNumber()%></a>
                <%   
                    }
                %> 
  
</div>
      </div>
    </div>
  </div>
  <div class="col-sm-5">
    <div class="card">
      <div class="card-body">
        <h5 class="card-header">Class Room Details</h5>
        <%if(cl1!=null){%>
        <p class="card-text"><b>ClassRoom Number:</b> <%=cl1.getClassroomNumber()%></p>
        <p class="card-text"><b>ClassRoom Capacity:</b> <%=cl1.getNumberOfRows()*cl1.getNumberofColumns()%></p>
        <p class="card-text"><b>Exam Date:</b> <%=cl1.getExamDate()%></p>
        <p class="card-text"><b>Exam Duration:</b> <%=cl1.getExamDuration()%></p>
        <p class="card-text"><b>Exam Time:</b> <%=cl1.getExamTime()%></p>
        <p class="card-text"><b>Invigilators Name:</b> <%=cl1.getAssignedInvigilators()%></p>
        <%}%>
      </div>
    </div>
  </div>
            <div class="col-sm-5">
    <div class="card">
        <div class="card-body">
          <h5 class="card-header" style="text-align: center;">Student Details</h5>
        <%if(temp!=0){
          if(cl1.getStudents().isEmpty()){
        %>
        <p class="font-monospace" style="color: #ff3333; text-align: center;">Sorry The Class Room is Empty</p>
        
        <% }else{

            if(cl1.getStudents().size()== (cl1.getNumberofColumns()*cl1.getNumberOfRows())){ %> 
            <p class="font-monospace" style="color: #00ff33; text-align: center;">The ClassRoom is Full</p>
            <% }else{ %>
            <p class="font-monospace" style="color: #ffff33; text-align: center;">The ClassRoom is Partially full</p>
            <% } %>
        
        
        <%}%>
        <div class="card" style="overflow-x: scroll;overflow-y: scroll;  max-height: 450px; max-width: 250px; margin-left: 165px;margin-right: 160px; ">
            <% for(int i=0;i<cl1.getNumberOfRows();i++){
            %> <div style="display: flex">
            <%
            for(int j=0;j<cl1.getNumberofColumns();j++){
            %>
            <img src="img/studenticon.png"  alt="studenticon" style="width: 20px; height:25px ;
      margin: 40px 20px 20px 20px;"/>

            <%
                }
%>
            </div>
            <%
                }
            %>
        </div>
        
        
        
        <%}%>
      </div>
    </div>
  </div>
</div>
    </body>
</html>
