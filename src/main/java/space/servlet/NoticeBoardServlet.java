package space.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import space.noticeboard.JdbcNotice_BoardDao;
import space.noticeboard.Notice_Board;

@SuppressWarnings("serial")
@WebServlet({"/board/noticeBoardList", "/board/noticeBoardDetail", "/board/noticeBoardWrite", "/board/noticeBoardWriteResult"})
public class NoticeBoardServlet extends HttpServlet {
    
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
        JdbcNotice_BoardDao dao = JdbcNotice_BoardDao.getInstance();
        
        if (param.equals("noticeBoardList")) {
            req.setAttribute("noticeBoardList", dao.getAll());
            dispatchURL = "/board/noticeBoardList.jsp";
            
        } else if (param.equals("noticeBoardDetail")) {
            String idxStr = req.getParameter("idx");
            int idx = Integer.parseInt(idxStr);
            Notice_Board noticeBoard = dao.get(idx);
            req.setAttribute("noticeBoardDetail", noticeBoard);
            dispatchURL = "/board/noticeBoardDetail.jsp";        
            
        } else if (param.equals("noticeBoardWrite")) {
            dispatchURL = "/board/noticeBoardWrite.jsp";            
        
        } else if (param.equals("noticeBoardWriteResult")) {
            String memberIdxStr = req.getParameter("member_idx");
            int memberIdx = Integer.parseInt(memberIdxStr);
            String title = req.getParameter("title");
            String content = req.getParameter("content");
            
            // Notice_Board 객체 생성 후 DAO에 저장
            Notice_Board noticeBoard = new Notice_Board();
            noticeBoard.setTitle(title);
            noticeBoard.setMemberIdx(memberIdx);
            noticeBoard.setContent(content);
            noticeBoard.setRegistDate(new java.sql.Timestamp(System.currentTimeMillis()));
            noticeBoard.setViews(0); // 초기 조회수는 0

            dao.insert(noticeBoard);
            
            dispatchURL = "noticeBoardList";    
        }
        
        System.out.println(dispatchURL);
        RequestDispatcher rd = req.getRequestDispatcher(dispatchURL);
        rd.forward(req, resp);        
    }
}
