package space.servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import space.dto.Member;
import space.jdbc.JdbcMemberDao;

@WebServlet({"/join/joinForm", "/join/join"})
public class JoinServlet extends HttpServlet{
	
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
		String param = uri.substring(lastIndex + 1);

		String dispatchURL = "";

		if (param.equals("joinForm")) 
		{
			dispatchURL = "/join/join.jsp";
		}
		else if (param.equals("join")) 
		{
			String loginId = req.getParameter("mb_id");
			
			System.out.println("id : " + loginId);
			String loginPw = req.getParameter("mb_password");
			String name = req.getParameter("mb_name");
			String phone = req.getParameter("mb_hp");
			String postCode = req.getParameter("mb_zip");
			String addr = req.getParameter("mb_addr1");
			String addrDetail = req.getParameter("mb_addr2");
			String email = req.getParameter("mb_email");
			String note = req.getParameter("note");

			Member m = new Member();			
			m.setLogin_id(loginId);
			m.setLogin_pw(loginPw);
			m.setName(name);
			m.setPost_code(postCode);
			m.setAddr(addr);
			m.setAddr_detail(addrDetail);
			m.setEmail(email);
			m.setPhone(phone);
			m.setNote(note);
			
			
			if(JdbcMemberDao.getInstance().insert(m) != 0)
			{
				HttpSession session = req.getSession();
				session.setAttribute("loginMember", m);
				req.setAttribute("loginSuccessMessage", m.getName() + "님 로그인이 완료되었습니다.");
			}

			System.out.println(m); // 디버깅 출력
			dispatchURL = "/main/home";

		}
		else 
		{
			dispatchURL = "/error/error.jsp";
		}
		
		
		System.out.println(dispatchURL);
		RequestDispatcher rd = req.getRequestDispatcher(dispatchURL);
		rd.forward(req, resp);	
		
	}
}
