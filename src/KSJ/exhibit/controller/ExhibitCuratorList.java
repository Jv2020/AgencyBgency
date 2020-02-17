package KSJ.exhibit.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import KSJ.exhibit.dao.ExhibitDao;
import KSJ.exhibit.dto.ExhibitDto;
import NWH.member.dto.MemberDto;

@WebServlet("/curatorexhibitlist")
public class ExhibitCuratorList extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 세션에서 큐레이터 정보 받아오기 
		HttpSession session = req.getSession();
		MemberDto loginuser = (MemberDto)session.getAttribute("loginuser");
		
		ExhibitDao dao = ExhibitDao.getInstance();
		String certi_num = loginuser.getCerti_num();
		String spage = req.getParameter("page");
		
		// 페이징을 위한 페이지 파라미터 파싱 
		int page = 0;
		if(spage != null || !spage.equals("")) {
			page= Integer.parseInt(spage);
		}else {
			System.out.println("spage = null");
		}
		
		// dao에서 내가 쓴 글 긁어오기
		List<ExhibitDto> list = dao.getCuratorList(page, certi_num);
		
		// 페이징을 위한 전체 총 글갯수 불러오기 
		int contentsNum = dao.getCuratorContentsNum(certi_num);
		
		req.setAttribute("list", list);
		req.setAttribute("page", page);
		req.setAttribute("contentsNum", contentsNum);
		
		req.getRequestDispatcher("./mypage/curatorexhibitlist.jsp").forward(req, resp);
	
	}

	
	
	
}
