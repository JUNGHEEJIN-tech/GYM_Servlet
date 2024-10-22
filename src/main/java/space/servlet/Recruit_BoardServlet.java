package space.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import space.dto.Recruit_Board;
import space.jdbc.JDBCRecruit_BoardDao;
import space.jdbc.Recruit_BoardDao;

@SuppressWarnings("serial")
@WebServlet({"/board/recruitInput", "/board/recruitSave", "/board/recruitList", "/board/recruitDetail", "/board/recruitUpdate", "/board/recruitDelete", "/board/recruitSearch"})
public class Recruit_BoardServlet extends HttpServlet {

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
		int lastIndex = uri.lastIndexOf("/");
		String action = uri.substring(lastIndex+1);
		System.out.println(action);
		
		if(action.equals("recruitInput")) {
			
		} else if(action.equals("recruitSave")) {
			
			Recruit_BoardDao rDao = new JDBCRecruit_BoardDao();
			
			Recruit_Board board = new Recruit_Board();
			
			board.setTitle(req.getParameter("title"));
			board.setContent(req.getParameter("content"));
			board.setWriter(req.getParameter("writer"));
			
			rDao.insert(board);
			req.setAttribute("result", "저장 되었습니다.");
			
		} else if (action.equals("recruitList")) {
			Recruit_BoardDao rDao = new JDBCRecruit_BoardDao();
			req.setAttribute("boards", rDao.findAll());
			
		} else if (action.equals("recruitDetail")) {
			Recruit_BoardDao rDao = new JDBCRecruit_BoardDao();
			int id = Integer.parseInt(req.getParameter("id"));

		    if (id != 0) {

		    Recruit_Board board = rDao.findById(id);
            req.setAttribute("board", board);
		    
            int updateViews = rDao.updateViews(id);
            
            if (updateViews == 1) {
                req.setAttribute("message", "조회수 증가");
            } else {
                req.setAttribute("message", "조회수 확인 불가");
            }
		}
		    
		}  else if (action.equals("recruitUpdate")) {    
			Recruit_BoardDao rDao = new JDBCRecruit_BoardDao();
			
			int id = Integer.parseInt(req.getParameter("id"));
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			String writer = req.getParameter("writer");
			
			rDao.update(new Recruit_Board(id, title, content, writer));
			req.setAttribute("boards", rDao.findAll());
			
		} else if (action.equals("recruitDelete")) {
			Recruit_BoardDao rDao = new JDBCRecruit_BoardDao();
			
			int id = Integer.parseInt(req.getParameter("id"));
			rDao.deleteById(id);
			req.setAttribute("boards", rDao.findAll());
		
		} else if (action.equals("recruitSearch")) {
			Recruit_BoardDao rDao = new JDBCRecruit_BoardDao();
			
			String filter = req.getParameter("f");
		    String query = req.getParameter("query");
 
		    System.out.println("Filter: " + filter);
		    System.out.println("Query: " + query);
		    
		    List<Recruit_Board> boards = rDao.search(filter, query);
		    req.setAttribute("boards", boards);
		}
		
		String dispatcherUrl = null;
		
		if(action.equals("recruitInput")) {
			dispatcherUrl = "/board/Recruit_Boardinput.html";

		} else if (action.equals("recruitSave")) {
			dispatcherUrl = "/board/Recruit_Boardsave.html";

		} else if (action.equals("recruitList")) {
			dispatcherUrl = "/board/Recruit_Boardlist.jsp";
		
		} else if (action.equals("recruitDetail")) {
			dispatcherUrl = "/board/Recruit_Boarddetail.jsp";
			
		} else if (action.equals("recruitUpdate")) {
			dispatcherUrl = "/board/Recruit_Boardlist.jsp";
			
		} else if (action.equals("recruitDelete")) {
			dispatcherUrl = "/board/Recruit_Board/list";
		
		} else if (action.equals("recruitSearch")) {
			dispatcherUrl = "/board/Recruit_BoardSearch.jsp";
		}
			
		System.out.println(dispatcherUrl);
		RequestDispatcher rd = req.getRequestDispatcher(dispatcherUrl);
		rd.forward(req, resp);
	}
}
