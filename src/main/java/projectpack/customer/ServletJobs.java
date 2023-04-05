package main.java.projectpack.customer;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.java.projectpack.model.jobsJDBC;



@WebServlet("/jobs") //job list
public class ServletJobs extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RequestDispatcher dispatcher = null;
	
	// get request handler
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("jobRec", new jobsJDBC().getjobsResultSet()); // className.methodName()
		dispatcher = request.getRequestDispatcher("customer/jobs.jsp");
				
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
}