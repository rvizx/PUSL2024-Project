
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;

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
@WebServlet(urlPatterns = {"/emplogin"})
public class emplogin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession empsession = request.getSession();


        PrintWriter out = response.getWriter();

        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            //response.sendRedirect("/date_time.jsp");
            String HashedPassword = null;
            // MessageDigest instance for MD5.  
            MessageDigest m = MessageDigest.getInstance("MD5");
            // Add plain-text password bytes to digest using MD5 update() method. 
            m.update(password.getBytes());
            // Convert the hash value into bytes
            byte[] bytes = m.digest();
            // The bytes array has bytes in decimal form. Converting it into hexadecimal format.  
            StringBuilder s = new StringBuilder();
            for (int i = 0; i < bytes.length; i++) {
                s.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            // Complete hashed password in hexadecimal format  
            HashedPassword = s.toString();

            // db configurations
            Connection con = null;
            Statement st = null;

            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/abc_cinema", "root", "");
            st = con.createStatement();

            PreparedStatement ps = con.prepareStatement("SELECT email FROM employee WHERE email=? AND password=?");
            ps.setString(1, email);
            ps.setString(2, HashedPassword);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                empsession.setAttribute("email", "ADM"+email);

                PreparedStatement ps1 = con.prepareStatement("SELECT email FROM employee,manager WHERE employee.emp_id=manager.emp_id AND email=?");
                ps1.setString(1, email);

                ResultSet rs1 = ps1.executeQuery();
                if (rs1.next()) {

                    response.sendRedirect("admin/adindex.jsp");
                    empsession.setAttribute("email", "A-"+email);

                } else {

                    response.sendRedirect("employee/staffiindex.jsp");
                    empsession.setAttribute("email", "E-"+email);

                }

            } else {

                String message = "Invalid email or password!";
                request.setAttribute("message", message);
                request.getRequestDispatcher("/emplogin.jsp").forward(request, response);
            }

        } catch (IOException | ClassNotFoundException | NoSuchAlgorithmException | SQLException e) {

            out.print(e);
        }

    }

}
