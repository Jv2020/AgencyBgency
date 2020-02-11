package CYH.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import CYH.PagingDto;
import CYH.ReviewDao;
import CYH.ReviewDto;

// 실제 리뷰를 뿌려주는 서블렛(페이징포함)
@WebServlet("/getreviewlist")
public class GetReviewList extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ReviewDao dao = ReviewDao.getInstance();
		PagingDto paging = new PagingDto();
		
		int count = dao.getAllCount();
		
		int page = 1;
		
		if(req.getParameter("page") != null) {
			page = Integer.parseInt(req.getParameter("page"));
		}
		
		paging.setPage(page);
		paging.setTotalCount(count);
		
		List<ReviewDto> reviewList = dao.getReviewList(page);
		
		req.setAttribute("reviewlist", reviewList);
		req.setAttribute("paging", paging);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/community/reviewDetail.jsp");
		dispatcher.forward(req, resp);
	}
	
}
