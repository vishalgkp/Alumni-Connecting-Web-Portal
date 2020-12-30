<%@include file="Top.jsp" %>

		<div id="home">
		<% User user1=(User)session.getAttribute("user1");
		if(user1!=null){
			%>
			
	
	      
	      <h2>Name:&nbsp; <span style="color:green;"> <i> <%=user1.getName() %></i></span></h2> 
	      <h2>DOB:</h2>&nbsp; <h2><span style="color:green;"><i> <%=user1.getDob() %></i></span></h2>
	      <h2>Gender:&nbsp; <span style="color:green;"><i> <%=user1.getGender() %></i></span></h2>
	      <h2>Course:&nbsp; <span style="color:green;"> <i><%=user1.getCourse() %></i></span></h2> 
	      <h2>Branch: &nbsp; <span style="color:green;"><i><%=user1.getBranch() %></i></span></h2>
	      <h2>Admission:&nbsp; <span style="color:green;"><i> <%=user1.getAdmission() %></i></span></h2>
	      <h2>Passing:&nbsp; <span style="color:green;"> <i><%=user1.getPassing() %></i></span></h2>
	      <h2>Current Address:&nbsp; <span style="color:green;"><i> <%=user1.getAddress() %></i></span></h2>
	      <h2>  Mobile:&nbsp; <span style="color:green;"><i><%=user1.getMobile() %></i></span></h2>
	      <h2>E-mail: &nbsp; <span style="color:green;"><i><%=user1.getEmail() %></i></span></h2>
        
        
		<%} %>
		
		</div>
		
<%@include file="Bottom.jsp" %>