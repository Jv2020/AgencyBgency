package NWH.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import NWH.member.dao.MemberDao;

@WebServlet("/memberdeleteid")
public class MemberDelete extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		resp.setCharacterEncoding("utf-8");
	    resp.setContentType("application/json");
		
		String id = req.getParameter("id");
		
		System.out.println("딜리트서블릿: "+id);
		
		MemberDao dao = MemberDao.getInstance();
		
		boolean bisS = dao.delMemberById(id);
		System.out.println("딜리트서블릿불린: "+bisS);
		String isS = String.valueOf(bisS);
		 System.out.println("딜리트서블릿스프링: "+isS);
		String gson = new Gson().toJson(bisS);
		
		PrintWriter out = resp.getWriter();
		out.write(isS);
		out.flush();
		
		
	}
	
}
