import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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


// todo : add ticket amounts

// get seat names of already booked seats
@WebServlet(urlPatterns = {"/bookseats"})
public class bookseats extends HttpServlet {        
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                response.setContentType("application/json");
                String[] bookedSeats = new String[0];
                
           try{            
            PrintWriter out=response.getWriter();        
            Connection con=null;        
            Statement st=null;
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/PUSL2024-Project/seats","root","");
                st=con.createStatement();
                String sql = "SELECT seatname FROM seats WHERE booked = 1";
                ResultSet rs = st.executeQuery(sql);
                bookedSeats = new String[rs.getFetchSize()];
                
                // append seat names to the array 
                int i = 0;
                while (rs.next()) {
                    bookedSeats[i] = rs.getString("seatname");
                    i++;
                }

               } catch (ClassNotFoundException | SQLException e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred!");
               } finally {
                    // closing the database resources
                      if (st != null) {
                            try {
                                st.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                      }
                       if (con != null) {
                            try {
                                con.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                    }
            }
            
             request.setAttribute("bookedSeats", bookedSeats);
             request.getRequestDispatcher("/frontend.jsp").forward(request, response);                                    
        }        
        catch(Exception e)
            {
                PrintWriter out=response.getWriter();
                out.print(e);
            }

   
   
   
  }
    
    // add booked seats to the database
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try{
            String[] seatNames = request.getParameterValues("selectedSeats"); //getting the seat names from the front-end and put it into an array
            
            // if no seats we're selected -> (better to handle this from front-end)
            if (seatNames == null || seatNames.length == 0) { 
                  response.sendError(HttpServletResponse.SC_BAD_REQUEST, "No seats were selected");
                  return;
            }
            
            PrintWriter out=response.getWriter();        
            Connection con=null;        
            Statement st=null;
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/PUSL2024-Project/seats","root","");
                st=con.createStatement();
                
                String sql = "UPDATE seats SET booked = 1 WHERE seat_name IN (?";
                for (int i = 1; i < seatNames.length; i++) {
                    sql += ",?";
                }
                sql += ")";
                PreparedStatement ps = con.prepareStatement(sql);
                
                for (int i = 1; i <= seatNames.length; i++) {
                    ps.setString(i, seatNames[i - 1]);
                }
                
                int rowsUpdated = ps.executeUpdate();
                if (rowsUpdated == seatNames.length) {
                        response.setStatus(HttpServletResponse.SC_OK);
                } else {
                    
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "an error occured - all the seats were not booked!");
                }

               } catch (ClassNotFoundException | SQLException e) {
                    // An error occurred while connecting to the database or executing the query
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while booking the seats");
               } finally {
                    // closing the database resources
                      if (st != null) {
                            try {
                                st.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                      }
                       if (con != null) {
                            try {
                                con.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                    }
            }
            

        }        
        catch(Exception e)
            {
                PrintWriter out=response.getWriter();
                out.print(e);
            }
       
    }
}
