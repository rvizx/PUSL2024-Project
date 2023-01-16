
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
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
@WebServlet(urlPatterns = {"/fileupload2"})
public class fileupload2 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out= response.getWriter();

        Part filePart = request.getPart("file"); // Retrieves <input type="file" name="file">
        
        String Number=request.getParameter("num");
        
        String fileName = "card_"+Number+".png";
        
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
            response.getWriter().write("File uploaded successfully");
            outputStream.flush();
        }
    catch (FileNotFoundException e) {
    System.out.println("File not found at the specified location, please check the path or permissions " + e);
}

     
}

}
