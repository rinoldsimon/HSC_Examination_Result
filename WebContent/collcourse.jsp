<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,java.*" %>
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
</head>
<body bgcolor="#e6ffe5">
<center>
<h1><b><font color="green">College and Course Available For your Cut-Off</font></b></h1>
<table border="2" style="color:green;">
<%Connection conn = null;
String url = "jdbc:mysql://localhost:3306/";
String dbName = "result";
String driver = "com.mysql.jdbc.Driver";
String userName = "root";
String password = "oracle";
String choice=request.getParameter("option");

int reg=Integer.parseInt((String)session.getAttribute("reg_no"));
try {
	Class.forName(driver).newInstance();
	conn = DriverManager.getConnection(url + dbName, userName, password);
	String query="select * from stu_data where reg_no='"+reg+"'";
	String category="";
	float cutoff=0;
	Statement st=conn.createStatement();
	ResultSet rs=st.executeQuery(query);
	while(rs.next()){
		category=rs.getString(5);
		cutoff=rs.getFloat(14);
	}
	String query2="select col_name,course,"+category+" from coll_data where "+category+"<"+cutoff+"";
	rs=st.executeQuery(query2);
	while(rs.next()){
			%>
			
			<tr><td>&nbsp;<font color="blue"><%out.print(rs.getString(1)); %></font>&nbsp;</td>
			<td>&nbsp;<font color="red"><%out.print(rs.getString(2)); %></font></td>
			<td>&nbsp;<font color="violet"><%out.print(rs.getString(3)); %></font></td>
	
			</tr>
		<%
		}
		
} catch (Exception e) {
	e.printStackTrace();
}
	
 %>

	</table>
	<br>
	<input id="x" type="button" style= "background-color:#FFFFC0" onmouseover="changeColor('yellow')" onmouseout="changeColor('#FFFFC0')" onclick="location.href='collegeget.jsp'" value="Back"/></center>
</body>
</html>