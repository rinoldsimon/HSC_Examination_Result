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
<body  bgcolor="#e6ffe5">
<% 
Connection conn = null;
String url = "jdbc:mysql://localhost:3306/";
String dbName = "result";
String driver = "com.mysql.jdbc.Driver";
String userName = "root";
String password = "oracle";
int reg=Integer.parseInt((String)session.getAttribute("reg_no"));
String queryup="update stu_data set cutoff=(((physics/4)+(chemistry/4))+(maths/2)) where reg_no='"+reg+"'";

String queryup1="update stu_data set cutoff1=((physics/4)+(chemistry/4)+(maths/4)+(biology/4)) where reg_no='"+reg+"'";

String queryup3="update stu_data set cutoff3=((physics/4)+(chemistry/4)+(maths/4)+(computer_science/4)) where reg_no='"+reg+"'";

String queryup2="update stu_data set cutoff2=(((physics/4)+(chemistry/4))+(biology/2)) where reg_no='"+reg+"'";



try {
	Class.forName(driver).newInstance();
	conn = DriverManager.getConnection(url + dbName, userName, password);
	String query="select cutoff from stu_data where reg_no='"+reg+"'";
	PreparedStatement ps=conn.prepareStatement(queryup);
	ps.executeUpdate();
	Statement st= conn.createStatement();
	ResultSet rs=st.executeQuery(query);
	ps.executeUpdate();
	
	String query1="select cutoff1 from stu_data where reg_no='"+reg+"'";
	PreparedStatement ps1=conn.prepareStatement(queryup1);
	ps1.executeUpdate();
	Statement st1= conn.createStatement();
	ResultSet rs1=st1.executeQuery(query1);
	ps1.executeUpdate();
	
	String query2="select cutoff2 from stu_data where reg_no='"+reg+"'";
	PreparedStatement ps2=conn.prepareStatement(queryup2);
	ps2.executeUpdate();
	Statement st2= conn.createStatement();
	ResultSet rs2=st2.executeQuery(query2);
	ps2.executeUpdate();
	
	String query3="select cutoff3 from stu_data where reg_no='"+reg+"'";
	PreparedStatement ps3=conn.prepareStatement(queryup3);
	ps3.executeUpdate();
	Statement st3= conn.createStatement();
	ResultSet rs3=st3.executeQuery(query3);
	ps3.executeUpdate();
	while(rs.next()&&rs1.next()&&rs2.next()&&rs3.next()){
			float cutoff=rs.getFloat(1);
			float cutoff1=rs1.getFloat(1);
			float cutoff2=rs2.getFloat(1);
			float cutoff3=rs3.getFloat(1);
			%>
			<center>
			<h1><blink><font color="green">YOUR ENGINEERING CUT OFF IS </font> : <%out.print(cutoff); %></blink></h1>
			<%if(rs2.getFloat(1)!=0){ %>
			<h1><blink><font color="green">YOUR MEDICAL CUT OFF IS </font> : <%out.print(cutoff2); %></blink></h1>
			<%}else{} %>
			<%if(rs1.getFloat(1)!=0) {%>
			<h1><blink><font color="green">YOUR ARTS and SCIENCE CUT OFF IS </font> : <%out.print(cutoff1); %></blink></h1>
			<%}else{ %>
			<h1><blink><font color="green">YOUR ARTS and SCIENCE CUT OFF IS </font> : <%out.print(cutoff3); %></blink></h1>
			<%} %>
			</center>
			<br><br>
			
			<center><input id="x" type="button" value="Get Engineering College for my cut-off" style= "background-color:#FFFFC0"onmouseover="changeColor('yellow')" onmouseout="changeColor('#FFFFC0')"  onclick="location.href='collegeget.jsp'"/>&nbsp;<input id="x1"type ="button" name="home" style="background-color:#FFFFC0" onmouseover="changeColor1('yellow')" onmouseout="changeColor1('#FFFFC0')"onclick="location.href='reg_no.jsp'" value="Check Another Result"/> 
			
			</center>
		
			<%}
	
	
	
} catch (Exception e) {
	e.printStackTrace();
}
	
 %>
</body>
</html>