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
import space.jdbc.JdbcRecruit_BoardDao;
import space.jdbc.JdbcMemberDao;
import space.jdbc.Recruit_BoardDao;

@SuppressWarnings("serial")
@WebServlet({"/main/home", "/main/loginForm", "/main/schedule", "/main/loginCheck", "/main/logout"})
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
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String uri = req.getRequestURI();
		System.out.println(uri);
		
		int lastIndex = uri.lastIndexOf("/");
		String param = uri.substring(lastIndex +1);
		System.out.println(param);
		String dispatchUrl = "";
		if (param.equals("home")) {
			Recruit_BoardDao rDao = new JdbcRecruit_BoardDao();			
			req.setAttribute("recruitList", rDao.findAll());
			dispatchUrl = "/index.jsp";
		} else if (param.equals("loginForm")) {
			dispatchUrl = "/main/login.jsp";
		} else if (param.equals("joinForm")) {
			dispatchUrl = "/join/join.jsp";
		} else if (param.equals("schedule")) {
			dispatchUrl = "/main/schedule.jsp";
		} else if (param.equals("loginCheck")) {
			String id = req.getParameter("login_id");
			String pw = req.getParameter("login_pw");	
			String command = req.getParameter("command");
			Member toLoginMember = JdbcMemberDao.getInstance().findbyId(id, pw);
			if (toLoginMember != null) {
				HttpSession session = req.getSession();				
				session.setAttribute("loginMember", toLoginMember);
				req.setAttribute("loginSuccessMessage", toLoginMember.getName() + "님 로그인이 완료되었습니다.");
				if (command == null || command.equals("")) {
					dispatchUrl = "/main/home";
				} else {
					dispatchUrl = command;
				}
				
			} else {
				req.setAttribute("loginErrorMessage", "해당 정보를 가진 회원이 없습니다.");
				dispatchUrl = "/main/loginForm";
			}	
		} else if (param.equals("logout")) {
			HttpSession session = req.getSession();
			session.invalidate();
			req.setAttribute("logoutMessage", "로그아웃 되었습니다.");
			dispatchUrl = "/main/home";
		}
		
		System.out.println(dispatchUrl);
		RequestDispatcher rd = req.getRequestDispatcher(dispatchUrl);
		rd.forward(req, resp);
	}
}
