<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Created by CodingLab |www.youtube.com/c/CodingLabYT-->
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <!--<title> Login and Registration Form in HTML & CSS | CodingLab </title>-->
    <link rel="stylesheet" href="CSS/registration.css">
    <!-- Fontawesome CDN Link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   </head>
<body>
<input type="hidden" id="status" value="<%=request.getAttribute("status") %>">
  <div class="container">
    <input type="checkbox" id="flip">
    <div class="cover">
      <div class="front">
        <img src="Images/frontImg.jpg" alt="">
        <div class="text">
          <span class="text-1">Ace your exams with ease, <br> take them online </span>
          <span class="text-2">with no squeeze!</span>
        </div>
      </div>
      <div class="back">
        <img class="backImg" src="Images/backImg.jpg" alt="">
        <div class="text">
          <span class="text-1">Complete miles of journey <br> with one step</span>
          <span class="text-2">Let's get started</span>
        </div>
      </div>
    </div>
    <div class="forms">
        <div class="form-content">
          <div class="login-form">
            <div class="title">Add Student</div>
          <form action="AddStudentServlet" method="post">
            <div class="input-boxes">
              <div class="input-box">
                <i class="fas fa-envelope"></i>
                <input type="text" placeholder="Enter student_id" name="id" required>
              </div>
              
              <div class="input-box">
                <i class="fas fa-envelope"></i>
                <input type="text" placeholder="Enter student_name" name="name" required>
              </div>
              
              <div class="input-box">
                <i class="fas fa-envelope"></i>
                <input type="password" placeholder="Enter student_password" name="password" required>
              </div>
              
              <div class="input-box">
                <i class="fas fa-envelope"></i>
                <input type="text" placeholder="Enter student_age" name="age" >
              </div>
              
              <div class="input-box">
                <i class="fas fa-envelope"></i>
                <input type="text" placeholder="Enter student_contact" name="contact" >
              </div>
              
           
              <div class="button input-box">
                <input type="submit" value="Sumbit">
                <input type="Reset" value="Reset" class="pl-[1rem]">
              </div>
              
            </div>
        </form>
      </div>
        
    </div>
    </div>
  </div>
  
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	<script type="text/javascript">
	var status = "<%= request.getAttribute("status") %>";
	if (status === "failed") {
		swal("Failed", "No students Exists", "error");
	}else if(status=="success"){
		swal("Added" , "Student Data Added Succesfully" , "success");
	}
	
</body>
</html>