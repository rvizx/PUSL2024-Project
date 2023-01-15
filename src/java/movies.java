import java.io.IOException;
import java.io.PrintWriter;
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
            PrintWriter out=response.getWriter();
            
        
        try{
            String m_id = request.getParameter("data");                                    
            info.put("m_id", m_id);
            session.setAttribute("info", info);
            String newe = (String) info.get("m_id");
            response.sendRedirect("/date_time.jsp");
        }
        
        catch(Exception e){                        
            out.print(e);
        }
    }  

}
