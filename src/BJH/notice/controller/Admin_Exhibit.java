package BJH.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import BJH.notice.dao.AdminDao;
@WebServlet("/Admin_Exhibit")
public class Admin_Exhibit extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		
		String exhibit = req.getParameter("exhibit");
		AdminDao adminDao = AdminDao.getInstance();
		if(exhibit != null) {
			// 전시 삭제
			if(exhibit.equals("delete")) {
				String[] sdeleteList = req.getParameterValues("pexhDeleteList[]");
				for (int i = 0; i < sdeleteList.length; i++) {
					System.out.println(sdeleteList[i]);
				}
				
				req.setCharacterEncoding("utf-8");
				resp.setContentType("application/json");
				boolean exhibitResult = false;
				exhibitResult = adminDao.exhibit_delete(sdeleteList);
				System.out.println("exh_result"+exhibitResult);
				String gson = new Gson().toJson(exhibitResult);
				resp.getWriter().write(gson);
			}
			
			
			
		
		// null 처리
		}else {
			System.out.println("exhibit="+exhibit);
			resp.sendRedirect(req.getContextPath()+"/admin/admin_result.jsp?result=false");
		}
	}

	
}
