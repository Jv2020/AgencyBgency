package KEC.reserv.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import KSJ.exhibit.dao.ExhibitDao;
import KSJ.exhibit.dto.ExhibitDto;

@WebServlet("/reservget")
public class ReservGet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("reservget doPost success");
		
		//  예매정보 -> 예매내역 확인으로 보내기
		String sseq = req.getParameter("seq");
		int seq = Integer.parseInt(sseq);
		
		System.out.println("seq : " + seq);
		
		ExhibitDao edao = ExhibitDao.getInstance();
		ExhibitDto dto = edao.getExDetail(seq);
		
		req.setAttribute("exhibitDto", dto);
		
		RequestDispatcher dis = req.getRequestDispatcher("./reservation/reserv.jsp");
		dis.forward(req, resp);
		
		
		
	}
	
	
	
}
