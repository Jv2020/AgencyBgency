package CYH.review.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
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
		int star = Integer.parseInt(req.getParameter("starrate"));
		
		ReviewDao dao = ReviewDao.getInstance();
		boolean isS = dao.writeReview(new ReviewDto(id, title, review, star));
		
	//	resp.sendRedirect("/AgencyBgencyy/index.jsp");
	//	resp.sendRedirect("/AgencyBgencyy/mypage/myexhibitAf.jsp");
		
		
		if( id == null || title == null || review == null || star <= 0) {
			isS = false;
		}else {
			System.out.println("writereviewAf에 넘어온 id는 " + id);
			System.out.println("writereviewAf에 넘어온 title은 " + title);
			System.out.println("writereviewAf에 넘어온reivew는 " + review);
			System.out.println("writereviewAf에 들어온 별갯수는 " + star);

		}
		System.out.println("isS" + isS);
		
		req.setAttribute("isS", isS);
		
		RequestDispatcher disp = req.getRequestDispatcher("./mypage/myexhibitAf.jsp");
		disp.forward(req, resp);
	}

}


