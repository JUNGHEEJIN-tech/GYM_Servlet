package space.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import space.common.DAOManager;
import space.common.Pagination;
import space.jdbc.JdbcQna_BoardDao;

@WebServlet({"/board/qna_BoardList"})
public class QNAServlet extends HttpServlet{

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
		
		if(param.equals("list"))
		{
			JdbcQna_BoardDao qDao = new JdbcQna_BoardDao();
			
			String query = req.getParameter("query");
			String keyWord = req.getParameter("keyWord");
			String pageNum = req.getParameter("pageNum");
			int page = 1;
			
			if(pageNum != null)
			{
				page = Integer.parseInt(pageNum);
			}
			
			//검색 키워드가 있는 경우.
			if((keyWord != null && !keyWord.equals(""))&& (query != null && !query.equals("")))
			{
//				Pagination pagination = new Pagination(DAOgetAllCount(query, keyword), pageNum, 10, 5);
//				req.setAttribute("freeBoardList", DAOManager.getInstance().getFbDao().findBoard(query, keyword, pageInt));
//				req.setAttribute("pagination", pagination);
			}
			else
			{
				//Pagination pagination = new Pagination()
			}
			
		}
		else if (param.equals("write"))
		{
			
		}
		
		String dispatchURL = "";
		
		if(param.equals("list"))
		{
			dispatchURL = "/board/QnaBoardList.jsp";
		}
		else if (param.equals("write"))
		{
			dispatchURL = "/board/QnaBoardWrite.jsp";			
		}
		
		RequestDispatcher rd = req.getRequestDispatcher(dispatchURL);
		rd.forward(req, resp);	
	}
	
}
