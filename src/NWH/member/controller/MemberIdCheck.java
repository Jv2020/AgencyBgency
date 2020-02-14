package NWH.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import NWH.member.dao.MemberDao;


@WebServlet("/idCheck")
public class MemberIdCheck extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id = req.getParameter("idcheck");
		System.out.println("ajaxtest"+id);
		
		MemberDao dao = MemberDao.getInstance();
		boolean bidCheck = dao.idCheck(id);
		String idCheck = String.valueOf(bidCheck);
		System.out.println("아이디체크에프터다오: "+idCheck);
		
		PrintWriter out = resp.getWriter();
		out.write(idCheck);
		out.flush();
		
		
	}
	
	
	
	
}
