import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author sanid
 */
@MultipartConfig
@WebServlet(urlPatterns = {"/addmovie"})
public class addmovie extends HttpServlet {

   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
  
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mid=request.getParameter("movieid");
        int mid1=Integer.parseInt(mid);
        int m_id=mid1-1;
        String movie_id=String.valueOf(m_id);
        
        
        String name=request.getParameter("moviename");
        String language=request.getParameter("movielanguage"); 
        String status=request.getParameter("moviestatus");
        String genre=request.getParameter("moviegenre");
        String runtime=request.getParameter("movieruntime"); 
        String description=request.getParameter("moviedescription");
        String trailer=request.getParameter("moviedtrailer");
            
    try{
        PrintWriter out= response.getWriter();

        Part filePart = request.getPart("img"); 
              
        String fileName = "card_"+mid+".png";
        
        InputStream fileContent = filePart.getInputStream();
        
        String path = getServletContext().getRealPath("/../../web/assets/images")+File.separator+fileName;
        
        //out.println(fileName);
        out.println(path);
        
        
        
       
        try (FileOutputStream outputStream = new FileOutputStream(path)) {
            int read = 0;
            final byte[] bytes = new byte[1024];
            
            while ((read = fileContent.read(bytes)) != -1) {
                outputStream.write(bytes, 0, read);
            }
            
            outputStream.flush();
        }
    catch (FileNotFoundException e) {
    System.out.println("File not found at the specified location, please check the path or permissions " + e);
}
            Connection con=null;        
            Statement st=null;
        
            Class.forName("com.mysql.jdbc.Driver");
            con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/abc_cinema","pmauser","123NxUok4IL4pW9GvkJF8gO1C6MyRFed");
            st=con.createStatement();
            
            // insert the feedback message into the database
            PreparedStatement ps1=con.prepareStatement("UPDATE movie SET m_name=?, m_language=?, genre=?, runtime=?, description=?, trailer_link=?, m_status=? WHERE m_id=?");
            ps1.setString(1, name);
            ps1.setString(2, language);
            ps1.setString(3, genre);
            ps1.setString(4, runtime);
            ps1.setString(5, description);
            ps1.setString(6, trailer);
            ps1.setString(7, status);
            ps1.setString(8, mid);
            ps1.executeUpdate();
            
            String sucessmsg = "Movie Data was entered succesfully!!"; 
            request.setAttribute("message", sucessmsg);
            request.getRequestDispatcher("admin/addmovie.jsp").forward(request, response);  

        }
            
    catch(ClassNotFoundException | SQLException e){
        
        PrintWriter out=response.getWriter();
        out.print(e);
                
        } 
    

    }

}
