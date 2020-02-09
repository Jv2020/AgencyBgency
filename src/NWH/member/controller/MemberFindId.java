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

@WebServlet("/memberfindid")
public class MemberFindId extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("doPost");
		
		String name = request.getParameter("memberName");
		String email = request.getParameter("memberEmail");
		String phone = request.getParameter("memberPhone");
		
		System.out.println(name); // ok
		System.out.println(email); // ok
		System.out.println(phone); // ok
		
		MemberDao dao = MemberDao.getInstance();
		String findId = dao.memberFindId(new MemberDto(name, email, phone));
		System.out.println("파인드아이디서블릿: "+ findId);
		

		
		request.setAttribute("findid", findId);
		request.getRequestDispatcher("/member/findidAf.jsp").forward(request, resp);
		
	}
}	