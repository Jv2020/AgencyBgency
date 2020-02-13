package KSJ.exhibit.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import KSJ.exhibit.dao.ExhibitDao;
import KSJ.exhibit.dto.ExhibitDto;

@WebServlet("/exhibitlist")
public class ExhibitList extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		
		String choice = req.getParameter("choice");
		String spage = req.getParameter("page");
		int page = 0;
		if(spage!=null && !spage.equals("")) {
			page = Integer.parseInt(spage);
		}
		if( choice == null || choice.equals("")) {	//null일때 
			choice = "now";
		} 

		ExhibitDao dao = ExhibitDao.getInstance();
		List<ExhibitDto> list = dao.getExhibitList(choice,12);
		
		resp.setContentType("application/json");	// 보내는 데이터 형식을 json으로 변환
		resp.setCharacterEncoding("utf-8");			// 한글을 정상으로 출력
		
		String sendLink="";
		if(choice.equals("now")) {
			sendLink="exhibit.jsp";
		}else if(choice.equals("past")) {
			sendLink="exhibit_past.jsp";
			
		}else if(choice.equals("fut")) {
			sendLink="exhibit_future.jsp";
		}
		
		
		req.setAttribute("list", list);
		req.getRequestDispatcher("./exhibit/"+sendLink).forward(req, resp);
	
	}

	
	
}
