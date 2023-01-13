
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

        PrintWriter out = response.getWriter();
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            // Connect to the database
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/abc_cinema", "root", "");
            stmt = con.createStatement();
            // Execute the SQL query and store the results in a ResultSet
            rs = stmt.executeQuery("SELECT m_name FROM movie");
            // Create a StringBuilder to hold the options
            StringBuilder options = new StringBuilder();
            // Iterate through the ResultSet
            while (rs.next()) {
                // Get the values from the ResultSet
                String mname = rs.getString("m_name");
                out.println(mname);

                // Append an option tag to the StringBuilder
                options.append("<option value='").append(mname).append("'>").append(mname).append("</option>\n");
            }
            out.println(options);
            // Set the options as an attribute on the request
            request.setAttribute("options", options.toString());
            // Forward the request to the JSP page
            request.getRequestDispatcher("admin/show.jsp").forward(request, response);
        } catch (SQLException e) {
            // Handle any SQL exceptions
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(showdetails.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                // Close the ResultSet, Statement, and Connection
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (con != null) {
                    con.close();
                }

            } catch (SQLException e) {
                // Handle any SQL exceptions
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            // Connect to the database
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/abc_cinema", "root", "");
            stmt = con.createStatement();
            // Execute the SQL query and store the results in a ResultSet
            rs = stmt.executeQuery("SELECT * FROM employee");
            // Store the ResultSet in a request attribute
            request.setAttribute("resultSet", rs);
            // Forward the request to the JSP page
            request.getRequestDispatcher("admin/staffdetails.jsp").forward(request, response);

        } catch (SQLException e) {
            // Handle any SQL exceptions
        } finally {

            try {
                // Close the ResultSet, Statement, and Connection
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                // Handle any SQL exceptions
            }
        }

    }

}
