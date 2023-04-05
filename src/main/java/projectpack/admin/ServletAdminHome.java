package main.java.projectpack.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin_home")
public class ServletAdminHome extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// get request handler
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/home.jsp");
        dispatcher.forward(request, response);
	}
}