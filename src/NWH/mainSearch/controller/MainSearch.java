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
		Map<String, List<ExhibitDto>> exhibitDtolist = new HashMap<String, List<ExhibitDto>>();
		
		List<ExhibitDto> exhibitByTitleList = dao.getExhibitListAfterSeachTitle(searchWord);
		System.out.println("size:"+exhibitByTitleList.size());
		if(exhibitByTitleList.size()>0) {
			System.out.println(exhibitByTitleList.get(0).toString());
			exhibitDtolist.put("title", exhibitByTitleList);
			
		} else {
			System.out.println("검색없음");
		}
		
		
		List<ExhibitDto> exhibitByContentList = dao.getExhibitListAfterSeachContent(searchWord);
		if(exhibitByContentList.size()>0) {
			System.out.println(exhibitByContentList.get(0).toString());
			exhibitDtolist.put("content", exhibitByContentList);
			
		} else {
			System.out.println("컨텐츠 	검색없음");
		}
		
		
		req.setAttribute("exhibitDtolist", exhibitDtolist);
		req.getRequestDispatcher("/main/mainSearch.jsp").forward(req, resp);
		
	}
	
}
