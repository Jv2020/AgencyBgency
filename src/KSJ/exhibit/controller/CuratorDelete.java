package KSJ.exhibit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import KSJ.exhibit.dao.ExhibitDao;
import KSJ.files.dao.FilesDao;

@WebServlet("/curatorwritedelete")
public class CuratorDelete extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String sseq= req.getParameter("seq");
		int seq = Integer.parseInt(sseq);
		
		System.out.println("지우는 서블릿으로 이동 ");
		// 전시 del
		ExhibitDao edao = ExhibitDao.getInstance();
		boolean exhibitDelete = edao.deleteExhibit(seq);
		
		// 파일 del
		
		if(exhibitDelete) {
			System.out.println("전시 디비 지워짐 ");
			// 파일 지우기 : false 일때는 이미지 파일이 없는 것 
			//resp.sendRedirect("./filedelete?seq="+seq);
			
		}else {
			System.out.println("전시 지우기 실패");
			
		}
		resp.sendRedirect("./mypage/curatorDeleteCheck.jsp?delete="+exhibitDelete);
		
	}
       
	

}
