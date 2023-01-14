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

@WebServlet(urlPatterns = {"/cancel"})
public class cancel extends HttpServlet {    
    
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
   
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
   try
      {
        String booking_id=request.getParameter("bid");
        HttpSession session = request.getSession();                                                                
        // db configurations
        PrintWriter out=response.getWriter();        
        Connection con=null;        
        Statement st=null;
        
        
          Class.forName("com.mysql.jdbc.Driver");
          con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/abc_cinema","root","");
          st=con.createStatement();            
          
          PreparedStatement ps= con.prepareStatement("SELECT * FROM booking where booking_id = ?");
          ps.setString(1, booking_id);
          ResultSet rs = ps.executeQuery();
          
          PreparedStatement ps2= con.prepareStatement("SELECT movie.m_name FROM movie JOIN shows ON shows.m_id = movie.m_id JOIN ticket ON ticket.t_id = boooking.t_id;  WHERE booking.booking_id=?; ");
          ps2.setString(1, booking_id);
          ResultSet movie = ps2.executeQuery();

          PreparedStatement ps3= con.prepareStatement("SELECT ticket.date_time FROM ticket JOIN booking ON ticket.t_id = booking.t_id WHERE booking.booking_id=?");
          ps3.setString(1, booking_id);
          ResultSet date_time = ps3.executeQuery();

          //if the booking id-exists
          if (rs.next()) {                            
              PreparedStatement ps4 = con.prepareStatement("DROP * FROM ticket JOIN booking ON ticket.t_id = booking.t_id WHERE booking.booking_id=?");
              ResultSet rs2 = ps4.executeQuery();
              if (rs2.next()) {
                    String message = "your booking(s) for the "+movie+" on "+date_time+" were/was cancelled successfully!"; //add movie,date_time this
                    request.setAttribute("message", message);
                    request.getRequestDispatcher("/details.jsp").forward(request, response);                           
              }
              
          } else {
              
                //if the booking id doesn't exists                
                String message = "An error occured!"; 
                request.setAttribute("message", message);
                request.getRequestDispatcher("/index.jsp").forward(request, response);
         }
          response.sendRedirect("/payment.jsp");           
       }
        
    catch(Exception e)
            {
                PrintWriter out=response.getWriter();
                out.print(e);
            }
       
    }
      
}
