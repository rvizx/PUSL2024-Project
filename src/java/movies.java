
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
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@WebServlet(urlPatterns = {"/movies"})
public class movies extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        HashMap<String, Object> info = new HashMap<>();
        PrintWriter out = response.getWriter();

        try {
            String driverName = "com.mysql.jdbc.Driver";
            String connectionUrl = "jdbc:mysql://localhost:3306/";
            String dbName = "abc_cinema";
            String userId = "pmauser";
            String password = "123NxUok4IL4pW9GvkJF8gO1C6MyRFed";

            String m_id = request.getParameter("data");
            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;
            connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
            statement = connection.createStatement();
            String sql = "SELECT * FROM movie WHERE m_id=1";
            resultSet = statement.executeQuery(sql);
            resultSet.next();
            String m_name = resultSet.getString("m_name");

            info.put("m_id", m_id);
            info.put("m_name", m_name);            
            
            session.setAttribute("info", info);
            
            String newe = (String) info.get("m_id");
            response.sendRedirect("/date_time.jsp");
        } catch (Exception e) {
            out.print(e);
        }
    }

}
