/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
 
import com.paypal.base.rest.PayPalRESTException;
import java.util.HashMap;

/**
 *
 * @author sanid
 */
@WebServlet(urlPatterns = {"/authorize_payment"})
public class authorizepayment extends HttpServlet {
    
    public authorizepayment() {
    }
 
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();  
        
        //map
        HashMap<String, Object> info = (HashMap<String, Object>) session.getAttribute("info");
        String price = (String) info.get("price");
       
        String product = request.getParameter("product");
        String subtotal =price;
        String shipping = "0";
        String tax = "0" ;
        String total = price;
         
        OrderDetail orderDetail = new OrderDetail(product, subtotal, shipping, tax, total);        
      
        try {
            PaymentServices paymentServices = new PaymentServices();
            String approvalLink = paymentServices.authorizePayment(orderDetail);
 
            response.sendRedirect(approvalLink);
             
        } catch (PayPalRESTException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

   

}
