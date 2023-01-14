import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sanid
 */
@WebServlet(urlPatterns = {"/addstaff"})
public class addstaff extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String name=request.getParameter("empname");
        String mail=request.getParameter("empmail"); 
        String password=request.getParameter("emppassword");

            
    try{
                        
            String HashedPassword = null;             
            // MessageDigest instance for MD5.  
            MessageDigest m = MessageDigest.getInstance("MD5");                
            // Add plain-text password bytes to digest using MD5 update() method. 
            m.update(password.getBytes());      
            // Convert the hash value into bytes
            byte[] bytes = m.digest();  
            // The bytes array has bytes in decimal form. Converting it into hexadecimal format.  
            StringBuilder s = new StringBuilder();  
                for(int i=0; i< bytes.length ;i++)  
                {  
                    s.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));  
                }                
            // Complete hashed password in hexadecimal format  
            HashedPassword = s.toString(); 
        
            Connection con=null;        
            Statement st=null;
        
            Class.forName("com.mysql.jdbc.Driver");
            con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/abc_cinema","root","");
            st=con.createStatement();
            
            // insert the feedback message into the database
            PreparedStatement ps1=con.prepareStatement("INSERT INTO employee(name,email,password) VALUES(?,?,?)");
            ps1.setString(1, name);
            ps1.setString(2, mail);
            ps1.setString(3, HashedPassword);

            ps1.executeUpdate();
            
            String sucessmsg = "Staff member Data was entered succesfully!!"; 
            request.setAttribute("message", sucessmsg);
            request.getRequestDispatcher("admin/addemployee.jsp").forward(request, response);  

        }
            
    catch(ClassNotFoundException | SQLException e){
        
        PrintWriter out=response.getWriter();
        out.print(e);
                
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(addstaff.class.getName()).log(Level.SEVERE, null, ex);
        } 

    }

}