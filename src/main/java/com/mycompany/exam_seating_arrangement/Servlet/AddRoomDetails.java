/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.exam_seating_arrangement.Servlet;

import com.mycompany.exam_seating_arrangement.Dao.ClassRoomDao;
import com.mycompany.exam_seating_arrangement.entities.ClassRoom;
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
public class AddRoomDetails extends HttpServlet {

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
            int RowNumber=Integer.parseInt(request.getParameter("norows"));
            int ColumnNumber=Integer.parseInt(request.getParameter("nocolumns"));
            String Duration=request.getParameter("examduration");
            String Date=request.getParameter("ExamDate");
            String Time=request.getParameter("examtime");
            String Invigilator=request.getParameter("assignedInvigilators");
            ClassRoom classRoom=new ClassRoom(RowNumber, ColumnNumber, Duration, Date, Time, Invigilator, null);
            ClassRoomDao classRoomDao= new ClassRoomDao(FactoryProvider.getFactory());
            int t= classRoomDao.NewClassRoomRegister(classRoom);
            HttpSession session = request.getSession();
            if(t==0){
                session.setAttribute("message", "WentWrong");
            }else{
                session.setAttribute("message","ClassRoomAdded");
            }
            response.sendRedirect("Admin.jsp");
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
