package BJH.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import NWH.member.dao.MemberDao;
@WebServlet("/Member_Recover")
public class Member_Recover extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String[] srecoverList = req.getParameterValues("pmemRecoverList[]");

		
		for (int i = 0; i < srecoverList.length; i++) {
			System.out.println(srecoverList[i]);
			
		}
		
		req.setCharacterEncoding("utf-8");
		resp.setContentType("application/json");
		
		
		boolean memberResult = false;
		MemberDao memberDao = MemberDao.getInstance();
		memberResult = memberDao.member_recover(srecoverList);
		System.out.println("mem_result="+memberResult);
		
		String gson = new Gson().toJson(memberResult);
		resp.getWriter().write(gson);
	}

	
}
