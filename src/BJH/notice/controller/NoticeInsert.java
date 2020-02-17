package BJH.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/NoticeInsert")
public class NoticeInsert extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("file upload connected");
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		List<FilesDt> flist = new ArrayList<>();
		
		 // 서버 내 저장
//		String fupload ="/Users/sunjukim/Desktop/semi/AgencyBgency/WebContent/upload/";
		String filepath = "/upload/title/";
		String fupload = req.getSession().getServletContext().getRealPath(filepath);
		System.out.println("fupload:"+fupload);
		
		
		//지정폴더 (Client)
		System.out.println("업로드 폴더: " + fupload);


		String yourTempDir = fupload;

		int yourMaxRequestSize = 100 * 1024* 1024;	// 최대 업로드 가능 사이즈 1 MB
		int yourMaxMemorySize = 100 * 1024;			// 최대 메모리 사이즈 1 KB

		// form field의 데이터를 저장할 변수
		
		String title = "";
		String begindate =  "";
		String enddate =  "";
		String ex_time =  "";
		String place =  "";
		String loc_info =  "";
		String sprice =  "";
		String certi_num =  "";
		String contact =  "";
		String content =  "";
		String filename =  "";// FileDto도 있음
		// 파일 
		String origin_name ="";	//origin_name
		String bbs_name = "exhibit";
		String sfile_seq = "";
		
		int price = -1;
		int bbs_seq = -1;	// 이거는 전시 insert 후에 메소드로 받아오기 
		int file_seq = -1;
		
		// file path 는 위에 있음 

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
						
						if(item.getFieldName().equals("title")){
							title = item.getString("utf-8");
						}else if(item.getFieldName().equals("begindate")){
							begindate = item.getString("utf-8");
						}else if(item.getFieldName().equals("enddate")){
							enddate = item.getString("utf-8");
						}else if(item.getFieldName().equals("ex_time")){
							ex_time = item.getString("utf-8");
						}else if(item.getFieldName().equals("place")){
							place = item.getString("utf-8");
						}else if(item.getFieldName().equals("loc_info")){
							loc_info = item.getString("utf-8");
						}else if(item.getFieldName().equals("price")){
							sprice = item.getString("utf-8");
							price = Integer.parseInt(sprice);	// 금액

						}else if(item.getFieldName().equals("certi_num")){
							certi_num = item.getString("utf-8");
						}else if(item.getFieldName().equals("contact")){
							contact = item.getString("utf-8");
						}else if(item.getFieldName().equals("content")){
							content = item.getString("utf-8");
						}else if(item.getFieldName().equals("filename")){
							filename = item.getString("utf-8").trim();
						}else if(item.getFieldName().equals("origin_name")){
							origin_name = item.getString("utf-8");
						}else if(item.getFieldName().equals("file_seq")){
							sfile_seq = item.getString("utf-8");
							file_seq = Integer.parseInt(sfile_seq);
						}
					}
						else{	
//						// file 일 때
						if(item.getFieldName().equals("titlefile")){	// fileload 일 때
							filename = processUploadFile(item, fupload);
							// item을 만들어서 fuload라는 경로에 넣어두어라
						}
					}
				}
				// 파일 이름 바꾸기 
				File oldfile1 = new File(fupload,origin_name);
				File newfile = new File(fupload,filename);
				
				if(oldfile1.exists()) {
					oldfile1.renameTo(newfile);
				}
					

				
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	// 전송되어온 파일을 뽑아옴(parsing)
			
			
			
		}else{
			System.out.println("multipart가 아님");
			resp.sendRedirect("./main/main.jsp");
		}
		
		
		System.out.println("title : "+title);
		System.out.println("begindate : "+begindate);
		System.out.println("enddate : "+enddate);
		System.out.println("ex_time : "+ex_time);
		System.out.println("place : "+place);
		System.out.println("loc_info : "+loc_info);
		System.out.println("price : "+ price);
		System.out.println("certi_num : "+certi_num);
		System.out.println("contact : "+contact);
		System.out.println("content : "+content);
		System.out.println("filename : "+filename);
		System.out.println("filename: "+ filename );
		System.out.println("file_seq: "+ sfile_seq);
		System.out.println("bbs_name: "+ bbs_name);
		System.out.println("bbs_seq: "+ bbs_seq);
		System.out.println("filepath: "+ filepath);
		System.out.println("orgin_name: "+ origin_name);

		
		ExhibitDao dao = ExhibitDao.getInstance();;
		FilesDao fdao = FilesDao.getInstance();
		// dto로 정보 담기 
		ExhibitDto dto = new ExhibitDto(-1, begindate, enddate, title, place, content, ex_time, 
				loc_info, 0, contact, certi_num, price, filename);
		
		
		 
		boolean b = dao.insertExhibit(dto);
		 
		if(b) {
			System.out.println("전시 디비 입력 성공 ");
			bbs_seq = fdao.getExhibitSeq(filename);	// 파일에 저장하기 위해 시퀀스 불러오기 
			System.out.println("bbs_seq : " + bbs_seq);
			FilesDto fdto = new FilesDto(-1, filename, origin_name, filepath, bbs_name, bbs_seq, 0, file_seq);
			flist.add(fdto);
			
			System.out.println(fdto.toString());
			//req.setAttribute("newFiles", newFile);
			
			boolean fileSuccess = fdao.insertFile(fdto);
			
			if(fileSuccess) {
				
				req.setAttribute("edto", dto);
				req.setAttribute("flist", flist);
				req.setAttribute("filename", filename);
				req.setAttribute("filepath", filepath);
				
				System.out.println("send filepath :"+filepath);
				System.out.println("send filepath :"+filename);
			
				
				RequestDispatcher dis = req.getRequestDispatcher("./mypage/curatorwriteDetail.jsp");
				dis.forward(req, resp);

			}
		}


	
}
