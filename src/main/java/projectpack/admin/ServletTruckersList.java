package main.java.projectpack.admin;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.java.projectpack.model.truckersInfoJDBC;



@WebServlet("/truckers_info")
public class ServletTruckersList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RequestDispatcher dispatcher = null;
	
	//get request handler
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try{
            // session
            HttpSession session = request.getSession();
            String password = (String)session.getAttribute("password");
            session.setAttribute("password", password);
            
            request.setAttribute("infoRec", new truckersInfoJDBC().getUserInfo());
            dispatcher = request.getRequestDispatcher("admin/truckers.jsp");
            dispatcher.forward(request, response);
        }
		catch(Exception e)
        {
            PrintWriter out = response.getWriter();
            out.print(e.getMessage());
            e.printStackTrace();
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
}