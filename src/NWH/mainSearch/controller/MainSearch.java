package NWH.mainSearch.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import KSJ.exhibit.dto.ExhibitDto;
import NWH.mainSearch.dao.mainSearchDao;

@WebServlet("/mainSearch")
public class MainSearch extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		
		String searchWord = req.getParameter("mainSearchWord");
		System.out.println("서치 컨트롤러: "+ searchWord);
		
		mainSearchDao dao = mainSearchDao.getInstance();
		
		List<ExhibitDto> exhibitByTitleList = dao.getExhibitListAfterSeachTitle(searchWord);
		System.out.println(exhibitByTitleList.get(0).toString());
		List<ExhibitDto> exhibitByContentList = dao.getExhibitListAfterSeachContent(searchWord);
		System.out.println(exhibitByContentList.get(0).toString());
		
		Map<String, Object> exhibitDtolist = new HashMap<String, Object>();
		exhibitDtolist.put("title", exhibitByTitleList);
		exhibitDtolist.put("content", exhibitByContentList);
		
		
		req.setAttribute("exhibitDtolist", exhibitDtolist);
		req.getRequestDispatcher("/main/serchtest.jsp").forward(req, resp);
		
	}
	
}
