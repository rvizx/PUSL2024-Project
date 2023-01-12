/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;
/**
 *
 * @author sanid
 */
@WebServlet(urlPatterns = {"/movies"})
public class movies extends HttpServlet {



 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {                              
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            PrintWriter out=response.getWriter();
        
        try{
            //http session
            HttpSession session = request.getSession();
            String m_id = (String) session.getAttribute("m_id");
            out.println(m_id);       //remove this     
            
            Map<String, Object> info = (Map<String, Object>) session.getAttribute("info");
            
            if (m_id==null){
                
                String message = "please select a movie";
                request.setAttribute("message", message);
                request.getRequestDispatcher("/movies.jsp").forward(request, response);                
                response.sendRedirect("/index.jsp");
            }
                        
            else{
                
                info.put("m_id", m_id);
                session.setAttribute("info", info);                
                response.sendRedirect("/date_time.jsp");
            }   
        }
        
        catch(Exception e){                        
            out.print(e);
        }
    }  

}
