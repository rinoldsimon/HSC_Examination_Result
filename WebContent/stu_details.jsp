<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>result.org</title>
<script>
function changeColor(color)
{
document.getElementById('x').style.background=color;
}
</script>
<script>
function changeColor1(color)
{
document.getElementById('x1').style.background=color;
}
</script>

</head>
<body bgcolor="#e6ffe5">
<% 
Connection conn = null;
String url = "jdbc:mysql://localhost:3306/";
String dbName = "result";
String driver = "com.mysql.jdbc.Driver";
String userName = "root";
String password = "oracle";
String reg=request.getParameter("reg_no");
String byear=request.getParameter("birthday_year");
String bmonth=request.getParameter("birthday_month");
String bday=request.getParameter("birthday_day");
session.setAttribute("reg_no",reg);
session.setAttribute("birthday_year",byear);
session.setAttribute("birthday_month",bmonth);
session.setAttribute("birthday_day",bday);
try {
	Class.forName(driver).newInstance();
	conn = DriverManager.getConnection(url + dbName, userName, password);
	//String query="select * from stu_data where reg_no='"+reg+"'";
	String query="select * from stu_data where reg_no='"+reg+"' and birthday_year='"+byear+"' and birthday_month='"+bmonth+"' and birthday_day='"+bday+"'";
	Statement st= conn.createStatement();
	ResultSet rs=st.executeQuery(query);
	while(rs.next()){
		%>
		<center>
		<h1><font color="DarkBlue">HIGHER SECONDARY EXAM RESULTS</font></h1><br><br>
		<table border=1 style="color:green;">
		<tr><td><font color="blue">Regno</font></td><td><%out.println(rs.getInt(1));%></td></tr>
		<tr><td><font color="blue">Name of the candidate</font></td><td><%out.println(rs.getString(2));%></td></tr>
		<tr><td><font color="blue">Date of Birth</font></td><td><%out.println(rs.getString(3));%></td></tr>
		<tr><td><font color="blue">Category</font></td><td><%out.println(rs.getString(5));%></td></tr>
		</table>
		<br>
		<table border=5 style="color:green;">
		<tr><td>Tamil</td><td><%out.println(rs.getInt(6));%></td></tr>
		<tr><td>English</td><td><%out.println(rs.getInt(7));%></td></tr>
		<tr><td>Physics</td><td><%out.println(rs.getInt(9));%></td></tr>
		<tr><td>Chemistry</td><td><%out.println(rs.getInt(10));%></td></tr>
		<tr><td>Maths</td><td><%out.println(rs.getInt(8));%></td></tr>
		<%if(rs.getInt(19)==0){ %>
		<tr><td>Computer Science</td><td><%out.println(rs.getInt(11));%></td></tr>
		<%}else{ %>
		<tr><td>Biology</td><td><%out.println(rs.getInt(19));%></td></tr>
		<%} %>
		<tr><td><font color="red">Total</font></td><td><font color="red"><%out.println(rs.getInt(12));%></font></td></tr>
		<tr><td><font color="red">Result</font></td><td><font color="red"><%out.println(rs.getString(13));%></font></td></tr>
		</table><br><br>
		<input id="x" type ="button" name="cal"style= " background-color:#FFFFC0"onmouseover="changeColor('yellow')" onmouseout="changeColor('#FFFFC0')" onclick="location.href='cutoff.jsp'" value="Calculate Cut-Off"/>
		<input id="x1" type ="button" name="home"style= " background-color:#FFFFC0"onmouseover="changeColor1('yellow')" onmouseout="changeColor1('#FFFFC0')"onclick="location.href='reg_no.jsp'" value="Check Another Result"/>
		</center>
		<%
		
	}
	
	
	
} catch (Exception e) {
	e.printStackTrace();
}
	
 %>
</body>
</html>