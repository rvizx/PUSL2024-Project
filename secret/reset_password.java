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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = {"/ResetPw"})
public class ResetPw extends HttpServlet {

   
    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try{
        
        String password=request.getParameter("con_password");
        
        String mail=request.getParameter("email");
        
        //request.setAttribute("message", mail);
        //request.getRequestDispatcher("/ForgotPw.jsp").forward(request, response);
        
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
        
        PrintWriter out=response.getWriter();
        
        Connection con=null;
        
        Statement st=null;
        
        
            Class.forName("com.mysql.jdbc.Driver");
            con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/abc_cinemadb","root","");
            st=con.createStatement();
            
            
            PreparedStatement ps=con.prepareStatement("UPDATE customer SET c_password=? where c_mail=?");
            ps.setString(1, mail);
            ps.setString(2, HashedPassword);
            
            ResultSet rs=ps.executeQuery();
 
            if(rs.next())
            {
                String message = "Password updated Succesfully!";
                 request.setAttribute("message", message);
                 request.getRequestDispatcher("/ResetPw.jsp").forward(request, response);
                 
                  Thread.sleep(5000);
                // Redirect to login page
                response.sendRedirect("login.jsp");   
            }
            else
            {
                String message = "Passowrd update failed!";
                request.setAttribute("message", message);
                request.getRequestDispatcher("/ResetPw.jsp").forward(request, response);
                
            }
            
            
           
            
          
        }
        
        catch(Exception e)
        {
            PrintWriter out=response.getWriter();
            out.print(e);
        }
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
