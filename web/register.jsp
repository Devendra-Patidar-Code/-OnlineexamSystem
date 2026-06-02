 <html>
<head>
<title>Register</title>

<style>
body{
  margin:0;
  font-family: Arial;
  background: linear-gradient(120deg,#ff9a9e,#fad0c4);
  height:100vh;
  display:flex;
  justify-content:center;
  align-items:center;
}

.container{
  background:white;
  padding:30px;
  border-radius:15px;
  width:340px;
  box-shadow:0 10px 25px rgba(0,0,0,0.3);
  text-align:center;
}

input{
  width:100%;
  padding:10px;
  margin:10px 0;
  border-radius:8px;
  border:1px solid #ccc;
}

button{
  width:100%;
  padding:10px;
  border:none;
  background:#ff758c;
  color:white;
  border-radius:8px;
  cursor:pointer;
}

button:hover{
  background:#ff4d6d;
}

a{
  text-decoration:none;
  color:#ff758c;
}
</style>

</head>

<body>

<div class="container">
<h2>Create Account</h2>

<form action="RegisterServlet" method="post">

<input type="text" name="name" placeholder="Enter Name" required>
<input type="email" name="email" placeholder="Enter Email" required>
<input type="password" name="password" placeholder="Enter Password" required>

<button type="submit">Register</button>

</form>

<p>Already have account? <a href="index.html">Login</a></p>

</div>

</body>
</html>