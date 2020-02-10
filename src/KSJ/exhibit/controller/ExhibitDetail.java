package KSJ.exhibit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import KSJ.exhibit.dao.ExhibitDao;
import KSJ.exhibit.dto.ExhibitDto;

@WebServlet("/exdetail")
public class ExhibitDetail extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String sseq = req.getParameter("seq");
		String ex = req.getParameter("ex");
		int seq = Integer.parseInt(sseq);
		
		System.out.println("servlet seq : " + seq );
		System.out.println("servlet ex : " + ex );
		
		ExhibitDao dao = ExhibitDao.getInstance();
		ExhibitDto dto = dao.getExDetail(seq);
		
		
		// 짐싸기
		req.setAttribute("dto", dto);
		req.setAttribute("ex", ex);
		
		// 보내기 -> detail view 
		RequestDispatcher dis = req.getRequestDispatcher("./exhibit/ex_detail.jsp");
		dis.forward(req, resp);
	
	}

	
	
	
}
