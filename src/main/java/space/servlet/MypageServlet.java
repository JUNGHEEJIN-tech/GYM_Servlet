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

@WebServlet({"/join/mypage", "/join/update"})
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
			HttpSession session = req.getSession();
			//입력하지 않은 정보는 기존의 정보로 대체한다.
			
			Member curM = (Member)session.getAttribute("loginMember");
			
			String pw = req.getParameter("newPw");

			
			String pc = req.getParameter("newPostCode");
			String ad = req.getParameter("newAddr");
			String add = req.getParameter("newAddrDetail");
			String ph = req.getParameter("newPhone");
			String nt = req.getParameter("newNote");
			String mail = req.getParameter("newEmail"); 
			
			Member m = new Member();
			
			
			m.setLogin_pw(pw);
			m.setPost_code(pc);
			m.setAddr(ad);
			m.setAddr_detail(add);
			m.setPhone(ph);
			m.setNote(nt);
			m.setEmail(mail);
			m.setIdx(curM.getIdx());

			
			JdbcMemberDao.getInstance().update(m);
			
			 
			dispatchURL = "/main/home";
			
		}
		else if (param.equals("mypage"))
		{
			HttpSession session = req.getSession();
			
			System.out.println(session);
			
			//attribute 로 갖고오게 되면 전부 문자열로 가져오기 때문에 캐스팅을 해줘야함. 
			Member loginMember = (Member) session.getAttribute("loginMember");
			req.setAttribute("loginMember", loginMember);
			
			dispatchURL = "/join/mypage.jsp";
			
		}
		
		
		System.out.println(dispatchURL);
		RequestDispatcher rd = req.getRequestDispatcher(dispatchURL);
		rd.forward(req, resp);	
	}

}
