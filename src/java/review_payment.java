
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

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.paypal.api.payments.*;
import com.paypal.base.rest.PayPalRESTException;

/**
 *
 * @author sanid
 */
@WebServlet(urlPatterns = {"/review_payment"})
public class review_payment extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public review_payment() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerID");

        try {
            PaymentServices paymentServices = new PaymentServices();
            Payment payment = paymentServices.getPaymentDetails(paymentId);

            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);
            ShippingAddress shippingAddress = transaction.getItemList().getShippingAddress();

            request.setAttribute("payer", payerInfo);
            request.setAttribute("transaction", transaction);
            request.setAttribute("shippingAddress", shippingAddress);

            String url = "review.jsp?paymentId=" + paymentId + "&PayerID=" + payerId;

           

            
            // send mail
            
            PrintWriter out = response.getWriter();
            HttpSession httpsession = request.getSession();
            HashMap<String, Object> info = (HashMap<String, Object>) httpsession.getAttribute("info");
            String bid = (String) info.get("bid");
            String m_id = "";
            String TicketAmount = "";
            String date_time = "";

            m_id = (String) info.get("m_id");
            date_time = (String) info.get("date_time");
            TicketAmount = (String) info.get("TicketAmount");

            String domain = "localhost";
            String port = "8080";
            String reset_link = "http://" + domain + ":" + port + "/cancel?bid=" + bid;

            String email = (String) info.get("email");
            if (email == null) {
                out.print("[!] email doesn't exist in the session");
                return;
            }
            final String username = "abccinema.colombo@gmail.com"; // your email
            final String password = "wyjeiqiichplxurl";  // your password

            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");

            Session session = Session.getInstance(props,
                    new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });

            try {
                String driverName = "com.mysql.jdbc.Driver";
                String connectionUrl = "jdbc:mysql://localhost:3306/";
                String dbName = "abc_cinema";
                String userId = "pmauser";
                String dbpassword = "123NxUok4IL4pW9GvkJF8gO1C6MyRFed";

                Connection connection = null;
                Statement statement = null;
                ResultSet resultSet = null;
                connection = DriverManager.getConnection(connectionUrl + dbName, userId, dbpassword);
                statement = connection.createStatement();
                String sql = "SELECT * FROM movie WHERE m_id=" + m_id;
                resultSet = statement.executeQuery(sql);
                resultSet.next();
                String m_name = resultSet.getString("m_name");

                Message message = new MimeMessage(session);
                message.setFrom(new InternetAddress(username));
                message.setRecipients(Message.RecipientType.TO,
                        InternetAddress.parse(email));
                message.setSubject("ABC Cienma - Ticket Booking");
                message.setText(""
                        + "Confirmation of your booking at ABC Cinema\n"
                        + ""
                        + ""
                        + "Dear Customer,\n"
                        + "\nYou have successfully booked " + TicketAmount + " seat(s) for " + m_name + " on " + date_time + ""
                        + "We are really looking forward to welcoming you to ABC Cinema and hope you have an enjoyable experience."
                        + "In case you need to cancel your booking, please click on the following link:"
                        +  reset_link
                        + "\n . Please note that once you click the button, your booking will be cancelled, and the seats will be released for others to book."
                        + "Please let us know if you have any questions."
                        + "\nBest regards,"
                        + "\nABC Cinema"
                        + "");

                Transport.send(message);
               
                
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            } catch (SQLException ex) {
                Logger.getLogger(review_payment.class.getName()).log(Level.SEVERE, null, ex);
            }
            
             request.getRequestDispatcher(url).forward(request, response);

        } catch (PayPalRESTException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }

    }

}
