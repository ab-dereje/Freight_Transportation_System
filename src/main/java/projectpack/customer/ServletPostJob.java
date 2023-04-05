package main.java.projectpack.customer;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/postjob") //
public class ServletPostJob extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    //get request handler
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get session 
		HttpSession session = request.getSession();
		String password = (String)session.getAttribute("password");
		session.setAttribute("password", password); //assigning for next route[post]

		RequestDispatcher dispatcher = request.getRequestDispatcher("customer/post.jsp");
		dispatcher.forward(request, response);
		// response.sendRedirect("customer/post.jsp");
	}

	//post request handler
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String jobTitle = request.getParameter("jobTitle");
		String jobOwner = request.getParameter("jobOwner");
		String price =request.getParameter("price");
		String truckType = request.getParameter("truckType");
		String description = request.getParameter("description");
		
		//variables
        String DBuser = "root";
        String DBpass = "password123";
        String Driver = "com.mysql.cj.jdbc.Driver";
        
        String url = "jdbc:MySQL://localhost:3306/test12";

		try {

			String sql_command = "insert into jobList (title, truckType, price, description, jobOwner) values (?, ?, ?, ?, ?)";
			
			Class.forName(Driver);
			Connection myConn = DriverManager.getConnection(url,DBuser,DBpass);

			PreparedStatement myStmt = myConn.prepareStatement(sql_command);
			
			//myStmt.setInt(1, 111);
			//job-ID <= DEFAULT
			myStmt.setString(1, jobTitle);
			myStmt.setString(2, truckType);
			myStmt.setString(3,  price);
			myStmt.setString(4, description);
			myStmt.setString(5, jobOwner);

			
			
			myStmt.executeUpdate();

			myConn.close();

			//after post is success redirect to jobs page
			RequestDispatcher dispatcher = request.getRequestDispatcher("jobs");
			dispatcher.forward(request, response);
		}

		catch(Exception e){
			e.printStackTrace();
			PrintWriter out = response.getWriter();
			out.println(e.getMessage()); 
		}
        
        
		
	}

}
