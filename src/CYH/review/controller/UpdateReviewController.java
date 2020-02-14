package CYH.review.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import CYH.ReviewDao;
import CYH.ReviewDto;

public class UpdateReviewController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int seq = Integer.parseInt(req.getParameter("seq"));	// 리뷰 seq
		
		ReviewDao dao = ReviewDao.getInstance();
		ReviewDto dto = dao.getOneReview(seq);
		
		req.setAttribute("dto", dto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/community/updateReview.jsp");
		dispatcher.forward(req, resp);
	}

}
