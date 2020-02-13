package KEC.reserv.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import KEC.reserv.dao.ReservDao;
import KEC.reserv.dto.ReservDto;


@WebServlet("/reservinsert")
public class ReservInsert extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("success do Post");
		// 국문 깨지는 문제 해결 코드
		req.setCharacterEncoding("utf-8");
		
		String during = req.getParameter("during");
		String title = req.getParameter("title");	
		
		String id = req.getParameter("id");	
		String name = req.getParameter("reservName");	
		
		String year = req.getParameter("reservYear");	
		String month = req.getParameter("reservMonth");	
		String day = req.getParameter("reservDay");	
		String birthdate = year+month+day;	
		
		String phone = req.getParameter("reservPhone");	
		
		String reservEmail01 = req.getParameter("reservEmail01");		
		String reservEmail02 = req.getParameter("reservEmail02");	
		String email = reservEmail01 + "@" + reservEmail02;	
		
		String post = req.getParameter("post");		
		String address01 = req.getParameter("address01");
		String address02 = req.getParameter("address02");			
		String address = post + "/" + address01 + "/" + address02;
		
		String receive = req.getParameter("r-ticket");				
		String sqty = req.getParameter("qty");	
		int qty = Integer.parseInt(sqty);
		
		String payMethod = req.getParameter("r-payment");		
		String stotalprice = req.getParameter("totalprice");
		int totalPrice = Integer.parseInt(stotalprice);
		
		
		System.out.println("during : " + during);		
		System.out.println("title : " + title);			
		System.out.println("id : " + id);		
		System.out.println("reservName : " + name);	
		
		System.out.println("reservYear : " + year);
		System.out.println("reservMonth : " + month);
		System.out.println("reservDay : " + day);	
		System.out.println("birthdate : " + birthdate);
		
		System.out.println("phone : " + phone);	
		System.out.println("reservEmail01 : " + reservEmail01);
		System.out.println("reservEmail02 : " + reservEmail02);	
		System.out.println("email : " + email);	
		
		System.out.println("post : " + post);
		System.out.println("address01 : " + address01);
		System.out.println("address02 : " + address02);		
		System.out.println("address : " + address);	
		
		System.out.println("rticket : " + receive);		
		System.out.println("qty : " + qty);		
		System.out.println("payMethod : " + payMethod);		
		System.out.println("totalprice : " + totalPrice);		
		
		ReservDao dao = ReservDao.getInstance();
		ReservDto dto = new ReservDto(id, name, birthdate, phone, email, address, receive, qty, totalPrice, payMethod, title, during);
		boolean isS = dao.getReservInsert(dto);
		
		
		if(isS) { // insert 성공			
			
			// session에 dto를 담아준다.
			HttpSession reservSession = req.getSession();
			reservSession.setAttribute("dto", dto);
			
			// 예매내역 확인 경로로 이동 
			req.getRequestDispatcher("./reservation/reservConfirm.jsp").forward(req, resp);	
			
		}else { // insert 실패
			System.out.println("실패");
		}
				
	}

	

}
