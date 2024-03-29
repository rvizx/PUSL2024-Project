
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

/**
 *
 * @author rvz
 *
 */
// get seat names of already booked seats
@WebServlet(urlPatterns = {"/bookseats"})
public class bookseats extends HttpServlet {

    // add booked seats to the database
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            //getting the seat names from the front-end and put it into an array
            String seats = request.getParameter("selectedSeats");
            String[] seatNames = seats.split(",");
            String TicketAmount = String.valueOf(seatNames.length);
            String price = String.valueOf(seatNames.length * 800);

            HttpSession session = request.getSession();
            HashMap<String, Object> info = (HashMap<String, Object>) session.getAttribute("info");
            info.put("seats", seatNames);
            info.put("TicketAmount", TicketAmount);
            info.put("price", price);

            // if no seats we're selected 
            if (seatNames == null || seatNames.length == 0) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "No seats were selected");
                return;
            }

            PrintWriter out = response.getWriter();
            Connection con = null;
            Statement st = null;

            // avoid booking collisions
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/abc_cinema", "pmauser", "123NxUok4IL4pW9GvkJF8gO1C6MyRFed");
                st = con.createStatement();

                String date_time = (String) info.get("date_time");
                String sql = "SELECT seat_status from seat WHERE date_time='"+date_time+"' AND seat_no IN (?";
                for (int i = 0; i < seatNames.length; i++) {
                    sql += ",?";
                }
                sql += ")";
                
                PreparedStatement stmt = con.prepareStatement(sql);
                stmt.setString(1, date_time);
                for (int i = 0; i < seatNames.length; i++) {
                    stmt.setString(i + 2, seatNames[i]);
                }
                ResultSet result = stmt.executeQuery();

                boolean isReserved = false;
                while (result.next()) {
                    if (result.getString("seat_status").equals("reserved")) {
                        isReserved = true;
                        break;
                    }
                }

                
                if (isReserved) {
                    response.sendRedirect("bookingseat.jsp");
                } else {

                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/abc_cinema", "pmauser", "123NxUok4IL4pW9GvkJF8gO1C6MyRFed");
                        st = con.createStatement();

                        String sql2 = "UPDATE seat SET seat_status ='reserved'  WHERE date_time = '"+ date_time +"' AND seat_no IN (?";
                        for (int i = 1; i < seatNames.length; i++) {
                            sql2 += ",?";
                        }
                        sql2 += ")";
                        
                        PreparedStatement ps2 = con.prepareStatement(sql2);
                        for (int i = 1; i <= seatNames.length; i++) {
                            ps2.setString(i, seatNames[i - 1]);
                        }

                        int rowsUpdated = ps2.executeUpdate();
                        if (rowsUpdated == seatNames.length) {
                            response.sendRedirect("bookingpayment.jsp");
                            

                        } else {

                            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "an error occured - all the seats were not booked!");
                        }

                    }  catch (Exception e) {                        
                        out.print(e);
                    }
                                                           
                }

            } catch (Exception e) {
                out.print(e);
            }

            session.setAttribute("info", info);

        } catch (Exception e) {
            PrintWriter out = response.getWriter();
            out.print(e);
        }

    }
}
