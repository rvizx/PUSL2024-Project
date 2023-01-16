
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
import java.util.HashMap;

@WebServlet(urlPatterns = {"/date_time"})
public class date_time extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        
        String date = request.getParameter("date");
        String time=request.getParameter("time");
        String date_time=date+" "+time;
        
        try {

            //HTTP Session
            HttpSession session = request.getSession();
            HashMap<String, Object> info = (HashMap<String, Object>) session.getAttribute("info");

            Connection con = null;
            Statement st = null;
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/abc_cinema", "pmauser", "123NxUok4IL4pW9GvkJF8gO1C6MyRFed");
            st = con.createStatement();
            PreparedStatement ps = con.prepareStatement("SELECT COUNT(seat_no) FROM seat WHERE seat_status='available' AND date_time=?");
            ps.setString(1, date_time);
            ResultSet rs = ps.executeQuery();

            info.put("date_time", date_time);
            session.setAttribute("info", info);
            rs.next();          
            int availableseats = rs.getInt(1);
            out.print(availableseats); 
            
                if (availableseats <= 0) {
                    String message = "There are no bookings available on the date you selected!!";
                    request.setAttribute("message", message);
                    request.getRequestDispatcher("/date_time.jsp").forward(request, response);
                } else {
                    response.sendRedirect("/bookingseat.jsp");

                }

        } catch (Exception e) {

            out.print(e);
        }
    } 
    
}
