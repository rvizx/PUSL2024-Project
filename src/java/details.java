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
import java.util.HashMap;


/**
 *
 * @author rvz
 */

@WebServlet(urlPatterns = {"/details"})
public class details extends HttpServlet {    
    
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
   
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
   try
      {
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String phone=request.getParameter("mobile"); 
        HttpSession session = request.getSession();  
        
        //map
        HashMap<String, Object> info = (HashMap<String, Object>) session.getAttribute("info");
        info.put("name", name);
        info.put("email", email);
        info.put("phone", phone);
                                                       
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
              // A user with this email already exists - no need to add warnings at fron-end
              String message = "process complete! (email already exists.)"; //remove this
              request.setAttribute("message", message);
              request.getRequestDispatcher("/details.jsp").forward(request, response);                           

              
          } else {
              
                // insert the new user into the database
                PreparedStatement ps1=con.prepareStatement("INSERT INTO customer(name,mobile,email) VALUES(?,?,?)");
                ps1.setString(1, name);
                ps1.setString(3, phone);
                ps1.setString(4, email);
                ps1.executeUpdate();
                
                String message = "process comeplete"; //remove this
                request.setAttribute("message", message);
                request.getRequestDispatcher("/details.jsp").forward(request, response);                           

         }
          response.sendRedirect("/payment.jsp");

/*

          // DONT EDIT OR REMOVE THIS ~ rvz
          
          //insert rest of the values to the database
          
          //seat_numbers
          PreparedStatement ps1=con.prepareStatement("INSERT INTO seats(name,mobile,email) VALUES(?,?,?)");
          ps1.setString(1, name);
          ps1.executeUpdate();
          
          //tickets          
          PreparedStatement ps3=con.prepareStatement("INSERT INTO tickets(seat_no,seat_status,email) VALUES(?,?,?)");
                  ps1.setString(1, name);
                  ps1.executeUpdate();

          
          
          // filter
          PreparedStatement ps3=con.prepareStatement("INSERT INTO child_tickets(seat_no,seat_status,email) VALUES(?,?,?)");
                  ps1.setString(1, name);
                  ps1.executeUpdate();


          PreparedStatement ps3=con.prepareStatement("INSERT INTO adulit_tickets(seat_no,seat_status,email) VALUES(?,?,?)");

                  ps1.setString(1, name);
                  ps1.executeUpdate();
          
        
*/


           
       }
        
    catch(Exception e)
            {
                PrintWriter out=response.getWriter();
                out.print(e);
            }
       
    }
      
}
