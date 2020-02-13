package NWH.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import NWH.member.dao.MemberDao;
import NWH.member.dto.MemberDto;

@WebServlet("/MemberGetIdBeforeUpdate")
public class MemberGetIdBeforeUpdate  extends HttpServlet{
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String id = req.getParameter("memberId");
		System.out.println("객체하나선택비포업데이트서블릿 아이디: "+ id);
		
		MemberDao dao = MemberDao.getInstance();
		MemberDto dto = dao.getMemberById(id);
		System.out.println("객체하나선택비포업데이트서블 투스트링: "+ dto.toString());
		
		req.setAttribute("findid", dto);
		req.getRequestDispatcher("/mypage/memupdate.jsp").forward(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
		
		
		
	}
	
}
