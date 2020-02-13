package KEC.reserv.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DB.DBClose;
import DB.DBConnection;
import KEC.reserv.dto.ReservDto;
import NWH.member.dto.MemberDto;

public class ReservDao {
	
	// singleton
	private static ReservDao dao = null;
	
	public ReservDao() {
		DBConnection.initConnection(); // DB연결 초기화
	}
	
	public static ReservDao getInstance(){
		if(dao == null) {
			dao = new ReservDao();
		}
		return dao;
	}
	
	// 예매하기 (INSERT)** 
	public boolean getReservInsert(ReservDto dto){
		
		String sql = " INSERT INTO RESERVATION (SEQ, ID, NAME, BIRTHDATE, PHONE, EMAIL, ADDRESS, "
				+ " RECEIVE, QTY, TOTAL_PRICE, PAY_METHOD, DEL, TITLE, RDATE, DURING) "
				+ " VALUES(SEQ_RESV.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0, ?, SYSDATE, ? ) ";
		
		Connection conn = null;			// DB Connection
		PreparedStatement psmt = null;	// SQLll
		ResultSet rs = null;			// result
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getReserv success");
				
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getReserv success");
			
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getBirthdate());
			psmt.setString(4, dto.getPhone());
			psmt.setString(5, dto.getEmail());
			psmt.setString(6, dto.getAddress());
			psmt.setString(7, dto.getReceive());
			psmt.setInt(8, dto.getQty());
			psmt.setInt(9, dto.getTotalPrice());
			psmt.setString(10, dto.getPayMethod());
			psmt.setString(11, dto.getTitle());
			psmt.setString(12, dto.getDuring());
			
			count = psmt.executeUpdate();
			System.out.println("3/6 getReserv success");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("getReserv fail");
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return count > 0 ? true:false;	
		
	}
	
	// 마이페이지 나의 예매내역 list 뿌리기**
	public List<ReservDto> ReserveList() {
		String sql = " SELECT SEQ, ID, NAME, BIRTHDATE, PHONE, EMAIL, ADDRESS, "
				+ " RECEIVE, QTY, TOTAL_PRICE, PAY_METHOD, DEL, TITLE, RDATE, DURING "
				+ " FROM RESERVATION "
				+ " ORDER BY SEQ DESC ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<ReservDto> list =  new ArrayList<ReservDto>();	
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 ReserveList success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 ReserveList success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 ReserveList success");
			
			while (rs.next()) {
				int i = 1;
				ReservDto dto = new ReservDto(rs.getInt(i++), //seq
											  rs.getString(i++), //id
											  rs.getString(i++), //name
											  rs.getString(i++), //birthdate
											  rs.getString(i++), //phone
											  rs.getString(i++), //email
											  rs.getString(i++), //address
											  rs.getString(i++), //receive
											  rs.getInt(i++), //qty
											  rs.getInt(i++), //totalPrice
											  rs.getString(i++), //payMethod
											  rs.getInt(i++), //del
											  rs.getString(i++), //title
											  rs.getString(i++), //rdate
											  rs.getString(i++) ); //during
				list.add(dto);
				System.out.println("4/6 ReserveList success");
			}
			
		} catch (SQLException e) {
			System.out.println("ReserveList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
	}
	
	// 나의 예매내역 총 개수  ( 한 페이지당 10개씩 추출 )
	public int getAllreserve() {
		String sql = " SELECT COUNT(*) FROM RESERVATION ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int len = 0;
		
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getAllreserve success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getAllreserve success");
			
			if(rs.next()) {
				len = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.out.println("getAllreserve fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return len;		
	}
	
	// paging 처리 
	/*
	public List<ReservDto> getPaging() {
		/*
			1. row 번호
			2. 검색
			3. 정렬
			4. 범위 1 ~ 10
		
		
		
	}
	*/
	
	// 예매 확인 (정보 뿌리기 - 1개 )** 
	public ReservDto getReserve(int seq){
		String sql = " SELECT SEQ, ID, NAME, BIRTHDATE, PHONE, EMAIL, ADDRESS, "
				+ " RECEIVE, QTY, TOTAL_PRICE, PAY_METHOD, DEL, TITLE, RDATE, DURING "
				+ " FROM RESERVATION ";
	
		Connection conn = null;			// DB Connection
		PreparedStatement psmt = null;	// SQL
		ResultSet rs = null;			// result
		
		ReservDto dto = null;
	
		try {
			
			conn = DBConnection.getConnection();
			System.out.println("1/6 getReserve success");
		
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getReserve success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getReserve success");
			
			if (rs.next()) {
				int i = 1;
				dto = new ReservDto(rs.getInt(i++), //seq
									rs.getString(i++), //id
									rs.getString(i++), //name
									rs.getString(i++), //birthdate
									rs.getString(i++), //phone
									rs.getString(i++), //email
									rs.getString(i++), //address
									rs.getString(i++), //receive
									rs.getInt(i++), //qty
									rs.getInt(i++), //totalPrice
									rs.getString(i++), //payMethod
									rs.getInt(i++), //del
									rs.getString(i++), //title
									rs.getString(i++), //RDATE
									rs.getString(i++) ); //DURING
			}
			
			System.out.println("4/6 getReserve success");
				
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("getReserve fail");
				
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		
		return dto;
	}
	
	// 예매 정보 수정**
	public int reserveupdate(int seq, String phone, String email, String address, String receive) {		
		String sql = " UPDATE RESERVATION SET PHONE = ?, EMAIL = ?, ADDRESS = ?, RECEIVE = ? "
				   + " WHERE SEQ = ?" ;
		
		Connection conn = null;			// DB Connection
		PreparedStatement psmt = null;	// SQL
		ResultSet rs = null;			// result
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 update success");
		
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 update success");
			psmt.setString(1, phone);
			psmt.setString(2, email);
			psmt.setString(3, address);
			psmt.setString(4, receive);
			psmt.setInt(5, seq);
			
			return psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		
		return -1; // 데이터베이스 오류

	}
	
	// 예매 정보 삭제**
	public int reserveDelete(int seq) {
		String sql = "UPDATE RESERVATION SET DEL = 1 WHERE SEQ = ?";
		
		Connection conn = null;			// DB Connection
		PreparedStatement psmt = null;	// SQL
		ResultSet rs = null;			// result
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 update success");
		
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, seq);
			
			return psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		return -1; // 데이터베이스 오류
	}
	
	
	
	
	
	
}
