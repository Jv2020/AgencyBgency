package KSJ.files.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import KSJ.exhibit.dao.ExhibitDao;
import KSJ.files.dao.FilesDao;

@WebServlet("/filedelete")
public class FileDelete extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String sseq= req.getParameter("seq");
		int seq = Integer.parseInt(sseq);
		
		System.out.println("file 지우는 서블릿으로 이동 ");
		FilesDao fdao = FilesDao.getInstance();
		boolean filesDelete = fdao.deleteExhibit("exhibit", seq);
		
		resp.sendRedirect("./mypage/curatorDeleteCheck.jsp?delete="+filesDelete);
			
		
	}
       
	

}
