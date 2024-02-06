package com.registration;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/AddResultServlet")
public class AddResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sid = request.getParameter("id");
        int sem = Integer.parseInt(request.getParameter("sem"));
        int sub1 = Integer.parseInt(request.getParameter("sub1"));
        int sub2 = Integer.parseInt(request.getParameter("sub2"));
        int sub3 = Integer.parseInt(request.getParameter("sub3"));
        int sub4 = Integer.parseInt(request.getParameter("sub4"));
        int sub5 = Integer.parseInt(request.getParameter("sub5"));
        double per = ((sub1+sub2+sub3+sub4+sub5)*100)/500;
        String s_sta = "passed";
        if(per<40) s_sta = "failed";
        RequestDispatcher dispatcher = null;
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/EXAMPORTAL?useSSL=false", "root", "Nayan_0403@"); 
            
            // Check if the student ID already exists in the RESULT table
            PreparedStatement checkStmt = conn.prepareStatement("SELECT * FROM RESULT WHERE STUDENT_ID = ?");
            checkStmt.setString(1, sid);
            ResultSet checkRs = checkStmt.executeQuery();
            
            if (checkRs.next()) {
                // If the student ID already exists, set status attribute to "exist"
                request.setAttribute("status", "exist");
                dispatcher = request.getRequestDispatcher("AddResult.jsp");
            } else {
                // If the student ID doesn't exist, proceed with the insertion
                PreparedStatement pst = conn.prepareStatement("INSERT INTO RESULT VALUES (?, ?, ?, ?, ?, ? , ? , ? , ?)");
                pst.setString(1, sid);
                pst.setInt(2, sem);
                pst.setInt(3, sub1);
                pst.setInt(4, sub2);
                pst.setInt(5, sub3);
                pst.setInt(6, sub4);
                pst.setInt(7, sub5);
                pst.setString(8, String.valueOf(per));
                pst.setString(9, s_sta);
                
                int rowsAffected = pst.executeUpdate();
                
                if (rowsAffected > 0) {
                    // If insertion is successful, set status attribute to "success"
                    request.setAttribute("status", "success");
                    dispatcher = request.getRequestDispatcher("AddResult.jsp");
                } else {
                    // If insertion fails, set status attribute to "failed"
                    request.setAttribute("status", "failed");
                    dispatcher = request.getRequestDispatcher("AddResult.jsp");
                }
            }
        } catch(Exception e) {
            e.printStackTrace();
            request.setAttribute("status", "failed");
            dispatcher = request.getRequestDispatcher("AddResult.jsp");
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            dispatcher.forward(request, response);
        }

	}

}
