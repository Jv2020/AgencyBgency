package KSJ.exhibit.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import KSJ.exhibit.dao.ExhibitDao;
import KSJ.exhibit.dto.ExhibitDto;

@WebServlet("/exhibitmonthsch")
public class ExhibitMonthSch extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		String year = req.getParameter("year");
		String month = req.getParameter("month");
		
		ExhibitDao dao = ExhibitDao.getInstance();
		System.out.println("year : " + year);
		System.out.println("month : " + month);
		List<ExhibitDto> list = dao.getMonthSchedule(year, month);
		

		resp.setContentType("application/json");	// 보내는 데이터 형식을 json으로 변환
		resp.setCharacterEncoding("utf-8");			// 한글을 정상으로 출력
		
		
		String gson = new Gson().toJson(list);
		resp.getWriter().print(gson);
		
	}

	
	
	
}
