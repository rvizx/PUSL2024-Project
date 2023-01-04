/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author rvz
 */

@WebServlet(urlPatterns = {"/register"})
public class register extends HttpServlet {

    
    
    
    
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
   
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
   try
      {
        String fname=request.getParameter("firstname");
        String lname=request.getParameter("lastname");
        String email=request.getParameter("email");
        String address=request.getParameter("address");
        String phone=request.getParameter("phone");        
        String password=request.getParameter("password");
                               
        String HashedPassword = null;             
        // MessageDigest instance for MD5.  
        MessageDigest m = MessageDigest.getInstance("MD5");                
        // Add plain-text password bytes to digest using MD5 update() method. 
        m.update(password.getBytes());      
        // Convert the hash value into bytes
        byte[] bytes = m.digest();  
        // The bytes array has bytes in decimal form. Converting it into hexadecimal format.  
        StringBuilder s = new StringBuilder();  
            for(int i=0; i< bytes.length ;i++)  
            {  
                s.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));  
            }                
        // Complete hashed password in hexadecimal format  
        HashedPassword = s.toString();  
        
        
        // db configurations
        PrintWriter out=response.getWriter();        
        Connection con=null;        
        Statement st=null;
        
        
          Class.forName("com.mysql.jdbc.Driver");
          con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/PUSL2024-Project/customer","root","");
          st=con.createStatement();            
          
          PreparedStatement ps= con.prepareStatement("SELECT * FROM customers WHERE email = ?");
          ps.setString(1, email);
          ResultSet rs = ps.executeQuery();
          
          if (rs.next()) {
              // A user with this email already exists
              String message = "Error! A user with this email address already registered, try login.";
              out.print(message);
              
          } else {
              
                // Insert the new user into the database
                PreparedStatement ps1=con.prepareStatement("INSERT INTO customer(fname,lname,email,address,phone,password) VALUES(?,?,?,?,?,?)");
                ps1.setString(1, fname);
                ps1.setString(2, lname);
                ps1.setString(3, email);
                ps1.setString(4, address);
                ps1.setString(5, phone);
                ps1.setString(6, HashedPassword);
                ps1.executeUpdate();
                
                String message = "Registration complete!. You'll be redirected to the home page in 5 seconds";
                out.print(message);
                Thread.sleep(5000);
                // Redirect to login page
                response.sendRedirect("login.jsp");                              
         }
           
       }
        
    catch(Exception e)
            {
                PrintWriter out=response.getWriter();
                out.print(e);
            }
       
    }
      
}
