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

@WebServlet("/joinpage/")
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
		
		
		
		if(param.equals("joinpage"))
		{
			
			
			
			String loginId = req.getParameter("");
			String loginPw = req.getParameter("");
			String name = req.getParameter("");
			String postCode = req.getParameter("");
			String addr = req.getParameter("");
			String addr_detail = req.getParameter("");
			String email = req.getParameter("");
			
			Member m = new Member();
			m.setLogin_id(loginId);
			m.setLogin_pw(loginPw);
			m.setName(name);
			m.setPost_code(postCode);
			m.setAddr(addr);
			m.setAddr_detail(addr_detail);
			m.setEmail(email);
			
			//JdbcMemberDao.getin
			
			
		}
		else if (param.equals("")) {
			
		}
		
		
		String dispatchURL = "";
		
		
		if(param.equals("joinpage"))
		{
			dispatchURL = "/main/home";
		}
		else if (param.equals("")) {
			
		}
		
		
		
		System.out.println(dispatchURL);
		RequestDispatcher rd = req.getRequestDispatcher(dispatchURL);
		rd.forward(req, resp);	
		
	}

}
