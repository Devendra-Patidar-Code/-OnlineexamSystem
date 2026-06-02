 import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

 protected void doPost(HttpServletRequest req, HttpServletResponse res)
 throws IOException {

  String name=req.getParameter("name");
  String email=req.getParameter("email");
  String pass=req.getParameter("password");

  try{
    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con=DriverManager.getConnection(
      "jdbc:mysql://localhost:3306/exam_db","root","root");

    PreparedStatement ps=con.prepareStatement(
      "INSERT INTO users(name,email,password) VALUES(?,?,?)");

    ps.setString(1,name);
    ps.setString(2,email);
    ps.setString(3,pass);
    ps.executeUpdate();

    res.sendRedirect("index.html");

  }catch(Exception e){
    e.printStackTrace();
  }
 }
}