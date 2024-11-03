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
import space.dto.Free_Board;
import space.dto.Free_BoardComment;
import space.dto.Member;
import space.jdbc.JdbcFree_BoardDao;

@SuppressWarnings("serial")
@WebServlet({"/board/freeBoardList", "/board/freeBoardDetail", 
	"/board/freeBoardWrite", "/board/freeBoardWriteResult",
	"/board/freeBoardModify", "/board/freeBoardModifyResult",
	"/board/freeBoardDelete", "/board/freeBoardCommentWrite",
	"/board/freeBoardCommentDelete"})

public class FreeBoardServlet extends HttpServlet{
	
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
		if (param.equals("freeBoardList")) {
			String query = req.getParameter("query");
			String keyword = req.getParameter("keyword");
			String pageNum = req.getParameter("pageNum");
			int pageInt = 1;
			if (pageNum != null) {
				pageInt = Integer.parseInt(pageNum);
			}
			
						
			if ((keyword != null && !keyword.equals(""))&& (query != null && !query.equals(""))) {
				Pagination pagination = new Pagination(DAOManager.getInstance().getFbDao().getAllCount(query, keyword), pageNum, 10, 5);
				req.setAttribute("freeBoardList", DAOManager.getInstance().getFbDao().findBoard(query, keyword, pageInt));
				req.setAttribute("pagination", pagination);
			} else {				
				Pagination pagination = new Pagination(DAOManager.getInstance().getFbDao().getAllCount("", ""), pageNum, 10, 5);
				req.setAttribute("freeBoardList", DAOManager.getInstance().getFbDao().allList(pageInt));				
				req.setAttribute("pagination", pagination);
			}
			
			dispatchURL = "/board/freeBoardList.jsp";
			
		} else if (param.equals("freeBoardDetail")) {
			String idxStr = req.getParameter("idx");
			int idx = Integer.parseInt(idxStr);			
			DAOManager.getInstance().getFbDao().hitUp(idx);
			req.setAttribute("freeBoardDetail", DAOManager.getInstance().getFbDao().getBoardInfo(idx));
			req.setAttribute("comments", DAOManager.getInstance().getFbcDao().allList(idx));
			
			dispatchURL = "/board/freeBoardDetail.jsp";		
			
		} else if (param.equals("freeBoardWrite")) {
			dispatchURL = "/board/freeBoardWrite.jsp";			
		
		} else if (param.equals("freeBoardWriteResult")) {			
			String member_idxStr = req.getParameter("member_idx");
			System.out.println(member_idxStr);
			
			int member_idx = Integer.parseInt(member_idxStr);
			String pageNum = req.getParameter("pageNum");
			String title = req.getParameter("title");
			String content = req.getParameter("content");			
			
			req.setAttribute("writeResult", DAOManager.getInstance().getFbDao().writeFreeBoard(
					new Free_Board(title, content, 0, new Member(member_idx))));
			
			dispatchURL = "freeBoardList?pageNum="+pageNum;	
			
		} else if (param.equals("freeBoardModify")) {
			String idxStr = req.getParameter("idx");
			int idx = Integer.parseInt(idxStr);
			
			req.setAttribute("originalInfo", DAOManager.getInstance().getFbDao().getBoardInfo(idx));			
			dispatchURL = "/board/freeBoardModify.jsp";
		
		} else if (param.equals("freeBoardModifyResult")) {
			
			int idx = Integer.parseInt(req.getParameter("idx"));			
			String title = req.getParameter("title");
			String content = req.getParameter("content");			
			
			req.setAttribute("modifyResult", DAOManager.getInstance().getFbDao().modifyFreeBoard(
					new Free_Board(idx, title, content)));
			
			dispatchURL = "freeBoardDetail?idx="+idx;
			
		} else if (param.equals("freeBoardDelete")) {
			String idxStr = req.getParameter("idx");			
			int idx = Integer.parseInt(idxStr);
			
			req.setAttribute("deleteResult", DAOManager.getInstance().getFbDao().deleteFreeBoard(idx));
			
			dispatchURL = "freeBoardList";
		} else if (param.equals("freeBoardCommentWrite")) {
			String memberIdx = req.getParameter("memberIdx");
			String freeBoardIdx = req.getParameter("freeBoardIdx");
			String content = req.getParameter("content");
			
			if (memberIdx != null) {
				req.setAttribute("writeCommentResult", DAOManager.getInstance().getFbcDao().writeComment(
						new Free_BoardComment(Integer.parseInt(memberIdx), Integer.parseInt(freeBoardIdx), content))); 
								
			} else {
				req.setAttribute("writeCommentResult", "입력 실패");
			}
			
			dispatchURL = "freeBoardDetail?idx="+freeBoardIdx;
			
		} else if (param.equals("freeBoardCommentDelete")) {
			String commentIdx = req.getParameter("commentIdx");
			String freeBoardIdx = req.getParameter("freeBoardIdx");
			req.setAttribute("commentDeleteResult", DAOManager.getInstance().getFbcDao().deleteComment(Integer.parseInt(commentIdx)));
			dispatchURL = "freeBoardDetail?idx="+freeBoardIdx;			
		}
		
		System.out.println(dispatchURL);
		RequestDispatcher rd = req.getRequestDispatcher(dispatchURL);
		rd.forward(req, resp);		
	}
}