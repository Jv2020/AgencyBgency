package CYH.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import KSJ.exhibit.dao.ExhibitDao;
import KSJ.exhibit.dto.ExhibitDto;

// 전시회를 뿌려주는 서블렛
@WebServlet("/showReviewList")
public class ShowReviewList extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ExhibitDao dao = ExhibitDao.getInstance();
		
		
		List<ExhibitDto> list = dao.getExhibitList("now", 13);
		
		req.setAttribute("list", list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/community/review.jsp");
		dispatcher.forward(req, resp);
	}

}
