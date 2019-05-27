/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jdcb.sample;

import java.io.IOException;
import java.util.ArrayList;
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
import javax.servlet.http.HttpSession;

@WebServlet(name = "order", urlPatterns = {"/order"})
public class order extends HttpServlet {

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
        //empty
    }
    

    // DID NOT USE
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String zip = request.getParameter("zip");
        String phone = request.getParameter("phone");
        String method = request.getParameter("method");
        String cardname = request.getParameter("cardname");
        String cvv = request.getParameter("cvv");
        String expmonth = request.getParameter("expmonth");
        String expyear = request.getParameter("expyear");

//        out.println(first_name);
//            out.println(last_name);
//            out.println(email);
//            out.println(address);
//            out.println(city);
//            out.println(state);
//            out.println(zip);
//            out.println(phone);
//            out.println(method);
//            out.println(cardname);
//            out.println(cvv);
//            out.println(expmonth);
//            out.println(expyear);
//            out.println("-----------------");
       

        
        
        
        HttpSession session = request.getSession();
        ArrayList<Item> shoppingCart = (ArrayList<Item>)session.getAttribute("shoppingCart");
        for(int i = 0; i<shoppingCart.size();i++){
//            out.println(first_name);
//            out.println(last_name);
//            out.println(email);
//            out.println(address);
//            out.println(city);
//            out.println(state);
//            out.println(zip);
//            out.println(phone);
//            out.println(method);
//            out.println(cardname);
//            out.println(cvv);
//            out.println(expmonth);
//            out.println(expyear);
//            out.println("-----------------");
//                    
//                   out.println("<h1>--------------------------------------</h>");
//                    out.println("<h3> name: "+shoppingCart.get(i).name+"</h3>");
//                    out.println("<h3> img: "+shoppingCart.get(i).images+"</h3>");
//                    out.println("<h3> price "+shoppingCart.get(i).price+"</h3>");
//                   out.println("<h3> quantity "+shoppingCart.get(i).quantity+"</h3>");
            try {
                Connection conn = null;
                PreparedStatement preparedStatement = null;
                try {   
                    conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:8889/test", "root", "root");

                    preparedStatement = conn.prepareStatement("INSERT INTO orders(first_name,last_name,"
                            + "email,address,city,state,zip,phone,method,"
                            + "cardname,cvv,expmonth,expyear,itemn,itemq) "
                            + "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

                    preparedStatement.setString(1, first_name);
                    preparedStatement.setString(2, last_name);
                    preparedStatement.setString(3, email);
                    preparedStatement.setString(4, address);
                    preparedStatement.setString(5, city);
                    preparedStatement.setString(6, state);
                    preparedStatement.setString(7, zip);
                    preparedStatement.setString(8, phone);
                    preparedStatement.setString(9, method);
                    preparedStatement.setString(10, cardname);
                    preparedStatement.setString(11, cvv);
                    preparedStatement.setString(12, expmonth);
                    preparedStatement.setString(13, expyear);
                    preparedStatement.setString(14, shoppingCart.get(i).name);
                    preparedStatement.setString(15, String.valueOf(shoppingCart.get(i).quantity));

                   
                    preparedStatement.executeUpdate();

//                    response.sendRedirect("connect");
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
//
            } catch (SQLException e) {
                // do NOT send confidential information here
                response.sendError(500);
            }
        }
        String nextJSP = "/detailPage.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(nextJSP);
        dispatcher.forward(request,response);
            
    }
}
