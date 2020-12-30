<%@include file="Top.jsp" %>
<div id="home">
<center>
	<fieldset style="width:400px;">
		<legend>Alumini Detail</legend>
			<form action="CandidateData" method="post" >
				<table>
				 	<tr>
				 		<td>Name:</td><td><input type="text" name="name" required="required"></td>
				 	</tr>
				 	
				 	<tr>
				 		<td>DOB:</td><td><input type="date" name="dob" min="1940-01-01" required="required"></td>
				 	</tr>
				 	
				 	<tr>
				 		<td>Gender:</td><td><input type="radio" name="gender" value="male" required="required">Male
				 		                    <input type="radio" name="gender" value="female" required="required">Female
				 		                    <input type="radio" name="gender" value="other" required="required">Other</td>
				 	</tr>
				 	
				 	<tr>
				 		<td>Course:</td><td><select name="course" required="required"> 
				 		<option value="">--select--</option>
				 		    <option value="b_tech">B.Tech</option>
				 		    <option value="m_tech">M.Tech</option>
				 		    <option value="mca">MCA</option>
				 		    <option value="phd">PHD</option>
				 		    
				 		
				 		
				 		
				 		</select></td>
				 	</tr>
				 	
				 	<tr>
				 		<td>Branch:</td><td><select name="branch" required="required"> 
				 		<option value="">--select--</option>
				 		    <option value="computer_science">Computer Science</option>
				 		    <option value="information_technology">Information Technology</option>
				 		    <option value="mining_engineering">Mining Engineering</option>
				 		    <option value="electrical_engineering">Electrical Engineering</option>
				 		    <option value="etc">Electronics & Telecommunication Engineering</option>
				 		    <option value="mechanical_engineering">Mechanical Engineering</option>
				 		    <option value="bio_tech">Bio-Tech Engineering</option>
				 		    <option value="bio_med">Bio-Medical Engineering</option>
				 		    <option value="chemical_engineering">Chemical Engineering</option>
				 		    <option value="civil_engineering">Civil Engineering</option>
				 		
				 		
				 		
				 		</select></td>
				 	</tr>
				 	
				 	<tr>
				 		<td>Year of Admission:</td><td><input type="number" name="admission" min="1960" required="required"></td>
				 	</tr>
				 	
				 	<tr>
				 		<td>Year of Passing:</td><td><input type="number" name="passing" min="1964" required="required"></td>
				 	</tr>
				 	
				 	
				 	
				 	<tr>
				 		<td>Current Address:</td><td><textarea name="address" cols="40" rows="4" required="required">  </textarea></td>
				 	</tr>
				 	
				 	<%if(request.getAttribute("isMobile")!=null){%>
      
      
				      <h1 style="color:red;">
				      Enter Mobile Number!!
				      </h1>
				      
				      <%} %>
				 	
				 	<tr>
				 		<td>Mobile No:</td><td><input type="text" name="mobile" required="required"></td>
				 	</tr>
				 	
				 	<tr>
				 		<td>E-mail:</td><td><input type="email" name="email" required="required"></td>
				 	</tr>
				 	
				 	<tr>
				 		<td>Designation:</td><td><input type="text" name="designation" required="required"></td>
				 	</tr>
				 	<%if(request.getAttribute("isPassword")!=null){%>
      
            
					      <h1 style="color:red;">
					      Password mismatch!!
					      </h1>
				    <%} %>
				     
		
				 	<tr>
				 		<td>Password:</td><td><input type="password" name="password" required="required"></td>
				 	</tr>
				 	
				 	<tr>
				 		<td>Confirm Password:</td><td><input type="password" name="confirm_password" required="required"></td>
				 	</tr>
				 	
				 	
				    <tr>
				 		<td><input type="submit" value="SignUp" ></td><td><input type="reset" value="Reset" ></td>
				 	</tr>
				</table>
			
			</form>
	</fieldset>
</center>
</div>		
		
		
<%@include file="Bottom.jsp" %>