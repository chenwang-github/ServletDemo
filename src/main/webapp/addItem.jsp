<%-- 
    Document   : addItem
    Created on : May 25, 2019, 8:50:38 PM
    Author     : chenwang
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.jdcb.sample.Item"%>
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
            ArrayList<Item> shoppingCart = (ArrayList<Item>)session.getAttribute("shoppingCart");
            if (shoppingCart == null)
            {
                shoppingCart = new ArrayList();
                session.setAttribute("shoppingCart", shoppingCart);
            }
            boolean repeat = false;
            for (Item product:shoppingCart){
                if (product.images.equals(items.images)){
                    product.quantity +=1;
                    repeat = true;
                }
            }
            if(repeat == false){
                shoppingCart.add(items);
            }
            
            
            session.setAttribute("shoppingCart", shoppingCart);
            
            
        %>    
        
        <%
            
            RequestDispatcher rd = request.getRequestDispatcher("EyePalette.jsp");
            rd.include(request, response);
        %>
    </body>
</html>
