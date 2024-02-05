package com.registration;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/AddStudentServlet")
public class AddStudent extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sid = request.getParameter("id");
        String sname = request.getParameter("name");
        String spwd = request.getParameter("password");
        int sage = Integer.parseInt(request.getParameter("age"));
        String scontact = request.getParameter("contact");
        RequestDispatcher dispatcher = null;
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/EXAMPORTAL?useSSL=false", "root", "Nayan_0403@");
            PreparedStatement pst = conn.prepareStatement("INSERT INTO STUDENTS VALUES (?, ?, ?, ?, ?)");
            pst.setString(1, sid);
            pst.setString(2, sname);
            pst.setString(3, spwd);
            pst.setInt(4, sage);
            pst.setString(5, scontact);
            int rowsAffected = pst.executeUpdate();
            
            if (rowsAffected > 0) {
                request.setAttribute("status", "success");
                dispatcher = request.getRequestDispatcher("AddStudent.jsp");
            } else {
                request.setAttribute("status", "failed");
            }
            dispatcher = request.getRequestDispatcher("AddStudent.jsp");
        } catch(Exception e) {
            e.printStackTrace();
            request.setAttribute("status", "failed");
            dispatcher = request.getRequestDispatcher("AddStudent.jsp");
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
