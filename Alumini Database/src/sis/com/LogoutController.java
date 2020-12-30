package sis.com;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogoutController")
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
		HttpSession session = request.getSession(false);
		String sessionMsg  ="";
		if(session==null) {
			 sessionMsg  ="Session Already expired";
		}else {
			sessionMsg  ="Logout Successfully";
			session.invalidate();
			
		}
		
		response.sendRedirect("Login.jsp?logout_msg="+sessionMsg);
	}

	
}
