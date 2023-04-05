package main.java.projectpack;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.java.projectpack.model.customersInfoJDBC;
import main.java.projectpack.model.truckersInfoJDBC;



@WebServlet("/myaccount")
public class ServletMyAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RequestDispatcher dispatcher = null;
	
	//get request handler
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
        String userType = (String) session.getAttribute("userType");

		try{
			if(userType.equals("Trucker")){
				request.setAttribute("infoRec", new truckersInfoJDBC().getUserInfo());
				dispatcher = request.getRequestDispatcher("trucker/my_account.jsp");
			}
			else if(userType.equals("Customer")){
				request.setAttribute("infoRec", new customersInfoJDBC().getUserInfo());
				dispatcher = request.getRequestDispatcher("customer/my_account.jsp");
			}
			else{
				//if userType is null, user does not logged in so we should redirect user to login page..
				dispatcher = request.getRequestDispatcher("login.jsp");
			}
			
			dispatcher.forward(request, response);
		}
		catch(Exception e){
			PrintWriter out = response.getWriter();
			out.println(e.getMessage());
		}
	}

}