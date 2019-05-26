<%-- 
    Document   : EyePalette
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
            <a href="shoppingCart.jsp" onclick="verify_CheckOut()">My Cart</a>
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
        <div id = "Eye">
            <%
            try {
                String connectionURL = "jdbc:mysql://127.0.0.1:3306/test";
                Connection conn = null; 
                Statement stmt = null;
                Class.forName("com.mysql.jdbc.Driver").newInstance(); 
                conn = DriverManager.getConnection(connectionURL, "root", "root");
                if(!conn.isClosed())
                    //out.println("Successfully connected to " + "MySQL server using TCP/IP...");
                    out.println("<br>");
                    stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM products");
                    while(rs.next()){  
                        String image = rs.getString("itemi");
                        image = image.replace("\\", "-");
                        String name = rs.getString("itemn");
                        String price = rs.getString("itemp");
                        String links = "newjsp.jsp?"+
                            "itemi="+image+
                            "&itemn="+name+
                            "&quantity="+ 1+
                            "&itemp="+price;
                        out.println("   <div class=\"columns\">");
                        out.println("       <ul  class=\"products\">");
                        out.println("           <li>");
                        out.println("               <a href=\"productClicked.jsp?itemn="+name+"&itemi="+image+"&itemp="+price+"\">");
                        out.println("                   <img class = \"resize\" src=" + rs.getString("itemi") +">");
                        out.println("               </a>");
                        out.println("           </li>");
                        out.println("           <li>"+name+"</li>");
                        out.println("           <li class= \"price\">$"+price+"</li>");
                        out.println("           <li>");
                        out.println("<button class=\"cartbutton\" "
                                + "onclick=\"window.location.href = '" +links+ "'\">");
                        out.println("           ADD TO CART");
                        out.println("           </button>");
                        out.println("           </li>");
                        out.println("       </ul>");
                        out.println("   </div>");
                    }
              
                conn.close();
            }catch(Exception ex){
                out.println("Unable to connect to database"+ex);
            } 
        %>    

        </div>

    </body>
</html>