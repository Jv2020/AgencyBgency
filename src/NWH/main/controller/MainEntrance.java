package NWH.main.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import KSJ.exhibit.dao.ExhibitDao;
import KSJ.exhibit.dto.ExhibitDto;


@WebServlet("/mainEntrance")
public class MainEntrance extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		System.out.println("MainEntrance ok");
		
		ExhibitDao edao = ExhibitDao.getInstance();
		// 인기전시
		List<ExhibitDto> popularEx = edao.mainRecommandExhibit();
		
		// 월별전시
		List<ExhibitDto> monthList = edao.getMonthSchedule("","");
		ExhibitDto recommandDto = edao.getRecommandExhibit();
		
		req.setAttribute("monthList", monthList);
		req.setAttribute("recommandDto", recommandDto);
		req.setAttribute("popularEx", popularEx);
		
		req.getRequestDispatcher("/main/main.jsp").forward(req, resp);;
		
	}

	
	
}
