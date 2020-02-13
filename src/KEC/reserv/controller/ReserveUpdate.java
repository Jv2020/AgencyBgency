package KEC.reserv.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import KEC.reserv.dao.ReservDao;

@WebServlet("/reserveupdate")
public class ReserveUpdate extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("ReserveUpdate doPost Success");
		
		// 예매 내역 수정하기 
		
		// singleton 
		ReservDao dao = ReservDao.getInstance();	
		// dao.update(seq, phone, email, address, receive);
		
		
		
	}
	
	
}
