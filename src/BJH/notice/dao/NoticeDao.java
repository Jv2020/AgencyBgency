package BJH.notice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BJH.notice.dto.NoticeDto;
import DB.DBClose;
import DB.DBConnection;

public class NoticeDao {
	
	private static NoticeDao noticedao = new NoticeDao();
 	
	private NoticeDao() {
		DBConnection.initConnection();
	}
	
	public static NoticeDao getInstance() {
		return noticedao;
	}
	
	// 공지 기본리스트 
	public List<NoticeDto> getNoticeList(){
		String sql = " SELECT SEQ, ID, TITLE, CONTENT, REG_DATE, READCOUNT, DEL, CHOICE,FILENAME "
				+ " FROM NOTICE "
				+ " WHERE DEL=0 "
				+ " ORDER BY SEQ DESC ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<NoticeDto> noticeList = new ArrayList<NoticeDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getNoticeList ");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/4 getNoticeList ");
			rs = psmt.executeQuery();
			System.out.println("3/4 getNoticeList ");
			
			while(rs.next()) {
				int i = 1;
				NoticeDto noticeDto = new NoticeDto(rs.getInt(i++),	//SEQ
													rs.getString(i++),//ID
													rs.getString(i++),//TITLE
													rs.getString(i++),//CONTENT
													rs.getString(i++),//REGDATE
													rs.getInt(i++),//READCOUNT
													rs.getInt(i++),//DEL
													rs.getInt(i++),
													rs.getString(i++));//CHOICE
				noticeList.add(noticeDto);
			}
			System.out.println("4/4 getNoticeList Success");
		} catch (SQLException e) {
			System.out.println("getNoticeList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return noticeList;

	}
	// 공지 추가(DB)
	public boolean notice_Insert(NoticeDto dto) {
		
		String sql = " INSERT INTO NOTICE(SEQ,ID,TITLE,CONTENT,REG_DATE,READCOUNT,DEL,CHOICE,FILENAME)"
				+ " VALUES(SEQ_NOTICE.NEXTVAL ,?, ?, ?, SYSDATE, 0, 0, ?,?) ";
			
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int noticeResult = 0;
		
		
		try {
			conn = DBConnection.getConnection();
				System.out.println("1/4 notice_Insert ");
			psmt = conn.prepareStatement(sql);
				System.out.println("2/4 notice_Insert ");
				psmt.setString(1, dto.getId());
				psmt.setString(2, dto.getTitle());
				psmt.setString(3, dto.getContent());
				psmt.setInt(4, dto.getChoice());
				psmt.setString(5, dto.getFilename());
				System.out.println("3/4 notice_Insert ");
				noticeResult = psmt.executeUpdate();
				System.out.println("4/4 notice_Insert Successs");
			
		} catch (SQLException e) {
			System.out.println("notice_Insert fail ");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
			
		}
		
		
		return noticeResult>0?true:false;
	}
	// 공지 업데이트
	public boolean notice_Update(int seq, NoticeDto dto ) {
		System.out.println("updateDto"+dto);
		String sql = " UPDATE NOTICE "
				+ " SET ID=?, TITLE=? , CONTENT=? , CHOICE= ? ,FILENAME= ?"
				+ " WHERE SEQ= ? ";
			
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int noticeResult = 0;
		
		
		try {
			conn = DBConnection.getConnection();
				System.out.println("1/4 notice_Update ");
			psmt = conn.prepareStatement(sql);
				System.out.println("2/4 notice_Update ");
				psmt.setString(1, dto.getId());
				psmt.setString(2, dto.getTitle());
				psmt.setString(3, dto.getContent());
				psmt.setInt(4, dto.getChoice());
				psmt.setString(5,dto.getFilename());
				psmt.setInt(6, seq);
				System.out.println("3/4 notice_Update ");
			noticeResult = psmt.executeUpdate();
				System.out.println("4/4 notice_Update Successs");
			
		} catch (SQLException e) {
			System.out.println("notice_Update fail ");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
			
		}
		
		
		return noticeResult>0?true:false;
	}
	// 공지 페이징 리스트
	public List<NoticeDto> getNoticePagingList(String choice, String searchWord, int page){
		System.out.println("int page = "+page);
		String sql = " SELECT SEQ, ID, TITLE, CONTENT, REG_DATE, READCOUNT, DEL, CHOICE, FILENAME "
				+ " FROM ";
		
			   sql += " (SELECT ROW_NUMBER()OVER(ORDER BY SEQ DESC) AS RNUM, "
				+ " SEQ,ID, TITLE, CONTENT, REG_DATE, READCOUNT, DEL, CHOICE, FILENAME "
				+ " FROM NOTICE ";
			   
	    String sqlWord = "";
	    
	    if(choice.equals("title")) {
	    	sqlWord = " WHERE TITLE LIKE '%" + searchWord.trim() + "%' AND DEL=0 ";
	    }else if(choice.equals("content")){
	    	sqlWord = " WHERE CONTENT LIKE '%" + searchWord.trim() + "%' AND DEL=0 ";
	    }else {
	    	sqlWord = " WHERE DEL=0 ";
	    }
	    
	    sql += sqlWord;
	    
	    sql += " ORDER BY SEQ DESC) ";
	    sql += " WHERE RNUM >= ? AND RNUM <= ? ";
	    
	    Connection conn = null;
	    PreparedStatement psmt = null;
	    ResultSet rs = null;
	    
	    List<NoticeDto> noticeList = new ArrayList<NoticeDto>();
	    
	    int start, end;
	    start = 1 + 5 * page; //	0->1 1->6  2->11 3->16
	    end = 5 + 5 * page; // 		0->5 1->10 2->15 3->20
	    
	    try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getNoticeList ");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, start);
			psmt.setInt(2, end);			
			System.out.println("2/4 getNoticeList ");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 getNoticeList ");
			
			while(rs.next()) {
				int i = 1;
				NoticeDto noticeDto = new NoticeDto(rs.getInt(i++), //seq
										rs.getString(i++), // id
										rs.getString(i++), // title
										rs.getString(i++), // content
										rs.getString(i++), // reg_date
										rs.getInt(i++),	// readcount
										rs.getInt(i++), // del
										rs.getInt(i++),//choice
										rs.getString(i++)); //filename
										
				noticeList.add(noticeDto);
			}
			System.out.println("4/4 getNoticeList success ");
			
		} catch (SQLException e) {
			System.out.println("getNoticeList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		
		return noticeList;
	}
	// 공지 페이징 (10개씩)
	public List<NoticeDto> getNoticePagingList10(int page){
		System.out.println("int page = "+page);
		String sql = " SELECT SEQ, ID, TITLE, CONTENT, REG_DATE, READCOUNT, DEL, CHOICE, FILENAME "
				+ " FROM ";
		
			   sql += " (SELECT ROW_NUMBER()OVER(ORDER BY SEQ DESC) AS RNUM, "
				+ " SEQ,ID, TITLE, CONTENT, REG_DATE, READCOUNT, DEL, CHOICE, FILENAME "
				+ " FROM NOTICE "
				+ " WHERE DEL=0 "
				+ " ORDER BY SEQ DESC) "
				+ " WHERE RNUM >= ? AND RNUM <= ?";
			   
	    Connection conn = null;
	    PreparedStatement psmt = null;
	    ResultSet rs = null;
	    
	    List<NoticeDto> noticeList = new ArrayList<NoticeDto>();
	    
	    int start, end;
	    start = 1 + 10 * page; //	0->1 1->4  2->7 3->10
	    end = 10 + 10 * page; // 		0->3 1->6 2->9 3->12
	    
	    try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getNoticePagingList3 ");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, start);
			psmt.setInt(2, end);			
			System.out.println("2/4 getNoticePagingList3 ");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 getNoticePagingList3 ");
			
			while(rs.next()) {
				int i = 1;
				NoticeDto noticeDto = new NoticeDto(rs.getInt(i++), //seq
										rs.getString(i++), // id
										rs.getString(i++), // title
										rs.getString(i++), // content
										rs.getString(i++), // reg_date
										rs.getInt(i++),	// readcount
										rs.getInt(i++), // del
										rs.getInt(i++),//choice
										rs.getString(i++)); //filename
										
				noticeList.add(noticeDto);
			}
			System.out.println("4/4 getNoticePagingList3 success ");
			
		} catch (SQLException e) {
			System.out.println("getNoticePagingList3 fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		
		return noticeList;
	}
	//공지 총 갯수
	public int getAllNotice(String choice, String searchWord) {
	
		String sql = " SELECT COUNT(*) FROM NOTICE ";
		String sqlWord = "";
		
		if(choice.equals("title")) {
			sqlWord = " WHERE TITLE LIKE '%" + searchWord.trim() + "%' AND DEL=0 ";
		}else if(choice.equals("content")){
			sqlWord = " WHERE CONTENT LIKE '%" + searchWord.trim() + "%' AND DEL=0 ";
		}else {
			sqlWord = " WHERE DEL = 0 ";
		}
		sql += sqlWord;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int len = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4getAllNotice ");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/4getAllNotice ");
			rs = psmt.executeQuery();
			System.out.println("3/4getAllNotice ");
			if(rs.next()) {
				len = rs.getInt(1);
			}			
			System.out.println("4/4getAllNotice success ");
		} catch (SQLException e) {
			System.out.println("getAllNotice fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		return len;	
	}
	// 공지 갯수 구하기(파라미터 X)
	public int getAllNoticeLength() {
		
		String sql = " SELECT COUNT(*) "
				+ " FROM NOTICE "
				+ " WHERE DEL=0 ";
		
		
		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int len = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getAllNoticeLength ");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/4 getAllNoticeLength ");
			rs = psmt.executeQuery();
			System.out.println("3/4 getAllNoticeLength ");
			if(rs.next()) {
				len = rs.getInt(1);
			}			
			System.out.println("4/4 getAllNoticeLength success ");
		} catch (SQLException e) {
			System.out.println("getAllNoticeLength fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		return len;	
	}
	// 공지 삭제
	public boolean notice_delete(String[] sdeleteList) {
	
		String sql = " UPDATE NOTICE "
				+ " SET DEL=1 "
				+ " WHERE SEQ = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int[] deleteList = new int[sdeleteList.length];
		int result = 0;
		
		for (int i = 0; i < sdeleteList.length; i++) {
			deleteList[i] = Integer.parseInt(sdeleteList[i]);
			
			try {
				conn = DBConnection.getConnection();
				System.out.println("1/4 deleteList["+i+"]번째");
				psmt= conn.prepareStatement(sql);
				System.out.println("2/4 deleteList["+i+"]번째");
				psmt.setInt(1, deleteList[i]);
				System.out.println("3/4 deleteList["+i+"]번째");
				result = psmt.executeUpdate();
				System.out.println("4/4 deleteList["+i+"]번째 Success" );
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBClose.close(psmt, conn, null);
			}
			
		}// for end 
		
		
		return result>0?true:false;
		
	}
	public NoticeDto notice_detail(int seq) {
		String sql = " SELECT SEQ,ID,TITLE,CONTENT,REG_DATE,READCOUNT,DEL,CHOICE,FILENAME "
				+ " FROM NOTICE "
				+ " WHERE SEQ=? " ;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		NoticeDto noticeDto = null;
		
		try {
			conn = DBConnection.getConnection();
			psmt= conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				int i=1;
				noticeDto = new NoticeDto(rs.getInt(i++),
											rs.getString(i++),
											rs.getString(i++),
											rs.getString(i++),
											rs.getString(i++),
											rs.getInt(i++),
											rs.getInt(i++),
											rs.getInt(i++),
											rs.getString(i++));
				
			}
			System.out.println(noticeDto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		
		}
		return noticeDto;
	}
	

}
