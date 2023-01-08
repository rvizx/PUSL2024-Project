import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
/**
 *
 * @author sanid
 */
@WebServlet(urlPatterns = {"/datetime"})
public class datetime extends HttpServlet {

    
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          PrintWriter out=response.getWriter();

            String moviedate=request.getParameter("s_date");

            String time=request.getParameter("time");
            
            
            String datetime=moviedate+" "+time;
            
            

     try
        {
            //HTTP Session
            String sessionmail=null;
            HttpSession session = request.getSession();        
            sessionmail = (String) session.getAttribute("email");
            
            Cookie[] loginCookie = request.getCookies();
            
            if (null == session.getAttribute("email") && loginCookie.length == 0 && null == loginCookie){
                
                String message = "Login to continue";
                request.setAttribute("message", message);
                request.getRequestDispatcher("/index.jsp").forward(request, response);
                
                // Redirect the user to the Seat book page
                response.sendRedirect("login.jsp");
            }
            
            else{
                          
                Connection con=null;        
                Statement st=null;

                Class.forName("com.mysql.jdbc.Driver");
                con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/abc_cinema","root","");
                st=con.createStatement();

                PreparedStatement ps=con.prepareStatement("SELECT COUNT(seat_no) FROM seats WHERE seat_status=1 AND date_time=?;");
                ps.setString(1,datetime);
                ResultSet rs=ps.executeQuery();

                while(rs.next()){

                    int availableseats=rs.getInt(1);

                    /*PreparedStatement ps1=con.prepareStatement("SELECT COUNT(seats.seat_no) FROM movie_show,booked_seats WHERE movie_show.show_id=booked_seats.show_id AND movie_show.show_date=? AND movie_show.show_time=?;");
                    ps1.setString(1, moviedate);
                    ps1.setString(2, time);
                    ResultSet rs1=ps1.executeQuery();

                    while (rs1.next()) {
                        
                        int bookedSeatcount =rs1.getInt(1); */

                        if(availableseats<=0)
                        {
                            String message = "There are no bookings available on the date you selected!!";
                            request.setAttribute("message", message);
                            request.getRequestDispatcher("/datetime.jsp").forward(request, response);
                        }
                        else
                        {
                           // PreparedStatement ps2=con.prepareStatement("INSERT INTO movie_show(show_date,show_time) VALUES(?,?)");
                            //ps2.setString(1, moviedate);
                            //ps2.setString(2, time);
                            //ps2.executeUpdate();

                            // Redirect the user to the Seat book page
                            response.sendRedirect("seat.jsp");

                        }

                  //}

                }

            }
         }
        
        catch(Exception e)
        {
            
            out.print(e);
        }       
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
