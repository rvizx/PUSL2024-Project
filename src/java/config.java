
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
import java.security.NoSuchAlgorithmException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import java.util.HashMap;




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
        
        //creating a hashmap to store necessary data temporaly
            HashMap<String, Object> info = new HashMap<String, Object>();
            
            String email=request.getParameter("l_email");
            String password=request.getParameter("l_password");            
            info.put("email", email);
            
            String HashedPassword = null;             
            MessageDigest m = MessageDigest.getInstance("MD5");                
            m.update(password.getBytes());      
            byte[] bytes = m.digest();  
            StringBuilder s = new StringBuilder();  
                for(int i=0; i< bytes.length ;i++)  
                {  
                    s.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));  
                }                
            HashedPassword = s.toString(); 
        
        
        
        
            // db configurations
            PrintWriter out=response.getWriter();        
            Connection con=null;        
            Statement st=null;
        
            Class.forName("com.mysql.jdbc.Driver");
            con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/abc_cinema","root","");
            st=con.createStatement();
            
            PreparedStatement ps=con.prepareStatement("SELECT email FROM customer WHERE email=? AND password=?");
            ps.setString(1, email);
            ps.setString(2, HashedPassword);
            
            ResultSet rs=ps.executeQuery();
            
            
            if(rs.next())
                {    
                    // If the email and password are valid, log the user in
                    HttpSession session = request.getSession();
                    session.setAttribute("info",info);
                    session.setMaxInactiveInterval(10*60); // 10 minutes
                    
                    String Hashedemail = null;             
                    MessageDigest m1 = MessageDigest.getInstance("MD5");                
                    m1.update(email.getBytes());      
                    byte[] ebytes = m1.digest();  
                    StringBuilder s1 = new StringBuilder();  
                        for(int i=0; i< ebytes.length ;i++)  
                        {  
                            s1.append(Integer.toString((ebytes[i] & 0xff) + 0x100, 16).substring(1));  
                        }                
                    Hashedemail = s.toString(); 
                    
                    
                    Cookie loginCookie = new Cookie("email", Hashedemail);
                    loginCookie.setPath("/");
                    loginCookie.setMaxAge(365*24*60*60);
                    response.addCookie(loginCookie);
                    RequestDispatcher rq=request.getRequestDispatcher("movies");
                    rq.forward(request,response); 
                        
                    response.sendRedirect("movies.jsp");                    
                
               }
            
            else
                {
                   
                    String message = "Invalid email or password!";
                    request.setAttribute("message", message);
                    request.getRequestDispatcher("/index.jsp").forward(request, response);
                } 
        }
        
        catch(IOException | ClassNotFoundException | NoSuchAlgorithmException | SQLException | ServletException e)
            {
                PrintWriter out=response.getWriter();
                out.print(e);
            }
       
    }

    
    

}
