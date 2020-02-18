package CYH.review.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteReviewAf")
public class DeleteReviewAfController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("deleteReviewAf에 잘왔어");
		
		//resp.sendRedirect("/mypage/mypage.jsp");
		
		RequestDispatcher disp = req.getRequestDispatcher("/mypage/mypage.jsp");
		disp.forward(req, resp);
	}

}
