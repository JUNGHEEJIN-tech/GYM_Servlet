package space.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import space.common.DAOManager;
import space.dto.Attraction;


@WebServlet({"/rule_register/rule", "/rule_register/trainerRegister", "/rule_register/registerResult"})
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
		String uri = req.getRequestURI();
		System.out.println(uri);
		int lastIndex = uri.lastIndexOf("/");
		String action = uri.substring(lastIndex +1);		
		
		String dispatchURL = "";		
		if (action.equals("rule")) {
			dispatchURL = "/rule_register/rule.jsp";
		} else if (action.equals("register")) {
			dispatchURL = "/rule_register/register.jsp";
		} else if (action.equals("trainerRegister")) {
			req.setAttribute("trainerList", DAOManager.getInstance().gettDao().trainerList());
			dispatchURL = "/rule_register/trainerRegister.jsp";
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
		}
		
		RequestDispatcher rd = req.getRequestDispatcher(dispatchURL);
		rd.forward(req, resp);		
		
	}
}
