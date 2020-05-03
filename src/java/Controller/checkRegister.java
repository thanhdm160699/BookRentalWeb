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
public class checkRegister extends HttpServlet {

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
            out.println("<title>Servlet checkRegister</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet checkRegister at " + request.getContextPath() + "</h1>");
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
        String password = request.getParameter("password");
        String repeatpassword = request.getParameter("repeatpassword");
        if (!password.equals(repeatpassword)) {
            pw.println("<script type=\"text/javascript\">");
            pw.println("alert('Your password does not match');");
            pw.println("</script>");
            RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
            rd.include(request, response);
        } else {
            String fullname = request.getParameter("fullname");
            String username = request.getParameter("username");
            String sex = request.getParameter("sex");
            String phone = request.getParameter("phone");
            String identityCard = request.getParameter("identityCard");
            String mail = request.getParameter("mail");
            String dob = request.getParameter("bday");
            String address = request.getParameter("address");
            UserLib user;
            if (sex.equals("female")) {
                user = new UserLib(identityCard, username, password, mail, fullname, phone, address, "1", "0", dob, null);
                
            } else {
                user = new UserLib(identityCard, username, password, mail, fullname, phone, address, "1", "1", dob, null);
            }
            try {
                // check user
                if (!user.checkUser().equals("true")) {
                    pw.println("<script type=\"text/javascript\">");
                    pw.println("alert('Your " + user.checkUser() + " is not valid');");
                    pw.println("</script>");
                    RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
                    rd.include(request, response);
                } else {    
                    user.checkSignUp(user);
                    HttpSession s= request.getSession();
                    s.setAttribute("user", user);  
                    RequestDispatcher rd = request.getRequestDispatcher("welcome.jsp");
                    rd.forward(request, response);
                }
            } catch (SQLException ex) {
                Logger.getLogger(checkRegister.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(checkRegister.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
