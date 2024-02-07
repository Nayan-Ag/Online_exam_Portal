<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.Statement" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP Sample</title>
</head>
<body>
    <% 
    Statement st = null;
    Connection con = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/EXAMPORTAL?useSSL=false", "root", "Nayan_0403@");
        st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = st.executeQuery("SELECT * FROM STUDENTS;");
        
        // Check if data is found
        boolean dataFound = false;
        if (rs.next()) {
            dataFound = true; // Data found, set flag to true
            rs.beforeFirst(); // Move cursor back to first row for iteration
    %>
    <table border="1" align="center" style="text-align:center">
        <thead>
            <tr>
                <th>ID</th>
                <th>NAME</th>
                <th>PASSWORD</th>
                <th>CONTACT</th>
            </tr>
        </thead>
        <tbody>
            <% while (rs.next()) { %>
            <tr>
                <td><%= rs.getString("ID") %></td>
                <td><%= rs.getString("NAME") %></td>
                <td><%= rs.getString("PASSWORD") %></td>
                <td><%= rs.getString("CONTACT") %></td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <br>
    <% 
        } // end of if
        if (!dataFound) { // If no data found, set status attribute
            request.setAttribute("status", "failed");
        }
    } catch (Exception e) { 
        out.print(e.getMessage());
    } finally { 
        try {
            if (st != null) st.close();
            if (con != null) con.close();
        } catch (Exception ex) {
            out.print(ex.getMessage());
        }
    } 
    %>
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	<script type="text/javascript">
	var status = "<%= request.getAttribute("status") %>";
	if (status === "failed") {
		swal("Failed", "No students Exists", "error");
	} 
	</script>
</body>
</html>






