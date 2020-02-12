package KSJ.exhibit.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import KSJ.exhibit.dao.ExhibitDao;
import KSJ.exhibit.dto.ExhibitDto;

@WebServlet("/exhibitinsert")
public class ExhibitInsert extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		req.setCharacterEncoding("utf-8");
		System.out.println("here in servlet");
		ExhibitDao dao = ExhibitDao.getInstance();
		
		String title = req.getParameter("title");
		String begindate = req.getParameter("begindate");
		String enddate = req.getParameter("enddate");
		String ex_time = req.getParameter("ex_time");
		String place = req.getParameter("place");
		String loc_info = req.getParameter("loc_info");
		String sprice = req.getParameter("price");
		String certi_num = req.getParameter("certi_num");
		String contact = req.getParameter("contact");
		String content = req.getParameter("content");
		
		System.out.println("title "+title);
		System.out.println("begindate "+begindate);
		System.out.println("enddate "+enddate);
		System.out.println("ex_time "+ex_time);
		System.out.println("place "+place);
		System.out.println("loc_info "+loc_info);
		System.out.println("price "+sprice);
		System.out.println("certi_num "+certi_num);
		System.out.println("contact "+contact);
		System.out.println("content "+content);
	
		int price = Integer.parseInt(sprice);
		
		ExhibitDto dto = new ExhibitDto(0, begindate, enddate, title, place, content, ex_time, loc_info, 0, contact, certi_num, price);
		boolean b = dao.insertExhibit(dto);
		System.out.println(b);
		
		if(true) {
			resp.sendRedirect("./exhibit/insertCheck.jsp?b=true");
		}
	}

	
	
	
}
