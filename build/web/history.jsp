 <%@ page import="java.sql.*" %>

<%
if(session.getAttribute("user")==null){
 response.sendRedirect("login.html");
}
%>

<html>
<head>
<title>History</title>

<style>
body{
  margin:0;
  font-family:Arial;
  background: linear-gradient(to right,#4facfe,#00f2fe);
  text-align:center;
}

.container{
  background:white;
  width:80%;
  margin:50px auto;
  padding:20px;
  border-radius:15px;
  box-shadow:0 5px 20px rgba(0,0,0,0.3);
}

table{
  width:100%;
  border-collapse:collapse;
  margin-top:20px;
}

th,td{
  padding:10px;
  border:1px solid #ddd;
}

th{
  background:#4facfe;
  color:white;
}

button{
  margin-top:15px;
  padding:10px 20px;
  border:none;
  background:#4facfe;
  color:white;
  border-radius:8px;
  cursor:pointer;
}
</style>

</head>

<body>

<div class="container">

<h2>? Result History</h2>

<table>
<tr>
<th>Name</th>
<th>Score</th>
<th>Percentage</th>
</tr>

<%
Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/exam_db","root","root");

Statement st = con.createStatement();
ResultSet rs = st.executeQuery(
"SELECT users.name, results.score, results.percentage " +
"FROM results JOIN users ON results.user_id = users.id");

while(rs.next()){
%>

<tr>
<td><%=rs.getString("name")%></td>
<td><%=rs.getInt("score")%></td>
<td><%=rs.getDouble("percentage")%>%</td>
</tr>

<%
}
%>

</table>

<br>

<a href="dashboard.jsp"><button>Back</button></a>

</div>

</body>
</html>