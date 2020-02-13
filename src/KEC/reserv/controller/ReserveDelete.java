package KEC.reserv.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import KEC.reserv.dao.ReservDao;

@WebServlet("/reservedelte")
public class ReserveDelete extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("ReserveDelete doPost success");
		String seq = req.getParameter("seq");
		
		// singleton
		ReservDao dao = ReservDao.getInstance();
		dao.reserveDelete(seq);
		
		
	}
	
	
	
}
