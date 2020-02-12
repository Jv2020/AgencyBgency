package BJH.notice.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.filters.SetCharacterEncodingFilter;

import BJH.notice.dao.NoticeDao;


@WebServlet("/Notice_delete")
public class Notice_delete extends HttpServlet {


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("ajax!!!!!!!!!!!!!!!!doget");
		

		String[] test = req.getParameterValues("pdeleteList");
		System.out.println(test);
		for (int i = 0; i < test.length; i++) {
			System.out.println(test[i]);
			
		}
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("ajax!!!!!!!!!!!!!!!!dopost");
		

		String[] sdeleteList = req.getParameterValues("pdeleteList[]");
		System.out.println(sdeleteList);
		for (int i = 0; i < sdeleteList.length; i++) {
			System.out.println(sdeleteList[i]);
			
		}

//		list
//		String gson = new Gson().toJson(list);
		
//		boolean -> resp.getWriter().write("ddd") ;
//		gson -> resp.getWriter().write(gson) ;
		
		req.setCharacterEncoding("utf-8");
		resp.setContentType("application/json");
		
		
		boolean noticeResult = false;
		NoticeDao noticeDao = NoticeDao.getInstance();
		noticeResult = noticeDao.notice_delete(sdeleteList);
		System.out.println("del_result="+noticeResult);
		
		if(noticeResult) {
			
			resp.sendRedirect("./admin/amain.jsp");
		}
		
	}
	
	

}
