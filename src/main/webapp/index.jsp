<%
   if(session.getAttribute("name") == null){
       response.sendRedirect("StudentLogin.jsp");
   }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('Images/backImg.jpg');
            background-size: cover;
            filter: brightness(50%);
        }
    </style>
</head>

<body class="font-sans antialiased">
    <div class="min-h-screen flex items-center justify-center">
        <div class="bg-white bg-opacity-80 p-8 rounded-lg shadow-lg">
            <ul class="space-y-4">
                <li>
                    <a href="StudentDetails.jsp" class="text-blue-600 hover:text-blue-800">Profile</a>
                </li>  
                <li>
                    <a href="StudentDetails.jsp" class="text-blue-600 hover:text-blue-800">Course Information</a>
                </li>
                <li>
                    <a href="ResultDetails.jsp" class="text-blue-600 hover:text-blue-800">Exam Schedule</a>
                </li>
                <li>
                    <a href="StudentResult.jsp" class="text-blue-600 hover:text-blue-800">Result</a>
                </li>
                <li>
                    <a href="AddStudent.jsp" class="text-blue-600 hover:text-blue-800">Profile</a>
                </li>
                <li>
                    <a href="EditAdmin.jsp" class="text-blue-600 hover:text-blue-800">Edit Details</a>
                </li>
                
                
            </ul>
        </div>
    </div>
</body>
</html>
