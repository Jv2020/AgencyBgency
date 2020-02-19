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

@WebServlet("/exhibitmorelist")
public class ExhibitMoreList extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		req.setCharacterEncoding("utf-8");
		
		ExhibitDao dao = ExhibitDao.getInstance();

		String choice = req.getParameter("choice");
		String scount =  req.getParameter("count");
		
		int count = Integer.parseInt(scount);
		int numOfContent = 12;	// 초기 데이터 사이즈
		int numOfPlus = 4;		// 추가되는 데이터 사이즈
		int allContentSize = dao.getContentNumber(choice);
		System.out.println("allContentSize:"+allContentSize);
		
		if( numOfContent + count * numOfPlus > allContentSize ) {
			System.out.println("콘텐츠 초과됨 ");
			resp.getWriter().write("false");
			return;
		}
		
		List<ExhibitDto> list =  dao.getMoreExhibit(choice, count);
		
		resp.setContentType("application/json");
		resp.setCharacterEncoding("utf-8");
		
		String gson = new Gson().toJson(list);
		resp.getWriter().write(gson);
		
		
		
	
	}

	
	
	
}
