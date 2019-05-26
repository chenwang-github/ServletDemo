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

       
        out.println(first_name);
        out.println(last_name);
        out.println(email);
        out.println(address);
        out.println(city);
        out.println(state);
        out.println(zip);
        out.println(phone);
        out.println(method);
        out.println(cardname);
        out.println(cvv);
        out.println(expmonth);
        out.println(expyear);
        
            
            
    }
}
