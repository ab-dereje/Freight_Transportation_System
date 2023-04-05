package main.java.projectpack;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// path ==> /signin
@WebServlet("/signin") 
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// get request handler
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("login.jsp"); //forward to login.jsp
	}

	// post request handler
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// credentials from user
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String userType = request.getParameter("userType"); // login as customer/trucker

	
		// String em = "astu@mail.com", pass="pass123";
		RequestDispatcher dispatcher = null;

		String DBuser = "root";
        String DBpass = "password123";
        String Driver = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:MySQL://localhost:3306/test12";

		
        
        try {
            String sql_command = null;

            if(userType.equals("Customer")){
                sql_command = "select password from customers where email=\'"+email+"\'";  // "select password from customers where email='sofi@mail.com'"
            }
            if(userType.equals("Trucker")){
                sql_command = "select password from truckers where email=\'"+email+"\'"; // "select password from truckers where email='email'"
            }

            // JDBC
            Class.forName(Driver);
            
            Connection con = DriverManager.getConnection(url,DBuser,DBpass);
            
            Statement statement = con.createStatement();

            ResultSet result = statement.executeQuery(sql_command);
            
            // db cred
		    String pass_db = null;

            while(result.next()) {
                pass_db = result.getString("password");            
            }

            if(pass_db.equals(password) && userType.equals("Customer")){
                //request.setAttribute("status", "success");
                HttpSession session = request.getSession();
                session.setAttribute("password", password); // variable and value
                session.setAttribute("email", email);
                session.setAttribute("userType", userType);


				dispatcher = request.getRequestDispatcher("jobs"); // for customers
            }
            else if(pass_db.equals(password) && userType.equals("Trucker")){
                //request.setAttribute("status", "success");
                HttpSession session = request.getSession();
                session.setAttribute("password", password);
                session.setAttribute("email", email);
                session.setAttribute("userType", userType);

                
			    dispatcher = request.getRequestDispatcher("jobslist"); // for trucker
            }
            else{
                request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("login.jsp");
            }
            dispatcher.forward(request, response); 

        }catch (Exception e) {
            PrintWriter out = response.getWriter();
            out.println(e.getMessage());
            // request.setAttribute("status", "failed");
			// dispatcher = request.getRequestDispatcher("login.jsp");
            // dispatcher.forward(request, response);
        }
	}

}
