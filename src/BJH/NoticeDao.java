package BJH;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	
	// ���� ����Ʈ 
	public List<NoticeDto> getNoticeList(){
		String sql = " SELECT SEQ, REF, ID, TITLE, CONTENT, REG_DATE, READCOUNT, DEL, CHOICE "
				+ " FROM NOTICE "
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
													rs.getInt(i++),
													rs.getString(i++),//ID
													rs.getString(i++),//TITLE
													rs.getString(i++),//CONTENT
													rs.getString(i++),//REGDATE
													rs.getInt(i++),//READCOUNT
													rs.getInt(i++),//DEL
													rs.getInt(i++));//CHOICE
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
	// ���� ��� 
	public boolean notice_Insert(NoticeDto dto) {
		
		String sql = " INSERT INTO NOTICE(SEQ,REF,ID,TITLE,CONTENT,REG_DATE,READCOUNT,DEL,CHOICE)"
				+ " VALUES(SEQ_NOTICE.NEXTVAL, (SELECT NVL(MAX(REF), 0) + 1 FROM NOTICE) ,?, ?, ?, SYSDATE, 0, 0, ?) ";
			
		
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
	
	public List<NoticeDto> getNoticePagingList(String choice, String searchWord, int page){
		System.out.println("int page = "+page);
		String sql = " SELECT SEQ, REF,ID, TITLE, CONTENT, REG_DATE, READCOUNT, DEL, CHOICE "
				+ " FROM ";
		
			   sql += " (SELECT ROW_NUMBER()OVER(ORDER BY REF DESC) AS RNUM, "
				+ " SEQ, REF,ID, TITLE, CONTENT, REG_DATE, READCOUNT, DEL, CHOICE "
				+ " FROM NOTICE ";
			   
	    String sqlWord = "";
	    
	    if(choice.equals("title")) {
	    	sqlWord = " WHERE TITLE LIKE '%" + searchWord.trim() + "%' ";
	    }else {
	    	sqlWord = " WHERE CONTENT LIKE '%" + searchWord.trim() + "%' ";
	    }
	    
	    sql += sqlWord;
	    
	    sql += " ORDER BY REF DESC) ";
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
										rs.getInt(i++), //ref
										rs.getString(i++), // id
										rs.getString(i++), // title
										rs.getString(i++), // content
										rs.getString(i++), // reg_date
										rs.getInt(i++),	// readcount
										rs.getInt(i++), // del
										rs.getInt(i++)); //choice
										
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
	
	public int getAllNotice(String choice, String searchWord) {
	
		String sql = " SELECT COUNT(*) FROM NOTICE ";
		String sqlWord = "";
		
		if(choice.equals("title")) {
			sqlWord = " WHERE TITLE LIKE '%" + searchWord.trim() + "%' ";
		}else {
			sqlWord = " WHERE CONTENT LIKE '%" + searchWord.trim() + "%' ";
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
}
