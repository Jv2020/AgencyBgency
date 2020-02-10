package BJH.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


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
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("ajax!!!!!!!!!!!!!!!!dopost");
//		for (int i = 0; i < req.getParameter("deleteList").length(); i++) {
//			
//		}
		String[] test = req.getParameterValues("pdeleteList");
		System.out.println(test);
		for (int i = 0; i < test.length; i++) {
			System.out.println(test[i]);
		}
	}
}
