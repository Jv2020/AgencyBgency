package KSJ.exhibit.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import KSJ.exhibit.dao.ExhibitDao;
import KSJ.exhibit.dto.ExhibitDto;

@WebServlet("/curatorexhibitlist")
public class ExhibitCuratorList extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ExhibitDao dao = ExhibitDao.getInstance();
		String certi_num = req.getParameter("certi_num");
		String spage = req.getParameter("page");
		
		int page = 0;
		if(spage != null || !spage.equals("")) {
			page= Integer.parseInt(spage);
		}else {
			System.out.println("spage = null");
		}
		
		List<ExhibitDto> list = dao.getCuratorList(page, certi_num);
		
		req.setAttribute("list", list);
		req.setAttribute("page", page);
		
		req.getRequestDispatcher("./mypage/curatorexhibitlist.jsp").forward(req, resp);
	
	}

	
	
	
}
