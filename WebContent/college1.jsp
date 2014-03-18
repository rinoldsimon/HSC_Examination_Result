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
<style>
p.small {font-variant:small-caps;}
</style>
</head>
<body bgcolor="#e6ffe5">
<center>
<h1 ><b><font color="green" > <p class="small"><%out.print(request.getParameter("depart")); %></p></font></b></h1>
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
	}%>

	<%
	String dept=request.getParameter("depart");
	String col=request.getParameter("college");
	//out.print(dept); 
	String query2="select col_name,"+category+" from coll_data where "+category+"<"+cutoff+" and course='"+dept+"' and col_name='"+col+"'";
		String query3="select col_name,"+category+" from coll_data where course='"+dept+"'";
		rs=st.executeQuery(query3);
		while(rs.next()){
			%>
			
			<tr><td>&nbsp;<font color="blue"><%out.print(rs.getString(1)); %></font></td>
			<td>&nbsp;<font color="red"><%out.print(rs.getString(2)); %></font></td>
	
			</tr>
		<%
		}
		
} catch (Exception e) {
	e.printStackTrace();
}
	
 %>

	</table>
	<br>
	<input id="x" type="button" style= "background-color:#FFFFC0" onmouseover="changeColor('yellow')" onmouseout="changeColor('#FFFFC0')"onclick="location.href='collegeget.jsp'" value="Back"/>
	</center>
</body>
</html>