/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

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
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author rvz
 */
@WebServlet(urlPatterns = {"/forgotpassword"})
public class forgotpassword extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try
        {

        String email=request.getParameter("email");        
        // database configurations
        PrintWriter out=response.getWriter();        
        Connection con=null;        
        Statement st=null;
        
          Class.forName("com.mysql.jdbc.Driver");
          con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/abc_cinema","root","");
          st=con.createStatement();
            
          PreparedStatement ps=con.prepareStatement("SELECT email FROM customer WHERE email=?");
          ps.setString(1, email);
                      
          ResultSet rs=ps.executeQuery();
            
            
            if(rs.next())
                {                
                    // if the email exists on the database -> generate password reset link
                    
                    // generate random hash
                    Random random = new Random();
                    MessageDigest messageDigest = MessageDigest.getInstance("MD5");
                    byte[] bytes = new byte[32];
                    random.nextBytes(bytes);
                    messageDigest.update(bytes);
                    byte[] hash = messageDigest.digest();
                    StringBuilder sb = new StringBuilder();
                    //bytes to hex
                    for (byte b : hash) {                       
                        sb.append(String.format("%02x", b)); 
                    }                    
                    
                    String hashString = sb.toString();            
                    
                    //creating necessary directories to randomize the url for the password reset link
                    File directory1 = new File("../../web/" + hashString);
                    directory1.mkdir();
                    File directory2 = new File(hashString);
                    directory1.mkdir();
                    
                    //copying servlet to the generated folder                    
                    Path source = Paths.get("../../secret/reset_passowrd.java");
                    Path target = Paths.get(hashString + "/reset_password.java");
                    Files.copy(source, target);              
                    
                    //add the updated reset-password jsp in here 89 ->
                    String jsp = "<!DOCTYPE html>\n"
                            + "<html>\n"
                            + "<head>\n"
                            + "  <title>Password Reset</title>\n"
                            + "</head>\n"
                            + "<body>\n"
                            + "  <h1>Password Reset</h1>\n"
                            + "  <form action='" + hashString + "/reset' method='post'>\n"
                            + "    <label for='email'>Email:</label><br>\n"
                            + "    <input type='email' id='email' name='email'><br>\n"
                            + "    <input type='submit' value='Send reset link'>\n"
                            + "  </form> \n"
                            + "</body>\n"
                            + "</html>";                    
                    
                    Path target2 = Paths.get("../../web/" + hashString + "/ResetPassword.jsp");
                    Files.write(target2, jsp.getBytes());
                    
                    
                    //generate a password reset link
                    String reset_link = "https://localhost:8080/reset-password/"+hashString+"/ResetPassword.jsp";

                    //send email to the user 
                    Properties properties = new Properties();
                    properties.put("mail.smtp.auth", "true");
                    properties.put("mail.smtp.starttls.enable", "true");
                    properties.put("mail.smtp.host", "smtp.gmail.com");
                    properties.put("mail.smtp.port", "587");

                    //email credentials -  UPDATE THIS TO GET CREDENTIALS FROM THE DATABASE?
                    final String username = "abccinema.colombo@gmail.com"; 
                    final String password = "Abc@12345";
                    
                    //creating a session
                    Session session = Session.getInstance(properties,
                            new javax.mail.Authenticator() {
                                @Override
                                protected PasswordAuthentication getPasswordAuthentication() {
                                    return new PasswordAuthentication(username, password);
                                }
                            });
                   
                        try {
                                    Message message = new MimeMessage(session);
                                    message.setFrom(new InternetAddress(username));
                                    message.setRecipients(Message.RecipientType.TO,
                                            InternetAddress.parse(email));
                                    message.setSubject("ABC Cienma - Password Reset Instructions ");
                                    message.setText(""
                                            + "Dear customer, <br> We've noticed that you've requested a password reset for you account that created from"+email+". "
                                                    + "Indorder to complete this process visit the following link and create a new password. "
                                                    + "Note: This link will be disabled in 5 mintues. <br> "
                                            +reset_link
                                            +"<br> Thank you, ABC Cinema. <br> "
                                                    + "<i>please note that this is an automatically generated email and do not reply to this email.<i>");      
                                    Transport.send(message);
                                    System.out.println("Email sent successfully");      
      
                        } catch (MessagingException e) {
                        }
                        
                        
                  //inorder to make the links invalid -> delete the directories that have the copied jsp and servlet
                  Thread.sleep(300000); // sleep 5 minutes
                      File dir = new File("../../web/" + hashString);
                      deleteDirectory(dir);
                      File dir2 = new File("../../web/" + hashString);
                      deleteDirectory(dir2);
                      
                }
                    
                                
          String message = "if your email already registered on our system, you'll recieve an email. please check spam folders as well.";
          request.setAttribute("message", message);
          request.getRequestDispatcher("/index.jsp").forward(request, response);                 
                       
        }
        
        catch(IOException | ClassNotFoundException | InterruptedException | NoSuchAlgorithmException | SQLException | ServletException e)
            {
                PrintWriter out=response.getWriter();
                out.print(e);
            }
        
       
    }

    private static void deleteDirectory(File directory) {
        File[] files = directory.listFiles();
        if (files != null) {
            for (File file : files) {
                if (file.isDirectory()) {
                    deleteDirectory(file);
            } else {
                    file.delete();
                }
            }
        }
    directory.delete();
  }
 
}