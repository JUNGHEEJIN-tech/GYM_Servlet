package space.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import space.dto.Member;
import space.jdbc.JdbcMemberDao;

@SuppressWarnings("serial")
@WebServlet({"/main/home", "/main/loginForm", "/main/joinForm", "/main/schedule", "/main/loginCheck"})
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
			dispatchUrl = "/main/login.jsp";
		} else if (param.equals("joinForm")) {
			dispatchUrl = "/main/join.jsp";
		} else if (param.equals("schedule")) {
			dispatchUrl = "/main/schedule.jsp";
		} else if (param.equals("loginCheck")) {
			String id = req.getParameter("login_id");
			String pw = req.getParameter("login_pw");			
			Member toLoginMember = JdbcMemberDao.getInstance().findbyId(id, pw);
			if (toLoginMember != null) {
				HttpSession session = req.getSession();				
				session.setAttribute("loginMember", toLoginMember);
				dispatchUrl = "home";
			} else {
				req.setAttribute("loginErrorMessage", "해당 정보를 가진 회원이 없습니다.");
				dispatchUrl = "loginForm";
			}
			
			
		}
		
		System.out.println(dispatchUrl);
		RequestDispatcher rd = req.getRequestDispatcher(dispatchUrl);
		rd.forward(req, resp);
	}
}
