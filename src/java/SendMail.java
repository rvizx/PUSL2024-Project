import java.io.IOException;
import java.io.PrintWriter;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author rvz
 */

@WebServlet(urlPatterns = {"/SendMail"})
public class SendMail extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        HttpSession httpsession = request.getSession();
        HashMap<String, Object> info = (HashMap<String, Object>) httpsession.getAttribute("info");
        String bid = (String) info.get("bid");
        
        String domain = "localhost";
        String port = "8080";
        String reset_link = "http://"+domain+":"+port+"/cancel?"+bid;
        
        String email =  (String) info.get("email");
        if(email == null) {
            out.print("[!] email doesn't exist in the session");
            return;
        }        
        final String username = "abccinema.colombo@gmail.com"; // your email
        final String password = "";  // your password

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {
            
            
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(email));
            message.setSubject("ABC Cienma - Ticket Booking");
            message.setText("Dear Customer,"
                    + "\n\n You've successfully booked your tickets."
                    + "If you wish to cancel these tickets please click the following link at least 3 days before the show date."
                    + "Reset : " +reset_link
                    + "Thank you, "
                    + "ABC Cinema ");

            Transport.send(message);

            System.out.println("Email sent successfully");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

    }
}

    

