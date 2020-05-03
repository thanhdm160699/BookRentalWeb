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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PC
 */
@WebServlet(name = "EditStatus", urlPatterns = {"/EditStatus"})
public class EditStatus extends HttpServlet {

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
            out.println("<title>Servlet EditStatus</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditStatus at " + request.getContextPath() + "</h1>");
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
        String page = request.getParameter("page");
        String username = request.getParameter("username");
        HttpSession s = request.getSession();
        if (page.equals("before")) {
            UserLib userEdit = new UserLib();
            try {
                s.setAttribute("userEdit", userEdit.getUserLib(username));
                RequestDispatcher rd = request.getRequestDispatcher("editStatus.jsp");
                rd.forward(request, response);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

//        if (page.equals("after")) {
//            String status = request.getParameter("status");
//            UserLib userEdit = (UserLib) request.getAttribute("userEdit");
//            userEdit.setStatus(status);
//            try {
//                userEdit.UpdateStatus();
//            } catch (Exception ex) {
//                ex.printStackTrace();
//            }
//            RequestDispatcher rd = request.getRequestDispatcher("listUserAdmin.jsp");
//            rd.forward(request, response);
//        }
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
            String status = request.getParameter("status");
            HttpSession s = request.getSession();
            UserLib userEdit = (UserLib)s.getAttribute("userEdit");
            try {
                userEdit.UpdateStatus(status);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            RequestDispatcher rd = request.getRequestDispatcher("listUserAdmin.jsp");
            rd.forward(request, response);
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
