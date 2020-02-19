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
		System.out.println("writereviewAf에 넘어온 id는 " + id);
		String title = req.getParameter("title");
		System.out.println("writereviewAf에 넘어온 title은 " + title);
		String review = req.getParameter("review");
		System.out.println("writereviewAf에 넘어온reivew는 " + review);
		int star = Integer.parseInt(req.getParameter("starrate"));
		System.out.println("writereviewAf에 들어온 별갯수는 " + star);
		
		ReviewDao dao = ReviewDao.getInstance();
		boolean sisS = dao.writeReview(new ReviewDto(id, title, review, star));
		
	//	resp.sendRedirect("/AgencyBgencyy/index.jsp");
	//	resp.sendRedirect("/AgencyBgencyy/mypage/myexhibitAf.jsp");
		
		String isS = String.valueOf(sisS);
		
		req.setAttribute("isS", isS);
		
		RequestDispatcher disp = req.getRequestDispatcher("/mypage/myexhibitAf.jsp");
		disp.forward(req, resp);
	}

}


