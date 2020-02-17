package KEC.reserv.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/aboutusentrance")
public class AboutUsEntrance extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("AboutUsEntrance ok");
		
		resp.sendRedirect(req.getContextPath()+"/about/aboutus.jsp");
		
	}

	
	
}
