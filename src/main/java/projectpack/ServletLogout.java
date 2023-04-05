package main.java.projectpack;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class ServletLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// get request handler
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                HttpSession session = request.getSession();
                session.setAttribute("password", null);
                session.setAttribute("email", null);
                RequestDispatcher dispatcher = request.getRequestDispatcher("index.html"); //change sendRedirect to dispatcher
                dispatcher.forward(request, response);
	}

}
