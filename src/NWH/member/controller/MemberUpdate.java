package NWH.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import NWH.member.dao.MemberDao;
import NWH.member.dto.MemberDto;

@WebServlet("/memberupdate")
public class MemberUpdate extends HttpServlet{
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		
		
		
		 
		String id = req.getParameter("memberId");
		
		String phone = req.getParameter("memberPhone");
		String memberPostCode = req.getParameter("memberPostCode");
		String memberStreetName = req.getParameter("memberStreetName");
		String memberDetailStreetName = req.getParameter("memberDetailStreetName");
		String address = memberPostCode +"/"+ memberStreetName +"/"+ memberDetailStreetName;
		String question = req.getParameter("memberQuestion");
		String hint = req.getParameter("memberAnswer");
		
		System.out.println("memberId: " + id);
		System.out.println("memberPhone: " + phone);
		System.out.println("memberAddress: " + address);
		System.out.println("memberQuestion: " + question);
		System.out.println("memberAnswer: " + hint);
		
		MemberDao dao = MemberDao.getInstance();
		
		dao.updateMemberByDTO(new MemberDto(id, address, phone, question, hint));
		MemberDto mem = dao.getMemberById(id);
		System.out.println("마지막서블릿dto: " + mem.toString());
		
		HttpSession session = req.getSession();
		
		session.setAttribute("loginuser", mem);
		req.getRequestDispatcher("/mypage/memupdateAf.jsp").forward(req, resp);
		
		
		
		
	}
	
}
