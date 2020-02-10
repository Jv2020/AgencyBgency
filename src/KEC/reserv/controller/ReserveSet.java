package KEC.reserv.controller;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import KSJ.exhibit.dao.ExhibitDao;
import KSJ.exhibit.dto.ExhibitDto;

@WebServlet("/reserveset")
public class ReserveSet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 전시정보 보내기
		System.out.println("doGet success");
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
