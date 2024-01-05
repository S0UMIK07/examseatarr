<%-- 
    Document   : SeeStudentDetails
    Created on : Jan 3, 2024, 8:03:51 PM
    Author     : 91731
--%>
<%@page import="com.mycompany.exam_seating_arrangement.helper.FactoryProvider"%>
<%@page import="com.mycompany.exam_seating_arrangement.Dao.StudentDao"%>
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
    String Branch=request.getParameter("Branch");
    String Roll=request.getParameter("Roll");
    StudentDao dao=new StudentDao(FactoryProvider.getFactory());
    Student student=dao.getStudentByBranchAndRoll(Branch, Roll);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/common_css_js.jsp" %>
<%@include file="components/navbar.jsp" %>
<%@include file="components/msg.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        

<style>
.customcard {
    margin-top: 75px;
    margin-left: 36%;
    margin-right: 30%;
  position: relative;
  width: 400px;
  height: 500px;
  border-radius: 14px;
  z-index: 1111;
  overflow: hidden;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  box-shadow: 20px 20px 60px #bebebe, -20px -20px 60px #ffffff;
}

.bg {
  position: absolute;
  top: 5px;
  left: 5px;
  width: 390px;
  height: 490px;
  z-index: 2;
  background: rgba(255, 255, 255, .95);
  backdrop-filter: blur(24px);
  border-radius: 10px;
  overflow: hidden;
  outline: 2px solid white;
}

.blob {
  position: absolute;
  z-index: 1;
  top: 50%;
  left: 50%;
  width: 300px;
  height: 300px;
  border-radius: 50%;
  background-color: #ff0000;
  opacity: 5;
  filter: blur(12px);
  animation: blob-bounce 4s infinite ease;
}

@keyframes blob-bounce {
  0% {
    transform: translate(-100%, -100%) translate3d(0, 0, 0);
  }

  25% {
    transform: translate(-100%, -100%) translate3d(100%, 0, 0);
  }

  50% {
    transform: translate(-100%, -100%) translate3d(100%, 100%, 0);
  }

  75% {
    transform: translate(-100%, -100%) translate3d(0, 100%, 0);
  }

  100% {
    transform: translate(-100%, -100%) translate3d(0, 0, 0);
  }
}
</style>

    </head>
    <body>
        <div class="customcard">
            <div class="bg">
                <div class="card">
                    <div class="card-header" style="text-align: center"><h5><b>Student Details</b></h5></div>
                </div>
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
      
                </div>
            </div>
  <div class="blob"></div>
</div>
    </body>
</html>
