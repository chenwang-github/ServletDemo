/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jdcb.sample;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Driver;
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

@WebServlet(name = "ConnectDBServlet", urlPatterns = {"/connect"})
public class ConnectDBServlet extends HttpServlet {

    @Override
    public void init(ServletConfig config) throws ServletException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // DID NOT USE
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
                conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:8889/", "root", "root");              
                stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM users");
                while (rs.next()) {
                    out.println(" | name : " + rs.getString("username")
                            + " | email : " + rs.getString("email")
                    );
                    out.println("<br>");
                }
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

    // DID NOT USE
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        

        try {
            Connection conn = null;
            PreparedStatement preparedStatement = null;
            try {
                String username = request.getParameter("username");
                String email = request.getParameter("email");
                
                conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:8889/TeaShopDB", "root", "root");
    
                preparedStatement = conn.prepareStatement("INSERT INTO users(username, email) VALUES(?,?)");
                preparedStatement.setString(1, username);
                preparedStatement.setString(2, email);
                preparedStatement.executeUpdate();
                
                response.sendRedirect("connect");
            } catch (Exception e) {
                response.sendError(500);
            } finally {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (conn != null) {
                    conn.close();
                }
            }
            
        } catch (SQLException e) {
            // do NOT send confidential information here
            response.sendError(500);
        }
    }
}
