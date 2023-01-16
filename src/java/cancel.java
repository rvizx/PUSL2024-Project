
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

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String booking_id = request.getParameter("bid");
            HttpSession session = request.getSession();
            // db configurations
            PrintWriter out = response.getWriter();
            Connection con = null;
            Statement st = null;

            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/abc_cinema", "root", "");
            st = con.createStatement();

            PreparedStatement ps = con.prepareStatement("SELECT * FROM booking where booking_id = ?");
            ps.setString(1, booking_id);
            ResultSet rs = ps.executeQuery();

            PreparedStatement ps2 = con.prepareStatement("SELECT movie.m_name FROM movie JOIN shows ON shows.m_id = movie.m_id JOIN ticket ON ticket.t_id = boooking.t_id;  WHERE booking.booking_id=?; ");
            ps2.setString(1, booking_id);
            ResultSet rs2 = ps2.executeQuery();
            rs2.next();
            String movie = rs2.getString("m_name");

            PreparedStatement ps3 = con.prepareStatement("SELECT ticket.date_time FROM ticket JOIN booking ON ticket.t_id = booking.t_id WHERE booking.booking_id=?");
            ps3.setString(1, booking_id);
            ResultSet rs3 = ps3.executeQuery();
            rs3.next();
            String date_time = rs3.getString("m_name");

            PreparedStatement ps5 = con.prepareStatement("SELECT customer.email FROM customer JOIN ticket ON ticket.c_id = customer.c_id JOIN booking ON ticket.t_id = booking.t_id WHERE booking.booking_id=?");
            ps5.setString(1, booking_id);
            ResultSet rs5 = ps5.executeQuery();
            rs5.next();
            String email = rs5.getString("email");

            //if the booking id-exists
            if (rs.next()) {
                PreparedStatement ps4 = con.prepareStatement("DROP * FROM ticket JOIN booking ON ticket.t_id = booking.t_id WHERE booking.booking_id=?");
                ResultSet rs4 = ps4.executeQuery();
                if (rs4.next()) {

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

                        String template = "<!DOCTYPE html>"
                                + "<html>"
                                + "<head>"
                                + "<title>Booking Cancellation at ABC Cinema</title>"
                                + "</head>"
                                + "<body>"
                                + "<p>Dear Customer,</p>"
                                + "<p>This is to inform you that your booking for <strong>" + movie + "</strong> on <strong>" + date_time + "</strong> has been cancelled sucessfully.</p>"
                                + "<p>We apologize for any inconvenience that may have caused.</p>"
                                + "<p>If you have any questions or concerns, please don't hesitate to contact us.</p>"
                                + "<p>Best regards,</p>"
                                + "<p>ABC Cinema</p>"
                                + "</body>"
                                + "</html>";
                        message.setText(template);
                        Transport.send(message);
                    } catch (MessagingException e) {
                        throw new RuntimeException(e);
                    }

                }

            } else {

                //if the booking id doesn't exists                
                String message = "An error occured!";
                request.setAttribute("message", message);
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
        } catch (Exception e) {
            PrintWriter out = response.getWriter();
            out.print(e);
        }

    }

}
