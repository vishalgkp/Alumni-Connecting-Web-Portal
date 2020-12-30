<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1><span style="color:green;">E-mail Verification & Password Reset</span></h1>
<% 
	String msg=(String)request.getParameter("uid");
	if(msg!=null)
	{%>
	 <h6><span style="color:red;"><%=msg %></span></h6>
	<%} %> 

<form action="Email_Back_End.jsp" method="post">
	<table>
	<tr>
	 <td>Enter your E-mail ID:</td><td><input name="email_id" type="email" ></td><br>
	 </tr>
	 <tr>
	 <td><input type="submit"  name="operation"  value="Send Password"></td>
	
	 <td><input type="submit"  name="operation"  value="Re-Send Password"></td>
	 </tr>
	</table>

</form>


</body>
</html>