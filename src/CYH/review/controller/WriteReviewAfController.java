package CYH.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import CYH.ReviewDao;
import CYH.ReviewDto;

@WebServlet("/writereviewAf")
public class WriteReviewAfController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String title = req.getParameter("title");
		String review = req.getParameter("review");
		int star = Integer.parseInt(req.getParameter("star"));
		System.out.println("들어온 별갯수는 " + star);
		
		ReviewDao dao = ReviewDao.getInstance();
		boolean isS = dao.writeReview(new ReviewDto(id, title, review, star));
		
		resp.sendRedirect("writeReview.jsp?isS="+isS);
	}
	
}


