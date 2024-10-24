package space.servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		String uri = req.getRequestURI();
		System.out.println(uri);
		int lastIndex = uri.lastIndexOf("/");
		String param = uri.substring(lastIndex + 1);
		
		String dispatchURL = "";
	
		if(param.equals("joinForm"))
		{
			dispatchURL = "/join/join.jsp";
		}
		else if(param.equals("join"))
		{
			
			String loginId = req.getParameter("mb_id");
			String loginPw = req.getParameter("mb_password");
			String name = req.getParameter("reg_mb_name");
			String phone = req.getParameter("mb_hp");
			String postCode = req.getParameter("mb_zip");
			String addr = req.getParameter("mb_addr1");
			String addr_detail = req.getParameter("mb_addr2");
			String email = req.getParameter("old_email");
			
			Member m = new Member();
			
			m.setLogin_id(loginId);
			m.setLogin_pw(loginPw);
			m.setName(name);
			m.setPost_code(postCode);
			m.setAddr(addr);
			m.setAddr_detail(addr_detail);
			m.setEmail(email);
			m.setPhone(phone);
			
			System.out.println(m);
			
			//JdbcMemberDao.getin
			//dispatchURL = "/main/home";
			
		}
		else {
			dispatchURL = "/error/error.jsp";
		}
		
		
		

		
		
//		if(param.equals("joinForm"))
//		{
//			dispatchURL = "/main/home";
//		}
//		else if (param.equals("")) {
//			
//		}
		
		
		
		System.out.println(dispatchURL);
		RequestDispatcher rd = req.getRequestDispatcher(dispatchURL);
		rd.forward(req, resp);	
		
	}

}
