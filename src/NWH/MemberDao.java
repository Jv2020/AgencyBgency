package NWH;

import DB.DBConnection;
import NWH.member.dto.MemberDto;

public class MemberDao {

	private static MemberDao dao = new MemberDao();
	
	private MemberDao(){
		DBConnection.initConnection();
	}
	
	public static MemberDao getInstance() {
		return dao;
	}
	
	public boolean addMember(MemberDto dto) {
		String sql = " INSERT INTO "
				+ 	 " (ID, PASSWORD, NAME, EMAIL, ADDRESS, BIRTHDAY, GENDER, PHONE, HINT, EXHIBIT_NAME, CERTI_NUM, AUTH) "
				+ 	 " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		return true;
	}
	
}
