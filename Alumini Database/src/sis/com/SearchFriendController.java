package sis.com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SearchFriendController
 */
@WebServlet("/SearchFriendController")
public class SearchFriendController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String friend=request.getParameter("search_name");
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<String> friendList = new ArrayList<String>();
			try{
				
				con=SisDbConnectionUtil.getConnection();
				String sql="select name from alumniDatabase where name like ? ";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, "%"+friend+"%");
			
				
				
				rs=pstmt.executeQuery();
				while(rs.next())
				{
					friendList.add(rs.getString("Name"));
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
			HttpSession session=request.getSession();
	      	  session.setAttribute("friendList",friendList);
	      	  response.sendRedirect("FriendList.jsp");
	}
               
	
}
