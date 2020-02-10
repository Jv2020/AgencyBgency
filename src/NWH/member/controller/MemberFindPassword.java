package NWH.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import NWH.member.dao.MemberDao;
import NWH.member.dto.MemberDto;

@WebServlet("/memberfindpassword")
public class MemberFindPassword extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		
		String id = request.getParameter("memberId");
		String name = request.getParameter("memberName");
		String question = request.getParameter("memberQuestion");
		String answer = request.getParameter("memberAnswer");
		
		System.out.println(id); // ok
		System.out.println(name); // ok
		System.out.println(question); // ok
		System.out.println(answer); // ok
		
		MemberDao dao = MemberDao.getInstance();
		String findPassword = dao.memberFindPassword(new MemberDto(id, name, question, answer));
		System.out.println("파인드패스워드서블릿: "+ findPassword);
		

		
		request.setAttribute("findPassword", findPassword);
		request.getRequestDispatcher("/member/findpasswordAf.jsp").forward(request, resp);
		
	}
}
