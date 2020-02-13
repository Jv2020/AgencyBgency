package KSJ.exhibit.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import CYH.ReviewDao;
import CYH.ReviewDto;
import KSJ.exhibit.dao.ExhibitDao;
import KSJ.exhibit.dto.ExhibitDto;

@WebServlet("/exdetail")
public class ExhibitDetail extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		
		String sseq = req.getParameter("seq");
		String ex = req.getParameter("ex");
		int seq = Integer.parseInt(sseq);
		
		
		ExhibitDao dao = ExhibitDao.getInstance();
		ExhibitDto dto = dao.getExDetail(seq);
		
		// 리뷰 데이터
		ReviewDao rdao = ReviewDao.getInstance();
		List<ReviewDto> reviewList = rdao.getReviewToDetail(dto.getTitle());
	
		System.out.println("list : " + reviewList.size());
		
		// 짐싸기
		req.setAttribute("dto", dto);			// 전시 디테일보내기 
		req.setAttribute("ex", ex);						
		req.setAttribute("reviewList", reviewList);		// 리뷰 베스트 4 뽑아오기 
		
		
		// 보내기 -> detail view 
		RequestDispatcher dis = req.getRequestDispatcher("./exhibit/ex_detail.jsp");
		dis.forward(req, resp);
	
	}

	
	
	
}
