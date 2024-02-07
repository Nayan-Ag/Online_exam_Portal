package com.registration;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;


@WebServlet("/AdLoginServlet")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("id");
	    String upwd = request.getParameter("password");
	    HttpSession session = request.getSession();
	    RequestDispatcher dispatcher = null;
	    Connection conn = null;
	    try {
	        Class.forName("com.mysql.jdbc.Driver");
	        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/EXAMPORTAL?useSSL=false", "root", "Nayan_0403@");

	        
	        PreparedStatement pst2 = conn.prepareStatement("SELECT * FROM STUDENTS WHERE ID = ? AND PASSWORD= ? ");
	        pst2.setString(1, uid);
	        pst2.setString(2, upwd);
	        ResultSet rs2 = pst2.executeQuery();
	        
	        if(rs2.next()) {    
	        	 session.setAttribute("name" , rs2.getString("NAME"));
	        	 session.setAttribute("userId", uid); // userId is the ID used during login

	             dispatcher = request.getRequestDispatcher("index.jsp");
	        } else {
	             request.setAttribute("status", "failed");
	             dispatcher = request.getRequestDispatcher("StudentLogin.jsp.jsp");
	        }
	        dispatcher.forward(request, response);
	    } catch(Exception e) {
	        e.printStackTrace();
	        dispatcher = request.getRequestDispatcher("StudentLogin.jsp.jsp");
	    }
	}

}
