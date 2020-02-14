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

@WebServlet("/reservelist")
public class ReserveList extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doGet ReserveList success");
		
		// singleton
		ReservDao dao = ReservDao.getInstance();
		List<ReservDto> list = dao.ReserveList();

        // 데이터(list) 포장
        req.setAttribute("list", list);
		// list 전송
		req.getRequestDispatcher("/AgencyBgencyy/mypage/myreserv.jsp").forward(req, resp);
		
		
	}

	
	
}
