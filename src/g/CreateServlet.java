package g;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class CreateServlet extends HttpServlet {
	private static final Logger _log = LogManager.getLogger(CreateServlet.class);

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String repassword = request.getParameter("repassword");

		String amoun = request.getParameter("amount");
		double amount = Double.parseDouble(amoun);

		String adderess = request.getParameter("adderess");

		String ph = request.getParameter("phone");
		double phone = Double.parseDouble(ph);

		int status = RegisterUser.register(username, password, repassword, amount, adderess, phone);

		if (status > 0) {
			request.setAttribute("Create_MSG", "WELCOME! YOUR ACCOUNT HAS OPENED");
		} else {
			request.setAttribute("Create_MSG", "Sorry,Registration failed. please try later");
		}
		RequestDispatcher rd = request.getRequestDispatcher("create.jsp");
		rd.include(request, response);

		out.close();
	}

}
