<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>result.org</title>
<script>
function validateForm()
{
var x=document.forms["myForm"]["depart"].value;

if (x==null || x=='--')
  {
  alert("Please enter correct value for Course");
  return false;
  }
}
</script>
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
<center>
<h1><b><font color="green">Choose Your Option</font></b></h1>

<form name="myForm" action="college1.jsp" onsubmit="return validateForm()" method="post">
	
	<select name="depart">
	<option value="--">--</option>
	<option value="cs">cs</option>
	<option value="mech">mech</option>
	<option value="eee">eee</option>
	<option value="ece">ece</option>
	<option value="it">it</option>
	<option value="civil">civil</option></select>
	<input id="x"type="submit"style= "background-color:#FFFFC0" name="submit" onmouseover="changeColor('yellow')" onmouseout="changeColor('#FFFFC0')"/>
	<input id="x1"type="button" style= "background-color:#FFFFC0"  onmouseover="changeColor1('yellow')" onmouseout="changeColor1('#FFFFC0')"onclick="location.href='collegeget.jsp'" value="Back"/>
	</form>
	<br>
</center>	
</body>
</html>