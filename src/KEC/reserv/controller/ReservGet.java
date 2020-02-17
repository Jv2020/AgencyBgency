package KEC.reserv.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import KEC.reserv.dao.ReservDao;
import KEC.reserv.dto.ReservDto;
import KSJ.exhibit.dao.ExhibitDao;
import KSJ.exhibit.dto.ExhibitDto;

@WebServlet("/reservget")
public class ReservGet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("reservGet doGet success");
		// 시퀀스 넘겨 받기
		String sseq = req.getParameter("seq");
		int seq = Integer.parseInt(sseq);
		
		String page = req.getParameter("page");
		
		System.out.println(seq);
		System.out.println(page);
		
		// singleton
		ReservDao dao = ReservDao.getInstance();		
		ReservDto dto = dao.getReserve(seq);	
		
		
		// 짐싸기
		req.setAttribute("dto", dto);
		
		// 짐 보내기
		if(page.equals("detail")) {		
			req.getRequestDispatcher("./mypage/rsvConfirm.jsp").forward(req, resp);
		}else if (page.equals("update")){
			req.getRequestDispatcher("./mypage/rsvwrite.jsp").forward(req, resp);
		}
		
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("reservGet doPost success");
		// 시퀀스 넘겨 받기
		String sseq = req.getParameter("seq");
		int seq = Integer.parseInt(sseq);
		
		System.out.println(seq);
		
		// singleton
		ReservDao dao = ReservDao.getInstance();		
		ReservDto dto = dao.getReserve(seq);	
		
		
		// 짐싸기
		req.setAttribute("dto", dto);
		
		// 짐 보내기
		req.getRequestDispatcher("/mypage/rsvwrite.jsp").forward(req, resp);
		
	}

	
	
}
