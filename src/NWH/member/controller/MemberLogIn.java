package NWH.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import NWH.member.dao.MemberDao;
import NWH.member.dto.MemberDto;

@WebServlet("/memberlogin")
public class MemberLogIn extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("doPost");
		
		String id = request.getParameter("memberId");
		String password = request.getParameter("memberPassword");
		
		System.out.println(id); // ok
		System.out.println(password); // ok
		
		MemberDao dao = MemberDao.getInstance();
		MemberDto mem = dao.login(new MemberDto(id, password));
		

		HttpSession session = request.getSession();
		
		session.setAttribute("loginuser", mem);
		request.getRequestDispatcher("/member/loginAf.jsp").forward(request, resp);
		
	}
}	