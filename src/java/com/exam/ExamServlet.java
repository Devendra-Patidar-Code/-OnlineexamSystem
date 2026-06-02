 import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/ExamServlet")
public class ExamServlet extends HttpServlet {

 protected void doPost(HttpServletRequest req, HttpServletResponse res)
 throws ServletException, IOException {

  int score = 0;
  int total = 0;

  try {

    // 1. Load Driver
    Class.forName("com.mysql.cj.jdbc.Driver");

    // 2. Connect DB
    Connection con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/exam_db","root","root");

    // 3. Get answers from DB
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT answer FROM questions LIMIT 5");

    int i = 1;

    while(rs.next()){
      total++;

      String correct = rs.getString("answer");
      String user = req.getParameter("q"+i);

      if(user != null && user.equals(correct)){
        score++;
      }

      i++;
    }

    // 4. Calculate percentage
    double percentage = (score * 100.0) / total;

    // 🔥 5. Get logged-in user email from session
    HttpSession session = req.getSession();
    String email = (String) session.getAttribute("user");

    int userId = 0;

    // 6. Get user id from users table
    PreparedStatement ps1 = con.prepareStatement(
    "SELECT id FROM users WHERE email=?");

    ps1.setString(1, email);
    ResultSet rs1 = ps1.executeQuery();

    if(rs1.next()){
      userId = rs1.getInt("id");
    }

    // 🔥 7. Save result in DB
    PreparedStatement ps = con.prepareStatement(
    "INSERT INTO results(user_id,score,percentage) VALUES(?,?,?)");

    ps.setInt(1, userId);
    ps.setInt(2, score);
    ps.setDouble(3, percentage);

    ps.executeUpdate();

    // 8. Send result to result.jsp
    req.setAttribute("score", score);
    req.setAttribute("wrong", total - score);
    req.setAttribute("percentage", percentage);

    req.getRequestDispatcher("result.jsp")
       .forward(req, res);

  } catch(Exception e){
    e.printStackTrace();
  }
 }
}