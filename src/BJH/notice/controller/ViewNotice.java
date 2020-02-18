package BJH.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BJH.notice.dao.FileDao;
import BJH.notice.dao.NoticeDao;
import BJH.notice.dto.NoticeDto;
import KSJ.files.dto.FilesDto;
@WebServlet("/vNotice")
public class ViewNotice extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String sseq = req.getParameter("seq");
		NoticeDao noticeDao = NoticeDao.getInstance();
		
		
		
		if(sseq == null) {
			req.setCharacterEncoding("utf-8");
			String spageNum = req.getParameter("pageNum");
			
			int pageNum =0;
			if(spageNum != null && !spageNum.equals("")){
				pageNum = Integer.parseInt(spageNum);
			}
	
			int noticeLength = noticeDao.getAllNoticeLength();
			int noticePage = noticeLength / 10;
			if(noticeLength % 10 > 0){
				noticePage = noticePage +1;
			}
			System.out.println("noticePageNum = " + pageNum);
			System.out.println("noticePage = "+noticePage);
			System.out.println("Notice DEL=0 총 갯수="+noticeLength);
			List<NoticeDto> noticeList = null;
			noticeList = noticeDao.getNoticePagingList10(pageNum);
			
			req.setAttribute("pageNum", pageNum);
			req.setAttribute("noticeList", noticeList);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/community/notice.jsp");
			dispatcher.forward(req, resp);
		
		}else {
			int seq = Integer.parseInt(sseq);
			System.out.println("seq="+seq);
			
			NoticeDto noticeDto = noticeDao.notice_detail(seq);
			FileDao fileDao = FileDao.getInstance();
			FilesDto fileDto = fileDao.getOriginName(seq);
			
			req.setAttribute("fileDto", fileDto);
			req.setAttribute("noticeDto", noticeDto);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/community/noticeDetail.jsp");
			dispatcher.forward(req	, resp);
			
		}
	}
	
}
