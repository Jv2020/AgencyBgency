package KEC.reserv.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Connection.Request;

import KEC.reserv.dao.ReservDao;
import KEC.reserv.dto.ReservDto;

@WebServlet("/reservedelte")
public class ReserveDelete extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("ReserveDelete doGet success");
		// 시퀀스 넘겨 받기
		String sseq = req.getParameter("seq");
		int seq = Integer.parseInt(sseq);
		
		System.out.println(seq);
		
		// singleton
		ReservDao dao = ReservDao.getInstance();
		boolean isS = dao.reserveDelete(seq);		
		
		System.out.println(isS);
		
		if(isS) {
			resp.sendRedirect("/AgencyBgencyy/mypage/rsvdelete.jsp");
		}else {
			
		}
	}

	
	
	
	
}
