/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jdcb.sample;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author chenwang
 */
@WebServlet(name = "display_eyeproduct", urlPatterns = {"/display_eyeproduct"})
public class display_eyeproduct extends HttpServlet {

    
    
    @Override
    public void init(ServletConfig config) throws ServletException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        Connection conn = null;
        Statement stmt = null;
        response.setContentType("text/html");
        
        try {            
            PrintWriter out = response.getWriter();
            try {
                // not a good practiceto include username and password in code
                conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:8889/TeaShopDB", "root", "root");              
                stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM users");

                    out.println("<!doctype html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("    <meta charset=\"UTF-8\">");
                    out.println("    <title>Products</title>");
                    //out.println("    <link rel = \"stylesheet\" type = \"text.css\" href = \"style.css\">");
                    out.println("</head>");
                    out.println("<body>");
                    while (rs.next()) {
                        out.print("<p> name : "+ rs.getString("username") + " | email : "+ rs.getString("email")+"</p>");
                    }
                    out.println("</body>");
                    out.println("</html>");

                RequestDispatcher rd=request.getRequestDispatcher("/index.html");
                rd.include(request, response);
            } catch (Exception e) {
                response.sendError(500);
            } finally {
                if (stmt != null)
                    stmt.close();
                if (conn != null)
                    conn.close();
            }
            
        } catch (SQLException e) {
            response.sendError(500);
        }
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
