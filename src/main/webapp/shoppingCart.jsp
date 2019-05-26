<%-- 
    Document   : result
    Created on : May 25, 2019, 9:08:25 PM
    Author     : chenwang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.jdcb.sample.Item"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ArrayList<Item> shoppingCart = (ArrayList<Item>)session.getAttribute("shoppingCart");
            if (shoppingCart == null)
            {
                out.println("<h1>shopping car shouldn't be empty</h>");
            }else{
                for(int i = 0; i<shoppingCart.size();i++){
                    out.println("<h1>--------------------------------------</h>");
                    out.println("<h3> name: "+shoppingCart.get(i).name+"</h3>");
                    out.println("<h3> img: "+shoppingCart.get(i).images+"</h3>");
                    out.println("<h3> price "+shoppingCart.get(i).price+"</h3>");
                    out.println("<h3> quantity "+shoppingCart.get(i).quantity+"</h3>");
                }
            }
        %>
    </body>
</html>
