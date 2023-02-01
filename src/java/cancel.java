import java.sql.PreparedStatement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

/**
 *
 * @author rvz
 */
@WebServlet(urlPatterns = {"/cancel"})
public class cancel extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String booking_id = request.getParameter("bid");
            HttpSession session = request.getSession();
            // db configurations
            PrintWriter out = response.getWriter();
            Connection con = null;
            Statement st = null;

            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/abc_cinema", "pmauser", "123NxUok4IL4pW9GvkJF8gO1C6MyRFed");
            st = con.createStatement();

            PreparedStatement ps = con.prepareStatement("SELECT * FROM booking where booking_id = ?");
            ps.setString(1, booking_id);
            ResultSet rs = ps.executeQuery();

            PreparedStatement ps2 = con.prepareStatement("SELECT movie.m_name  FROM movie JOIN shows ON movie.m_id = shows.m_id JOIN ticket ON ticket.date_time = shows.date_time JOIN booking ON booking.t_id = ticket.t_id WHERE booking.booking_id = ?");
            ps2.setString(1, booking_id);
            ResultSet rs2 = ps2.executeQuery();
            rs2.next();
            String movie = rs2.getString("m_name");

            PreparedStatement ps3 = con.prepareStatement("SELECT ticket.date_time FROM ticket JOIN booking ON booking.t_id = ticket.t_id WHERE booking.booking_id = ?");
            ps3.setString(1, booking_id);
            ResultSet rs3 = ps3.executeQuery();
            rs3.next();
            String date_time = rs3.getString("date_time");

            PreparedStatement ps5 = con.prepareStatement("SELECT customer.email FROM customer JOIN ticket ON ticket.c_id = customer.c_id JOIN booking ON ticket.t_id = booking.t_id WHERE booking.booking_id = ?");
            ps5.setString(1, booking_id);
            ResultSet rs5 = ps5.executeQuery();
            rs5.next();
            String email = rs5.getString("email");
            
             PreparedStatement ps8 = con.prepareStatement("UPDATE seat SET seat_status = 'available' WHERE seat_no IN (SELECT seat_no FROM ticket WHERE t_id = (SELECT t_id FROM booking WHERE booking_id = ?)) AND date_time = ?;");
             ps8.setString(1, booking_id);
             ps8.setString(2, booking_id);
             ps8.executeUpdate();

            //if the booking id-exists
            if (rs.next()) {
                
                PreparedStatement ps6 = con.prepareStatement("SET FOREIGN_KEY_CHECKS=0");
                ps6.executeUpdate();
                
                PreparedStatement ps4 = con.prepareStatement("DELETE FROM ticket WHERE t_id IN (SELECT t.t_id FROM ticket t  JOIN booking b ON t.t_id = b.t_id  WHERE b.booking_id = ? AND t.date_time = ?)");
                
                PreparedStatement ps7 = con.prepareStatement("SET FOREIGN_KEY_CHECKS=1");
                ps6.executeUpdate();
                
                ps4.setString(1, booking_id);
                ps4.setString(2, date_time);
                int rowsDeleted = ps4.executeUpdate();
                if (rowsDeleted > 0){

                    final String username = "abccinema.colombo@gmail.com";  
                    final String password = "wyjeiqiichplxurl";

                    Properties props = new Properties();
                    props.put("mail.smtp.auth", "true");
                    props.put("mail.smtp.starttls.enable", "true");
                    props.put("mail.smtp.host", "smtp.gmail.com");
                    props.put("mail.smtp.port", "587");

                    Session mailsession = Session.getInstance(props,
                            new javax.mail.Authenticator() {
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(username, password);
                        }
                    });

                    try {
                        Message message = new MimeMessage(mailsession);
                        message.setFrom(new InternetAddress(username));
                        message.setRecipients(Message.RecipientType.TO,
                                InternetAddress.parse(email));
                        message.setSubject("ABC Cienma - Ticket Booking");

                        String template = ""
                                + "Booking Cancellation at ABC Cinema\n\n"
                                + "Dear Customer,\n\n"
                                + "This is to inform you that your booking for " + movie + " on " + date_time + "has been cancelled sucessfully.\n"
                                + "We apologize for any inconvenience that may have caused."
                                + "If you have any questions or concerns, please don't hesitate to contact us.\n\n"
                                + "Best regards,\n"
                                + "ABC Cinema\n"
                                + "";
                        message.setText(template);
                        Transport.send(message);
                        request.getRequestDispatcher("/index.jsp").forward(request, response);
                    } catch (Exception e) {
                                   out.print(e);
                    }

                }

            } else {

                //if the booking id doesn't exists                
                String message = "An error occured!";
                out.print(message);
                request.setAttribute("message", message);
                
            }
        } catch (Exception e) {

        }

    }

}
