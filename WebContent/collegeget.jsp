<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>result.org</title>
<style> 
a.ex1:hover,a.ex1:active {color:red;}
</style>
<script>
function changeColor(color)
{
document.getElementById('x').style.background=color;
}
</script>
</head>
<body bgcolor="#e6ffe5">
<center>
<h1><b><font color="green">Choose Your Option For Searching</font></b></h1><br>
<br>
<table>
<tr>
<td>&nbsp;<h3>&rarr;&rarr;</h3>&nbsp;</td>
<td><h3><a class="ex1" href="collcourse.jsp">College and course for my cut-off</a></h3></td>
</tr>

<tr>
<td>&nbsp;<h3>&rarr;&rarr;</h3>&nbsp;</td>
<td><h3><a class="ex1" href="collegescourse.jsp">Selected course in all colleges</a></h3></td>
</tr>


<tr>
<td>&nbsp;<h3>&rarr;&rarr;</h3>&nbsp;</td>
<td><h3><a class="ex1" href="collegescollege.jsp">All courses in selected college</a></h3></td>
</tr>
</table>


<input id="x" type="button" style= "background-color:#FFFFC0" onmouseover="changeColor('yellow')" onmouseout="changeColor('#FFFFC0')"onclick="location.href='reg_no.jsp'" value="Cancel"/>
</center>
</body>
</html>