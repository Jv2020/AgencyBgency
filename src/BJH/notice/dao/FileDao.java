package BJH.notice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import BJH.notice.dto.NoticeDto;
import DB.DBClose;
import DB.DBConnection;
import KSJ.files.dto.FilesDto;


public class FileDao {

	//Singleton
	private static FileDao dao = null;
	
	private FileDao() {
		DBConnection.initConnection();
	}
	
	public static FileDao getInstance() {
		if(dao == null) dao = new FileDao();
		return dao;
	}
	
	// insert file 
		public boolean insertFile(FilesDto dto) {
			
			String sql = " INSERT INTO FILES ( SEQ, FILENAME, ORIGIN_NAME, FILEPATH, BBS_NAME, BBS_SEQ, DEL, FILE_SEQ ) "
					+ " VALUES ( SEQ_FILES.NEXTVAL, ?, ?, ?, ?, ?, 0 , 2 ) ";
			
			Connection conn = null;
			PreparedStatement psmt = null;
			
			int count = 0;
			
			try {
				conn = DBConnection.getConnection();
				System.out.println("1/4 insertFile");
				psmt = conn.prepareStatement(sql);
				System.out.println("2/4 insertFile");
				psmt.setString(1, dto.getFilename());
				psmt.setString(2, dto.getOriginName());
				psmt.setString(3, dto.getFilepath());
				psmt.setString(4, dto.getBbsName());
				psmt.setInt(5, dto.getBbsSeq());
				
				System.out.println("3/4 insertFile");
				count = psmt.executeUpdate();
				System.out.println("4/4 insertFile");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finally {
				DBClose.close(psmt, conn, null);
			}
			
			return count >0? true:false;
			
		}
		// update file 
		public boolean updateFile(FilesDto dto) {
			
			String sql = " UPDATE FILES "
					+ " SET FILENAME = ?,ORIGIN_NAME = ? "
					+ " WHERE BBS_SEQ=? AND BBS_NAME='notice' ";
					
			
			Connection conn = null;
			PreparedStatement psmt = null;
			
			int count = 0;
			
			try {
				conn = DBConnection.getConnection();
				System.out.println("1/4 updateFile");
				psmt = conn.prepareStatement(sql);
				System.out.println("2/4 updateFile");
				psmt.setString(1, dto.getFilename());
				psmt.setString(2, dto.getOriginName());
				psmt.setInt(3, dto.getBbsSeq());
				System.out.println("3/4 updateFile");
				count = psmt.executeUpdate();
				System.out.println("4/4 updateFile");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finally {
				DBClose.close(psmt, conn, null);
			}
			
			return count >0? true:false;
			
		}
		// delete file 
				public boolean file_delete(String delList[]) {
					
					String sql = " UPDATE FILES "
							+ " SET DEL=1 "
							+ " WHERE BBS_SEQ = ? BBS_NAME = 'notice' ";
					
					Connection conn = null;
					PreparedStatement psmt = null;
					int[] deleteList = new int[delList.length];
					int result = 0;
					
					for (int i = 0; i < delList.length; i++) {
						deleteList[i] = Integer.parseInt(delList[i]);
						
						try {
							conn = DBConnection.getConnection();
							System.out.println("1/4 file_delete["+i+"]번째");
							psmt= conn.prepareStatement(sql);
							System.out.println("2/4 file_delete["+i+"]번째");
							psmt.setInt(1, deleteList[i]);
							System.out.println("3/4 file_delete["+i+"]번째");
							result = psmt.executeUpdate();
							System.out.println("4/4 file_delete["+i+"]번째 Success" );
							
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}finally {
							DBClose.close(psmt, conn, null);
						}
						
					}// for end 
					
					
					return result>0?true:false;
			}
	
	//notice seq 추출
	public int getNoticeSeq(String filename) {
		String sql=   " SELECT SEQ "
					+ " FROM NOTICE "
					+ " WHERE FILENAME = ? AND DEL=0";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int notice_seq= -1;
		
		NoticeDto dto = new NoticeDto();;
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, filename);
			
			rs = psmt.executeQuery();
			if(rs.next()) {
				notice_seq = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			DBClose.close(psmt, conn, rs);
		}
		return notice_seq;
	}
	
	
	// 원본명 가져오기
	public FilesDto getOriginName(int seq) {
		
		String sql = " SELECT SEQ,FILENAME,ORIGIN_NAME, FILEPATH,BBS_NAME,BBS_SEQ,DEL,FILE_SEQ "
				+ " FROM FILES "
				+ " WHERE BBS_SEQ=? AND BBS_NAME='notice' AND DEL=0 ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		FilesDto fileDto = null;
	
		try {
			conn=DBConnection.getConnection();
			System.out.println("1/4 getOriginName");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/4 getOriginName");
			psmt.setInt(1, seq);
			System.out.println("3/4 getOriginName");
			rs = psmt.executeQuery();
			System.out.println("4/4 getOriginName");
			if(rs.next()) {
				int i =1;
				fileDto = new FilesDto(rs.getInt(i++),
										rs.getString(i++),
										rs.getString(i++),
										rs.getString(i++),
										rs.getString(i++),
										rs.getInt(i++),
										rs.getInt(i++),
										rs.getInt(i++));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		System.out.println(fileDto);
		return fileDto;
	}
	
		
	
}
