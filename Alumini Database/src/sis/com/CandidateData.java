package sis.com;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.io.*;


@WebServlet("/CandidateData")

public class CandidateData extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//System.out.println("Signup successfully");
		boolean isSignUp=false;
		String Name=request.getParameter("name");
		
		String Dob=request.getParameter("dob");
		SimpleDateFormat sdf=new SimpleDateFormat("dd/mm/yyyy");
		
		String Gender=request.getParameter("gender");
		String Course=request.getParameter("course");
		String Branch=request.getParameter("branch");
		Long Admission=Long.parseLong(request.getParameter("admission"));
		Long Passing=Long.parseLong(request.getParameter("passing"));
		String Address=request.getParameter("address");
		String Mobile=request.getParameter("mobile");
		
		if(Mobile==null)
		{
			boolean isMobile=false;
			request.setAttribute("isMobile",isMobile);
			RequestDispatcher rd=request.getRequestDispatcher("SignUp.jsp");
			rd.forward(request,response);
		}
		
		String Email=request.getParameter("email");
		String Designation=request.getParameter("designation");
		String Password=request.getParameter("password");
		String Password1=request.getParameter("confirm_password");
		/*response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		*/
		boolean compare_password=Password.equals(Password1);
		if(!compare_password)
		{
			boolean isPassword=false;
			request.setAttribute("isPassword",isPassword);
			RequestDispatcher rd=request.getRequestDispatcher("SignUp.jsp");
			rd.forward(request,response);
		}
		
		
		//FileInputStream fis  = null;	
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
     
			try{
				
				con=SisDbConnectionUtil.getConnection();
				String sql="insert into alumniDatabase(SrNo,Name,DOB,Gender,Course,Branch,Admission,Passout,CurrentAddress,Mobile,Designation,Email,Password)"
				+"values(alumniDatabase_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?)";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, Name);
			
				
				pstmt.setString(2, Dob);
				pstmt.setString(3,Gender);
				pstmt.setString(4, Course);
				pstmt.setString(5, Branch);
				pstmt.setLong(6, Admission);
				pstmt.setLong(7, Passing);
				pstmt.setString(8, Address);
				pstmt.setString(9, Mobile);
				pstmt.setString(10, Designation);
				pstmt.setString(11, Email);
				pstmt.setString(12, Password);
				
				int k=pstmt.executeUpdate();
				if(k==1)
				{
					isSignUp=true;
					
					
				}
				request.setAttribute("isSignUp",isSignUp);
				RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
				rd.forward(request, response);
				
				
			}catch(Exception e){
				 e.printStackTrace();
			 }finally{
					try{
						SisDbConnectionUtil.closeConnection(con);
					}catch(Exception e){
						e.printStackTrace();
					}	
			 }
		
		}
		
		
	
	
}
