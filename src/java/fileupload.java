/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
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
@WebServlet(urlPatterns = {"/fileupload"})
@MultipartConfig
public class fileupload extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out=response.getWriter();

        String Number = request.getParameter("num");

        Part filePart = request.getPart("file");
        
        String fileName=filePart.getSubmittedFileName();
        
        String newFileName = "card_"+Number+".png";
        
        String uploadPath = getServletContext().getRealPath("/"+"TestImg"+File.separator+newFileName); 
        
        InputStream is=filePart.getInputStream();
        
        boolean succs=UploadFile(is,uploadPath);
        
        if(succs){
            out.println("File upload directory: -"+uploadPath);
        }
        else{
            out.println("Error");
        }
        
        
         
    }
    
    public boolean UploadFile(InputStream is,String Path){
       
        boolean test=false;
        
        try{
            byte byt[]=new byte[is.available()];
            is.read();
            
            try (FileOutputStream fops = new FileOutputStream(Path)) {
                fops.write(byt);
                fops.flush();
            }
            
            test=true;
            
        }catch(IOException e){
        }
        
        
        
        return test;
        
    }

}
