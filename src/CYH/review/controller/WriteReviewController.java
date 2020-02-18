package CYH.review.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import KSJ.exhibit.dao.ExhibitDao;
import KSJ.exhibit.dto.ExhibitDto;

@WebServlet("/writereview")
public class WriteReviewController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int seq = Integer.parseInt(req.getParameter("seq"));
		System.out.println("넘어온 전시seq는 " + seq);
		
		ExhibitDao dao = ExhibitDao.getInstance();
		ExhibitDto dto = dao.getExDetail(seq);
		
		//resp.sendRedirect("/AgencyBgencyy/community/writeReview.jsp?title=" + title + "&id=" + id);
		req.setAttribute("dto", dto);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/community/starrr-gh-pages/writeReview.jsp");
		dispatcher.forward(req, resp);
		
	}

}
