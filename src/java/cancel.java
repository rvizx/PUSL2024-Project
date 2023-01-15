
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
import java.util.Properties;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
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
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
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

                    final String username = "abccinema.colombo@gmail.com"; // your email
                    final String password = "";  // your password

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
                        message.setText("<!DOCTYPE html>"
                                + "<html>"
                                + "<head>"
                                + "<title>Confirmation of your booking at ABC Cinema</title>"
                                + "</head>"
                                + "<body>"
                                + "<p>Dear Customer,</p>"
                                + "<p>. You have successfully booked seat(s) for <strong></strong> on <strong></strong>.</p>"
                                + "<p>We are really looking forward to welcoming you to ABC Cinema and hope you have an enjoyable experience.</p>"
                                + "<p>In case you need to cancel your booking, please click on the following button:</p>"
                                + "<p><a href='' style='padding: 8px 12px; background-color: #ff0000; color: #fff; text-decoration: none;'>Cancel Booking</a></p>"
                                + "<p>Please note that once you click the button, your booking will be cancelled, and the seats will be released for others to book.</p>"
                                + "<p>Please let us know if you have any questions.</p>"
                                + "<p>Best regards,</p>"
                                + "<p>[Your name]</p>"
                                + "<p>ABC Cinema</p>"
                                + "</body>"
                                + "</html>");

                        Transport.send(message);

                        System.out.println("Email sent successfully");

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
