package BJH.notice.controller;


import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;




@WebServlet("/NoticeInsert")
public class NoticeInsert extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("file upload connected");
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		String filepath= "/file/";
		String uploadPath = req.getSession().getServletContext().getRealPath(filepath);
		System.out.println("uploadPath=" + uploadPath);
		
		int size = 5*1024*1024;
		String id ="";
		String title ="";
		String content="";
		int choice =0;
		String filename ="";
		String originName = "";
		
		MultipartRequest multi =null;
		
		try {
			multi= new MultipartRequest(
					req, 
					uploadPath,
					size,
					"utf-8",
					new DefaultFileRenamePolicy());
			
			id = multi.getParameter("id");
			title= multi.getParameter("title");
			content = multi.getParameter("content");
			String schoice = multi.getParameter("choice");
			choice = Integer.parseInt(schoice);
			//파일 이름만 가져온다
			filename = multi.getFilesystemName("fileName");
			System.out.println("fileName="+filename);
			originName = multi.getOriginalFileName("fileName");
			System.out.println("originName="+originName);
		
		}catch(Exception e) {
			System.out.println("파일업로드 문제 발생");
			System.out.println(e.getMessage());
		}
			
		req.setAttribute("id", id);
		req.setAttribute("title", title);
		req.setAttribute("content", content);
		req.setAttribute("choice", choice);
		req.setAttribute("fileName", filename);
		req.setAttribute("originName", originName);
		RequestDispatcher dis = req.getRequestDispatcher("./admin/jun.jsp");
		dis.forward(req, resp);
				
	}
}
