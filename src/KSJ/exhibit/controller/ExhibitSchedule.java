package KSJ.exhibit.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import KSJ.exhibit.dao.ExhibitDao;
import KSJ.exhibit.dto.ExhibitDto;


@WebServlet("/exhibitschedule")
public class ExhibitSchedule extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
			ExhibitDao dao = ExhibitDao.getInstance();
			
			List<ExhibitDto> newlist = dao.getNewExhibits();
			List<ExhibitDto> endlist = dao.getEndExhibits();
			
			req.setAttribute("newlist", newlist);
			req.setAttribute("endlist", endlist);
			
			req.getRequestDispatcher("/schedule/schedule.jsp").forward(req, resp);;
	
	}

	
	
}
