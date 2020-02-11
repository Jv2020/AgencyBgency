package BJH.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import NWH.member.dao.MemberDao;
@WebServlet("/Member_Delete")
public class Member_Delete extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.service(req, resp);
		
		String[] sdeleteList = req.getParameterValues("pdeleteList[]");
		System.out.println(sdeleteList);
		for (int i = 0; i < sdeleteList.length; i++) {
			System.out.println(sdeleteList[i]);
			
		}
		
		req.setCharacterEncoding("utf-8");
		resp.setContentType("application/json");
		
		
		boolean memberResult = false;
		MemberDao memberDao = MemberDao.getInstance();
		//memberResult = noticeDao.notice_delete(sdeleteList);
		memberResult = memberDao.member_delete(sdeleteList);
		System.out.println("mem_result="+memberResult);
			
		  resp.sendRedirect("./admin/admin_memberList.jsp"); 
		 
		
	}

}
