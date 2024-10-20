package space.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet({"/main/home", "/main/loginForm", "/main/joinForm", "/main/schedule"})
public class MainServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	private void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		System.out.println(uri);
		
		int lastIndex = uri.lastIndexOf("/");
		String param = uri.substring(lastIndex +1);
		System.out.println(param);
		String dispatchUrl = "";
		if (param.equals("home")) {
			dispatchUrl = "/index.html";
		} else if (param.equals("loginForm")) {
			dispatchUrl = "/login.jsp";
		} else if (param.equals("joinForm")) {
			dispatchUrl = "/join.jsp";
		} else if (param.equals("schedule")) {
			dispatchUrl = "/schedule.jsp";
		}
		
		
		System.out.println(dispatchUrl);
		RequestDispatcher rd = req.getRequestDispatcher(dispatchUrl);
		rd.forward(req, resp);
	}
}
