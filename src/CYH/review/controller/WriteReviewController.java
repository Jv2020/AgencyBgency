package CYH.review.controller;

import java.io.IOException;

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
		String id = req.getParameter("loginuser");
		String title1 = req.getParameter("title");
		System.out.println("title1은 " + title1);
		
		ExhibitDao dao = ExhibitDao.getInstance();
		ExhibitDto dto = dao.getExDetail(seq);
		
		String title = dto.getTitle();
		
		resp.sendRedirect("writeReview.jsp?title=" + title + "&id=" + id);
		
		
	}

}
