<%@page import="java.sql.*"%>
<%@page import="sis.com.*"%>
<%@include file="Top.jsp" %>
		<div id="home">
		<% 
		   String name1=request.getParameter("name");
		   Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		User user1=null;
		try{
			con= SisDbConnectionUtil.getConnection();
			
			String sql="select * from alumniDatabase where Name=?";
			pstmt  = con.prepareStatement(sql);
			
			pstmt.setString(1,name1);
		
			rs=pstmt.executeQuery();
			if(rs.next()){
				System.out.println(name1);
				user1=new User();
				String name11  = rs.getString("Name");
				user1.setName(name11);
				String dob  = rs.getString("DOB");
			    user1.setDob(dob);
				String gender  = rs.getString("Gender");
				user1.setGender(gender);
				String course  = rs.getString("Course");
				user1.setCourse(course);
				String branch  = rs.getString("Branch");
				user1.setBranch(branch);
				String admission  = rs.getString("Admission");
				user1.setAdmission(admission);
				String passing  = rs.getString("passout");
				user1.setPassing(passing);
				String address  = rs.getString("CurrentAddress");
				user1.setAddress(address);
				String mobile  = rs.getString("Mobile");
				user1.setMobile(mobile);
				String email  = rs.getString("Email");
				user1.setEmail(email);
				String designation  = rs.getString("Designation");
				user1.setDesignation(designation);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			 try {
					SisDbConnectionUtil.closeConnection(con);
				} catch (SQLException e) {
					 
					e.printStackTrace();
				}
			}
		
      	 
      	  //session.setAttribute("user1",user1);
      	  response.sendRedirect("ViewProfile.jsp?user1=user1");
      	 
       
		%>
		
		</div>
		
<%@include file="Bottom.jsp" %>