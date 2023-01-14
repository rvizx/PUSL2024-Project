
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author sanid
 */
@WebServlet(urlPatterns = {"/updatemoviestatus"})
public class updatemoviestatus extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out= response.getWriter();

        String moviestatus = request.getParameter("moviestatus");
        
        String[] substrings = moviestatus.split("@");
        
        String mid = substrings[0];
        String moviest = substrings[1];
        
        out.println(mid);
        out.println(moviest);
        
        /*
        
        

        try {
            // db configurations
            
            Connection con = null;
            Statement st = null;

            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/abc_cinema", "root", "");
            st = con.createStatement();

            String query="UPDATE movie SET m_status='"+moviest+"' WHERE m_id='"+mid+"'";
 
            st.executeUpdate(query);

            // Redirect the user to the homepage */
            //response.sendRedirect("/admin/moviedetails.jsp");
            
        } /*catch (ClassNotFoundException | SQLException e) {
            
            out.print(e);
        }

    } */

}
