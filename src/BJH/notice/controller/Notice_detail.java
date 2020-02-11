package BJH.notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BJH.notice.dao.NoticeDao;
import BJH.notice.dto.NoticeDto;
@WebServlet("/notice_detail")
public class Notice_detail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("doget!!!!!!!!!!!!!!!!!!!!!!!!");
		
		req.setCharacterEncoding("utf-8");
		
		String sseq = req.getParameter("seq");
		System.out.println("seq="+sseq);
		int seq = Integer.parseInt(sseq);
		
		NoticeDao noticeDao = NoticeDao.getInstance();
		
		NoticeDto noticeDto = noticeDao.notice_detail(seq);
		
		
		
		
		
		req.setAttribute("noticeDetail", noticeDto);
		RequestDispatcher dispatcher = req.getRequestDispatcher("admin/noticeDetail.jsp");
		dispatcher.forward(req	, resp);
		
		
		
		
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		super.doPost(req, resp);
		System.out.println("dopost");
	}
	
}
