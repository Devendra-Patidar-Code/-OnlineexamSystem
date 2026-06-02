<%-- 
    Document   : exam
    Created on : 20 Apr 2026, 11:40:27 pm
    Author     : HP
--%>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        

        <form action="ExamServlet" method="post">
<p>Time: <span id="timer">60</span></p>

<script>
let t=60;
setInterval(()=>{
 t--;
 document.getElementById("timer").innerHTML=t;
 if(t==0) document.forms[0].submit();
},1000);
</script>
  
<%
Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/exam_db","root","root");

Statement st = con.createStatement();
ResultSet rs = st.executeQuery(
"SELECT * FROM questions LIMIT 5");

int i=1;
while(rs.next()){
%>

Q<%=i%>: <%=rs.getString("question")%><br>

<input type="radio" name="q<%=i%>" value="<%=rs.getString("opt1")%>">
<%=rs.getString("opt1")%><br>

<input type="radio" name="q<%=i%>" value="<%=rs.getString("opt2")%>">
<%=rs.getString("opt2")%><br><br>

<%
i++;
}
%>

<button>Submit</button>
</form>