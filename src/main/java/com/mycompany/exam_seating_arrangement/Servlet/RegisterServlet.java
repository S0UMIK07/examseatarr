/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.exam_seating_arrangement.Servlet;

import com.mycompany.exam_seating_arrangement.Dao.StudentDao;
import com.mycompany.exam_seating_arrangement.entities.Student;
import com.mycompany.exam_seating_arrangement.helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;


/**
 *
 * @author 91731
 */
public class RegisterServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            String Name=request.getParameter("StudentName");
            String Gende=request.getParameter("Gender");
            String Dob=request.getParameter("Date_of_Birth");
            String Roll=request.getParameter("RollNumber");
            String RegNumber=request.getParameter("RegistrationNumber");
            String Father_Name=request.getParameter("FatherName");
            String PhoneNumber=request.getParameter("PhoneNumber");
            String address=request.getParameter("Address");
            String branch=request.getParameter("Branch");
            StudentDao studentDao = new StudentDao(FactoryProvider.getFactory());
            Student s=studentDao.loginStudent(Name, Roll);
            HttpSession session=request.getSession();
            if(s==null){
                Student student=new Student(Name, Gende, Dob, Roll,RegNumber, Father_Name, PhoneNumber, address, branch, "student", null);
                int t=0;
                t=studentDao.StudentNewRegister(student);
                if(t!=0){
                    session.setAttribute("message", "SuccessRegister");
                }else{
                    session.setAttribute("message", "WentWrong");
                }
                
            }else{
               session.setAttribute("message", "Registered");
            }
            response.sendRedirect("Register.jsp");
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
