package KSJ.files.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet("/fileupload")
public class FileUpload extends HttpServlet {


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	

		//2가지 방법이 있음
		//1. tomcat에 배포(Server)	-> 자료가 사라질 가능성 있음()
		//임시 서버 경로로 나온다
		
//		String fupload = req.getSession().getServletContext().getRealPath("/");
//		String fupload = "/Users/sunjukim/Bitcamp_web/web4_jsp/ImageUpload/WebContent/upload/";		// 하드의 특정 공간에 저장
//		String fupload = application.getRealPath("/upload");	// project->webcontent 안에 해당 폴더가 있어야함

		//지정폴더 (Client)
		String fupload = "/Users/sunjukim/Desktop/tmp_pic/";		// 하드의 특정 공간에 저장
		System.out.println("업로드 폴더: " + fupload);


		String yourTempDir = fupload;

		int yourMaxRequestSize = 100 * 1024* 1024;	// 최대 업로드 가능 사이즈 1 MB
		int yourMaxMemorySize = 100 * 1024;			// 최대 메모리 사이즈 1 KB

		// form field의 데이터를 저장할 변수
		String origin_name = "";
		String bbs_name = "";
		String bbs_seq = "";
		String filepath = fupload;
		String file_seq = "";

		// file name
		String filename = "";

		// multipart 가 맞는지 확인
		boolean isMultipart = ServletFileUpload.isMultipartContent(req);


		if(isMultipart){
			
			// file item 생성하기
			DiskFileItemFactory factory = new DiskFileItemFactory();	

			// 용량 설정
			factory.setSizeThreshold(yourMaxMemorySize);	// max memorysize 설정
			
			// 저장소 설정 ( 저장 파일 생성 )
			factory.setRepository(new File(yourTempDir));
			
			// 업로드 설정
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setSizeMax(yourMaxRequestSize);	// 순간 전송크기를 설정
			
			// list 저장 -> id, title, content, file 등을 저장
			List<FileItem> items;
			
			try {
				items = upload.parseRequest(req);
				// list에서 get 아닌 iterator로 꺼낸다
				Iterator<FileItem> it = items.iterator();
				
				// 데이터 구분하기 (form과 file 데이터 구분하기)
				while(it.hasNext()){
					
					FileItem item = it.next();
					if(item.isFormField() ){	
						// formfield 를 찾아서 구분해준다.
						
						// id, title, content 등 form field에 해당하는 String만 넘어온다
						if(item.getFieldName().equals("filename")){
							// id 일 때	(=getParameter 일 때)
							filename = item.getString("utf-8");
							
						}else if(item.getFieldName().equals("origin_name")){
							origin_name = item.getString("utf-8");
							
						}else if(item.getFieldName().equals("bbs_name")){
							bbs_name = item.getString("utf-8");
							
						}else if(item.getFieldName().equals("bbs_seq")){
							bbs_seq = item.getString("utf-8");
							
						}else if(item.getFieldName().equals("file_seq")){
							file_seq = item.getString("utf-8");
						} 
					}
					/*
					 
					 */
					else{	
						// fileload
						
						// file 일 때
						if(item.getFieldName().equals("file")){	// fileload 일 때
							filename = processUploadFile(item, fupload);
							// item을 만들어서 fuload라는 경로에 넣어두어라
						}
					}
				}
				
			File oldfile1 = new File(fupload,origin_name);
			File newfile = new File(fupload,filename);
			
			if(oldfile1.exists()) {
//				System.out.println("파일이름 바꿔랑");
				oldfile1.renameTo(newfile);
			}
			System.out.println("filename: "+ filename );
			System.out.println("file_seq: "+ file_seq);
			System.out.println("bbs_name: "+ bbs_name);
			System.out.println("bbs_seq: "+ bbs_seq);
			System.out.println("filepath: "+ filepath);
			System.out.println("orgin_name: "+ origin_name);
				
				
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	// 전송되어온 파일을 뽑아옴(parsing)
			
			
			
		}else{
			System.out.println("multipart가 아님");
			
		}

		
//		//DB 저장
//		FileDto dto = new FileDto(0, filename, origin_name, fupload, bbs_name, Integer.parseInt(bbs_seq), 0, Integer.parseInt(file_seq));
//		FileDao dao = FileDao.getInstance();
//		boolean b = dao.insertFiles(dto);
//		if(b) {
//			System.out.println("다운 성공 ");
//			resp.sendRedirect("./uploadAf.jsp");
//		}
//		else {
//			System.out.println("다운 실패 ");
//			resp.sendRedirect("./index_ajax.jsp");
//		}
//	
	
	
	
	
	}

public String processUploadFile(FileItem fileItem, String dir ) throws IOException{
		
		String filename = fileItem.getName();	
		// --> 경로 + 파일명으로 들어옴 ( 1.서버(톰캣) 경로  2.클라이언트 경로)
		long sizeInBytes = fileItem.getSize();	
		// 파일의 크기 구하기
		if(sizeInBytes > 0 ) {	
			// 클라이언트의 경로일 때 예시 : d:/tmp/abc.txt 또는 d:\\tmp\\abc.txt
			// 정상적으로 파일이 업로드 되었을 때
			
			int idx = filename.lastIndexOf("\\");	// \으로 입력되있을 때
			if(idx == -1 ){
				idx = filename.lastIndexOf("/");	// /로 입력되었을 때
			}
			
			// 경로 빼고 파일명만 가져오기
			filename = filename.substring( idx+1 );
			

			
			// 업로드하는 디렉토리에 업로드 한 파일을 기입함
			File uploadfile = new File(dir, filename);
			
			
			try{
				fileItem.write(uploadfile);	// 실제 업로드 부분
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		
		return filename;	// return 값은 확인용
		
	}
	
	
}
