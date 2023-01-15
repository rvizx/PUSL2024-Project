
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sanid
 */
@WebServlet(urlPatterns = {"/feedbackmessage"})
public class feedbackmessage extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String message = request.getParameter("adminmsg");

        try {

            // db configurations
            PrintWriter out = response.getWriter();
            Connection con = null;
            Statement st = null;

            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/abc_cinema", "root", "");
            st = con.createStatement();

            String query = "INSERT INTO `admin_message` (msg_id, message) VALUES (NULL, '"+message+"')";
            st.executeUpdate(query);

            String infomsg1 = "Feedback sent sucessfully!";
            request.setAttribute("message", infomsg1);
            request.getRequestDispatcher("/admin/apfeedback.jsp").forward(request, response);

        } catch (ClassNotFoundException | SQLException e) {

        }
    }

}
