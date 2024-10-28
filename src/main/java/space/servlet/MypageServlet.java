package space.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import space.dto.Member;

@WebServlet({"/join/mypage"})
public class MypageServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
		
		
		if (param.equals("update")) 
		{
			
			
//			Member m = new Member();
//			
//			String pw = req.getParameter("newPw");
//			
//			System.out.println(pw);
			
			
			
			
//			req.setAttribute("loginSuccessMessage", "정보가 수정되었습니다.");
//			dispatchURL = "/join/join.jsp";
		}
		else if (param.equals("mypage"))
		{
			dispatchURL = "/join/mypage.jsp";
			
		}
		
		
		
		
		
		
		
		
		System.out.println(dispatchURL);
		RequestDispatcher rd = req.getRequestDispatcher(dispatchURL);
		rd.forward(req, resp);	
	}

}
