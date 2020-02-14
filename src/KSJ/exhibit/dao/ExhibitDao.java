package KSJ.exhibit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DB.DBClose;
import DB.DBConnection;
import KSJ.exhibit.dto.ExhibitDto;

public class ExhibitDao {
	
	//Singleton
	
	private static ExhibitDao dao = null;
	
	private ExhibitDao() {
		DBConnection.initConnection();	// DB initial connection
	}
	
	public static ExhibitDao getInstance() {
		if(dao == null) dao = new ExhibitDao();
		return dao;
	}
	
	// 전시회 모든 리스트 불러오기 
	public List<ExhibitDto> getExhibitList(String choice, int numOfContents) {
		
		// 현재전시 
		String sql = " SELECT SEQ, BEGINDATE, ENDDATE, TITLE, PLACE, CONTENT, EX_TIME, LOC_INFO, DEL, CONTACT, CERTI_NUM, PRICE, FILENAME "
					+" FROM ( SELECT ROW_NUMBER()OVER( ORDER BY BEGINDATE DESC ) AS RNUM, "
						 + " SEQ, BEGINDATE, ENDDATE, TITLE, PLACE, CONTENT, EX_TIME, LOC_INFO, DEL, CONTACT, CERTI_NUM, PRICE , FILENAME "
						 + "  FROM EXHIBIT ";
		String str="";
		if(choice.equals("now")) {	// 현재 전시
			str += " WHERE ENDDATE >= SYSDATE AND BEGINDATE <= SYSDATE  ";
		}else if(choice.equals("past")) {	// 지난 전시 
			str += " WHERE ENDDATE <= SYSDATE ";
		}else if(choice.equals("future")) {		// 예정 전시 
			str += " WHERE BEGINDATE >= SYSDATE ";
		}
		
		sql += str;
		
		sql += " ORDER BY BEGINDATE DESC, TITLE ASC ) " +
				" WHERE RNUM >= 1 AND RNUM <= ? ";
		// 처음 리스트에 뿌릴 데이터의 개수는 12, 더보기는 8개씩 추가된다.
	
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<ExhibitDto> list = new ArrayList<ExhibitDto>();
		
		
		try {
			
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, numOfContents);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int i = 1;
				ExhibitDto dto = new ExhibitDto(rs.getInt(i++), 
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
				list.add(dto);
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return list;
	}
	// 더보기로 끌어오는 경우 작업
	public List<ExhibitDto> getMoreExhibit(String choice, int count) {
		String sql =  " SELECT  SEQ, BEGINDATE, ENDDATE, TITLE, PLACE, CONTENT, EX_TIME, LOC_INFO, DEL, CONTACT, CERTI_NUM, PRICE, FILENAME  "
					+ " FROM ( SELECT ROW_NUMBER()OVER( ORDER BY BEGINDATE DESC ) AS RNUM,"
							+ " SEQ, BEGINDATE, ENDDATE, TITLE, PLACE, CONTENT, EX_TIME, LOC_INFO, DEL, CONTACT, CERTI_NUM, PRICE, FILENAME  "
							+ " FROM EXHIBIT ";
		
		String str = "";
		if(choice.equals("now")) { // 현재 전시 
			str = " WHERE BEGINDATE <= SYSDATE AND SYSDATE <= ENDDATE  ";
		}
		else if(choice.equals("past")) {	// 지난 전시 
			str = " WHERE SYSDATE > ENDDATE  ";
			
		}
		else if(choice.equals("future")) { // 예정 전시 
			str = " WHERE BEGINDATE > SYSDATE  ";
			
		}
		sql += str;
 
		sql += " ORDER BY BEGINDATE DESC, TITLE ASC ) " +
				" WHERE RNUM > ? AND RNUM <= ? ";
	
		// 
		
		int setContentSize = 12;	// 초기에 뿌릴데이터 사이즈 =12개 
		int start = setContentSize + count * 8 ;
		int end = start + 8;

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<ExhibitDto> list = new ArrayList<ExhibitDto>();
		
		
		try {
			
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, start);
			psmt.setInt(2, end);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int i = 1;
				ExhibitDto dto = new ExhibitDto(rs.getInt(i++), 
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
				list.add(dto);
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return list;
		
	}
	
	// 전시의 개수 구하기 
	public int getContentNumber(String choice) {
		
		String sql =  " SELECT COUNT(*) "
					+ " FROM EXHIBIT ";
		String str="";
		if(choice.equals("now")) {	// 현재 전시
			str += " WHERE ENDDATE >= SYSDATE AND BEGINDATE <= SYSDATE   ";
		}else if(choice.equals("past")) {	// 지난 전시 
			str += " WHERE ENDDATE < SYSDATE  ";
		}else if(choice.equals("future")) {		// 예정 전시 
			str += " WHERE BEGINDATE > SYSDATE  ";
		}
		
		sql += str;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int size = 0; 
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				
				size = rs.getInt(1);
				System.out.println(rs.getInt(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			
			DBClose.close(psmt, conn, rs);
			
		}
		
		
		return size;
	}
	
	// 디테일 보기를 위해 전시 select
	public ExhibitDto getExDetail(int seq) {
		
		String sql = " SELECT * FROM EXHIBIT WHERE SEQ = " + seq;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		ExhibitDto dto = new ExhibitDto();
		
		try {
			
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				int i=1;
				dto = new ExhibitDto(rs.getInt(i++), 
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
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return dto;
		
	}
	
	// 이달의 새로운 전시 불러오기
	public List<ExhibitDto> getNewExhibits(){
		String sql =  " SELECT * "
					+ " FROM EXHIBIT "
					+ " WHERE TO_CHAR(BEGINDATE,'MM') = TO_CHAR(SYSDATE,'MM') ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<ExhibitDto> list = new ArrayList<ExhibitDto>();
		
		
		try {
			
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int i = 1;
				ExhibitDto dto = new ExhibitDto(rs.getInt(i++), 
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
				list.add(dto);
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return list;
	}

	// 이달의 마감 전시 불러오기
	public List<ExhibitDto> getEndExhibits(){
		String sql =  " SELECT * "
				+ " FROM EXHIBIT "
				+ " WHERE TO_CHAR(ENDDATE,'MM') = TO_CHAR(SYSDATE,'MM') ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<ExhibitDto> list = new ArrayList<ExhibitDto>();
		
		
		try {
			
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int i = 1;
				ExhibitDto dto = new ExhibitDto(rs.getInt(i++), 
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
				list.add(dto);
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return list;
		
	}
	
	// 이달의 추천전시 불러오기 ( 일단은 가격순  / 나중에 
	public ExhibitDto getRecommandExhibit() {
		
		String sql =  " SELECT SEQ, BEGINDATE, ENDDATE, TITLE, PLACE, CONTENT, EX_TIME, LOC_INFO, DEL, CONTACT, CERTI_NUM, PRICE, FILENAME  "
					+ " FROM ( SELECT ROW_NUMBER()OVER( ORDER BY PRICE DESC ) AS RNUM,  "
					+ " SEQ, BEGINDATE, ENDDATE, TITLE, PLACE, CONTENT, EX_TIME, LOC_INFO, DEL, CONTACT, CERTI_NUM, PRICE, FILENAME  "
					+ " FROM EXHIBIT "
					+ " WHERE  TO_CHAR(ENDDATE,'YYMM') > TO_CHAR(SYSDATE,'YYMM') AND "
					+ " TO_CHAR(BEGINDATE,'YYMM') < TO_CHAR(SYSDATE,'YYMM')) "
					+ " WHERE RNUM = 1 ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		ExhibitDto dto = new ExhibitDto();
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			if(rs.next()) {
				int i=1;
				dto = new ExhibitDto(rs.getInt(i++), 
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
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			DBClose.close(psmt, conn, rs);
		}
		return dto;
	}
	// 월별 전시 목록 보기
	public List<ExhibitDto> getMonthSchedule(String year, String month){
		
		String sql = "";	// 현재 월
		String sql2= "";	// 다른 월 
		
		if( year.equals("") ||  month.equals("") ) {
			sql = " SELECT SEQ, BEGINDATE, ENDDATE, TITLE, PLACE, CONTENT, "
					+ " EX_TIME, LOC_INFO, DEL, CONTACT, CERTI_NUM, PRICE, FILENAME  "	// CERTI_NUM : 바꾸기
				+ " FROM EXHIBIT "
				+ "  WHERE BEGINDATE <= LAST_DAY(SYSDATE) "
						+ " AND ENDDATE >= TO_CHAR(ADD_MONTHS(LAST_DAY(SYSDATE)+1,-1),'YYYYMMDD') "
				+ " ORDER BY BEGINDATE ASC ";
			System.out.println("여기 옴 ");
		}
		
		else {
			sql2 = " SELECT SEQ, BEGINDATE, ENDDATE, TITLE, PLACE, CONTENT, "
					+ " EX_TIME, LOC_INFO, DEL, CONTACT, CERTI_NUM, PRICE, FILENAME  "	// CERTI_NUM : 바꾸기
				+ " FROM EXHIBIT "
				+ " WHERE BEGINDATE <= LAST_DAY( TO_DATE ( ? , 'YYYYMM') ) "
						+ " AND ENDDATE >= TO_DATE( ?, 'YYYYMMDD' ) "
				+ " ORDER BY BEGINDATE ASC ";
		}
		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<ExhibitDto> list = new ArrayList<ExhibitDto>();
		
		
		try {
			
			conn = DBConnection.getConnection();
			
			// 현재 월 일 때 
			if(year.equals("") ||  month.equals("")) {
				psmt = conn.prepareStatement(sql);
			}
			// 다른 월일 때
			else {
				psmt = conn.prepareStatement(sql2);
				psmt.setString(1, year+month);
				psmt.setString(2, year+month+"01");
			}
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int i = 1;
				ExhibitDto dto = new ExhibitDto(rs.getInt(i++), 
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
				list.add(dto);
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return list;
	
	}
	
	// TODO: insert Exhibit
	public boolean insertExhibit(ExhibitDto dto) {
		
		String sql=   " INSERT INTO EXHIBIT ( SEQ, BEGINDATE, ENDDATE, TITLE, PLACE, CONTENT, EX_TIME, LOC_INFO, DEL, CONTACT, CERTI_NUM, PRICE, FILENAME ) "
					+ " VALUES ( SEQ_EXHIBIT.NEXTVAL, TO_DATE( ?, 'YYYYMMDD' ), TO_DATE( ?, 'YYYYMMDD' ) , "
								+ " ?, ?, ? , ?, ?, 0 , ?, ?, ? , ?) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;

		int count = 0;
		
		try {
			
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			// 0 , BEGINDATE, ENDDATE,
			// TITLE, PLACE, CONTENT, EX_TIME, LOC_INFO, 0, CONTACT, CERTI_NUM, PRICE
			psmt.setString(1, dto.getBegindate());	// BEGINDATE
			psmt.setString(2, dto.getEnddate());	// ENDDATE
			psmt.setString(3, dto.getTitle());	// TITLE
			psmt.setString(4, dto.getPlace());	// PLACE
			psmt.setString(5, dto.getContent());	// CONTENT
			psmt.setString(6, dto.getEx_time());	// EX_TIME
			psmt.setString(7, dto.getLoc_info());	// LOC_INFO
			psmt.setString(8, dto.getContact());	// CONTACT
			psmt.setString(9, dto.getCerti_num());	// CERTI_NUM
			psmt.setInt(10, dto.getPrice());	// PRICE - int
			psmt.setString(11, dto.getFilename());	// FILENAME
			
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count>0? true:false;
		

		
		
	}
//
////=================== 리뷰 게시판 용 ======================================================================================
//	// 리뷰 게시판에 전시 정보 뿌리기 (현재 및 지난 전시만)
//	public List<ExhibitDto> getExhibitReview(int pageNum){
//		String sql =  " SELECT SEQ, BEGINDATE, ENDDATE, TITLE, PLACE, CONTENT, "
//					+ " EX_TIME, LOC_INFO, DEL, CONTACT, CERTI_NUM, PRICE "
//					+ " FROM ( SELECT ROW_NUMBER()OVER ( ORDER BY BEGINDATE DESC ) AS RNUM, "
//							+ " SEQ, BEGINDATE, ENDDATE, TITLE, PLACE, CONTENT, "
//							+ " EX_TIME, LOC_INFO, DEL, CONTACT, CERTI_NUM, PRICE "
//							+ " FROM EXHIBIT "
//							+ " WHERE BEGINDATE <= SYSDATE ) "
//					+ " WHERE RNUM >= ? AND RNUM <= ? ";
//		Connection conn = null;
//		PreparedStatement psmt = null;
//		ResultSet rs = null;
//		
//		List<ExhibitDto> list = new ArrayList<ExhibitDto>();
//		
//		// 페이징 시작과 끝
//		// 뿌릴 개수 : 5 
//		int start = 1 + pageNum * 5;	// 처음 페이지 인덱스는 0이 들어옴  
//		int end = 5 + pageNum * 5;		// 0번 페이지 : 1+0*5 = 1, 5+0*5 = 5
//		// 1 ~ 5, 6 ~ 10... 
//		
//		
//		try {
//			
//			conn = DBConnection.getConnection();
//			psmt = conn.prepareStatement(sql);
//			psmt.setInt(1, start);
//			psmt.setInt(2, end);
//			
//			rs = psmt.executeQuery();
//			
//			while(rs.next()) {
//				int i = 1;
//				ExhibitDto dto = new ExhibitDto(rs.getInt(i++), 
//												rs.getString(i++), 
//												rs.getString(i++), 
//												rs.getString(i++), 
//												rs.getString(i++), 
//												rs.getString(i++), 
//												rs.getString(i++), 
//												rs.getString(i++), 
//												rs.getInt(i++), 
//												rs.getString(i++), 
//												rs.getString(i++),
//												rs.getInt(i++));
//				list.add(dto);
//				
//			}
//			
//			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		finally {
//			DBClose.close(psmt, conn, rs);
//		}
//		
//		return list;
//		
//	}
//	// 페이징 할 때 모든 콘텐츠 수 구하는 함수 
//	public int getReviewExhibitNum(String choice) {
//		
//		String sql =  " SELECT COUNT(*) "
//					+ " FROM EXHIBIT "
//					+ " WHERE BEGINDATE <= SYSDATE ";
//
//		Connection conn = null;
//		PreparedStatement psmt = null;
//		ResultSet rs = null;
//		
//		int size = 0; 
//		
//		try {
//			conn = DBConnection.getConnection();
//			psmt = conn.prepareStatement(sql);
//			
//			rs = psmt.executeQuery();
//			
//			if(rs.next()) {
//				size = rs.getInt(1);
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		finally {
//			
//			DBClose.close(psmt, conn, rs);
//			
//		}
//		
//		
//		return size;
//	}
	
}
