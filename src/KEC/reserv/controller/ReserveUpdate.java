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
		
		// 국문 깨지는 문제 해결 코드
		req.setCharacterEncoding("utf-8");				
				
		String sseq = req.getParameter("seq");
		int seq = Integer.parseInt(sseq);
		String phone = req.getParameter("phone");
		
		String reservEmail01 = req.getParameter("reservEmail01");
		String reservEmail02 = req.getParameter("reservEmail02");
		String email = reservEmail01 + "@" + reservEmail02;
		
		String post = req.getParameter("post");		
		String address01 = req.getParameter("address01");
		String address02 = req.getParameter("address02");			
		String address = post + "/" + address01 + "/" + address02;
		
		String receive = req.getParameter("r-ticket");
		
		
		System.out.println("seq : " +  seq);
		System.out.println("phone : " +  phone);
		System.out.println("email : " +  email);
		System.out.println("address : " +  address);
		System.out.println("receive : " +  receive);
		
		
		
		// singleton 
		ReservDao dao = ReservDao.getInstance();	
		boolean isS = dao.reserveupdate(seq, phone, email, address, receive);
		
		
		if(isS) {
			 resp.sendRedirect("/AgencyBgencyy/reservelist");
		}else {
			
		}
		
		
		
	}
	
	
}
