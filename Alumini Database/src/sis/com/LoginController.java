package sis.com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setHeader("Cache-Control", "no-cache ,no-store ,must-revalidate");
		String loginId=request.getParameter("id");
		String password=request.getParameter("password");
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		User user=null;
		try{
			con= SisDbConnectionUtil.getConnection();
			String sql="select * from alumniDatabase where EMAIL=? and PASSWORD=?";
			pstmt  = con.prepareStatement(sql);
			pstmt.setString(1,loginId );
			pstmt.setString(2,password );
			rs=pstmt.executeQuery();
			if(rs.next()){
				user=new User();
				String name  = rs.getString("Name");
				user.setName(name);
				String dob  = rs.getString("DOB");
			    user.setDob(dob);
				String gender  = rs.getString("Gender");
				user.setGender(gender);
				String course  = rs.getString("Course");
				user.setCourse(course);
				String branch  = rs.getString("Branch");
				user.setBranch(branch);
				String admission  = rs.getString("Admission");
				user.setAdmission(admission);
				String passing  = rs.getString("passout");
				user.setPassing(passing);
				String address  = rs.getString("CurrentAddress");
				user.setAddress(address);
				String mobile  = rs.getString("Mobile");
				user.setMobile(mobile);
				String email  = rs.getString("Email");
				user.setEmail(email);
				String designation  = rs.getString("Designation");
				user.setDesignation(designation);
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
		if(user!=null){
      	  HttpSession session=request.getSession();
      	  session.setAttribute("user",user);
      	  response.sendRedirect("Top.jsp");
      	
        }
		else{
			//request.setAttribute("LoginError",loginId);
			request.setAttribute("LoginError", "invalid user or password");
			RequestDispatcher rd=request.getRequestDispatcher("LoginFailed.jsp");
			rd.forward(request, response);
		}
		
	}

}

              
