 <html>
<head>
<title>Result</title>

<style>
body{
  margin:0;
  font-family:Arial;
  background: linear-gradient(to right,#4facfe,#00f2fe);
  text-align:center;
}

.container{
  background:white;
  width:350px;
  margin:80px auto;
  padding:30px;
  border-radius:15px;
  box-shadow:0 5px 20px rgba(0,0,0,0.3);
}

h2{
  margin-bottom:20px;
}

p{
  font-size:18px;
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

<h2>? Exam Result</h2>

<p>? Correct: ${score}</p>
<p>? Wrong: ${wrong}</p>
<p>? Percentage: ${percentage}%</p>

<!-- Graph -->
<canvas id="chart" width="200" height="200"></canvas>

<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
let correct = ${score};
let wrong = ${wrong};

new Chart(document.getElementById("chart"),{
 type:'pie',
 data:{
  labels:['Correct','Wrong'],
  datasets:[{
    data:[correct, wrong]
  }]
 }
});
</script>

<br>

<a href="dashboard.jsp"><button>Back to Dashboard</button></a>

</div>

</body>
</html>