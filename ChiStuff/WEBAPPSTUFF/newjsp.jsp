<%-- 
    Document   : newjsp
    Created on : May 25, 2019, 4:50:44 PM
    Author     : ching
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.pa1.Item"%>
<%@ page import=" java.io.IOException"%>
<%@ page import=" java.io.PrintWriter"%>
<%@ page import=" java.sql.Connection"%>
<%@ page import=" java.sql.Driver"%>
<%@ page import=" java.sql.DriverManager"%>
<%@ page import=" java.sql.PreparedStatement"%>
<%@ page import=" java.sql.ResultSet"%>
<%@ page import=" java.sql.SQLException"%>
<%@ page import=" java.sql.Statement"%>
<%@ page import=" javax.servlet.RequestDispatcher"%>
<%@ page import=" javax.servlet.ServletConfig"%>
<%@ page import=" javax.servlet.ServletException"%>
<%@ page import=" javax.servlet.annotation.WebServlet"%>
<%@ page import=" javax.servlet.http.HttpServlet"%>
<%@ page import=" javax.servlet.http.HttpServletRequest"%>
<%@ page import=" javax.servlet.http.HttpServletResponse"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        
        
        <%
            
            String itemn = request.getParameter("itemn");
            String itemi = request.getParameter("itemi");
            itemi = itemi.replace("-","\\");
            int quantity = Integer.parseInt(
                request.getParameter("quantity"));
            int itemp = Integer.parseInt(
                request.getParameter("itemp"));
            Item items = new Item(itemi, itemn, itemp, quantity);

            session = request.getSession();
            ArrayList<Item> shoppingcart = (ArrayList<Item>)session.getAttribute("shoppingcart");
            if (shoppingcart == null)
            {
                shoppingcart = new ArrayList();

                session.setAttribute("ShoppingCart", shoppingcart);
            }
            shoppingcart.add(items);
            RequestDispatcher rd = request.getRequestDispatcher("EyePalette.jsp");
            rd.include(request, response);
        %>    
    </body>
</html>
