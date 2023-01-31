

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sanid
 */
@WebServlet(urlPatterns = {"/feedback"})
public class feedback extends HttpServlet {


    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            String name=request.getParameter("name");
            String email=request.getParameter("email"); 
            String feedback=request.getParameter("message");
            
    try{
            Connection con=null;        
            Statement st=null;
        
            Class.forName("com.mysql.jdbc.Driver");
            con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/abc_cinema","pmauser","123NxUok4IL4pW9GvkJF8gO1C6MyRFed");
            st=con.createStatement();
            
            // insert the feedback message into the database
            PreparedStatement ps1=con.prepareStatement("INSERT INTO feedback(name,email,message) VALUES(?,?,?)");
            ps1.setString(1, name);
            ps1.setString(2, email);
            ps1.setString(3, feedback);
            ps1.executeUpdate();
            
            String sucessmsg = "Your feedback message was sent succesfully!!"; 
            request.setAttribute("message", sucessmsg);
            request.getRequestDispatcher("/feedback.jsp").forward(request, response); //Look into the sleeper function!!
            TimeUnit.SECONDS.sleep(5000);
            
            // Redirect the user to the homepage
            response.sendRedirect("index.jsp");
            

        }
            
    catch(ClassNotFoundException | SQLException e){
        
        PrintWriter out=response.getWriter();
        out.print(e);
                
        } 
    
    catch (InterruptedException ex) {
            Logger.getLogger(feedback.class.getName()).log(Level.SEVERE, null, ex);
     
    }
    }
   

}
