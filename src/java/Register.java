/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

/**
 *
 * @author rvz
 */



@WebServlet(urlPatterns = {"/Register"})
public class Register extends HttpServlet {
    
        @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

       String uid=request.getParameter("uid");
       String username=request.getParameter("username");
       String email=request.getParameter("email");
       String password=request.getParameter("password");
       
       
       PrintWriter out= response.getWriter();
       Connection con=null;
       Statement st=null;
       
       try {
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root",""); 
            //path of the database should be provided inside quotes
            st = con.createStatement();
            String qry = "insert into info values('"+stdid+"','"+name+"','"+degree+"','"+email+"');";
            st.executeUpdate(qry);
            out.print("data inserted successfully");
}
       catch(Exception e)
       {
         out.print(e);
       }
    }


     protected void doPost(HttpServletRequest request, HttpServletResponse response) 
             throws ServletException, IOException {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            try {
                        boolean success = registerUser(username, password);
                    if (success) {
                        response.setStatus(HttpServletResponse.SC_OK);   
                    } else {
                        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
      }
    } catch(SQLException e) {
      throw new ServletException(e);
    }
  }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

     private boolean registerUser(String username, String password) throws SQLException {
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      try {
          conn = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root",""); 
          pstmt = conn.prepareStatement(SQL_SELECT_USER_BY_USERNAME);
          pstmt.setString(1, username);
          rs = pstmt.executeQuery();
          if (rs.next()) {
              // A user with this username already exists
              return false;
          } else {
              // Insert the new user into the database
              pstmt = conn.prepareStatement(SQL_INSERT_USER);
              pstmt.setString(1, username);
              pstmt.setString(2, hashPassword(password));
              pstmt.executeUpdate();
              return true;
          }
      } finally {
          if (rs != null) {
              rs.close();
          }
          if (pstmt != null) {
              pstmt.close();
          }
          if (conn != null) {
              conn.close();
          }
      }
  }

    
    private static String hashPassword(String password) {
      try {
          MessageDigest md = MessageDigest.getInstance("MD5");
          md.update(password.getBytes());
          byte[] bytes = md.digest();
          StringBuilder sb = new StringBuilder();
          for (int i = 0; i < bytes.length; i++) {
              sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
          }
          return sb.toString();
      } catch (NoSuchAlgorithmException e) {
          // This should never happen
          throw new RuntimeException(e);
      }
  }
    
}
