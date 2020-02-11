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
		String sql = " SELECT SEQ, BEGINDATE, ENDDATE, TITLE, PLACE, CONTENT, EX_TIME, LOC_INFO, DEL, CONTACT, CERTI_NUM, PRICE "
					+" FROM ( SELECT ROW_NUMBER()OVER( ORDER BY BEGINDATE DESC ) AS RNUM, "
						 + " SEQ, BEGINDATE, ENDDATE, TITLE, PLACE, CONTENT, EX_TIME, LOC_INFO, DEL, CONTACT, CERTI_NUM, PRICE "
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
												rs.getInt(i++));
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
		String sql =  " SELECT  SEQ, BEGINDATE, ENDDATE, TITLE, PLACE, CONTENT, EX_TIME, LOC_INFO, DEL, CONTACT, CERTI_NUM, PRICE "
					+ " FROM ( SELECT ROW_NUMBER()OVER( ORDER BY BEGINDATE DESC ) AS RNUM,"
							+ " SEQ, BEGINDATE, ENDDATE, TITLE, PLACE, CONTENT, EX_TIME, LOC_INFO, DEL, CONTACT, CERTI_NUM, PRICE "
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
												rs.getInt(i++));
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
									rs.getInt(i++));
				
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
												rs.getInt(i++));
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
						rs.getInt(i++));
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
		
		String sql =  " SELECT SEQ, BEGINDATE, ENDDATE, TITLE, PLACE, CONTENT, EX_TIME, LOC_INFO, DEL, CONTACT, CERTI_NUM, PRICE "
					+ " FROM ( SELECT ROW_NUMBER()OVER( ORDER BY PRICE DESC ) AS RNUM,  "
					+ " SEQ, BEGINDATE, ENDDATE, TITLE, PLACE, CONTENT, EX_TIME, LOC_INFO, DEL, CONTACT, CERTI_NUM, PRICE "
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
									rs.getInt(i++));
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
//	public 

	
	
	
	
}
