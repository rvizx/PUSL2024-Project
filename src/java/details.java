
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
import java.sql.SQLException;
import java.util.HashMap;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.Instant;

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

        try {

            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("mobile");
            HttpSession session = request.getSession();

            //map
            HashMap<String, Object> info = (HashMap<String, Object>) session.getAttribute("info");
            info.put("name", name);
            info.put("email", email);
            info.put("phone", phone);

            // db configurations
            PrintWriter out = response.getWriter();
            Connection con = null;
            Statement st = null;

            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/abc_cinema", "pmauser", "123NxUok4IL4pW9GvkJF8gO1C6MyRFed");
            st = con.createStatement();

            PreparedStatement ps = con.prepareStatement("SELECT * FROM customer WHERE email = ?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                //A user with this email already exists - no need to add warnings at fron-end
                //String message = "process complete! (email already exists.)"; //remove this
                //request.setAttribute("message", message);
                //request.getRequestDispatcher("/details.jsp").forward(request, response);
               

            } else {

                // insert the new user into the database
                PreparedStatement ps1 = con.prepareStatement("INSERT INTO customer(name,mobile,email) VALUES(?,?,?)");
                ps1.setString(1, name);
                ps1.setString(2, phone);
                ps1.setString(3, email);
                ps1.executeUpdate();

            }
            //response.sendRedirect("/payment.jsp");

            //insert rest of the values to the database

            //seat
            String[] seatNames = (String[]) info.get("seats");

            //get seat number -> set as fk
            PreparedStatement ps3 = con.prepareStatement("SELECT c_id FROM customer WHERE email = ?");
            ps3.setString(1, email);
            ResultSet rs3 = ps3.executeQuery();
            rs3.next();
            String c_id = rs3.getString("c_id");
            String date_time = (String) info.get("date_time");
            String tickets = (String) info.get("TicketAmount");

            //tickets 
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/abc_cinema", "pmauser", "123NxUok4IL4pW9GvkJF8gO1C6MyRFed");
            st = con.createStatement();

            //// INSERT INTO ticket(seat_no,c_id,date_time,t_id)  VALUES(?,DEFAULT,?,DEFAULT)                        
            
            for (int i = 1; i < seatNames.length; i++) {
                String sql = "INSERT INTO ticket(seat_no,c_id,date_time) VALUES (?, ?, ?)";
                PreparedStatement statement = con.prepareStatement(sql);
                statement.setString(1, seatNames[i]);
                statement.setString(2, c_id);
                statement.setString(3,date_time);
                statement.executeUpdate();
            }
                                    
            
        // generate md5 hash of current time to make it unique
        MessageDigest md5 = MessageDigest.getInstance("MD5");
        byte[] currentTimeBytes = Long.toString(Instant.now().toEpochMilli()).getBytes();
        byte[] emailBytes = email.getBytes();
        byte[] combinedBytes = new byte[currentTimeBytes.length + emailBytes.length];
        System.arraycopy(currentTimeBytes, 0, combinedBytes, 0, currentTimeBytes.length);
        System.arraycopy(emailBytes, 0, combinedBytes, currentTimeBytes.length, emailBytes.length);
        byte[] hashBytes = md5.digest(combinedBytes);
        StringBuilder sb = new StringBuilder();
        for (byte b : hashBytes) {
            sb.append(String.format("%02x", b & 0xff));
        }
        String hash = sb.toString();            
            
                        
            PreparedStatement ps4=con.prepareStatement("SELECT ticket.t_id FROM ticket JOIN customer ON ticket.c_id = customer.c_id WHERE customer.email = ? LIMIT 1");
            ps4.setString(1, email);
            ResultSet rs4=ps4.executeQuery();
                         
            rs4.next();
            String t_id = rs4.getString("t_id");

            PreparedStatement ps5 = con.prepareStatement("INSERT INTO booking(booking_id,t_id) VALUES(?,?)");
                ps5.setString(1, hash);
                ps5.setInt(2, Integer.parseInt(t_id));
                ps5.executeUpdate();  
                              
            info.put("bid", hash);                
            response.sendRedirect("authorize_payment");

        } catch (Exception e) {
            PrintWriter out = response.getWriter();
            out.print(e);
        }

    }

}
