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
import KSJ.exhibit.dao.ExhibitDao;
import KSJ.exhibit.dto.ExhibitDto;

// 전시회를 뿌려주는 서블렛
// depth02.jsp에서 pageNum=0을 들고 여기로 왔어
@WebServlet("/showReviewList")
public class ShowReviewList extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ReviewDao dao = ReviewDao.getInstance();
		
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));	// pageNum을 받았어
		
		// getExhibitReview메소드는 pageNum을 받아서 그 페이지에 올라올 전시회를 설정해주고 돌려줄거야
		List<ExhibitDto> list = dao.getExhibitReview(pageNum);
		
		// getReviewExhibitNum메소드는 review.jsp에 뿌려질 전시회의 갯수를 구해줘
		// 그리고 그 갯수를 allContents에 담았어
		int allContents = dao.getReviewExhibitNum();
		
		// 짐싸
		req.setAttribute("allContents", allContents);	// allContents를 이용해서 전체페이지를 구할거야
		req.setAttribute("list", list);
		req.setAttribute("pageNum", pageNum);
		
		// review.jsp쪽으로 forward!
		RequestDispatcher dispatcher = req.getRequestDispatcher("/community/review.jsp");
		dispatcher.forward(req, resp);
	}

}
