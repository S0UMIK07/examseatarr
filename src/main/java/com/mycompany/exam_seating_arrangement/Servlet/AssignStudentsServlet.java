/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.exam_seating_arrangement.Servlet;

import com.mycompany.exam_seating_arrangement.Dao.ClassRoomDao;
import com.mycompany.exam_seating_arrangement.Dao.StudentDao;
import com.mycompany.exam_seating_arrangement.entities.ClassRoom;
import com.mycompany.exam_seating_arrangement.entities.Student;
import com.mycompany.exam_seating_arrangement.helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author 91731
 */
public class AssignStudentsServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int inputNum=Integer.parseInt(request.getParameter("inputNumber"));
            String Branch=request.getParameter("Branch");
            int Roomnumber=Integer.parseInt(request.getParameter("RoomNumber"));
            ClassRoomDao classRoomDao=new ClassRoomDao(FactoryProvider.getFactory());
            StudentDao dao=new StudentDao(FactoryProvider.getFactory());
            ClassRoom classRoom=classRoomDao.getClassRoomByRoomNumber(Roomnumber);
            List<Student> student=classRoom.getStudents();
            List<String> Branches = new ArrayList<>();
            for(Student student1:student){
                if(Branches.isEmpty()){
                    Branches.add(student1.getBranch());
                }else{
                    int s=0;
                    for(String bra:Branches){
                        if(bra.equals(student1.getBranch())){
                            s++;
                        }
                    }
                    if(s==0){
                        Branches.add(student1.getBranch());
                    }
                }
            }
            int t=0;
            int k=0;
            if(Branches.size()==2){
                for(String Bra:Branches){
                    if(!Bra.equals(Branch)){
                        t++;
                    }
                }
            }
            List<Student> ls=dao.getAllStudentByBranchAndRoomNumber(Branch,Roomnumber);
            if (ls == null) {
                ls = new ArrayList<>();
            }
            if(ls.isEmpty()){
                if(((classRoom.getNumberOfRows()*classRoom.getNumberofColumns())/2)<(inputNum)){
                    k++;
                }
            }else{
            if(((classRoom.getNumberOfRows()*classRoom.getNumberofColumns())/2)<(inputNum+ls.size())){
                k++;
            }
            }
            
            
            List<Student> stu=dao.getAllStudentByBranchWhereRoomIsNotAlloted(Branch);
            HttpSession session=request.getSession();
            if(t==2){
                session.setAttribute("message", "notAdd");
            }else if(k!=0 || inputNum<=0 || inputNum>((classRoom.getNumberOfRows()*classRoom.getNumberofColumns())-(classRoom.getStudents().size())) || inputNum>stu.size()){
                
                session.setAttribute("message", "WrongInput");
                
            }else{
                
                int res=dao.assignStudentsRoomNumber(inputNum, Roomnumber, Branch);
                session.setAttribute("message", "AssignSuccess");
                
            }
            response.sendRedirect("AssignStudents.jsp?Roomnumber="+Roomnumber);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
