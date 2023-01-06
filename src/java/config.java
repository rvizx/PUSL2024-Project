
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
            
          PreparedStatement ps=con.prepareStatement("SELECT email FROM customer WHERE c_mail=? AND c_password=?");
          ps.setString(1, email);
          ps.setString(2, HashedPassword);
            
          ResultSet rs=ps.executeQuery();
            
            
            if(rs.next())
                {                
                    // If the email and password are valid, log the user in
                    HttpSession session = request.getSession();
                    session.setAttribute("c_mail", email);
                    session.setMaxInactiveInterval(10*60); // 10 minutes
                    
                    Cookie loginCookie = new Cookie("c_mail", email);
                    loginCookie.setPath("/");
                    response.addCookie(loginCookie);
    
                    // Redirect the user to the homepage
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
