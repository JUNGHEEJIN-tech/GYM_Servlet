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
import space.dto.Attraction;


@WebServlet({"/rule_register/rule", "/rule_register/attractionRegister", 
	"/rule_register/registerResult", "/rule_register/attractionList", 
	"/rule_register/attractionModify", "/rule_register/attractionModifyResult",
	"/rule_register/attractionDelete"})

public class RuleRegisterServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		execute(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		execute(req, resp);
	}

	private void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		String uri = req.getRequestURI();
		System.out.println(uri);
		int lastIndex = uri.lastIndexOf("/");
		String action = uri.substring(lastIndex +1);		
		
		String dispatchURL = "";		
		if (action.equals("rule")) {
			dispatchURL = "/rule_register/rule.jsp";
			
		} else if (action.equals("register")) {
			dispatchURL = "/rule_register/register.jsp";
			
		} else if (action.equals("attractionRegister")) {
			req.setAttribute("trainerList", DAOManager.getInstance().gettDao().trainerList());
			dispatchURL = "/rule_register/attractionRegister.jsp";
			
		} else if (action.equals("registerResult")) {
			
			String title = req.getParameter("at_title");
			String content = req.getParameter("at_content");
			String trainerIdxStr = req.getParameter("trainer_idx");
			String periodStr = req.getParameter("period");
			String prog_time = req.getParameter("prog_time");
			String end_time = req.getParameter("end_time");
			
			int trainerIdx = 1;
			if (trainerIdxStr != null) {
				trainerIdx = Integer.parseInt(trainerIdxStr);
			}
			
			int period = 1;
			if (periodStr != null) {
				period = Integer.parseInt(periodStr);
			}
			
			Attraction toRegisterAttr = new Attraction();			
			toRegisterAttr.setTitle(title);
			toRegisterAttr.setContent(content);
			toRegisterAttr.setTrainer_idx(trainerIdx);
			toRegisterAttr.setProg_time(prog_time);
			toRegisterAttr.setEnd_time(end_time);
			toRegisterAttr.setPeriod(period);
			
			req.setAttribute("registerResult", DAOManager.getInstance().getaDao().insert(toRegisterAttr));			
			
			dispatchURL = "/main/schedule";
			
		} else if (action.equals("attractionList")) {
			String page = req.getParameter("pageNum");
			int pageNum = 1;
			if (page != null) {
				pageNum = Integer.parseInt(page);
			}
			
			Pagination pagination = new Pagination(DAOManager.getInstance().getaDao().getAllCount(), page, 10, 5);
			req.setAttribute("attractionList", DAOManager.getInstance().getaDao().attractionListbyPagination(pageNum));
			req.setAttribute("pagination", pagination);
			
			
			dispatchURL = "/rule_register/attractionList.jsp";
		} else if (action.equals("attractionModify")) {
			String attr_idx = req.getParameter("attr_idx");
			
			Attraction toModifyAttraction = DAOManager.getInstance().getaDao().getAttraction(Integer.parseInt(attr_idx));
			req.setAttribute("originalInfo", toModifyAttraction);
			req.setAttribute("trainerList", DAOManager.getInstance().gettDao().trainerList());
			
			dispatchURL = "/rule_register/attractionModify.jsp";
			
		} else if (action.equals("attractionModifyResult")) {
			String attr_idx = req.getParameter("attr_idx");
			String title = req.getParameter("at_title");
			String content = req.getParameter("at_content");
			String trainerIdxStr = req.getParameter("trainer_idx");
			String periodStr = req.getParameter("period");
			String prog_time = req.getParameter("prog_time");
			String end_time = req.getParameter("end_time");
			
			int trainerIdx = 1;
			if (trainerIdxStr != null) {
				trainerIdx = Integer.parseInt(trainerIdxStr);
			}
			
			int period = 1;
			if (periodStr != null) {
				period = Integer.parseInt(periodStr);
			}
			
			Attraction toModifyAttr = new Attraction();			
			toModifyAttr.setAttr_idx(Integer.parseInt(attr_idx));
			toModifyAttr.setTitle(title);
			toModifyAttr.setContent(content);
			toModifyAttr.setTrainer_idx(trainerIdx);
			toModifyAttr.setProg_time(prog_time);
			toModifyAttr.setEnd_time(end_time);
			toModifyAttr.setPeriod(period);
			
			System.out.println("prog_time:"+ prog_time);
			System.out.println("end_time:"+end_time);
			
			req.setAttribute("modifyResult", DAOManager.getInstance().getaDao().update(toModifyAttr));
			
			dispatchURL = "/rule_register/attractionList";
			
		} else if (action.equals("attractionDelete")) {
			String attr_idx = req.getParameter("attr_idx");
			req.setAttribute("deleteResult", DAOManager.getInstance().getaDao().delete(Integer.parseInt(attr_idx)));
			
			dispatchURL = "/rule_register/attractionList";
		}
		
		RequestDispatcher rd = req.getRequestDispatcher(dispatchURL);
		rd.forward(req, resp);		
		
	}
}
