package space.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet({"/introduce/intro", "/introduce/attractionInfo", 
	"/introduce/locationInfo", "/introduce/onlineRegister",
	"/introduce/dailyEnterInfo"})
public class IntroduceServlet extends HttpServlet{
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
		
		if (action.equals("intro")) {
			dispatchURL = "/introduce/introduce.jsp";
		} else if (action.equals("attractionInfo")) {
			dispatchURL = "/introduce/attractionInfo.jsp";
		} else if (action.equals("locationInfo")) {
			dispatchURL = "/introduce/locationInfo.jsp";
		} else if (action.equals("onlineRegister")) {
			dispatchURL = "/rule_register/onlineRegister.jsp";
		} else if (action.equals("dailyEnterInfo")) {
			dispatchURL = "/rule_register/dailyEnterInfo.jsp";
		}
		RequestDispatcher rd = req.getRequestDispatcher(dispatchURL);		
		rd.forward(req, resp);
		
		}
	}
	
	
	