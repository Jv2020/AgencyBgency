package CYH.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import CYH.ReviewDao;

@WebServlet("/dislikeadd")
public class DISLIKEaddController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String loginUser = req.getParameter("id");
		String title = req.getParameter("title");
		
		ReviewDao dao = ReviewDao.getInstance();
		
		int DISLIKE_Decision = dao.getDISLIKE_Decision(loginUser, title);
		int LIKE_Decision = dao.getLIKE_Decision(loginUser, title);
		
		if(loginUser == null || loginUser == "") {
			resp.sendRedirect("/AgencyBgencyy/community/reviewDetail.jsp");
		}else {
			if(LIKE_Decision == 1 || DISLIKE_Decision == 1) {
				resp.sendRedirect("/AgencyBgencyy/community/reviewDetail.jsp");
			}else {
				dao.dislikeCount(loginUser, title);
				dao.setDISLIKE_Decision(loginUser, title);
				resp.sendRedirect("/AgencyBgencyy/community/reviewDetail.jsp");
			}
		}
	}

}
