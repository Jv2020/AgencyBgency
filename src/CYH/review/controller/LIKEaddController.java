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

@WebServlet("/likeadd")
public class LIKEaddController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String title = req.getParameter("title");
		String loginUser = req.getParameter("id");
		System.out.println("TITLE:" + title);
		
		ReviewDao dao = ReviewDao.getInstance();
		
		
		int re_pageNum = Integer.parseInt(req.getParameter("re_pageNum"));
		
		List<ReviewDto> dtoList = dao.getReviewList(title, re_pageNum);
		
		int allRe_Contents = dao.getAllCount(title);
		
		req.setAttribute("re_pageNum", re_pageNum);
		
		req.setAttribute("dtolist", dtoList);
		req.setAttribute("allRe_Contents", allRe_Contents);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/community/reviewDetail.jsp");
		dispatcher.forward(req, resp);
		
		
		int LIKE_Decision = dao.getLIKE_Decision(loginUser, title);
		int DISLIKE_Decision = dao.getDISLIKE_Decision(loginUser, title);
		
		if(loginUser == null || loginUser == "") {
			//resp.sendRedirect("/AgencyBgencyy/community/reviewDetail.jsp");
			/*
			 * dispatcher = req.getRequestDispatcher("/community/reviewDetail.jsp");
			 * dispatcher.forward(req, resp);
			 */
		}else {
			if(LIKE_Decision == 1 || DISLIKE_Decision == 1) {
				//resp.sendRedirect("/AgencyBgencyy/community/reviewDetail.jsp");
				/*
				 * dispatcher = req.getRequestDispatcher("/community/reviewDetail.jsp");
				 * dispatcher.forward(req, resp);
				 */
			}else {
				dao.likeCount(loginUser, title);
				dao.setLIKE_Decision(loginUser, title);
			//	resp.sendRedirect("/AgencyBgencyy/community/reviewDetail.jsp");
			}
		}
	}

}
