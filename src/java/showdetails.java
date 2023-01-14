
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(urlPatterns = {"/showdetails"})
public class showdetails extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String movie = request.getParameter("movie");
        String empID="4";

        String datetime = date + " " + time;
        try {
            Connection con = null;
            Statement st = null;
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/abc_cinema", "root", "");
            st = con.createStatement();

            PreparedStatement ps = con.prepareStatement("SELECT m_id FROM movie WHERE m_name=?");
            ps.setString(1, movie);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                
                String m_id = rs.getString("m_id");
                
                PreparedStatement ps1 = con.prepareStatement("INSERT INTO SHOWS VALUES(?,?,?)");
                ps1.setString(1, datetime);
                ps1.setString(2, m_id);
                ps1.setString(3, empID);

                ResultSet rs1 = ps1.executeQuery();
                

            } else {

                String message = "Invalid email or password!";
                request.setAttribute("message", message);
                request.getRequestDispatcher("/emplogin.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            // Handle any SQL exceptions

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(showdetails.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
