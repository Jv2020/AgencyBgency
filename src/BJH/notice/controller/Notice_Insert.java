package BJH.notice.controller;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import BJH.notice.dao.NoticeDao;
import BJH.notice.dto.NoticeDto;


@WebServlet("/Notice")
public class Notice_Insert extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		
		MultipartRequest multi = null;
		
		int sizeLimit = 10 * 1024 * 1024 ;// 10MB
		// upload Path
		String uploadPath = req.getRealPath("./file");
		//String uploadPath = "/WebContent/file/";
		try {
		multi = new MultipartRequest(req, uploadPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		 String id = multi.getParameter("id");
		 String title = multi.getParameter("title");
		 String content = multi.getParameter("content");
		 String fileName = multi.getFilesystemName("fileName");
		 int choice = Integer.parseInt(multi.getParameter("choice"));
		 
		 
		 System.out.println("id="+id);
		 System.out.println("title="+title);
		 System.out.println("content="+content);
		 System.out.println("fileName="+fileName);
		 System.out.println("choice="+choice);
		 
		 boolean result = false;
		 NoticeDao noticeDao = NoticeDao.getInstance();
		 result = noticeDao.notice_Insert(new NoticeDto(id,title,content,choice));
		 System.out.println("result="+result);
		 

		 resp.sendRedirect("./admin/noticeWriteAf.jsp?result="+result);
		 
		 
	}

}
