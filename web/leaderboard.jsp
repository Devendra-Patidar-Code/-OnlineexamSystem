 <%@ page import="java.sql.*" %>

<%
if(session.getAttribute("user")==null){
 response.sendRedirect("login.html");
}
%>

<html>
<head>
<title>Leaderboard</title>

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

h2{
  margin-bottom:20px;
}

table{
  width:100%;
  border-collapse:collapse;
}

th,td{
  padding:12px;
  border:1px solid #ddd;
}

th{
  background:#4facfe;
  color:white;
}

tr:nth-child(2){
  background:#ffd700; /* Gold */
}

tr:nth-child(3){
  background:#c0c0c0; /* Silver */
}

tr:nth-child(4){
  background:#cd7f32; /* Bronze */
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

button:hover{
  background:#007bff;
}
</style>

</head>

<body>

<div class="container">

<h2>? Leaderboard (Top 5 Students)</h2>

<table>

<tr>
<th>Rank</th>
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
"FROM results JOIN users ON results.user_id = users.id " +
"ORDER BY results.percentage DESC LIMIT 5"
);

int rank = 1;

while(rs.next()){
%>

<tr>
<td><%=rank%></td>
<td><%=rs.getString("name")%></td>
<td><%=rs.getInt("score")%></td>
<td><%=rs.getDouble("percentage")%>%</td>
</tr>

<%
rank++;
}
%>

</table>

<br>

<a href="dashboard.jsp"><button>Back to Dashboard</button></a>

</div>

</body>
</html>