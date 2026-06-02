 import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {

 protected void doGet(HttpServletRequest req, HttpServletResponse res)
 throws IOException {

  HttpSession session = req.getSession();

  session.invalidate();  

  res.sendRedirect("index.html");   
 }
}