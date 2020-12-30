
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="sis.com.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.http.*"%>

<%
String operationType  = request.getParameter("operation");
String userEmail  = request.getParameter("email_id");
//db email search

 		Connection con  = null;
		 PreparedStatement pstmt  = null;
		 ResultSet rs  = null;
		 String userName=null;
		   String userPassword=null;
		  // String userEmail=null;
		 
		 try{
		     con = SisDbConnectionUtil.getConnection();
			 String sql="select PASSWORD from alumniDatabase "
			 		+ " where EMAIL=?";
			 pstmt  = con.prepareStatement(sql);
			 pstmt.setString(1,userEmail);
			 rs  = pstmt.executeQuery();
			 
			 if(rs.next()){
					   
					   
					   userPassword  = rs.getString("PASSWORD");
					   
					  
					
			 } else{
				response.sendRedirect("Email_Front_End.jsp?uid="+ "Email Not Found");
			 }
		 }catch(Exception e){
			 e.printStackTrace();
		 }finally{
				try{
					SisDbConnectionUtil.closeConnection(con);
				}catch(Exception e){
					e.printStackTrace();
				}	
		 }

   if(userPassword!=null){
		//opt flow 
		 if("Send Password".equalsIgnoreCase(operationType) || "Re-Send Password".equalsIgnoreCase(operationType)){
		 	String pass =userPassword;
		 	//email or sms TODO 
		 	System.out.print("Your Pssword is:  " + pass);

		 	// __________________EMAIL________________________ 
		  
		 final String senderEmailId = "vk601542@gmail.com";
		 final String password = "vk601542";

		 Properties props = new Properties();
		 props.put("mail.smtp.auth", "true");
		 props.put("mail.smtp.starttls.enable", "true");
		 props.put("mail.smtp.host", "smtp.gmail.com");
		 props.put("mail.smtp.port", "587");

		 Session email_session = Session.getInstance(props,
		   new javax.mail.Authenticator() {
		 	protected PasswordAuthentication getPasswordAuthentication() {
		 		return new PasswordAuthentication(senderEmailId, password);
		 	}
		   });
		 System.out.println("session created....."+email_session);
					 try {
			
					 	Message message = new MimeMessage(email_session);
					 	//String mailid=(String)session.getAttribute("mailid");
					 	message.setFrom(new InternetAddress(senderEmailId));
					 	message.setRecipients(Message.RecipientType.TO,
					 		//InternetAddress.parse("vishalkumar12071997@gmail.com"));
					 		InternetAddress.parse(userEmail));
					 	
					 	message.setSubject("Password Confirmation ");
					 	//message.setText("success is sure " +new Date());
					 	message.setText("Your password is: " +pass);
			
					 	Transport.send(message);
			
					 	System.out.println("message sent ");
			
					 } catch (MessagingException e) {
					 	e.printStackTrace();
					 	System.out.print(e.getMessage());
					 }
		  
		
		//__________email end________________________________
		 	
		//response.sendRedirect("Login.jsp");//return to login page
		response.sendRedirect("Email_Front_End.jsp?uid="+ "Password Sent");
		 	//session.setAttribute("user_generated_otp", otp);
		 	//request.getRequestDispatcher("email_verf.jsp").forward(request, response);
		 	
		 	return;
		 }

   }

%>
 
 