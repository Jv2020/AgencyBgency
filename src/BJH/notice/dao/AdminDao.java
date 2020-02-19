package BJH.notice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DB.DBClose;
import DB.DBConnection;
import KSJ.exhibit.dto.ExhibitDto;
import NWH.member.dto.MemberDto;

public class AdminDao {

private static AdminDao adminDao = new AdminDao();
 	
	private AdminDao() {
		DBConnection.initConnection();
	}
	
	public static AdminDao getInstance() {
		return adminDao;
	}
//--------------------------------ADMIN 회원관리---------------------------	
	// 멤버 리스트
	public List<MemberDto> getMemberList(){
		String sql = " SELECT ID, PASSWORD, NAME, EMAIL, ADDRESS, BIRTHDAY, GENDER, PHONE, QUESTION, HINT, EXHIBIT_NAME, CERTI_NUM, DEL, AUTH "
				+    " FROM MEMBER ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		MemberDto dto = null;
		List<MemberDto> list = new ArrayList<MemberDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getMemberList success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getMemberList success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getMemberList success");
			
			while(rs.next()) {
				int i = 1;
				String id = rs.getString(i++);
				String password = rs.getString(i++);
				String name = rs.getString(i++);
				String email = rs.getString(i++);
				String address = rs.getString(i++);
				String birthday = rs.getString(i++);
				String gender = rs.getString(i++);
				String phone = rs.getString(i++);
				String question = rs.getString(i++);
				String hint = rs.getString(i++);
				String exhibit_name = rs.getString(i++);
				String certi_num = rs.getString(i++);
				int del = rs.getInt(i++);
				int auth = rs.getInt(i++);
				
				
				dto = new MemberDto(id, password, name, email, address, birthday, gender, phone, question, hint, exhibit_name, certi_num, del, auth);
				list.add(dto);
			}
			System.out.println("4/6 getMemberList success");
			
		} catch (SQLException e) {
			System.out.println("getMemberList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		return list;
	}
	// 멤버 리스트 paging
	public List<MemberDto> getMemberListPaging(int pageNum){
		System.out.println("DB pageNum="+pageNum);
		String sql = " SELECT ID, PASSWORD, NAME, EMAIL, ADDRESS, BIRTHDAY, GENDER, PHONE, QUESTION, HINT, EXHIBIT_NAME, CERTI_NUM, DEL, AUTH "
				+    " FROM ";
				sql += " (SELECT ROW_NUMBER()OVER(ORDER BY ID ASC) AS RNUM,"
						+ " ID,PASSWORD,NAME,EMAIL,ADDRESS,BIRTHDAY,GENDER,PHONE,QUESTION,HINT,EXHIBIT_NAME,CERTI_NUM,DEL,AUTH "
						+ " FROM MEMBER "
						+ " WHERE DEL=0 "
						+ " ORDER BY ID ASC) "
						+ " WHERE RNUM>=? AND RNUM<=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		MemberDto dto = null;
		List<MemberDto> list = new ArrayList<MemberDto>();
		
		int start, end;
		start = 1 + 10 * pageNum; //0 -> 1 
		end = 10 + 10* pageNum;// 0->10
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getMemberListPaging ");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, start);
			psmt.setInt(2, end);
			System.out.println("2/4 getMemberListPaging ");			
			rs = psmt.executeQuery();
			System.out.println("3/4 getMemberListPaging ");
			
			while(rs.next()) {
				int i = 1;
				String id = rs.getString(i++);
				String password = rs.getString(i++);
				String name = rs.getString(i++);
				String email = rs.getString(i++);
				String address = rs.getString(i++);
				String birthday = rs.getString(i++);
				String gender = rs.getString(i++);
				String phone = rs.getString(i++);
				String question = rs.getString(i++);
				String hint = rs.getString(i++);
				String exhibit_name = rs.getString(i++);
				String certi_num = rs.getString(i++);
				int del = rs.getInt(i++);
				int auth = rs.getInt(i++);
				
				
				dto = new MemberDto(id, password, name, email, address, birthday, gender, phone, question, hint, exhibit_name, certi_num, del, auth);
				list.add(dto);
			}
			System.out.println("4/4 getMemberListPaging success");
			
		} catch (SQLException e) {
			System.out.println("getMemberListPaging fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		return list;
	}
	// member page Length
	public int getMemberPageLength() {
		
		String sql = " SELECT COUNT(*) FROM MEMBER "
				+ " WHERE DEL=0 ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int len = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getMemberPageLength ");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/4 getMemberPageLength ");
			rs = psmt.executeQuery();
			System.out.println("3/4 getMemberPageLength ");
			if(rs.next()) {
				len = rs.getInt(1);
			}			
			System.out.println("4/4 getMemberPageLength success ");
		} catch (SQLException e) {
			System.out.println("getMemberPageLength fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		return len;	
	}
	
	
	// DTO 하나 선택
	public MemberDto getMemberById(String findId){
		String sql = " SELECT ID, PASSWORD, NAME, EMAIL, ADDRESS, BIRTHDAY, GENDER, PHONE, QUESTION, HINT, EXHIBIT_NAME, CERTI_NUM, DEL, AUTH "
				+    " FROM MEMBER ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		MemberDto dto = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getMemberById success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getMemberById success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getMemberById success");
			
			if(rs.next()) {
				int i = 1;
				String id = rs.getString(i++);
				String password = rs.getString(i++);
				String name = rs.getString(i++);
				String email = rs.getString(i++);
				String address = rs.getString(i++);
				String birthday = rs.getString(i++);
				String gender = rs.getString(i++);
				String phone = rs.getString(i++);
				String question = rs.getString(i++);
				String hint = rs.getString(i++);
				String exhibit_name = rs.getString(i++);
				String certi_num = rs.getString(i++);
				int del = rs.getInt(i++);
				int auth = rs.getInt(i++);
				
				
				dto = new MemberDto(id, password, name, email, address, birthday, gender, phone, question, hint, exhibit_name, certi_num, del, auth);
				
			}
			System.out.println("4/6 getMemberById success");
			
		} catch (SQLException e) {
			System.out.println("getMemberById fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		return dto;
	}
	
	//ADMIN MEMBER DELETE
	public boolean member_delete(String[] deleteList) {
		
		String sql = " UPDATE MEMBER "
				+ " SET DEL=1 "
				+ " WHERE ID=? " ;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int result =0;
		
		for (int i = 0; i < deleteList.length; i++) {
			
			try {
				conn = DBConnection.getConnection();
				System.out.println("1/4 member_delete ["+i+"]번째");
				psmt= conn.prepareStatement(sql);
				System.out.println("2/4 member_delete["+i+"]번째");
				psmt.setString(1, deleteList[i]);
				System.out.println("3/4 member_delete["+i+"]번째");
				result = psmt.executeUpdate();
				System.out.println("4/4 member_delete["+i+"]번째 Success" );
				
			} catch (SQLException e) {
				System.out.println(" member_delete["+i+"]번째 fail" );
				e.printStackTrace();
			}finally {
				DBClose.close(psmt, conn, null);
			}
		}
		
		return result>0?true:false;
		
	}
	
	//ADMIN MEMBER RECOVER
		public boolean member_recover(String[] recoverList) {
			
			String sql = " UPDATE MEMBER "
					+ " SET DEL=0 "
					+ " WHERE ID=? " ;
			
			Connection conn = null;
			PreparedStatement psmt = null;
			int result =0;
			
			for (int i = 0; i < recoverList.length; i++) {
				
				try {
					conn = DBConnection.getConnection();
					System.out.println("1/4 member_delete ["+i+"]번째");
					psmt= conn.prepareStatement(sql);
					System.out.println("2/4 member_delete["+i+"]번째");
					psmt.setString(1, recoverList[i]);
					System.out.println("3/4 member_delete["+i+"]번째");
					result = psmt.executeUpdate();
					System.out.println("4/4 member_delete["+i+"]번째 Success" );
					
				} catch (SQLException e) {
					System.out.println(" member_delete["+i+"]번째 fail" );
					e.printStackTrace();
				}finally {
					DBClose.close(psmt, conn, null);
				}
			}
			
			return result>0?true:false;
			
		}
		
	// ADMIN 큐레이터 신청자
		
		public int getAccessMember(String choice, String searchWord) {
			String sql = " SELECT COUNT(*) FROM MEMBER ";
			String sqlWord = "";
			
			if(choice.equals("id")) {
				sqlWord = " WHERE ID LIKE '%" + searchWord.trim() + "%' AND AUTH=1 AND DEL=0";
			}else if(choice.equals("place")){
				sqlWord = " WHERE EXHIBIT_NAME LIKE '%" + searchWord.trim() + "%' AND AUTH=1 AND DEL=0 ";
			}else if(choice.equals("name")){
				sqlWord = " WHERE NAME LIKE '%" + searchWord.trim() + "%' AND AUTH=1 AND DEL=0 ";
			}else {
				sqlWord = " WHERE AUTH = 1 AND DEL=0 ";
			}
			sql += sqlWord;
			
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			int len = 0;
			
			try {
				conn = DBConnection.getConnection();
				System.out.println("1/4 getAccessMember ");
				psmt = conn.prepareStatement(sql);
				System.out.println("2/4 getAccessMember ");
				rs = psmt.executeQuery();
				System.out.println("3/4 getAccessMember ");
				if(rs.next()) {
					len = rs.getInt(1);
				}			
				System.out.println("4/4 getAccessMember success ");
			} catch (SQLException e) {
				System.out.println("getAccessMember fail");
				e.printStackTrace();
			} finally {
				DBClose.close(psmt, conn, rs);			
			}
			return len;	
		}
	// 큐레이터 승인 대기자 페이징
	public List<MemberDto> getAccessPagingList(String choice, String searchWord, int page){
		System.out.println("int accesspage = "+page);
		String sql = " SELECT ID, PASSWORD, NAME, EMAIL, ADDRESS, BIRTHDAY, GENDER, PHONE, QUESTION, HINT, EXHIBIT_NAME, CERTI_NUM, DEL, AUTH "
				+    " FROM ";
		
		sql += "(SELECT ROW_NUMBER()OVER(ORDER BY ID DESC) AS RNUM, "
				+ " ID, PASSWORD, NAME, EMAIL, ADDRESS, BIRTHDAY, GENDER, PHONE, QUESTION, HINT, EXHIBIT_NAME, CERTI_NUM, DEL, AUTH "
				+ " FROM MEMBER ";
		
		String sqlWord = "";
		
		if(choice.equals("id")) {
	    	sqlWord = " WHERE ID LIKE '%" + searchWord.trim() + "%' AND DEL=0 AND AUTH=1";
	    }else if(choice.equals("place")){
	    	sqlWord = " WHERE EXHIBIT_NAME LIKE '%" + searchWord.trim() + "%' AND DEL=0 AND AUTH=1";
	    }else if(choice.equals("name")){
			sqlWord = " WHERE NAME LIKE '%" + searchWord.trim() + "%' AND AUTH=1 AND DEL=0 ";
	    }else {
	    	sqlWord = " WHERE DEL=0 AND AUTH=1";
	    }
	    
	    sql += sqlWord;
	    
	    sql += " ORDER BY NAME ASC) ";
	    sql += " WHERE RNUM >= ? AND RNUM <= ? ";
	    
	    System.out.println("Query =" +sql);
	    Connection conn = null;
	    PreparedStatement psmt = null;
	    ResultSet rs = null;
	    
	    List<MemberDto> memberList = new ArrayList<MemberDto>();
	    
	    int start, end;
	    start = 1 + 5 * page; //	0->1 1->6  2->11 3->16
	    end = 5 + 5 * page; // 		0->5 1->10 2->15 3->20
	    
	    try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getAccessPagingList ");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, start);
			psmt.setInt(2, end);			
			System.out.println("2/4 getAccessPagingList ");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 getAccessPagingList ");
			while(rs.next()) {
				int i = 1;
				/*
				 * ID, PASSWORD, NAME, EMAIL, ADDRESS, BIRTHDAY, GENDER, PHONE, QUESTION, HINT,
				 * EXHIBIT_NAME, CERTI_NUM, DEL, AUTH
				 */
				MemberDto memberDto = new MemberDto(rs.getString(i++), 
													rs.getString(i++), 
													rs.getString(i++), 
													rs.getString(i++), 
													rs.getString(i++), 
													rs.getString(i++),
													rs.getString(i++),
													rs.getString(i++),
													rs.getString(i++),
													rs.getString(i++),
													rs.getString(i++),
													rs.getString(i++),
													rs.getInt(i++), 
													rs.getInt(i++)); 
										
				memberList.add(memberDto);
			}
			System.out.println("4/4 getAccessPagingList success ");
			
			} catch (SQLException e) {
				System.out.println("getAccessPagingList fail");
				e.printStackTrace();
			} finally {
				DBClose.close(psmt, conn, rs);			
			}
		
		return memberList;
	}
	// 회원 검색
	public MemberDto getMemberSearch(String choice, String searchWord) {
			System.out.println("choice="+choice);
		String sql = "SELECT ID, PASSWORD, NAME, EMAIL, ADDRESS, BIRTHDAY, GENDER, PHONE, QUESTION, HINT, EXHIBIT_NAME, CERTI_NUM, DEL, AUTH "
				+ " FROM MEMBER ";
		
		String sqlWord = "";
		
		if(choice.equals("id")) {
			sqlWord = " WHERE ID LIKE '%" + searchWord.trim() + "%' AND DEL=0";
		}else if(choice.equals("name")){
			sqlWord = " WHERE NAME LIKE '%" + searchWord.trim() + "%' AND DEL=0 ";
		}
		sql += sqlWord;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		MemberDto memDto = null;
		
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getMemberSearch ");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/4 getMemberSearch ");
			rs = psmt.executeQuery();
			System.out.println("3/4 getMemberSearch ");
			int i = 1;
			if(rs.next()) {
				memDto = new MemberDto(rs.getString(i++), 
										rs.getString(i++), 
										rs.getString(i++), 
										rs.getString(i++), 
										rs.getString(i++), 
										rs.getString(i++),
										rs.getString(i++),
										rs.getString(i++),
										rs.getString(i++),
										rs.getString(i++),
										rs.getString(i++),
										rs.getString(i++),
										rs.getInt(i++), 
										rs.getInt(i++)); 
			}
			
			System.out.println("4/4 getMemberSearch success ");
		} catch (SQLException e) {
			System.out.println("getMemberSearch fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		
		
		
		return memDto;
	}
// 큐레이터 승인
public boolean member_access(String[] accessList) {
		
		String sql = " UPDATE MEMBER "
				+ " SET AUTH=2 "
				+ " WHERE ID=? " ;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int result =0;
		
		for (int i = 0; i < accessList.length; i++) {
			
			try {
				conn = DBConnection.getConnection();
				System.out.println("1/4 member_delete ["+i+"]번째");
				psmt= conn.prepareStatement(sql);
				System.out.println("2/4 member_delete["+i+"]번째");
				psmt.setString(1, accessList[i]);
				System.out.println("3/4 member_delete["+i+"]번째");
				result = psmt.executeUpdate();
				System.out.println("4/4 member_delete["+i+"]번째 Success" );
				
			} catch (SQLException e) {
				System.out.println(" member_delete["+i+"]번째 fail" );
				e.printStackTrace();
			}finally {
				DBClose.close(psmt, conn, null);
			}
		}
		
		return result>0?true:false;
		
	}

	
	
	
	
//----------------------EXHIBIT-------------------------------
	//ADMIN Exhibit List Load
	public List<ExhibitDto> getExhibitList(){
		
		String sql = " SELECT SEQ, BEGINDATE, ENDDATE, TITLE, PLACE, CONTENT, EX_TIME, LOC_INFO, DEL, CONTACT, CERTI_NUM, PRICE, FILENAME "
				+ " FROM EXHIBIT ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		ExhibitDto exhibitDto = null;
		List<ExhibitDto> exhibitList  = new ArrayList<ExhibitDto>();
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int i = 1;
				exhibitDto = new ExhibitDto(rs.getInt(i++),
											rs.getString(i++),
											rs.getString(i++),
											rs.getString(i++),
											rs.getString(i++),
											rs.getString(i++),
											rs.getString(i++),
											rs.getString(i++),
											rs.getInt(i++),
											rs.getString(i++),
											rs.getString(i++),
											rs.getInt(i++),
											rs.getString(i++));
				exhibitList.add(exhibitDto);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return exhibitList;
		
	}
	// 전시갯수 DEL=0 
	public int getAllExhibit(String choice, String searchWord) {
		String sql = " SELECT COUNT(*) FROM EXHIBIT ";
		String sqlWord = "";
		
		if(choice.equals("title")) {
			sqlWord = " WHERE TITLE LIKE'%" + searchWord.trim() + "%' AND DEL=0";
		}else if(choice.equals("place")){
			sqlWord = " WHERE PLACE LIKE '%" + searchWord.trim() + "%' AND DEL=0 ";
		
		}else {
			sqlWord = " WHERE DEL=0 ";
		}
		sql += sqlWord;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int len = 0;
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getAllExhibit ");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/4 getAllExhibit ");
			rs = psmt.executeQuery();
			System.out.println("3/4 getAllExhibit ");
			if(rs.next()) {
				len = rs.getInt(1);
			}			
			System.out.println("4/4 getAllExhibit success ");
		} catch (SQLException e) {
			System.out.println("getAllExhibit fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		return len;	
	}
	// exhibit paging
	public List<ExhibitDto> getExhibitPagingList(String choice, String searchWord, int page ){
		System.out.println("int exhibitpage = "+page);		
		String sql = " SELECT SEQ, BEGINDATE, ENDDATE, TITLE, PLACE, CONTENT, EX_TIME, LOC_INFO, DEL, CONTACT, CERTI_NUM, PRICE, FILENAME "
				+    " FROM ";
		
		sql += "(SELECT ROW_NUMBER()OVER(ORDER BY SEQ DESC) AS RNUM, "
				+ " SEQ, BEGINDATE, ENDDATE, TITLE, PLACE, CONTENT, EX_TIME, LOC_INFO, DEL, CONTACT, CERTI_NUM, PRICE, FILENAME"
				+ " FROM EXHIBIT ";
		
		String sqlWord = "";
		if(choice.equals("title")) {
	    	sqlWord = " WHERE TITLE LIKE '%" + searchWord.trim() + "%' AND DEL=0 ";
	    }else if(choice.equals("place")){
	    	sqlWord = " WHERE PLACE LIKE '%" + searchWord.trim() + "%' AND DEL=0 ";
	    }else {
	    	sqlWord = " WHERE DEL=0 ";
	    }
	    
	    sql += sqlWord;
	    
	    sql += " ORDER BY SEQ DESC) ";
	    sql += " WHERE RNUM >= ? AND RNUM <= ? ";
	    
	    Connection conn = null;
	    PreparedStatement psmt = null;
	    ResultSet rs = null;
	    
	    List<ExhibitDto> exhibitList = new ArrayList<ExhibitDto>();
	    
	    int start, end;
	    start = 1 + 5 * page; //	0->1 1->6  2->11 3->16
	    end = 5 + 5 * page; // 		0->5 1->10 2->15 3->20
	    
	    try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getExhibitPagingList ");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, start);
			psmt.setInt(2, end);			
			System.out.println("2/4 getExhibitPagingList ");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 getExhibitPagingList ");
			
			while(rs.next()) {
				int i = 1;
				
				ExhibitDto exhibitDto = new ExhibitDto(rs.getInt(i++), 
														rs.getString(i++), 
														rs.getString(i++), 
														rs.getString(i++), 
														rs.getString(i++),
														rs.getString(i++),
														rs.getString(i++),
														rs.getString(i++),
														rs.getInt(i++),	
														rs.getString(i++),
														rs.getString(i++),
														rs.getInt(i++),
														rs.getString(i++)); 
										
				exhibitList.add(exhibitDto);
			}
			System.out.println("4/4 getExhibitPagingList success ");
			
		} catch (SQLException e) {
			System.out.println("getExhibitPagingList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		
		return exhibitList;
	}
	
	// 전시 삭제
	public boolean exhibit_delete(String[] exhibitList) {
			
			String sql = " UPDATE EXHIBIT "
					+ " SET DEL=1 "
					+ " WHERE SEQ=? " ;
			
			Connection conn = null;
			PreparedStatement psmt = null;
			int result =0;
			
			for (int i = 0; i < exhibitList.length; i++) {
				
				try {
					conn = DBConnection.getConnection();
					System.out.println("1/4 exhibit_delete ["+i+"]번째");
					psmt= conn.prepareStatement(sql);
					System.out.println("2/4 exhibit_delete["+i+"]번째");
					psmt.setString(1, exhibitList[i]);
					System.out.println("3/4 exhibit_delete["+i+"]번째");
					result = psmt.executeUpdate();
					System.out.println("4/4 exhibit_delete["+i+"]번째 Success" );
					
				} catch (SQLException e) {
					System.out.println(" exhibit_delete["+i+"]번째 fail" );
					e.printStackTrace();
				}finally {
					DBClose.close(psmt, conn, null);
				}
			}
			
			return result>0?true:false;
			
		}
	
}
