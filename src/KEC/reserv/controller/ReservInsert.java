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
				
		String name = req.getParameter("name");	
		System.out.println("name : " + name);
		
		ReservDao dao = ReservDao.getInstance();
		
				
	}

	

}
