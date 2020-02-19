package BJH.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BJH.notice.dao.AdminDao;
import BJH.notice.dao.NoticeDao;
import BJH.notice.dto.NoticeDto;
import KSJ.exhibit.dao.ExhibitDao;
import KSJ.exhibit.dto.ExhibitDto;
import NWH.member.dao.MemberDao;
import NWH.member.dto.MemberDto;

@WebServlet("/admin")
public class Admin extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//----------------------- 공지 -------------------------------------------------
		String noticeSearchChoice = req.getParameter("noticeSearchChoice");
		System.out.println("-------noticeSearchChoice---------" + noticeSearchChoice);
		String noticeSearchWord = req.getParameter("noticeSearchWord");
		System.out.println("-------noticeSearchWord---------" + noticeSearchWord);
		String sNoticePageNumber = req.getParameter("noticePageNumber");
		System.out.println("------sNoticePageNumber----------" + sNoticePageNumber);
		
		//AdminDao adminDao = AdminDao.getInstance();
		NoticeDao noticeDao = NoticeDao.getInstance();
		
		// 공지 페이징
		int noticePageNumber =0;
		if(sNoticePageNumber != null && !sNoticePageNumber.equals("")){
			noticePageNumber = Integer.parseInt(sNoticePageNumber);
		}

		System.out.println("-------noticeSearchChoice--------" + noticeSearchChoice);
		System.out.println("--------noticeSearchWord-------" + noticeSearchWord);
		
		if(noticeSearchChoice == null || noticeSearchWord == null) {
			noticeSearchChoice = "";
			noticeSearchWord = "";
		}
		int noticeLength = noticeDao.getAllNotice(noticeSearchChoice,noticeSearchWord);
			
		
		System.out.println("Notice DEL=0 총 갯수="+noticeLength);
		
		List<NoticeDto> noticeList = null;

		noticeList = noticeDao.getNoticePagingList(noticeSearchChoice,noticeSearchWord,noticePageNumber);
//----------------------- 공지 END -------------------------------------------------
		
		
	
		
//-------------------------------승인 start ---------------------------------------
		
		String accessSearchChoice =req.getParameter("accessSearchChoice");
		System.out.println("-------accessSearchChoice---------" + accessSearchChoice);
		String accessSearchWord = req.getParameter("accessSearchWord");
		System.out.println("-------accessSearchWord---------" + accessSearchWord);
		String sAccessPageNumber = req.getParameter("accessPageNumber");
		System.out.println("------saccessPageNumber----------" + sAccessPageNumber);
		
		
		
		
		// 승인 페이징
				AdminDao adminDao = AdminDao.getInstance();
				int accessPageNumber =0;
				if(sAccessPageNumber != null && !sAccessPageNumber.equals("")){
					accessPageNumber = Integer.parseInt(sAccessPageNumber);
				}

				System.out.println("-------accessSearchChoice--------" + accessSearchChoice);
				System.out.println("--------accessSearchWord-------" + accessSearchWord);
				
				if(accessSearchChoice == null || accessSearchWord == null) {
					accessSearchChoice = "";
					accessSearchWord = "";
				}
				int accessLength = adminDao.getAccessMember(accessSearchChoice,accessSearchWord);
					
				
				System.out.println("Access DEL=0 총 갯수="+accessLength);
		
				List<MemberDto> memberList = null;
		 
				memberList = adminDao.getAccessPagingList(accessSearchChoice,accessSearchWord,accessPageNumber);
//-------------------------------승인 END ---------------------------------------		 
		 
		 
		 
		 
//------------------------------전시start-----------------------------------------
		 
		String exhibitSearchChoice = req.getParameter("exhibitSearchChoice");
		String exhibitSearchWord = req.getParameter("exhibitSearchWord");
		String sExhibitPageNumber = req.getParameter("exhibitPageNumber");
		
		System.out.println("-------exhibitSearchChoice---------" + exhibitSearchChoice);
		System.out.println("-------exhibitSearchWord---------" + exhibitSearchWord);
		System.out.println("------exhibitPageNumber----------" + sExhibitPageNumber);
		
		//ExhibitDao exhibitDao = ExhibitDao.getInstance();
		
		// 전시 페이징
				int exhibitPageNumber =0;
				if(sExhibitPageNumber != null && !sExhibitPageNumber.equals("")){
					exhibitPageNumber = Integer.parseInt(sExhibitPageNumber);
				}

				System.out.println("-------exhibitSearchChoice--------" + exhibitSearchChoice);
				System.out.println("--------exhibitSearchWord-------" + exhibitSearchWord);
				
				if(exhibitSearchChoice == null || exhibitSearchWord == null) {
					exhibitSearchChoice = "";
					exhibitSearchWord = "";
				}
				int exhibitLength = adminDao.getAllExhibit(exhibitSearchChoice,exhibitSearchWord);
				System.out.println("Exhibit DEL=0 총 갯수="+exhibitLength);
				List<ExhibitDto> exhibitList = null;
				exhibitList = adminDao.getExhibitPagingList(exhibitSearchChoice,exhibitSearchWord,exhibitPageNumber);
//------------------------------전시end-----------------------------------------		 
		 
		 
		 
		 
		 
		 
///-----------------------foward------------------------------		
		
		req.setAttribute("noticeList", noticeList);
		req.setAttribute("memberList", memberList);
		req.setAttribute("exhibitList", exhibitList);
		
		req.setAttribute("noticePageNumber",sNoticePageNumber);
		req.setAttribute("accessPageNumber", sAccessPageNumber);
		req.setAttribute("exhibitPageNumber", sExhibitPageNumber);
		
		req.setAttribute("noticeLength", noticeLength);
		req.setAttribute("accessLength", accessLength);
		req.setAttribute("exhibitLength", exhibitLength);
		
		req.setAttribute("noticeSearchWord", noticeSearchWord);
		req.setAttribute("accessSearchWord", accessSearchWord);
		req.setAttribute("exhibitSearchWord", exhibitSearchWord);
		
		req.setAttribute("noticeSearchChoice", noticeSearchChoice);
		req.setAttribute("accessSearchChoice", accessSearchChoice);
		req.setAttribute("exhibitSearchChoice", exhibitSearchChoice);
		
		//System.out.println("exhibitSearchWord"+exhibitSearchWord);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/amain.jsp");
		dispatcher.forward(req	, resp);
		
		
	}
	
	

	

	
	
}
