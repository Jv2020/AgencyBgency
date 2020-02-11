package KEC.reserv.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import KEC.reserv.dao.ReservDao;
import KEC.reserv.dto.ReservDto;


@WebServlet("/reservinsert")
public class ReservInsert extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("success do Post");
		// 국문 깨지는 문제 해결 코드
		req.setCharacterEncoding("utf-8");
				
		String name = req.getParameter("reservName");	
		String year = req.getParameter("reservYear");	
		String month = req.getParameter("reservMonth");	
		String day = req.getParameter("reservDay");	
		String phone = req.getParameter("reservPhone");	
		
		String reservEmail01 = req.getParameter("reservEmail01");		
		String reservEmail02 = req.getParameter("reservEmail02");	
		String email = reservEmail01 + "@" + reservEmail02;	
		
		String post = req.getParameter("post");		
		String address01 = req.getParameter("address01");
		String address02 = req.getParameter("address02");				
		String rticket = req.getParameter("r-ticket");				
		String qty = req.getParameter("qty");		
		String rpayment = req.getParameter("r-payment");		
		String totalprice = req.getParameter("totalprice");
		
		
		System.out.println("reservName : " + name);		
		System.out.println("reservYear : " + year);
		System.out.println("reservMonth : " + month);
		System.out.println("reservDay : " + day);			
		System.out.println("phone : " + phone);	
		System.out.println("reservEmail01 : " + reservEmail01);
		System.out.println("reservEmail02 : " + reservEmail02);		
		System.out.println("post : " + post);
		System.out.println("address01 : " + address01);
		System.out.println("address02 : " + address02);		
		System.out.println("rticket : " + rticket);		
		System.out.println("qty : " + qty);		
		System.out.println("rpayment : " + rpayment);		
		System.out.println("totalprice : " + totalprice);		
		
		ReservDao dao = ReservDao.getInstance();
		
	    dao.getReserv(new ReservDto(reservName, birthdate, phone, email, address, receive, qty, totalPrice, payMethod, del))
		
				
	}

	

}
