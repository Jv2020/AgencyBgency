package BJH.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;


@WebServlet("/Notice_delete")
public class Notice_delete extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		System.out.println("ajax!!!!!!!!!!!!!!!!doget");
		
	//	String[] test = req.getParameterValues("pdeleteList");
	//	System.out.println(test.length);
//		for (int i = 0; i < test.length; i++) {
//			System.out.println(test[i]);
//		}
		
//		Object obj = req.getAttribute("pdeleteList");
//		System.out.println("여기까지 완료 ");
//		System.out.println("obj: "+ obj);
//		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("ajax!!!!!!!!!!!!!!!!dopost");
		
		String[] test = req.getParameterValues("pdeleteList[]");
		System.out.println(test.length);
		for (int i = 0; i < test.length; i++) {
			System.out.println(test[i]);
		}
		
//		
//		list
//		String gson = new Gson().toJson(list);
		
//		boolean -> resp.getWriter().write("ddd") ;
//		gson -> resp.getWriter().write(gson) ;
		req.setCharacterEncoding("utf-8");
		resp.setContentType("application/json");
		
	}
}
