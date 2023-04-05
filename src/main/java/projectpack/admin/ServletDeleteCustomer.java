package main.java.projectpack.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/delete_customer")
public class ServletDeleteCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// get request handler
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String targetEmail = request.getParameter("targetEmail");

        String DBuser = "root";
        String DBpass = "password123";
        String Driver = "com.mysql.cj.jdbc.Driver";
        
        String url = "jdbc:MySQL://localhost:3306/test12";
        
        try {
            String sql_command = "DELETE FROM customers WHERE email=\'" + targetEmail + "\'";

            Class.forName(Driver);
            
            Connection con = DriverManager.getConnection(url,DBuser,DBpass);
            
            Statement statement = con.createStatement();

            int rowsAffected = statement.executeUpdate(sql_command);

            System.out.println(rowsAffected);

            statement.close();

            con.close();

            RequestDispatcher dispatcher = request.getRequestDispatcher("customers_info"); 
            dispatcher.forward(request, response);

            
        }catch (Exception e) {
            PrintWriter out = response.getWriter();
            out.println(e.getMessage());
            e.printStackTrace();
        }

	}

	// post request handler
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
