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
            
            //HTTP Session
            HttpSession session = request.getSession();        
            String emailsession = (String) session.getAttribute("email");
            out.println(emailsession);
            
           
            
            // Cookie[] loginCookie = request.getCookies();
            //String Cname = loginCookie[0].getName();
            
            //prevoius if condition{sessionemail.getAttribute("email")==null && loginCookie.length == 0 && loginCookie==null}
            
            if (emailsession==null){
                
                String message = "Please login to continue";
                request.setAttribute("message", message);
                request.getRequestDispatcher("/movies.jsp").forward(request, response);
                
                //Redirect the user to the login page
                response.sendRedirect("/index.jsp");
            }
            
            
            else{
                Connection con=null;        
                Statement st=null;
        
                Class.forName("com.mysql.jdbc.Driver");
                con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/abc_cinema","root","");
                st=con.createStatement();
                
                String someName = (String)request.getAttribute("Name");
                out.println(someName);
                
                ServletContext servletcontext = getServletContext();
                String ReferMail = (String)session.getAttribute("Email");
                out.println(ReferMail);
                
                // Redirect the user to the login page
                //response.sendRedirect("/datetime.jsp");
                //PreparedStatement ps=con.prepareStatement("INSERT INTO //Should figure it out//");
                //ps.setString(1, movie);
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
 
                
                
                
                
            }   
        }
        
        catch(Exception e){
            
            
            out.print(e);
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    

}
