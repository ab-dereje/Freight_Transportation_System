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

@WebServlet("/accept")
public class ServletAccept extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/accept.html");
        dispatcher.forward(request, response);
		// response.sendRedirect("customer/accept.html");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fullname = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String jobID = request.getParameter("jobID");
		String jobOwner = request.getParameter("jobOwner");
		String message = request.getParameter("message");

		//JDBC
        String DBuser = "root";
        String DBpass = "password123";
        String Driver = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:MySQL://localhost:3306/test12";

		try {
			//insert into acceptedJobs table													   				//1  2  3  4  5  6
			String sql_command = "insert into acceptedJobs (name, email, phone, jobID, message, jobOwner) values (?, ?, ?, ?, ?, ?)";
			
			Class.forName(Driver);
			Connection myConn = DriverManager.getConnection(url,DBuser,DBpass);

			PreparedStatement myStmt = myConn.prepareStatement(sql_command);
			
			myStmt.setString(1, fullname);
			myStmt.setString(2, email);
			myStmt.setString(3, phone);
			myStmt.setString(4,  jobID);
			myStmt.setString(5, message);
			myStmt.setString(6, jobOwner);


			
			myStmt.executeUpdate();
			myConn.close();

			RequestDispatcher dispatcher = request.getRequestDispatcher("notification");
			dispatcher.forward(request, response);

		}

		catch(Exception e){
			PrintWriter out = response.getWriter();
			// out.println(e.getMessage());
			out.println("you are already applied for this job..");
			out.println("Post Failed");
			e.printStackTrace();
		}
		 
	}

}
