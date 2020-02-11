package NWH.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	
public MemberDto login(MemberDto dto) {
		
		String sql = " SELECT ID, NAME, EMAIL, ADDRESS, BIRTHDAY, GENDER, PHONE, QUESTION, HINT, EXHIBIT_NAME, CERTI_NUM, AUTH "
				+ " FROM MEMBER "
				+ " WHERE ID=? AND PASSWORD=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		MemberDto mem = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 login success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 login success");
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPassword());
			
			rs = psmt.executeQuery();
			System.out.println("3/6 login success");
			
			if(rs.next()) {
				int i = 1;
				String id = rs.getString(i++);
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
				int auth = rs.getInt(i++);
				
				
				mem = new MemberDto(id, null, name, email, address, birthday, gender, phone, question, hint, exhibit_name, certi_num, auth);				
			}
			System.out.println("4/6 login success");
			
		} catch (SQLException e) {
			System.out.println("login fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		return mem;
	}

	public String memberFindId(MemberDto dto) {
		String sql = " SELECT ID "
				+    " FROM MEMBER"
				+ 	 " WHERE NAME = ? AND EMAIL = ? AND PHONE = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		String id = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 memberFindId success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 memberFindId success");
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getEmail());
			psmt.setString(3, dto.getPhone());
			
			rs = psmt.executeQuery();
			System.out.println("3/6 memberFindId success");
			
			if(rs.next()) {
				id = rs.getString(1);
			}
			System.out.println("4/6 memberFindId success");
			
			
		} catch (SQLException e) {
			System.out.println("memberFindId fail");
			e.printStackTrace();
		}
		
		return id;
		
	}
	
	public String memberFindPassword(MemberDto dto) {
		String sql = " SELECT PASSWORD "
				+    " FROM MEMBER"
				+ 	 " WHERE ID = ? AND NAME = ? AND QUESTION = ? AND HINT = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		String password = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 memberFindPassword success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 memberFindPassword success");
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getQuestion());
			psmt.setString(4, dto.getHint());
			
			rs = psmt.executeQuery();
			System.out.println("3/6 memberFindPassword success");
			
			if(rs.next()) {
				password = rs.getString(1);
			}
			System.out.println("4/6 memberFindPassword success");
			
			
		} catch (SQLException e) {
			System.out.println("memberFindPassword fail");
			e.printStackTrace();
		}
		
		return password;
		
	}
	
	public List<MemberDto> getMemberList(){
		String sql = " SELECT ID, PASSWORD, NAME, EMAIL, ADDRESS, BIRTHDAY, GENDER, PHONE, QUESTION, HINT, EXHIBIT_NAME, CERTI_NUM, AUTH "
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
				int auth = rs.getInt(i++);
				
				
				dto = new MemberDto(id, password, name, email, address, birthday, gender, phone, question, hint, exhibit_name, certi_num, auth);
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
	
	public MemberDto getMemberById(String findId){
		String sql = " SELECT ID, PASSWORD, NAME, EMAIL, ADDRESS, BIRTHDAY, GENDER, PHONE, QUESTION, HINT, EXHIBIT_NAME, CERTI_NUM, AUTH "
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
				int auth = rs.getInt(i++);
				
				
				dto = new MemberDto(id, password, name, email, address, birthday, gender, phone, question, hint, exhibit_name, certi_num, auth);
				
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
	
}
