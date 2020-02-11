package KEC.reserv.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
	public boolean getReserv(ReservDto dto){
		
		String sql = " INSERT INTO RESERVATION (SEQ, ID, NAME, BIRTHDATE, PHONE, EMAIL, ADDRESS, "
				+ " RECEIVE, QTY, TOTAL_PRICE, PAY_METHOD, DEL) "
				+ " VALUES(SEQ_RESV.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0) ";
		
		Connection conn = null;			// DB Connection
		PreparedStatement psmt = null;	// SQL
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
	
	// 예매 확인 (정보 뿌리기)** 
	public ReservDto getReservId(String reservId){
		String sql = " SELECT SEQ, ID, NAME, BIRTHDATE, PHONE, EMAIL, ADDRESS, "
				+ " RECEIVE, QTY, TOTAL_PRICE, PAY_METHOD, DEL "
				+ " FROM RESERVATION";
	
		Connection conn = null;			// DB Connection
		PreparedStatement psmt = null;	// SQL
		ResultSet rs = null;			// result
		
		ReservDto dto = null;
	
		try {
			
			conn = DBConnection.getConnection();
			System.out.println("1/6 getReservId success");
		
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getReservId success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getReservId success");
		
			if(rs.next()) {
				int i = 1;
				int seq = rs.getInt(i++);
				String id = rs.getString(i++);
				String name = rs.getString(i++);
				String birthdate = rs.getString(i++);
				String phone = rs.getString(i++);
				String email = rs.getString(i++);
				String address = rs.getString(i++);
				String receive = rs.getString(i++);
				int qty = rs.getInt(i++);
				int totalPrice = rs.getInt(i++);
				String payMethod = rs.getString(i++);
				int del = rs.getInt(i++);
				
				
				
				dto = new ReservDto(seq, id, name, birthdate, phone, email, address, receive, qty, totalPrice, payMethod, del);
				
			}
			
			System.out.println("4/6 getReservId success");
				
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("getReservId fail");
				
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		
		return dto;
	}
	
	// 예매 정보 수정**
	public int update(int seq, String phone, String email, String address, String receive) {		
		String sql = " UPDATE RESERVATION SET PHONE = ?, EMAIL = ?, ADDRESS = ?, RECEIVE = ? "
				    + "	WHERE SEQ = ?" ;
		
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
	public int delete(int seq) {
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
