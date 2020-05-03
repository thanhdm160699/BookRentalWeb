/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.UserLib;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PC
 */
public class changePass extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet changePass</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet changePass at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        String oldpass = request.getParameter("oldpass");
        String newpass = request.getParameter("newpass");
        String repass = request.getParameter("repass");
        HttpSession s = request.getSession();
        UserLib u = (UserLib) s.getAttribute("user");
        if (u.getPassword().equals(oldpass)) {
            if (newpass.equals(repass)) {
                //tao mot message luu vao trong request de hien thi ra trang jsp
                UserLib us = new UserLib(u.getUsername(), newpass);
                try {
                    us.changePass();
                    s.setAttribute("user", u.getUserLib(u.getUsername()));
                    s.getAttribute("user");
                    UserLib uset =  (UserLib)s.getAttribute("user");
                    System.out.println(uset.getUsername());
                    //RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                    // rd.forward(request, response);
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            } else {
                // newpass khong giong voi repass

            }
        } else {
            // dung message de hien thi mat khau cu khong dung
        }
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
