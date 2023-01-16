
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.lang.Thread;
import java.sql.SQLException;
import java.util.HashMap;

/**
 *
 * @author rvz
 */
@WebServlet(urlPatterns = {"/details"})
public class details extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("mobile");
            HttpSession session = request.getSession();

            //map
            HashMap<String, Object> info = (HashMap<String, Object>) session.getAttribute("info");
            info.put("name", name);
            info.put("email", email);
            info.put("phone", phone);

            // db configurations
            PrintWriter out = response.getWriter();
            Connection con = null;
            Statement st = null;

            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/abc_cinema", "root", "");
            st = con.createStatement();

            PreparedStatement ps = con.prepareStatement("SELECT * FROM customer WHERE email = ?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // A user with this email already exists - no need to add warnings at fron-end
                String message = "process complete! (email already exists.)"; //remove this
                request.setAttribute("message", message);
                request.getRequestDispatcher("/details.jsp").forward(request, response);

            } else {

                // insert the new user into the database
                PreparedStatement ps1 = con.prepareStatement("INSERT INTO customer(name,mobile,email) VALUES(?,?,?)");
                ps1.setString(1, name);
                ps1.setString(3, phone);
                ps1.setString(4, email);
                ps1.executeUpdate();

                String message = "process comeplete"; //remove this
                request.setAttribute("message", message);
                request.getRequestDispatcher("/details.jsp").forward(request, response);

            }
            response.sendRedirect("/payment.jsp");

            //insert rest of the values to the database
            //seat_numbers
            PreparedStatement ps1 = con.prepareStatement("INSERT INTO seat(name,mobile,email) VALUES(?,?,?)");
            ps1.setString(1, name);
            ps1.setString(2, phone);
            ps1.setString(3, email);
            ps1.executeUpdate();

            //seat
            String[] seatNames = (String[]) info.get("seats");

            //get seat number -> set as fk
            PreparedStatement ps3 = con.prepareStatement("SELECT c_id FROM customer WHERE email = ?");
            ps3.setString(1, email);
            ResultSet rs3 = ps3.executeQuery();
            rs3.next();
            String c_id = rs3.getString("c_id");

            String date_time = (String) info.get("date_time");
            String[] tickets = (String[]) info.get("TicketAmount");

            //tickets 
                   try {
                        Class.forName("com.mysql.jdbc.Driver");
                        con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/abc_cinema", "pmauser", "123NxUok4IL4pW9GvkJF8gO1C6MyRFed");
                        st = con.createStatement();

                        String sql5 = "UPDATE ticket SET seat_no WHERE seat_no IN (?";
                        for (int i = 1; i < seatNames.length; i++) {
                            sql5 += ",?";
                        }
                        sql5+= ")";
                        PreparedStatement ps5 = con.prepareStatement(sql5);

                        for (int i = 1; i <= seatNames.length; i++) {
                            ps3.setString(i, seatNames[i - 1]);
                        }

                        int rowsUpdated = ps3.executeUpdate();
                        if (rowsUpdated == seatNames.length) {
                            response.setStatus(HttpServletResponse.SC_OK);
                        } else {

                            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "an error occured - all the seats were not booked!");
                        }

                    } catch (Exception e) {
                        // An error occurred while connecting to the database or executing the query
                        // e.printStackTrace();
                        // response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while booking the seats");
                        out.print(e);
                    } 

                                        finally {
                        // closing the database resources
                        if (st != null) {
                            try {
                                st.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                        if (con != null) {
                            try {
                                con.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                    }
            response.sendRedirect("authorize_payment");
        } catch (Exception e) {
            PrintWriter out = response.getWriter();
            out.print(e);
        }

    }

}
