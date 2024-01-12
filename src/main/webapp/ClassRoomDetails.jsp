<%-- 
    Document   : ClassRoomDetails
    Created on : Dec 6, 2023, 10:38:47 AM
    Author     : 91731
--%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.LinkedHashMap"%>
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
        <div class="row" style="margin-left: 5px;margin-right: 5px;margin-top: 8px;">
  <div class="col-md-2">
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
  <div class="col-md-5">
    <div class="card">
      <div class="card-body">
        <h5 class="card-header">Class Room Details</h5>
        <%if(cl1!=null){%>
        <div style="margin: 15px 0px 15px 15px;">
        <p class="card-text"><b>ClassRoom Number:</b> <%=cl1.getClassroomNumber()%></p>
        <p class="card-text"><b>ClassRoom Capacity:</b> <%=cl1.getNumberOfRows()*cl1.getNumberofColumns()%></p>
        <p class="card-text"><b>Total Student Present</b> <%=cl1.getStudents().size()%></p>
        <p class="card-text"><b>Exam Date:</b> <%=cl1.getExamDate()%></p>
        <p class="card-text"><b>Exam Duration:</b> <%=cl1.getExamDuration()%></p>
        <p class="card-text"><b>Exam Time:</b> <%=cl1.getExamTime()%></p>
        <p class="card-text"><b>Invigilators Name:</b> <%=cl1.getAssignedInvigilators()%></p>
        </div>
        <%}else{%>
        <div class="card-body">
        <p class="font-monospace" style="color: #0000ff; text-align: center;">Click Room Number For Display The Room Details</p>
        </div>
        <%}%>
        
      </div>
    </div>
  </div>
            <div class="col-md-5">
    <div class="card">
        <div class="card-body">
          <h5 class="card-header" style="text-align: center;">Student Details</h5>
        <%if(temp!=0){
        if(cl1.getStudents().isEmpty()){
        %>
        <p class="font-monospace" style="color: #ff3333; text-align: center;">Sorry The Class Room is Empty</p>
        
        <% }else{

        



List<Student> students=cl1.getStudents();
LinkedHashMap<String, List<Integer>> studentsByBranch = new LinkedHashMap<>();
  for (Student studen : students) {
                String branch = studen.getBranch();
                String rollNumberStr = studen.getRollNumber();
                
                int rollNumber = Integer.parseInt(rollNumberStr);

                // Check if branch exists in map, if not create a new entry
                List<Integer> rollNumbers = studentsByBranch.get(branch);
                if (rollNumbers == null) {
                    rollNumbers = new ArrayList<>();
                    studentsByBranch.put(branch, rollNumbers);
                }

                rollNumbers.add(rollNumber);

                // Sort the roll numbers list for each branch
                Collections.sort(rollNumbers);
            }


Collection<List<Integer>> ListofStudents=studentsByBranch.values();
List<List<Integer>> listOfStudentsAsList = new ArrayList<>(ListofStudents);
List<String> listOfBranches = new ArrayList<>(studentsByBranch.keySet());
List<Integer> firstList=listOfStudentsAsList.get(0);
List<Integer> secondList=null;
if(listOfBranches.size()>1){
secondList=listOfStudentsAsList.get(1);
}else if(listOfStudentsAsList.size()==1){
secondList=new ArrayList<>();
}






            
        
          

if(cl1.getStudents().size()== (cl1.getNumberofColumns()*cl1.getNumberOfRows())){ %> 
            <p class="font-monospace" style="color: #00ff33; text-align: center;">The ClassRoom is Full</p>
            <% }else{ %>
            <p class="font-monospace" style="color:#cc0df6; text-align: center;">The ClassRoom is Partially full</p>
            <% } %>
            <p class="font-monospace" style="color: #0000ff; text-align: center;">There are <%=studentsByBranch.size()%> Branches Present In The Class</p>
        
        
        <div class="card" style="overflow-x: scroll;overflow-y: scroll;  max-height: 450px; max-width: 250px; margin-left: 165px;margin-right: 160px; ">
            <%
            int s=0;
            int t=0;
            int u=0;
for(int i=0;i<cl1.getNumberOfRows();i++){
            %> <div style="display: flex">
            <%
            
            for(int j=0;j<cl1.getNumberofColumns();j++){
            if(((i%2==0)&&(j%2==0)) || ((i%2!=0)&&(j%2!=0))){
            if(s<firstList.size()){
            %>
            <form action="SeeStudentDetails.jsp" method="post">
                <input type="hidden" name="Roll" value="<%=firstList.get(s)%>">
                <input type="hidden" name="Branch" value="<%=listOfBranches.get(0)%>">
                <button type="submit" style="border: none; padding: 2px 2px 2px 2px; background-color: #8780A7"><%=firstList.get(s)%><br><img src="img/studenticon.png"  alt="studenticon" style="width: 20px; height:25px ;
      margin: 2px 20px 2px 12px;"/><br><%=listOfBranches.get(0)%></button>
            </form>
            <%
                s++;
                }else{
                 if(firstList.size()!=0){
            %>
            <button type="submit" style="border: none; padding: 2px 2px 2px 2px; background-color: #8780A7">Null<br><img src="img/studenticon.png"  alt="studenticon" style="width: 20px; height:25px ;
      margin: 2px 20px 2px 12px;"/><br><%=listOfBranches.get(0)%></button>
            
            <%
                }else{
%>
            <button type="submit" style="border: none; padding: 2px 2px 2px 2px; background-color: #8780A7">Null<br><img src="img/studenticon.png"  alt="studenticon" style="width: 20px; height:25px ;
      margin: 2px 20px 2px 12px;"/><br>Null</button>
            
            <%
}
}

            }else{
            if(t<secondList.size()){
            %>
            <form action="SeeStudentDetails.jsp" method="post">
                <input type="hidden" name="Roll" value="<%=secondList.get(t)%>">
                <input type="hidden" name="Branch" value="<%=listOfBranches.get(1)%>">
                <button type="submit" style="border: none; padding: 2px 2px 2px 2px; background-color: #B7B4C8"><%=secondList.get(t)%><br><img src="img/studenticon.png"  alt="studenticon" style="width: 20px; height:25px ;
      margin: 2px 20px 2px 12px;"/><br><%=listOfBranches.get(1)%></button>
            </form>
            <%
                t++;
                }else{
                 if(secondList.size()!=0){
            %>
            <button type="submit" style="border: none; padding: 2px 2px 2px 2px; background-color: #B7B4C8">Null<br><img src="img/studenticon.png"  alt="studenticon" style="width: 20px; height:25px ;
      margin: 2px 20px 2px 12px;"/><br><%=listOfBranches.get(1)%></button>
            
            <%
                }else{
%>
            <button type="submit" style="border: none; padding: 2px 2px 2px 2px; background-color: #B7B4C8">Null<br><img src="img/studenticon.png"  alt="studenticon" style="width: 20px; height:25px ;
      margin: 2px 20px 2px 12px;"/><br>Null</button>
            
            <%
}
}

}
if(s+t>=cl1.getStudents().size()){
break;
}
}
%>
            </div>
            <%
                if(s+t>=cl1.getStudents().size()){
break;
}
                }
            %>
        </div>
        
        
        
        <%}}else{%>
        <div class="card-body">
        <p class="font-monospace" style="color: #0000ff; text-align: center;">Click Room Number For Display The Student Arrangement</p>
        </div>
        <%}%>
      </div>
    </div>
  </div>
</div>
    </body>
</html>
