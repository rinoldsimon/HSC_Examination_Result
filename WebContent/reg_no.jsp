<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>result.org</title>
<script>
function isSelected(dropdown){
if(dropdown.selectedIndex==0){
dropdown.className='err_lb_border';
return false;
}else{
dropdown.className='listbox';
return true;
}
}
function validateForm(theForm){
	
	if (theForm.reg_no.value == "")
	  {
	    alert("Please enter a value for the \"Registration No.\" field.");
	    theForm.reg_no.focus();
	    return (false);
	  }
	 
	  if (theForm.reg_no.value.length < 1)
	  {
	    alert("Please enter at least 1 characters in the \"Registration No.\" field.");
	    theForm.reg_no.focus();
	    return (false);
	  }
	 
	  if (theForm.reg_no.value.length > 6)
	  {
	    alert("Please enter at most 6 characters in the \"Registration No.\" field.");
	    theForm.reg_no.focus();
	    return (false);
	  }
	 
	  var checkOK = "0123456789-";
	  var checkStr = theForm.reg_no.value;
	  var allValid = true;
	  var validGroups = true;
	  var decPoints = 0;
	  var allNum = "";
	  for (i = 0;  i < checkStr.length;  i++)
	  {
	    ch = checkStr.charAt(i);
	    for (j = 0;  j < checkOK.length;  j++)
	      if (ch == checkOK.charAt(j))
	        break;
	    if (j == checkOK.length)
	    {
	      allValid = false;
	      break;
	    }
	    allNum += ch;
	  }
	  if (!allValid)
	  {
	    alert("Please enter only digit characters in the \"Registration No.\" field.");
	    theForm.reg_no.focus();
	    return (false);
	  }
	
	
	
var year = document.getElementById('birthday_year');
var month = document.getElementById('birthday_month');
var day = document.getElementById('birthday_day');

var error=0;

if(!isSelected(year)){
error++;
}
if(!isSelected(month)){
error++;
}
if(!isSelected(day)){
error++;
}

if((parseInt(year[year.selectedIndex].value)%4==0)&& (parseInt(month[month.selectedIndex].value)==2) && parseInt(day[day.selectedIndex].value)>29){
day.className='err_lb_border';
error++;
}else if(parseInt(month[month.selectedIndex].value)==2 && parseInt(day[day.selectedIndex].value)>28){
day.className='err_lb_border';
error++;
}
if(error>0){
alert("Please select your DOB correctly");
return false;
}else{
return true;
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
<body onload="document.drop_down_validation_3.reg_no.focus();" bgcolor="#e6ffe5" >
<form id="drop_down_validation_3" name="drop_down_validation_3" action="stu_details.jsp" onsubmit="return validateForm(this)" method="post">

<center>
<table width=100%>

<tr><td height="1" bgcolor="green" align=center></td></tr>
<tr><td align="center"><h1><font color="DarkBlue">HSC Examination Results</font></h1></td></tr>
<tr><td height="1" bgcolor="green" align=center></td></tr>
</table>

<table>
<tr>
<td>
<font color="DarkRed">Register Number</font></td><td>:</td><td><input type="text" value="" name="reg_no" /></td></tr>

<tr><td><font color="DarkRed">Date of Birth</font></td>
<td>:</td><td><select id="birthday_year" class="listbox" name="birthday_year">
    <option value="0">Year</option>
    <option value="1996">1996</option>
    <option value="1995">1995</option>
    
    </select>
    


<select name="birthday_month" class="listbox" id="birthday_month">
    <option value="0">Month</option>
    <option value="1">January</option>
    <option value="2">February</option>
    <option value="3">March</option>
    <option value="4">April</option>
    <option value="5">May</option>
    <option value="6">June</option>
    <option value="7">July</option>
    <option value="8">August</option>
    <option value="9">September</option>
    <option value="10">October</option>
    <option value="11">November</option>
    <option value="12">December</option>
    </select>
    </td>
    
    
<td>
<select id="birthday_day" class="listbox" name="birthday_day">
    <option value="0">Day</option>
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
    <option value="6">6</option>
    <option value="7">7</option>
    <option value="8">8</option>
    <option value="9">9</option>
    <option value="10">10</option>
    <option value="11">11</option>
    <option value="12">12</option>
    <option value="13">13</option>
    <option value="14">14</option>
    <option value="15">15</option>
    <option value="16">16</option>
    <option value="17">17</option>
    <option value="18">18</option>
    <option value="19">19</option>
    <option value="20">20</option>
    <option value="21">21</option>
    <option value="22">22</option>
    <option value="23">23</option>
    <option value="24">24</option>
    <option value="25">25</option>
    <option value="26">26</option>
    <option value="27">27</option>
    <option value="28">28</option>
    <option value="29">29</option>
    <option value="30">30</option>
    <option value="31">31</option>
    </select>
    </td></tr>
    
    </table>
</center>

<pre>


                                                                 <input id="x" type="submit" style= " background-color:#FFFFC0" name="submit" onmouseover="changeColor('yellow')" onmouseout="changeColor('#FFFFC0')" value=">Get Marks<"/>    <input id="x1" type="reset" style= " background-color:#FFFFC0" onmouseover="changeColor1('yellow')" onmouseout="changeColor1('#FFFFC0')"name="reset" value="Reset"/>
</pre>
<br>
<center><h1><font face="Comic sans MS" size="6" color="green">Wishing you All the Best!</font></h1>

</center>

</form>
</body>
</html>