package CYH.review.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import CYH.ReviewDao;

@WebServlet("/updatereviewAf")
public class UpdateReviewAfController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int seq = Integer.parseInt(req.getParameter("seq"));
		System.out.println("updatereviewAf에 들어온 seq는 " + seq);
		String review = req.getParameter("review");
		System.out.println("updatereviewAf에 들어온 리뷰내용은 " + review);
		int star = Integer.parseInt(req.getParameter("starrate"));
		System.out.println("updatereviewAf에 들어온 별갯수는 " + star);
		
		ReviewDao dao = ReviewDao.getInstance();
		Boolean sisS = dao.updateReview(seq, review, star);
		
		String isS = String.valueOf(sisS);
		
		req.setAttribute("isS", isS);
		
		RequestDispatcher disp = req.getRequestDispatcher("/community/updateReviewAf.jsp");
		disp.forward(req, resp);
	}

}
