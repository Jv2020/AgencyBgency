package BJH.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.google.gson.Gson;

import BJH.notice.dao.AdminDao;
import NWH.member.dao.MemberDao;
import NWH.member.dto.MemberDto;

@WebServlet("/Admin_Member")
public class Admin_Member extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		String member = req.getParameter("member");
		AdminDao adminDao = AdminDao.getInstance();
		if(member != null) {
				// 회원  리스트
			  if(member.equals("list")) {
				  String sadmin_memberPageNumber = req.getParameter("admin_memberPageNumber");
				  
				  int admin_memberPageNumber = 0;
				  if(sadmin_memberPageNumber != null&& sadmin_memberPageNumber.equals("")) {
					  admin_memberPageNumber = Integer.parseInt(sadmin_memberPageNumber);
				  }
				  int admin_memberLength = adminDao.getMemberPageLength();
					
					//List<MemberDto> memberList = adminDao.getMemberList();
				  List<MemberDto> memberList =null;
				  List<MemberDto> outMemberList = null;
				  memberList = adminDao.getMemberListPaging(admin_memberPageNumber);
				  outMemberList = adminDao.getMemberList();
					req.setAttribute("memberList", memberList);
					req.setAttribute("admin_memberPageNumber", sadmin_memberPageNumber);
					req.setAttribute("admin_memberLength", admin_memberLength);
					req.setAttribute("outMemberList", outMemberList);
					RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/admin_memberList.jsp");
					dispatcher.forward(req	, resp);
			  
					
					// 탈퇴 계정 복구
			  }else if(member.equals("recovery")) {
				  String[] srecoverList = req.getParameterValues("pmemRecoverList[]");
	
					for (int i = 0; i < srecoverList.length; i++) {
						System.out.println(srecoverList[i]);
					}
					resp.setContentType("application/json");
					
					boolean memberResult = false;
					memberResult = adminDao.member_recover(srecoverList);
					System.out.println("mem_result="+memberResult);
					
					String gson = new Gson().toJson(memberResult);
					resp.getWriter().write(gson);
				// 계정 탈퇴
			  }else if(member.equals("delete")) {
				  String[] sdeleteList = req.getParameterValues("pmemDeleteList[]");
					System.out.println(sdeleteList);
					for (int i = 0; i < sdeleteList.length; i++) {
						System.out.println(sdeleteList[i]);
					}
					
					req.setCharacterEncoding("utf-8");
					resp.setContentType("application/json");
					boolean memberResult = false;
					memberResult = adminDao.member_delete(sdeleteList);
					System.out.println("mem_result="+memberResult);
					String gson = new Gson().toJson(memberResult);
					resp.getWriter().write(gson);
			// 회원 검색
			  }else if(member.equals("search")) {
				  System.out.println("search접근");
				  String choice = req.getParameter("searchChoice");
				  String searchWord = req.getParameter("searchWord");
				  
				  MemberDto memberDetail = adminDao.getMemberSearch(choice, searchWord);
				  
				  
				  if(memberDetail != null) {
					  req.setAttribute("memberDetail", memberDetail);
					  RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/admin_memberDetail.jsp");
					  dispatcher.forward(req, resp);
				  }else {
					  
					  resp.sendRedirect(req.getContextPath()+"/admin/admin_result.jsp?false");
				  }
				  
			  //큐레이터 허용
			  }else if(member.equals("access")){
				  
				  String[] saccessList = req.getParameterValues("accessList[]");
					System.out.println(saccessList);
					for (int i = 0; i < saccessList.length; i++) {
						System.out.println(saccessList[i]);
					}
					
					req.setCharacterEncoding("utf-8");
					resp.setContentType("application/json");
					boolean memberResult = false;
					memberResult = adminDao.member_access(saccessList);
					System.out.println("mem_result="+memberResult);
					String gson = new Gson().toJson(memberResult);
					resp.getWriter().write(gson);
			  }
		  
		  // member 파라미터 없을시 기본 이동
		}else {
			System.out.println("member="+member);
			System.out.println("MEMBER 파라미터 없음");
			resp.sendRedirect(req.getContextPath()+"/admin/admin_result.jsp");
		}
		
		
		
	}//service end

	
	
	
	
	
	

	
	
}
