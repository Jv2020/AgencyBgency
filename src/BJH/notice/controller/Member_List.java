package BJH.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
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
	
		
		MemberDao memDao = MemberDao.getInstance();
		
		List<MemberDto> memberList = memDao.getMemberList();
		
		req.setAttribute("memberList", memberList);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/admin_memberList.jsp");
		dispatcher.forward(req	, resp);
	}

	
	
	

	
}
