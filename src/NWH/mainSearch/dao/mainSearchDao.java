package NWH.mainSearch.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DB.DBClose;
import DB.DBConnection;
import KSJ.exhibit.dto.ExhibitDto;


public class mainSearchDao {
	
	private static mainSearchDao dao = new mainSearchDao();

	private mainSearchDao() {
		DBConnection.initConnection();
	}

	public static mainSearchDao getInstance() {
		return dao;
	}
	
	// 메인 검색
	 public List<ExhibitDto> getExhibitListAfterSeachTitle(String searchWord){
	      
	      String sql = " SELECT SEQ, BEGINDATE, ENDDATE, TITLE, PLACE, CONTENT, EX_TIME, LOC_INFO, DEL, CONTACT, CERTI_NUM, PRICE, FILENAME "
	            + 	   " FROM EXHIBIT"
	            + 	   " WHERE TITLE LIKE '%" + searchWord.trim() + "%' ";;
	      
	      Connection conn = null;
	      PreparedStatement psmt = null;
	      ResultSet rs = null;
	      
	      ExhibitDto exhibitDto = null;
	      List<ExhibitDto> exhibitList  = new ArrayList<ExhibitDto>();
	      
	      try {
	         conn = DBConnection.getConnection();
	         psmt = conn.prepareStatement(sql);
	         rs = psmt.executeQuery();
	         
	         while(rs.next()) {
	            int i = 1;
	            exhibitDto = new ExhibitDto( rs.getInt(i++),
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
	            							 rs.getString(i++)
	            							 );
	            exhibitList.add(exhibitDto);
	            
	         }
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } finally {
	         DBClose.close(psmt, conn, rs);
	      }
	      
	      return exhibitList;
	      
	   }
	 
	 public List<ExhibitDto> getExhibitListAfterSeachContent(String searchWord){
	      
	      String sql = " SELECT SEQ, BEGINDATE, ENDDATE, TITLE, PLACE, CONTENT, EX_TIME, LOC_INFO, DEL, CONTACT, CERTI_NUM, PRICE, FILENAME "
	            + 	   " FROM EXHIBIT"
	            + 	   " WHERE TITLE LIKE '%" + searchWord.trim() + "%' ";;
	      
	      Connection conn = null;
	      PreparedStatement psmt = null;
	      ResultSet rs = null;
	      
	      ExhibitDto exhibitDto = null;
	      List<ExhibitDto> exhibitList  = new ArrayList<ExhibitDto>();
	      
	      try {
	         conn = DBConnection.getConnection();
	         psmt = conn.prepareStatement(sql);
	         rs = psmt.executeQuery();
	         
	         while(rs.next()) {
	            int i = 1;
	            exhibitDto = new ExhibitDto( rs.getInt(i++),
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
	            							 rs.getString(i++)
	            							 );
	            exhibitList.add(exhibitDto);
	            
	         }
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } finally {
	         DBClose.close(psmt, conn, rs);
	      }
	      
	      return exhibitList;
	      
	   }
	
}
