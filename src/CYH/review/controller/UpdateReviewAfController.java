package CYH.review.controller;

import java.io.IOException;

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
		int id = Integer.parseInt(req.getParameter("id"));
		String review = req.getParameter("review");
		int star = Integer.parseInt(req.getParameter("star"));
		
		ReviewDao dao = ReviewDao.getInstance();
		Boolean isS = dao.updateReview(id, review, star);
		
		if(isS) {
			resp.sendRedirect("/mypage/myexhibit.jsp");
		}else {
			resp.sendRedirect("/mypage/myexhibit.jsp");
		}
		
		
	}

}
