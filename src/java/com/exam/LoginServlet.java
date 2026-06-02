 import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

 protected void doPost(HttpServletRequest req, HttpServletResponse res)
 throws IOException {

  String email=req.getParameter("email");
  String pass=req.getParameter("password");

  try{
    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con=DriverManager.getConnection(
      "jdbc:mysql://localhost:3306/exam_db","root","root");

    PreparedStatement ps=con.prepareStatement(
      "SELECT * FROM users WHERE email=? AND password=?");

    ps.setString(1,email);
    ps.setString(2,pass);

    ResultSet rs=ps.executeQuery();

    if(rs.next()){
        HttpSession s =req.getSession();
        s.setAttribute("user", email);
      res.sendRedirect("dashboard.jsp");
    } else {
      res.getWriter().println("Invalid Login");
    }

  }catch(Exception e){
    e.printStackTrace();
  }
 }
}