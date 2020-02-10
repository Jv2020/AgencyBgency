package KEC.reserv.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import DB.DBClose;
import DB.DBConnection;
import KEC.reserv.dto.ReservDto;

public class ReservDao {
	
	// singleton
	private static ReservDao dao = null;
	
	public ReservDao() {
		DBConnection.initConnection(); // DB연결 초기화
	}
	
	public static ReservDao getInstance(){
		if(dao == null) {
			new ReservDao();
		}
		return dao;
	}
	
	// 예매하기 (INSERT)** 
	public boolean getReserv(ReservDto dto){
		
		String sql = " INSERT INTO RESERVATION (SEQ, ID, NAME, BIRTHDATE, PHONE, EMAIL, ADDRESS, "
				+ " RECEIVE, QTY, TOTAL_PRICE, PAY_METHOD, DEL) "
				+ " VALUES(SEQ_RESV.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1) ";
		
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
	
	
	
	
	
	
}
