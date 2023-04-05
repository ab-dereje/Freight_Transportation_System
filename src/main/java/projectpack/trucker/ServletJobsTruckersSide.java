package main.java.projectpack.trucker;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.java.projectpack.model.jobsJDBC;



@WebServlet("/jobslist") // trucker side...
public class ServletJobsTruckersSide extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RequestDispatcher dispatcher = null;
	
	//get request handler
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get session
		HttpSession session = request.getSession();
		String password = (String)session.getAttribute("password");
		session.setAttribute("password", password);

		request.setAttribute("jobRec", new jobsJDBC().getjobsResultSet());
		dispatcher = request.getRequestDispatcher("trucker/jobs.jsp"); //trucker
		dispatcher.include(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
}