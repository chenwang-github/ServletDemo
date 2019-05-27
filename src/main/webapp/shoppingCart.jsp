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
        <link rel = "stylesheet" type = "text/css" href = "style.css">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="top_nav" >
            <a href="shoppingCart.html" onclick="verify_CheckOut()">My Cart</a>
        </div>
        <script>
            window.onscroll = function() {myFunction();};

            var top_nav = document.getElementById("top_nav");
            var sticky = top_nav.offsetTop;

            function myFunction() {
                if (window.pageYOffset >= sticky) {
                    top_nav.classList.add("sticky");
                } else {
                    top_nav.classList.remove("sticky");
                }
            }
        </script>


        <button id="defaultOpen" class="logo_link"  onclick="window.location.href = 'index.html';">Venus Cosmetics</button>
        <button class="tab_link"  onclick="window.location.href = 'EyePalette.jsp';">Product</button>
        <button class="tab_link"  onclick="window.location.href = 'about.jsp';">About Us</button>

        ﻿
        <%
//            ArrayList<Item> shoppingCart = (ArrayList<Item>)session.getAttribute("shoppingCart");
//            if (shoppingCart == null)
//            {
//                out.println("<h1>shopping car shouldn't be empty</h>");
//            }else{
//                for(int i = 0; i<shoppingCart.size();i++){
//                    out.println("<h1>--------------------------------------</h>");
//                    out.println("<h3> name: "+shoppingCart.get(i).name+"</h3>");
//                    out.println("<h3> img: "+shoppingCart.get(i).images+"</h3>");
//                    out.println("<h3> price "+shoppingCart.get(i).price+"</h3>");
//                    out.println("<h3> quantity "+shoppingCart.get(i).quantity+"</h3>");
//                }
//            }
        %>
        <div id = "cartContent">
            <%
                out.println("<h1 style=\"font-size: 30px; text-align: center; \"> SHOPPING BAG </h1>");
                out.println("<div style=\"display: flex;padding-left:10px; padding-right:10px;\">");
                out.println("<div class=\"two_column\" style=\"width:50%; float: left;\">");
                ArrayList<Item> shoppingCart = (ArrayList<Item>)session.getAttribute("shoppingCart");
            if (shoppingCart == null)
            {
                out.println("<h1>shopping car is empty</h1>");
            }else{
                for(int i = 0; i<shoppingCart.size();i++){
                    
                   out.println("<h1>--------------------------------------</h>");
                    out.println("<h3> name: "+shoppingCart.get(i).name+"</h3>");
                    out.println("<h3> img: "+shoppingCart.get(i).images+"</h3>");
                    out.println("<h3> price "+shoppingCart.get(i).price+"</h3>");
                   out.println("<h3> quantity "+shoppingCart.get(i).quantity+"</h3>");
                 
               
                    
                 
                }
            }
            
            out.println("</div>");
                out.println("<div class=\"two_column\" style=\"text-align: left; width:50%; float:right;\">"+
                    "<h3> ORDER SUMMARY </h3><br>"+
                    "<h5>SUBTOTAL  <span id = 'subtotal' style=\"float: right\"> $0.00</span></h5>"+
                    "<h5>SHIPPING <span style=\"float: right\">$0.00</span></h5>"+
                    "<h5>ESTIMATED SALES TAX <span style=\"float: right\">$0.00</span></h5>"+
                    "<hr>"+
                    "<h5>ORDER TOTAL<span id = 'order_total' style=\"float: right\">$0.00</span></h5><br>"+
                    "<button type=\"submit\" id = \"checkOutSubmit\"class=\"tab_link\" style="+
                            "\"background-color: black; color: white;float: right; width: 250px; height: 80px;"+
                            "text-align: center;\""+
                            "onclick=\"window.location.href = 'checkoutForm.html';\">CHECKOUT</button>"+
                "</div>");
            %>
         </div>
         
    </body>
</html>
