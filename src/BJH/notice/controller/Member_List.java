package BJH.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import NWH.member.dao.MemberDao;
import NWH.member.dto.MemberDto;


@WebServlet("/Member_list")
public class Member_List extends HttpServlet {


	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("서블릿 확인1");
		
		MemberDao memDao = MemberDao.getInstance();
		
		List<MemberDto> memberList = memDao.getMemberList();
		
		//System.out.println("Memdto확인1 : "+ memberList.get(0));
		
		req.setAttribute("memberList", memberList);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/admin_memberList.jsp");
		dispatcher.forward(req	, resp);
	}

	

	
	
	

	
	
	

	
}
