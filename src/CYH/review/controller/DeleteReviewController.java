package CYH.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import CYH.ReviewDao;

@WebServlet("/deletereview")
public class DeleteReviewController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	//	String sseq = req.getParameter("seq");
	//	int seq = Integer.parseInt(sseq);
		int seq = Integer.parseInt(req.getParameter("seq"));
		
		ReviewDao dao = ReviewDao.getInstance();
		boolean isS = dao.deleteReview(seq);
	}
	
}
