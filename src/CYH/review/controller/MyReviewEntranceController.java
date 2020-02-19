package CYH.review.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/myreviewEntrance")
public class MyReviewEntranceController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		System.out.println("들어온 id는 " + id);
		
		//resp.sendRedirect("/AgencyBgencyy/myReviews");
		
		req.setAttribute("id", id);
		
		RequestDispatcher disp = req.getRequestDispatcher("/myReviews");
		disp.forward(req, resp);
	}

}
