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

@WebServlet("/exhibitinsert")
public class ExhibitInsert extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String choice = req.getParameter("choice");
		String spage = req.getParameter("page");
		int page = Integer.parseInt(spage);
		

		ExhibitDao dao = ExhibitDao.getInstance();
		List<ExhibitDto> list = dao.getExhibitList(choice, page);
		
		resp.setContentType("application/json");	// 보내는 데이터 형식을 json으로 변환
		resp.setCharacterEncoding("utf-8");			// 한글을 정상으로 출력
		
		
//		System.out.println("Title : " + list.get(0).getTitle());
//		System.out.println("Content : " + list.get(0).getContent());
//		System.out.println("time : " + list.get(0).getEx_time());
		
		String gson = new Gson().toJson(list);
		resp.getWriter().write(gson);
	
	
	}

	
	
}
