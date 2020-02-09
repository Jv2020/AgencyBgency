package NWH.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import DB.DBClose;
import DB.DBConnection;
import NWH.member.dto.MemberDto;

public class MemberDao {

	private static MemberDao dao = new MemberDao();

	private MemberDao() {
		DBConnection.initConnection();
	}

	public static MemberDao getInstance() {
		return dao;
	}

	public boolean addMember(MemberDto dto) {
		String sql = " INSERT INTO MEMBER "
				+ " (ID, PASSWORD, NAME, EMAIL, ADDRESS, BIRTHDAY, GENDER, PHONE, QUESTION, HINT, EXHIBIT_NAME, CERTI_NUM, AUTH) "
				+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0) ";

		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 addMember success");

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPassword());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getEmail());
			psmt.setString(5, dto.getAddress());
			psmt.setString(6, dto.getBirthday());
			psmt.setString(7, dto.getGender());
			psmt.setString(8, dto.getPhone());
			psmt.setString(9, dto.getQuestion());
			psmt.setString(10, dto.getHint());
			psmt.setString(11, dto.getExhibit_name());
			psmt.setString(12, dto.getCerti_num());


			System.out.println("2/6 addMember success");

			count = psmt.executeUpdate();
			System.out.println("3/6 addMember success");

		} catch (SQLException e) {
			System.out.println("addMember fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		
		return count>0?true:false;
	}
}
