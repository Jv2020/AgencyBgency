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

// review.jsp에서 dto.getTitle()을 들고 여기로 왔어
// reveiw.jsp에서 re_pageNum=0도 들고 여기로 왔어
@WebServlet("/onereview")
public class GetOneReviewController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 제목을 받고 처리하고 넘겨
		String title = req.getParameter("title");
		
		// 리뷰페이지넘버를 받고 처리하고 넘겨(paging)
		int re_pageNum = Integer.parseInt(req.getParameter("re_pageNum"));
		
		ReviewDao dao = ReviewDao.getInstance();
		// 인자 값으로 title과 re_pageNum을 주면
		// 그 페이지에 대한 리뷰 list를 줄거야
		List<ReviewDto> dtoList = dao.getReviewList(title, re_pageNum);
		
		int allRe_Contents = dao.getAllCount(title);	// 클릭한 전시회에 대한 전체 리뷰갯수를 구해서 allRe_Contents에 담았어
		
		req.setAttribute("title", title);
		req.setAttribute("re_pageNum", re_pageNum);
		
		req.setAttribute("dtolist", dtoList);
		req.setAttribute("allRe_Contents", allRe_Contents);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/community/reviewDetail.jsp");
		dispatcher.forward(req, resp);
	}

}
