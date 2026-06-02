 <%
if(session.getAttribute("user")==null){
 response.sendRedirect("index.html");
}
%>

<html>
<head>
<title>Dashboard</title>

<style>
body{
  margin:0;
  font-family: Arial;
  background: linear-gradient(to right,#4facfe,#00f2fe);
}

.header{
  padding:15px;
  color:white;
  text-align:center;
  font-size:22px;
}

.container{
  display:flex;
  justify-content:center;
  flex-wrap:wrap;
  margin-top:50px;
}

.card{
  background:white;
  width:220px;
  padding:20px;
  margin:20px;
  border-radius:15px;
  text-align:center;
  box-shadow:0 5px 15px rgba(0,0,0,0.2);
  transition:0.3s;
}

.card:hover{
  transform:scale(1.05);
}

button{
  margin-top:10px;
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

.welcome{
  text-align:center;
  color:white;
  font-size:20px;
}
</style>

</head>

<body>

<div class="header">
  Online Exam Dashboard
</div>

<div class="welcome">
  Welcome: <%=session.getAttribute("user")%>
</div>

<div class="container">

  <div class="card">
    <h3> Start Exam</h3>
    <p>Attempt new test</p>
    <a href="exam.jsp"><button>Start</button></a>
  </div>

  <div class="card">
    <h3> Results</h3>
    <p>View your history</p>
    <a href="history.jsp"><button>View</button></a>
  </div>

  <div class="card">
    <h3> Leaderboard</h3>
    <p>Top students</p>
    <a href="leaderboard.jsp"><button>Open</button></a>
  </div>

  <div class="card">
    <h3>Logout</h3>
    <p>Exit system</p>
    <a href="LogoutServlet"><button>Logout</button></a>
  </div>

</div>

</body>
</html>