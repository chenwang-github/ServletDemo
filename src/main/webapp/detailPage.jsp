<%-- 
    Document   : detailPage
    Created on : May 26, 2019, 4:46:39 PM
    Author     : chenwang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.jdcb.sample.Item"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%        
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
            out.println("-----------------");
            


        ArrayList<Item> shoppingCart = (ArrayList<Item>)session.getAttribute("shoppingCart");
        for(int i = 0; i<shoppingCart.size();i++){
             out.println("<h3> name: "+shoppingCart.get(i).name+"</h3>");
             out.println("<h3> quantity "+shoppingCart.get(i).quantity+"</h3>");
        }
        %>
        
    </body>
</html>
