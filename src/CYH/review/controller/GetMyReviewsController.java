package CYH.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import CYH.ReviewDao;
import CYH.ReviewDto;

@WebServlet("/myReviews")
public class GetMyReviewsController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String spageNumber = req.getParameter("pageNumber");
		System.out.println("spageNumber :" + spageNumber);
		
		int pageNumber = 0; 
		
		if(spageNumber != null && !spageNumber.equals("")){
			pageNumber = Integer.parseInt(spageNumber);
		}else {
			pageNumber = 0; 
		}
		
		String id = req.getParameter("id");
		System.out.println("넘어온 세션아이디는 " + id);
		
		ReviewDao dao = ReviewDao.getInstance();
		List<ReviewDto> myReviews = dao.getMyReviews(id, pageNumber);
		
		int allMyReviewCount = dao.getMyReviewsCount(id);
		
		req.setAttribute("myReviews", myReviews);
		req.setAttribute("allMyReviewCount", allMyReviewCount);
		req.setAttribute("pageNumber", pageNumber);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/mypage/myreview.jsp");
		dispatcher.forward(req, resp);
	}
}
