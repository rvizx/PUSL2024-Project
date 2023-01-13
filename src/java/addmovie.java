import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.concurrent.TimeUnit;
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
@WebServlet(urlPatterns = {"/addmovie"})
public class addmovie extends HttpServlet {

   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
  
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String name=request.getParameter("moviename");
        String language=request.getParameter("movielanguage"); 
        String status=request.getParameter("moviestatus");
        String genre=request.getParameter("moviegenre");
        String runtime=request.getParameter("movieruntime"); 
        String description=request.getParameter("moviedescription");
        String trailer=request.getParameter("moviedtrailer");
            
    try{
            Connection con=null;        
            Statement st=null;
        
            Class.forName("com.mysql.jdbc.Driver");
            con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/abc_cinema","root","");
            st=con.createStatement();
            
            // insert the feedback message into the database
            PreparedStatement ps1=con.prepareStatement("INSERT INTO movie(m_name,m_language,genre,runtime,description,trailer_link,m_status) VALUES(?,?,?,?,?,?,?)");
            ps1.setString(1, name);
            ps1.setString(2, language);
            ps1.setString(3, genre);
            ps1.setString(4, runtime);
            ps1.setString(5, description);
            ps1.setString(6, trailer);
            ps1.setString(7, status);
            ps1.executeUpdate();
            
            String sucessmsg = "Movie Data was entered succesfully!!"; 
            request.setAttribute("message", sucessmsg);
            request.getRequestDispatcher("admin/movie.jsp").forward(request, response);  

        }
            
    catch(ClassNotFoundException | SQLException e){
        
        PrintWriter out=response.getWriter();
        out.print(e);
                
        } 
    

    }

}
