package BJH.notice.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sun.java.util.jar.pack.Package.File;

import BJH.notice.dao.NoticeDao;
import BJH.notice.dto.NoticeDto;
@WebServlet("/Notice")
public class Notice extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String notice = req.getParameter("notice");
		if(notice != null) {
			// 공지 작성 페이지 이동
			if(notice.equals("write")) {
				resp.sendRedirect(req.getContextPath()+"/admin/noticeWrite.jsp");
			// 공지 업데이트	
			}else if(notice.equals("update")){
				 String sseq = req.getParameter("seq");
				 String id = req.getParameter("id");
				 String title = req.getParameter("title");
				 String content = req.getParameter("content");
				 //String fileName = req.getFilesystemName("fileName");
				 String choice2 = req.getParameter("choice");
				 
				 
				 System.out.println("choice ==" + choice2);
				 System.out.println("seq="+sseq);
				 System.out.println("id="+id);
				 System.out.println("title="+title);
				 System.out.println("content="+content);
				 int seq = Integer.parseInt(sseq);
				 int choice = Integer.parseInt(choice2);
				 //System.out.println("fileName="+fileName);
				 System.out.println("choice="+choice);
				 System.out.println("seq="+seq);
				 
				 boolean result = false;
				 NoticeDao noticeDao = NoticeDao.getInstance();
				 result = noticeDao.notice_Update(seq,new NoticeDto(id,title,content,choice,filename));
				 System.out.println("result="+result);
				 
				 resp.sendRedirect(req.getContextPath()+"/admin/admin_result.jsp?result="+result);
			//공지 디테일
			}else if(notice.equals("detail")) {
				
				System.out.println("doget!!!!!!!!!!!!!!!!!!!!!!!!");
				req.setCharacterEncoding("utf-8");
				String sseq = req.getParameter("seq");
				System.out.println("seq="+sseq);
				int seq = Integer.parseInt(sseq);
				NoticeDao noticeDao = NoticeDao.getInstance();
				NoticeDto noticeDto = noticeDao.notice_detail(seq);
				
				req.setAttribute("noticeDetail", noticeDto);
				RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/noticeDetail.jsp");
				dispatcher.forward(req	, resp);
			//공지 DB 적용
			}else if(notice.equals("insert")) {
				req.setCharacterEncoding("utf-8");
					
					String realFolder="";
					//업로드할 폴더이름
					String saveFolder = "file";
					String encType ="utf-8";
					int sizeLimit = 10 * 1024 * 1024 ;// 10MB
					
					
					ServletContext context = this.getServletContext();
					// servlet upload path
					realFolder = context.getRealPath(saveFolder);
					// 경로 출력
					System.out.println("실제 서블릿상 업로드경로 :"+realFolder);
					
					MultipartRequest multi = null;
					
					try {
						multi = new MultipartRequest(
								req,
								realFolder,
								sizeLimit,
								encType,							
								new DefaultFileRenamePolicy());
						//첨부파일 여러개 시 
						Enumeration en = multi.getParameterNames();
						while(en.hasMoreElements()) {
							// 전송 받는 이름 (파일이름)
							String name = (String)en.nextElement();
							String value = multi.getParameter(name);
							System.out.println("name = "+ name +"value = " + value);
						}
						// 전송파일 이름 가져오기
						en = multi.getFileNames();
						while(en.hasMoreElements()) {
							// 파일 이름 (실제 업로드할 파일 이름)
							String name =(String)en.nextElement();
							// 실제 저장되는 파일 값
							String originFile=multi.getOriginalFileName(name);
							// 동일 파일 이름 존재시 현재 업로드파일 이름 변경
							String systemFile = multi.getFilesystemName(name);
							// 전송된 파일 타입
							String fileType = multi.getContentType(name);
							
							// 실제 업로드파일 
							java.io.File file =multi.getFile(name);
							
							System.out.println("파라미터 이름 : "+name);
							System.out.println("원본 이름 : "+originFile);
							System.out.println("시스템상 이름 : "+systemFile);
							System.out.println("파일 타입 : "+fileType);
							
							if(file!= null) {
								System.out.println("크기: "+file.length()+"byte");
							}
						}
						
					} catch (Exception e) {
						// TODO: handle exception
						System.out.println("File upload fail !!!");
					}
					
					String id = multi.getParameter("id");
					String title = multi.getParameter("title");
					String content = multi.getParameter("content");
					
					 int choice = Integer.parseInt(multi.getParameter("choice"));
					boolean result = false;
					NoticeDao noticeDao = NoticeDao.getInstance();
					result = noticeDao.notice_Insert(new NoticeDto(id,title,content,choice,name));
					System.out.println("result="+result);
					 
					resp.sendRedirect(req.getContextPath()+"/admin/admin_result.jsp?result="+result);
					
				
				
//				MultipartRequest multi = null;
//				
//				int sizeLimit = 10 * 1024 * 1024 ;// 10MB
//				// upload Path
//				String uploadPath = req.getRealPath("/file/");
//				//String uploadPath = "/WebContent/file/";
//				try {
//				multi = new MultipartRequest(req, uploadPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
//				
//				}catch(Exception e) {
//					e.printStackTrace();
//				}
//				
//				 String id = multi.getParameter("id");
//				 String title = multi.getParameter("title");
//				 String content = multi.getParameter("content");
//				 String fileName = multi.getFilesystemName("fileName");
//				 int choice = Integer.parseInt(multi.getParameter("choice"));
//				 
//				 
//				 System.out.println("id="+id);
//				 System.out.println("title="+title);
//				 System.out.println("content="+content);
//				 System.out.println("fileName="+fileName);
//				 System.out.println("choice="+choice);
//				 
//				 
//				 boolean result = false;
//				 NoticeDao noticeDao = NoticeDao.getInstance();
//				 result = noticeDao.notice_Insert(new NoticeDto(id,title,content,choice,fileName));
//				 System.out.println("result="+result);
//				 
//				 resp.sendRedirect(req.getContextPath()+"/admin/admin_result.jsp?result="+result);

				
				 
			// 공지 삭제	 
			}else if(notice.equals("delete")){
				
				String[] deleteList = req.getParameterValues("deleteList[]");
				System.out.println(deleteList);
				for (int i = 0; i < deleteList.length; i++) {
					System.out.println(deleteList[i]);
				}
				req.setCharacterEncoding("utf-8");
				resp.setContentType("application/json");
				
				
				boolean noticeResult = false;
				NoticeDao noticeDao = NoticeDao.getInstance();
				noticeResult = noticeDao.notice_delete(deleteList);
				System.out.println("del_result="+noticeResult);
				
				String result = noticeResult+"";
				//String gson = new Gson().toJson(noticeResult);
				resp.getWriter().write(result);
			}
		// notice 파라미터 없을시 메인뷰 이동 			
		}else {
			resp.sendRedirect(req.getContextPath()+"/admin/test.jsp");
		}
		
			
		
				
		
	}

	
	
}
