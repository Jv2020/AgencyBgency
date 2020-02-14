package KSJ.files.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DB.DBClose;
import DB.DBConnection;
import KSJ.exhibit.dto.ExhibitDto;
import KSJ.files.dto.FilesDto;

public class FilesDao {
	
	//Singleton
	private static FilesDao dao = null;
	
	private FilesDao() {
		DBConnection.initConnection();
	}
	
	public static FilesDao getInstance() {
		if(dao == null) dao = new FilesDao();
		return dao;
	}
	
	
	
	// 전시 seq 꺼내기
	public int getExhibitSeq(String filename) {
		String sql=   " SELECT SEQ "
					+ " FROM EXHIBIT "
					+ " WHERE FILENAME = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int exhibit_seq= -1;
		
		ExhibitDto dto = new ExhibitDto();
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, filename);
			
			rs = psmt.executeQuery();
			if(rs.next()) {
				exhibit_seq = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			DBClose.close(psmt, conn, rs);
		}
		return exhibit_seq;
	}
	
	// insert file 
	public boolean insertFile(FilesDto dto) {
		
		String sql = " INSERT INTO FILES ( SEQ, FILENAME, ORIGIN_NAME, FILEPATH, BBS_NAME, BBS_SEQ, DEL, FILE_SEQ ) "
				+ " VALUES ( SEQ_FILES.NEXTVAL, ?, ?, ?, ?, ?, 0 , ? ) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getFilename());
			psmt.setString(2, dto.getOriginName());
			psmt.setString(3, dto.getFilepath());
			psmt.setString(4, dto.getBbsName());
			psmt.setInt(5, dto.getBbsSeq());
			psmt.setInt(6, dto.getFile_seq());
			
			count = psmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			DBClose.close(psmt, conn, null);
		}
		
		return count >0? true:false;
		
	}
	
	
	
	
}
