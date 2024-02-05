package com.registration;

import jakarta.servlet.ServletException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;


@WebServlet("/AdminLoginServlet")
public class AdminLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uid = request.getParameter("id");
        String upwd = request.getParameter("password");
        HttpSession session = request.getSession();
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/EXAMPORTAL?useSSL=false", "root", "Nayan_0403@");
            PreparedStatement pst = conn.prepareStatement("SELECT * FROM ADMIN WHERE ID = ? AND PASSWORD= ? ");
            pst.setString(1, uid);
            pst.setString(2, upwd);
            ResultSet rs = pst.executeQuery();

            if(rs.next()) {
                 session.setAttribute("name", rs.getString("NAME"));
                 response.sendRedirect("AdminDashboard.jsp");
            } else {
                 request.setAttribute("status", "failed");
                 request.getRequestDispatcher("registration.jsp").forward(request, response);
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("registration.jsp");
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

