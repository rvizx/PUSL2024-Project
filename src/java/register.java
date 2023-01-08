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
import java.lang.Thread;

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
        String fname=request.getParameter("r_fname");
        String lname=request.getParameter("r_lname");
        String email=request.getParameter("r_email");
        String phone=request.getParameter("r_mobile");        
        String password=request.getParameter("r_password");
                               
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
          con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/abc_cinema","root","");
          st=con.createStatement();            
          
          PreparedStatement ps= con.prepareStatement("SELECT * FROM customer WHERE email = ?");
          ps.setString(1, email);
          ResultSet rs = ps.executeQuery();
          
          if (rs.next()) {
              // A user with this email already exists
              String message = "Registration complete!.You'll be redirected to the home page in 5 seconds";
              request.setAttribute("message", message);
              request.getRequestDispatcher("/register.jsp").forward(request, response);
              
          } else {
              
                // Insert the new user into the database
                PreparedStatement ps1=con.prepareStatement("INSERT INTO customer(fname,lname,mobile,email,password) VALUES(?,?,?,?,?)");
                ps1.setString(1, fname);
                ps1.setString(2, lname);
                ps1.setString(3, phone);
                ps1.setString(4, email);
                ps1.setString(5, HashedPassword);
                ps1.executeUpdate();
                
                //String message = "Registration complete!. You'll be redirected to the home page in 5 seconds";
                //out.print(message);
                String message = "Registration complete!.You'll be redirected to the home page in 5 seconds";
                request.setAttribute("message", message);
                request.getRequestDispatcher("/register.jsp").forward(request, response);                           
         }
          Thread.sleep(5000);
          response.sendRedirect("/index.jsp");   
           
       }
        
    catch(Exception e)
            {
                PrintWriter out=response.getWriter();
                out.print(e);
            }
       
    }
      
}
