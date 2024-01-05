<%-- 
    Document   : AssignStudents
    Created on : Dec 26, 2023, 9:28:12 PM
    Author     : 91731
--%>

<%@page import="java.util.List"%>
<%@page import="com.mycompany.exam_seating_arrangement.Dao.StudentDao"%>
<%@page import="com.mycompany.exam_seating_arrangement.entities.ClassRoom"%>
<%@page import="com.mycompany.exam_seating_arrangement.helper.FactoryProvider"%>
<%@page import="com.mycompany.exam_seating_arrangement.Dao.ClassRoomDao"%>
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
 <%@include file="components/common_css_js.jsp" %>
 <%@include file="components/customCss.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
           
           @keyframes typing {
  from {
    width: 0;
  }
}

@keyframes blink-caret {
  50% {
    border-color: transparent;
  }
}
/* When you change the amount of characters in the h1, you have to change 
the with: 14ch and  steps(14, end), if there is 14 characters, put 14, 
if there is 20 put 20 */
.animation {
    text-align: center;
  font: bold 200% Consolas, Monaco, monospace;
  border-right: .1em solid black;
  width: 22ch;
  margin: 4em auto;
  white-space: nowrap;
  overflow: hidden;
  -webkit-animation: typing 3s steps(22, end),
	           blink-caret .5s step-end infinite alternate;
}


        </style>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <%@include file="components/msg.jsp" %>
        <%
            int Rnum=Integer.parseInt(request.getParameter("Roomnumber"));
            ClassRoomDao classRoomDao=new ClassRoomDao(FactoryProvider.getFactory());
            ClassRoom classRoom=classRoomDao.getClassRoomByRoomNumber(Rnum);
            if(classRoom.getStudents().size()==(classRoom.getNumberOfRows()*classRoom.getNumberofColumns())){
            %>
            <div class="animation">The ClassRoom is Full</div>
            <br>
            
            <%
            }else{
        %>
        
        <div class="row" style="margin-top: 100px; text-align: center">
            <div class="col" style="margin-left: 35%;margin-right: 30%;">
                <div class="card" style="width: 400px;height: 300px;border-radius: 50px;background: #e0e0e0;box-shadow: 20px 20px 60px #bebebe,-20px -20px 60px #ffffff; text-align: center; margin-right: 30px; margin-left: 40px;">
                    <h4 style="margin-top: 20px">Select Branch for Room</h4>
                    <hr>
                    <div class="card-body">
                        
                        
                        
                        <div class="dropdown" style="margin-top: 20px">
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
    Select branch 
  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
      <%
          StudentDao studentDao=new StudentDao(FactoryProvider.getFactory());
          List<String> branch= studentDao.getAllBranch();
          for(String bra: branch){
      %>
      <li><button type="button" class="dropdown-item" data-bs-toggle="modal" data-bs-target="#exampleModal<%=bra%>"><%=bra%></button>
      
    
      
      </li> 
      
    <% } %>
  </ul>
  <%
      for(String bra: branch){
  %>
  
  <div class="modal fade" id="exampleModal<%=bra%>" tabindex="-1" aria-labelledby="exampleModalLabel<%=bra%>" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
        <form action="AssignStudentsServlet" method="post">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel<%=bra%>">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <div class="card">
              <div class="card-header">
                  <%
                      List<Student> lis=studentDao.getAllStudentByBranch(bra);
                      int n=0;
                      for(Student s:lis){
                      if(s.getClassRoom()==null){
                      n++;
                      }
                      }
                  %>
                  <h6>There are total <b><%=lis.size()%></b> Students in <b><%=bra%></b><br>There are <b><%=n%></b> Students who are not assigned any ClassRoom</h6>
              </div>
              <div class="card-body">
                  <h6>Enter Number of Students you want to assign</h6>
                  <div class="inputGroup">
                      <input type="number" autocomplete="off" name="inputNumber" required>
                      <input type="hidden" name="Branch" value="<%=bra%>">
                      <input type="hidden" name="RoomNumber" value="<%=Rnum%>">
    <label for="name">Enter the Number</label>
    
</div>
              </div>
          </div>
      </div>
      <div class="modal-footer">
          <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">Clear</button>
           <button type="submit" class="btn btn-primary">Save changes</button>
        
      </div>
        </form>
    </div>
  </div>
</div>
  <%}%>
</div>
  
  
  
                    </div>
                </div>
                
            </div>
            
        </div>
        
        <% } %>
    </body>
</html>
