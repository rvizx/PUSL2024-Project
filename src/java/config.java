
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.RequestDispatcher;  
import java.security.MessageDigest; 
import java.util.Random;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;



@WebServlet(urlPatterns = {"/config"})
public class config extends HttpServlet {
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try
        {

        String email=request.getParameter("l_email");
        String password=request.getParameter("l_password");
        
        
        
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
            
          PreparedStatement ps=con.prepareStatement("SELECT c_email FROM customer WHERE c_email=? AND c_password=?");
          ps.setString(1, email);
          ps.setString(2, HashedPassword);
            
          ResultSet rs=ps.executeQuery();
            
            
            if(rs.next())
                {                
                    // If the email and password are valid, log the user in
                    HttpSession session = request.getSession();
                    session.setAttribute("c_email", email);
                    session.setMaxInactiveInterval(10*60); // 10 minutes
                    
                    /* // generate random hash
                    Random random = new Random();
                    MessageDigest messageDigest = MessageDigest.getInstance("MD5");
                    byte[] bytes2 = new byte[32];
                    random.nextBytes(bytes2);
                    messageDigest.update(bytes2);
                    byte[] hash = messageDigest.digest();
                    StringBuilder sb = new StringBuilder();
                    //bytes to hex
                    for (byte b : hash) {                       
                        sb.append(String.format("%02x", b)); 
                    }                    
                    
                    String hashString = sb.toString();  
                    
                    String Hashedemail = null;             
                     // MessageDigest instance for MD5.  
                    MessageDigest m1 = MessageDigest.getInstance("MD5");                
                    // Add plain-text password bytes to digest using MD5 update() method. 
                    m1.update(email.getBytes());      
                    // Convert the hash value into bytes
                    byte[] ebytes = m1.digest();  
                    // The bytes array has bytes in decimal form. Converting it into hexadecimal format.  
                    StringBuilder s1 = new StringBuilder();  
                        for(int i=0; i< ebytes.length ;i++)  
                        {  
                            s1.append(Integer.toString((ebytes[i] & 0xff) + 0x100, 16).substring(1));  
                        }                
                    // Complete hashed password in hexadecimal format  
                    Hashedemail = s.toString(); 
                    
                    
                    //Cookie loginCookie = new Cookie("c_email", Hashedemail);
                   // loginCookie.setPath("/");
                    //loginCookie.setMaxAge(365*24*60*60);
                   // response.addCookie(loginCookie);
                   // RequestDispatcher rq=request.getRequestDispatcher("movies");
                    //rq.forward(request,response); 
                    
    
                    // Redirect the user to the homepage */
                    response.sendRedirect("movies.jsp");                    
                
               }
            
            else
                {
                   
                    String message = "Invalid email or password!";
                    request.setAttribute("message", message);
                    request.getRequestDispatcher("/index.jsp").forward(request, response);
                } 
        }
        
        catch(Exception e)
            {
                PrintWriter out=response.getWriter();
                out.print(e);
            }
       
    }

    
    

}
