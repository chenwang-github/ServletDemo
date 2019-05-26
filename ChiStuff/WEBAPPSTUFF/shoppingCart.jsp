<%-- 
    Document   : shoppingCart
    Created on : May 25, 2019, 2:59:04 PM
    Author     : ching
--%>

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
        <title> Venus Cosmetics </title>
        <meta charset = "utf-8" />
        <link rel = "stylesheet" type = "text/css" href = "style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="http://code.jquery.com/jquery-3.4.0.js"></script>
        
        
       
            
        </script>
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


       <button id="defaultOpen" class="logo_link"  style= "height: 150%" onclick="window.location.href = 'homebutton.html';">Venus Cosmetics</button>
        <button class="tab_link"  onclick="window.location.href = 'EyePalette.jsp';">Product</button>
        <button class="tab_link"  onclick="window.location.href = 'about.html';">About Us</button>
        
        
        <div id = "cartContent">
            <%
                out.println("<h1 style=\"font-size: 30px; text-align: center; \"> SHOPPING BAG </h1>");
                out.println("<div style=\"display: flex;padding-left:10px; padding-right:10px;\">");
                out.println("<table class=\"two_column\" >");
                out.println("<tr>"+
                        "<td valign=\"top\">"+
                            "<table class=\"cart_summary\">"+
                                "<thead>"+
                                "<tr>"+
                                    "<td>"+
                                    "</td>"+
                                    "<td style=\"padding: 10px;\">"+
                                    "</td>"+
                                    "<td>"+
                                    "</td>"+
                                    "<td>"+
                                    "</td>"+
                                "</tr>"+
                                "</thead>"+
                                "<tbody id=\"orderedProductsTblBody\">"+
                                "</tbody>"+
                            "</table>"+
                        "</td>"+
                    "</tr>"+
                "</table>"+
                "<div class=\"two_column\" style=\"text-align: left\">"+
                    "<h3> ORDER SUMMARY </h3><br>"+
                    "<h5>SUBTOTAL  <span id = 'subtotal' style=\"float: right\"> $0.00</span></h5>"+
                    "<h5>SHIPPING <span style=\"float: right\">$0.00</span></h5>"+
                    "<h5>ESTIMATED SALES TAX <span style=\"float: right\">$0.00</span></h5>"+
                    "<hr>"+
                    "<h5>ORDER TOTAL<span id = 'order_total' style=\"float: right\">$0.00</span></h5><br>"+
                    "<button type=\"submit\" id = \"checkOutSubmit\"class=\"tab_link\" style="+
                            "\"background-color: black; color: white;float: right; width: 250px; height: 80px;"+
                            "text-align: center;\""+
                            "onclick=\"openButton('CheckOutPage');\" disabled>CHECKOUT</button>"+
                "</div>");
            %>
            <%--
            <h1 style="font-size: 30px; text-align: center; "> SHOPPING BAG </h1>
            <div style="display: flex;padding-left:10px; padding-right:10px;">

                <table class="two_column" >
                    <tr>
                        <td valign="top">
                            <table class="cart_summary">
                                <thead>
                                <tr>
                                    <td>
                                    </td>
                                    <td style="padding: 10px;">
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                </thead>
                                <tbody id="orderedProductsTblBody">
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </table>
                <div class="two_column" style="text-align: left">


                    <h3>ORDER SUMMARY</h3><br>
                    <h5>SUBTOTAL  <span id = 'subtotal' style="float: right"> $0.00</span> </h5>
                    <h5>SHIPPING <span style="float: right">$0.00</span></h5>
                    <h5>ESTIMATED SALES TAX <span style="float: right">$0.00</span></h5>
                    <hr>
                    <h5> ORDER TOTAL <span id = 'order_total' style="float: right">$0.00</span></h5><br>
                    <button type="submit" id = "checkOutSubmit"class="tab_link" style=
                            "background-color: black; color: white;float: right; width: 250px; height: 80px;
                            text-align: center;"
                            onclick="openButton('CheckOutPage');" disabled>CHECKOUT</button>
                </div>
            </div>
            --%>


        </div>
  
    </body>
</html>