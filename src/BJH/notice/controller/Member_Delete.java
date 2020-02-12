package BJH.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import NWH.member.dao.MemberDao;
@WebServlet("/Member_Delete")
public class Member_Delete extends HttpServlet {



	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String[] sdeleteList = req.getParameterValues("pmemDeleteList[]");
		System.out.println(sdeleteList);
		for (int i = 0; i < sdeleteList.length; i++) {
			System.out.println(sdeleteList[i]);
			
		}
		
		req.setCharacterEncoding("utf-8");
		resp.setContentType("application/json");
		
		
		boolean memberResult = false;
		MemberDao memberDao = MemberDao.getInstance();
		memberResult = memberDao.member_delete(sdeleteList);
		System.out.println("mem_result="+memberResult);
		
		String gson = new Gson().toJson(memberResult);
		resp.getWriter().write(gson);
		

		 
	}
	
	

}
