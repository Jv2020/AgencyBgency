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

@WebServlet("/reviewdetail")
public class GetMyReviewDetailController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int seq = Integer.parseInt(req.getParameter("seq"));
		System.out.println("디테일서블렛으로 들어온 seq는 " + seq);
		
		ReviewDao dao = ReviewDao.getInstance();
		ReviewDto dto = dao.getOneReview(seq);
		
		req.setAttribute("dto", dto);
		
		RequestDispatcher disp = req.getRequestDispatcher("mypage/myreviewDetail.jsp");
		disp.forward(req, resp);
	}

}
