package space.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import space.common.DAOManager;
import space.common.Pagination;
import space.dto.Free_Board;
import space.dto.Member;
import space.jdbc.JdbcQna_BoardDao;

@WebServlet({"/board/qnaBoardList", "/board/qnaBoardDetail", 
	"/board/qnaBoardWrite", "/board/qnaBoardWriteResult",
	"/board/qnaBoardModify", "/board/qnaBoardModifyResult",
	"/board/qnaBoardDelete"})
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
		
		if(param.equals("qnaBoardList"))
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
			List<Member> iLst = new ArrayList();
			
			//검색 키워드가 있는 경우.
			if((keyWord != null && !keyWord.equals(""))&& (query != null && !query.equals("")))
			{
				Pagination pagination = new Pagination(qDao.getAllCount(query, keyWord), pageNum, 10, 5);
				req.setAttribute("qna_boardList", qDao.findBoard(query, keyWord, page));
				req.setAttribute("pagination", pagination);
			}
			else
			{
				Pagination pagination = new Pagination(qDao.getAllCount("", ""), pageNum, 10, 5);
				req.setAttribute("qna_boardList", qDao.findAll(page));				
				req.setAttribute("pagination", pagination);
			}
			
		}
		else if (param.equals("qnaBoardDetail"))
		{
			JdbcQna_BoardDao qDao = new JdbcQna_BoardDao();
			String idxStr = req.getParameter("idx");
			int idx = Integer.parseInt(idxStr);			
			qDao.hitUp(idx);
			req.setAttribute("freeBoardDetail", qDao.getBoardInfo(idx));
		}
		else if (param.equals("qnaBoardWrite"))
		{
		}
		else if (param.equals("qnaBoardWriteResult"))
		{
			JdbcQna_BoardDao qDao = new JdbcQna_BoardDao();
			String member_idxStr = req.getParameter("member_idx");
			System.out.println(member_idxStr);
			
			int member_idx = Integer.parseInt(member_idxStr);
			String pageNum = req.getParameter("pageNum");
			String title = req.getParameter("title");
			String content = req.getParameter("content");			
			
			req.setAttribute("writeResult",qDao.writeFreeBoard(
					new Free_Board(title, content, 0, new Member(member_idx))));
		}
		else if (param.equals("qnaBoardModify"))
		{
			JdbcQna_BoardDao qDao = new JdbcQna_BoardDao();
			String idxStr = req.getParameter("idx");
			int idx = Integer.parseInt(idxStr);
			
			req.setAttribute("originalInfo", qDao.getBoardInfo(idx));
		}
		else if (param.equals("qnaBoardModifyResult"))
		{
			JdbcQna_BoardDao qDao = new JdbcQna_BoardDao();
			
			int idx = Integer.parseInt(req.getParameter("idx"));			
			String title = req.getParameter("title");
			String content = req.getParameter("content");			
			
			req.setAttribute("modifyResult", qDao.modifyFreeBoard(
					new Free_Board(idx, title, content)));
		}
		else if (param.equals("qnaBoardDelete"))
		{
			JdbcQna_BoardDao qDao = new JdbcQna_BoardDao();
			String idxStr = req.getParameter("idx");			
			int idx = Integer.parseInt(idxStr);
			
			req.setAttribute("deleteResult", qDao.deleteByIdx(idx));
		}
		
		
		String dispatchURL = "";
		
		if(param.equals("qnaBoardList"))
		{
			dispatchURL = "/board/qnaBoardList.jsp";
		}
		else if (param.equals("qnaBoardDetail"))
		{
			dispatchURL = "/board/qnaBoardDetail.jsp";			
		}
		else if (param.equals("qnaBoardWrite"))
		{
			dispatchURL = "/board/qnaBoardWrite.jsp";
		}
		else if (param.equals("qnaBoardWriteResult"))
		{
			dispatchURL = "/board/qnaBoardWriteResult.jsp";
		}
		else if (param.equals("qnaBoardModify"))
		{
			dispatchURL = "/board/qnaBoardModify.jsp";
		}
		else if (param.equals("qnaBoardModifyResult"))
		{
			dispatchURL = "/board/qnaBoardModifyResult.jsp";
		}
		else if (param.equals("qnaBoardDelete"))
		{
			dispatchURL = "/board/qnaBoardDelete.jsp";
		}
		RequestDispatcher rd = req.getRequestDispatcher(dispatchURL);
		rd.forward(req, resp);	
	}
	
}
