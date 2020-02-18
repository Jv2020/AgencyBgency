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
			str += " WHERE ENDDATE >= SYSDATE AND BEGINDATE <= SYSDATE  AND DEL = 0  ";
		}else if(choice.equals("past")) {	// 지난 전시 
			str += " WHERE ENDDATE <= SYSDATE AND DEL = 0  ";
		}else if(choice.equals("future")) {		// 예정 전시 
			str += " WHERE BEGINDATE >= SYSDATE  AND DEL = 0 ";
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
			str = " WHERE BEGINDATE <= SYSDATE AND SYSDATE <= ENDDATE  AND DEL = 0  ";
		}
		else if(choice.equals("past")) {	// 지난 전시 
			str = " WHERE SYSDATE > ENDDATE  AND DEL = 0  ";
			
		}
		else if(choice.equals("future")) { // 예정 전시 
			str = " WHERE BEGINDATE > SYSDATE  AND DEL = 0  ";
			
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
			str += " WHERE ENDDATE >= SYSDATE AND BEGINDATE <= SYSDATE  AND DEL = 0   ";
		}else if(choice.equals("past")) {	// 지난 전시 
			str += " WHERE ENDDATE < SYSDATE  AND DEL = 0  ";
		}else if(choice.equals("future")) {		// 예정 전시 
			str += " WHERE BEGINDATE > SYSDATE  AND DEL = 0  ";
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
					+ " WHERE TO_CHAR(BEGINDATE,'MM') = TO_CHAR(SYSDATE,'MM')  AND DEL = 0  ";
		
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
				+ " WHERE TO_CHAR(ENDDATE,'MM') = TO_CHAR(SYSDATE,'MM')  AND DEL = 0  ";
		
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
							+ " TO_CHAR(BEGINDATE,'YYMM') < TO_CHAR(SYSDATE,'YYMM')  AND DEL = 0 ) "
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
						+ " AND ENDDATE >= TO_CHAR(ADD_MONTHS(LAST_DAY(SYSDATE)+1,-1),'YYYYMMDD')  AND DEL = 0 "
				+ " ORDER BY BEGINDATE ASC ";
			System.out.println("여기 옴 ");
		}
		
		else {
			sql2 = " SELECT SEQ, BEGINDATE, ENDDATE, TITLE, PLACE, CONTENT, "
					+ " EX_TIME, LOC_INFO, DEL, CONTACT, CERTI_NUM, PRICE, FILENAME  "	// CERTI_NUM : 바꾸기
				+ " FROM EXHIBIT "
				+ " WHERE BEGINDATE <= LAST_DAY( TO_DATE ( ? , 'YYYYMM') ) "
						+ " AND ENDDATE >= TO_DATE( ?, 'YYYYMMDD' )  AND DEL = 0  "
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
	
	//======= curator ==========================
	
	
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
			System.out.println("ExhibitDao :" + dto.getTitle());
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
		finally {
			DBClose.close(psmt, conn, null);
		}
		return count>0? true:false;
	}
	
	// 큐레이터 내가 등록한 전시 list
	public List<ExhibitDto> getCuratorList(int page, String certi_num){	// 페이징 : 한번에 10개씩 출력
		
		// 처음은 0 
		String sql =  " SELECT SEQ, BEGINDATE, ENDDATE, TITLE, PLACE, CONTENT, "
							+ " EX_TIME, LOC_INFO, DEL, CONTACT, CERTI_NUM, PRICE, FILENAME "
					+ " FROM ( SELECT ROW_NUMBER()OVER(ORDER BY BEGINDATE DESC) AS RNUM,SEQ, BEGINDATE, ENDDATE, TITLE, PLACE, CONTENT, "
							+ " EX_TIME, LOC_INFO, DEL, CONTACT, CERTI_NUM, PRICE, FILENAME "
							+ " FROM EXHIBIT"
							+ " WHERE CERTI_NUM = ? )"
					+ " WHERE RNUM >= ? AND RNUM <= ? ";
		
		// 처음 리스트에 뿌릴 데이터의 개수는 12, 더보기는 8개씩 추가된다.
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<ExhibitDto> list = new ArrayList<ExhibitDto>();
		
		int start, end = 0;
		start = 1 + page * 10;
		end = 10 + page * 10;
		
		try {
			
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, certi_num);	// CERTI_NUM
			psmt.setInt(2, start);	// START
			psmt.setInt(3, end);	// END
			
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
	// 내가 등록한 전시갯수 
	public int getCuratorContentsNum(String certi_num) {
		
		String sql =  " SELECT COUNT(*) "
					+ " FROM EXHIBIT "
					+ " WHERE CERTI_NUM = ? AND DEL = 0 ";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int number = -1;
		
		try {
			
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, certi_num);	// CERTI_NUM
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				number = rs.getInt(1);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return number;
		
	}

	// 전시 삭제하기
	public boolean deleteExhibit(int seq) {
		String sql=   " UPDATE EXHIBIT "
					+ " SET DEL = 1 "
					+ " WHERE SEQ = " + seq;
		Connection conn = null;
		PreparedStatement psmt = null;

		int count = 0;
		System.out.println("1");
		
		try {
			
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			System.out.println("1");
			
			count = psmt.executeUpdate();
			System.out.println("2");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			System.out.println("3");
			DBClose.close(psmt, conn, null);
		}
		
		System.out.println("4");
		return count>0? true:false;
		
		
	}
	
	
}
