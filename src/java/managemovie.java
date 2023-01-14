/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sanid
 */
@WebServlet(urlPatterns = {"/managemovie"})
public class managemovie extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String mid = request.getParameter("movieID");
        request.setAttribute("MID", mid);
        request.getRequestDispatcher("admin/managemovie.jsp").forward(request, response);

        response.sendRedirect("admin/managemovie.jsp");
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/managemovie.jsp");
        dispatcher.forward(request, response);

    }

}
