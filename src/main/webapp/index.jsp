<%
   if(session.getAttribute("name") == null){
	   response.sendRedirect("registration.jsp");
   }
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Online Exam Portal</title>

    <!-- TailwindCSS  -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Custom CSS-->
    <link rel="stylesheet" href="CSS/index.css" />

    <!-- Load an icon library to show a hamburger menu (bars) on small screens -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
  </head>
  <body>
    <header class="header p-4 flex justify-between items-center">
        <div class="logo">
          <a href="#home" class="active"
            ><img src="Images/logos.png" class="h-10 md:h-14 pl-3"/></a>
        </div>

        <div class="hamburger">
          <a href="javascript:void(0);" class="icon" onclick="myFunction()">
            <i class="fa fa-bars"></i>
          </a>
        </div>

      <div class="topnav flex items-center w-[100%] justify-end" id="myTopnav">
        <a href="#news">Result</a>
        <a href="#contact">Schedule</a>
        <a href="#about">Profile</a>
        <a><button>Logout</button> </a>
      </div>
    </header>

    <!-- Landing section  -->
    <section class="landing_section ml-7 mt-20 md:ml-16 md:mt-40">
      <h1 class="text-3xl md:text-5xl">Online Exam Portal</h1>
      <p class="text-base md:text-lg pl-24 md:pl-32 pt-4">~ School Academy</p>
    </section>

    <!-- Custom JavaScript -->
    <script src="JS/index.js"></script>
  </body>
</html>