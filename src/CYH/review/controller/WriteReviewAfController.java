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
		System.out.println("넘어온 id는 " + id);
		String title = req.getParameter("title");
		System.out.println("넘어온 title은 " + title);
		String review = req.getParameter("review");
		System.out.println("넘어온reivew는 " + review);
		int star = Integer.parseInt(req.getParameter("star"));
		System.out.println("들어온 별갯수는 " + star);
		
		ReviewDao dao = ReviewDao.getInstance();
		boolean isS = dao.writeReview(new ReviewDto(id, title, review, star));
		
	//	resp.sendRedirect("/AgencyBgencyy/index.jsp");
		resp.sendRedirect("/AgencyBgencyy/mypage/myexhibitAf.jsp");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
}


