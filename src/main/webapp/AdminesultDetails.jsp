<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.Statement" %>
<!DOCTYPE html>
<html>
<head>
    <title>Result Details</title>
</head>
<body>
    <% 
Statement st = null;
Connection con = null;
try {
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/EXAMPORTAL?useSSL=false", "root", "Nayan_0403@");
    st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    ResultSet rs = st.executeQuery("SELECT * FROM RESULT;");

    // Check if data is found
    boolean dataFound = false;

    %>
<table border="1" align="center" style="text-align:center">
    <thead>
        <tr>
            <th>ID</th>
            <th>SEMESTER</th>
            <th>COMPUTER_SCIENCE</th>
            <th>MAT1001</th>
            <th>ENGINEERING_PHYSICS</th>
            <th>COMPUTER_VISION</th>
            <th>DBMS</th>
            <th>PERCENTAGE</th>
            <th>ESTATUS</th>
        </tr>
    </thead>
    <tbody>
        <% while (rs.next()) { 
            dataFound = true; // Data found, set flag to true
        %>
        <tr>
            <td><%= rs.getString("STUDENT_ID") %></td>
            <td><%= rs.getInt("SEMESTER") %></td>
            <td><%= rs.getInt("COMPUTER_SCIENCE") %></td>
            <td><%= rs.getInt("MAT1001") %></td>
            <td><%= rs.getInt("ENGINEERING_PHYSICS") %></td>
            <td><%= rs.getInt("COMPUTER_VISION") %></td>
            <td><%= rs.getInt("DBMS") %></td>
            <td><%= rs.getString("PERCENTAGE")%> %</td>
            <td><%= rs.getString("ESTATUS") %></td>
        </tr>
        <% } %>
    </tbody>
</table>
<br>
<% 
    // Check if no data found
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
		swal("Failed", "No Results Exists", "error");
	} 
	</script>
</body>
</html>