<%@include file="Top.jsp" %>

		<div id="home">
		<center>
	<fieldset  style="width:400px;">
	      <legend><span style="color:#FF00FF;"><%=user.getName() %>'s Profile</span></legend>
	      
     <h2>Name:&nbsp; <span style="color:green;"> <i> <%=user.getName() %></i></span></h2>
       <h2>DOB:&nbsp; <span style="color:green;"><i> <%=user.getDob() %></i></span></h2>
      <h2>Gender:&nbsp; <span style="color:green;"><i> <%=user.getGender() %></i></span></h2>
       <h2>Course:&nbsp; <span style="color:green;"> <i><%=user.getCourse() %></i></span></h2> 
      <h2>Branch: &nbsp; <span style="color:green;"><i><%=user.getBranch() %></i></span></h2>
      <h2>Admission:&nbsp; <span style="color:green;"><i> <%=user.getAdmission() %></i></span></h2>
      <h2>Passing:&nbsp; <span style="color:green;"> <i><%=user.getPassing() %></i></span></h2>
        <h2>Current Address:&nbsp; <span style="color:green;"><i> <%=user.getAddress() %></i></span></h2>
       <h2>  Mobile:&nbsp; <span style="color:green;"><i><%=user.getMobile() %></i></span></h2>
      <h2>E-mail: &nbsp; <span style="color:green;"><i><%=user.getEmail() %></i></span></h2>
        
        
        </fieldset>
	</center>
	
		</div>
		
<%@include file="Bottom.jsp" %>

