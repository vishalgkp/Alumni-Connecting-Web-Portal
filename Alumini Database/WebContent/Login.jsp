<%@include file="Top.jsp" %>
<div id="home">

<center>
	<fieldset style="width:400px;">
	
	<%--logout code start--%>
	<% 	
	response.setHeader("Cache-Control", "no-cache ,no-store ,must-revalidate");
   if(request.getParameter("logout_msg")!=null){
	 %>
	
	<h3 style="color:red;"><%=request.getParameter("logout_msg") %></h3>
	<%} %>
	
	<%--logout code end --%>
	
     <%if((boolean)(request.getAttribute("isSignUp")!=null)){%>
      
      
      <h1 style="color:green;">
      Congratulations!SignUp Successful
      </h1>
      
      <%} %>
  
		<legend>Login Detail</legend>
		
		 
			<form action="LoginController" method="post">
				<table>
				 	<tr>
				 		<td><input type="text" name="id" placeholder="Enter your E-mail"></td>
				 	</tr>
				 	<tr>
				 		<td><input type="password" name="password" placeholder="Enter your Password"></td>
				 	</tr>
				    <tr>
				 		<td><input type="submit" value="Login" >&nbsp<a href="Email_Front_End.jsp">Forgot Password?</a></td>
				 	</tr>
				</table>
			
			</form>
	</fieldset>
</center>
</div>		
		
		
<%@include file="Bottom.jsp" %>