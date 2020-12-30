package sis.com;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ViewProfileController
 */
@WebServlet("/ViewProfileController")
public class ViewProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub\
		
		String name1=request.getParameter("name");
		   System.out.println(name1);
		   
		   Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		User user1=null;
		try{
			con= SisDbConnectionUtil.getConnection();
			String sql="select * from alumniDatabase where Name='+name1+'";
			pstmt  = con.prepareStatement(sql);
			pstmt.setString(1, "%"+name1+"%");
		
			rs=pstmt.executeQuery();
			if(rs.next()){
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
		
   	 if(user1!=null){
   		HttpSession session=request.getSession(false);
   	  session.setAttribute("user1",user1);
   	  response.sendRedirect("ViewProfile.jsp");
   	 }
	}

}
