package space.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet({"/rule_register/rule"})
public class RuleRegisterServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		execute(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		execute(req, resp);
	}

	private void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		System.out.println(uri);
		int lastIndex = uri.lastIndexOf("/");
		String action = uri.substring(lastIndex +1);		
		
		String dispatchURL = "";		
		if (action.equals("rule")) {
			dispatchURL = "/rule_register/rule.jsp";
		}
		
		RequestDispatcher rd = req.getRequestDispatcher(dispatchURL);
		rd.forward(req, resp);		
		
	}
}
