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
@WebServlet(urlPatterns = {"/addshow"})
public class addshow extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String date=request.getParameter("date");
        String time=request.getParameter("time"); 
        String datetime=date+" "+time;
        String movie=request.getParameter("movie");
        
            
    try{
            Connection con=null;        
            Statement st=null;
            ResultSet rs = null;
        
            Class.forName("com.mysql.jdbc.Driver");
            con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/abc_cinema","pmauser","123NxUok4IL4pW9GvkJF8gO1C6MyRFed");
            st=con.createStatement();
            
            PreparedStatement ps=con.prepareStatement("SELECT m_id FROM movie WHERE m_name=?");
            ps.setString(1, movie);
            ResultSet rs1=ps.executeQuery();
            
             if (rs1.next()) {
                 
                    // Get the value of the first column
                    String movieid = rs.getString("m_id");

                    // insert the feedback message into the database
                    PreparedStatement ps1=con.prepareStatement("INSERT INTO shows(date_time,m_id) VALUES(?,?)");
                    ps1.setString(1, datetime);
                    ps1.setString(2, movieid);
                    ps1.executeUpdate();
                    }


                    String sucessmsg = "Show Data was entered succesfully!!"; 
                    request.setAttribute("message", sucessmsg);
                    request.getRequestDispatcher("admin/movie.jsp").forward(request, response);  
            
            
        }
            
    catch(ClassNotFoundException | SQLException e){
        
        PrintWriter out=response.getWriter();
        out.print(e);
                
        } 

    }

}
