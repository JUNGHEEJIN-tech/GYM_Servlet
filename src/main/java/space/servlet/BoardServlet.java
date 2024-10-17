package space.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet({"/board/freeboard", "/board/qna", "/board/recruit", "/board/notice"})
public class BoardServlet extends HttpServlet{
	
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
		if (param.equals("freeboard")) {
			dispatchURL = "/board/freeboard.jsp";
		} else if (param.equals("qna")) {
			dispatchURL = "/board/qna.jsp";			
		} else if (param.equals("notice")) {
			dispatchURL = "/board/notice.jsp";
		} else if (param.equals("recruit")) {
			dispatchURL = "/board/recruit.jsp";
		}
		
		System.out.println(dispatchURL);
		RequestDispatcher rd = req.getRequestDispatcher(dispatchURL);
		rd.forward(req, resp);
		
	}
	


}
