<%-- 
    Document   : about
    Created on : May 25, 2019, 5:24:07 PM
    Author     : chenwang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title> Venus Cosmetics </title>
        <meta charset = "utf-8" />
        <link rel = "stylesheet" type = "text/css" href = "style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="http://code.jquery.com/jquery-3.4.0.js"></script>
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

        <div id="AboutUs" style="font-size: 1.0vw; padding: 100px; text-align: center;">
            <br>
            <h1>About Us</h1>
            <br>
            <p>Venus Cosmetics was born from a love of animals and an eagerness to inspire.
                Our mission is to create an educated community of health and beauty experts
                and to offer cruelty-free, effective, and pure products.
            </p> <br>
            <p>After years of experimenting with the best-of-the-best in beauty, we are
                still seeing a void in the industry for products that performed across all
                skin types and tones. Our team of aestheticians along with our founder, Chi Nguyen,
                decides to combat this issue. Together they focus on creating products that fits a wide
                range of traditionally hard-to-match skin tones, creating formulas that work for all skin
                types, and pinpointing universal shades so that everyone can express themselves through our brand.
                Our products are designed to feel lightweight, even as they deliver buildable
                coverage that effortlessly layers, to ultimately “make skin look like skin.”
            </p>
        </div>
    </body>
</html>

