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

	// 조인하기
	public boolean addMember(MemberDto dto) {
		String sql = " INSERT INTO MEMBER "
				+ " (ID, PASSWORD, NAME, EMAIL, ADDRESS, BIRTHDAY, GENDER, PHONE, QUESTION, HINT, EXHIBIT_NAME, CERTI_NUM, DEL, AUTH) "
				+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0, ?) ";

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
			psmt.setInt(13, dto.getAuth());


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
	
	// 로그인
	public MemberDto login(MemberDto dto) {
		
		String sql = " SELECT ID, NAME, EMAIL, ADDRESS, BIRTHDAY, GENDER, PHONE, QUESTION, HINT, EXHIBIT_NAME, CERTI_NUM, DEL, AUTH "
				+ " FROM MEMBER "
				+ " WHERE ID=? AND PASSWORD=? AND DEL=0 ";
		
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
				int del = rs.getInt(i++);
				int auth = rs.getInt(i++);
				
				
				mem = new MemberDto(id, null, name, email, address, birthday, gender, phone, question, hint, exhibit_name, certi_num, del, auth);				
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
	

	// 아이디 찾기
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
	
	// 비밀번호 찾기
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
	
	// DTO 하나 선택
	public MemberDto getMemberById(String findId){
		String sql = " SELECT ID, PASSWORD, NAME, EMAIL, ADDRESS, BIRTHDAY, GENDER, PHONE, QUESTION, HINT, EXHIBIT_NAME, CERTI_NUM, DEL, AUTH "
				+    " FROM MEMBER "
				+ 	 " WHERE ID=?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		MemberDto dto = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getMemberById success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, findId);
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
	
	// 회원 탈퇴
	public boolean delMemberById(String FindId) {
		String sql = " UPDATE MEMBER "
				+ " SET DEL=1 "
				+ " WHERE ID = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 delMemberById success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, FindId);
			
			System.out.println("2/6 delMemberById success");
			
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		System.out.println("3/6 delMemberById success");
		return count>0?true:false;
	}
	
	public boolean updateMemberByDTO(MemberDto dto) {
		String sql = " UPDATE MEMBER "
				+    " SET PHONE = ?, ADDRESS = ?, QUESTION = ?, HINT = ?   "
				+    " WHERE ID = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 updateMemberByDTO success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getPhone());
			psmt.setString(2, dto.getAddress());
			psmt.setString(3, dto.getQuestion());
			psmt.setString(4, dto.getHint());
			psmt.setString(5, dto.getId());
			
			System.out.println("2/6 updateMemberByDTO success");
			
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("updateMemberByDTO fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		System.out.println("3/6 updateMemberByDTO success");
		return count>0?true:false;
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
	
}
