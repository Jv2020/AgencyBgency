package CYH.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import CYH.ReviewDao;

public class UpdateReviewController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int seq = Integer.parseInt(req.getParameter("seq"));
		String review = req.getParameter("review");
		int star = Integer.parseInt(req.getParameter("star"));
		
		ReviewDao dao = ReviewDao.getInstance();
		Boolean isS = dao.updateReview(seq, review, star);
	}

}
