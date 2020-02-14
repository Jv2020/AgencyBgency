package CYH;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DB.DBClose;
import DB.DBConnection;
import KSJ.exhibit.dto.ExhibitDto;

public class ReviewDao {
	private static ReviewDao reviewDao = new ReviewDao();
	
	private ReviewDao() {
		DBConnection.initConnection();
	}
	
	public static ReviewDao getInstance() {
		return reviewDao;
	}
	
	public List<ReviewDto> getReviewList() {		// 리뷰페이지에 뿌려질 리뷰"리스트"를 가져와(get)
		String sql = " SELECT * FROM EXHIBIT_REVIEW ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<ReviewDto> reviewList = new ArrayList<ReviewDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getReviewList Success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getReviewList Success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getReviewList Success");
			
			while(rs.next()) {
				int i = 1;
				
				ReviewDto dto = new ReviewDto(	rs.getInt(i++),		//seq
												rs.getString(i++),	//id
												rs.getString(i++),	//exhibition_title
												rs.getString(i++),	//regdate
												rs.getInt(i++),		//star_number
												rs.getString(i++),	//review
												rs.getInt(i++),		//like_number
												rs.getInt(i++),		//dislike_number
												rs.getInt(i++)	);	//del
				reviewList.add(dto);
			}
			System.out.println("4/6 getReviewList Success");
			
		} catch (SQLException e) {
			System.out.println("getReviewList Fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return reviewList;
	}
	
	public List<ReviewDto> getReviewList(int page) {		// 리뷰페이지에 뿌려질 리뷰"리스트"를 가져와(get)
		// 1번 페이지 : 1 ~ 5
		// 2번 페이지 : 6 ~ 10
		int startNum = (page - 1) * 5 + 1;		// 예를 들어, 6번페이지의 글은 26번째 글 부터 시작해
		int endNum = page * 5;					// 6번 페이지의 글의 끝번호는 30번이야
		
		String sql = " SELECT *  "
					+ " FROM (SELECT * "
					+ " FROM (SELECT ROWNUM row_num, * FROM EXHIBIT_REVIEW) "
					+ " WHERE row_num >= ?) "
					+ " WHERE row_num <= ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<ReviewDto> reviewList = new ArrayList<ReviewDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getReviewList Success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getReviewList Success");
			
			psmt.setInt(1, startNum);
			psmt.setInt(2, endNum);
			System.out.println("3/6 getReviewList Success");
			
			rs = psmt.executeQuery();
			System.out.println("4/6 getReviewList Success");
			
			while(rs.next()) {
				int i = 1;
				
				ReviewDto dto = new ReviewDto(	rs.getInt(i++),		//seq
												rs.getString(i++),	//id
												rs.getString(i++),	//exhibition_title
												rs.getString(i++),	//regdate
												rs.getInt(i++),		//star_number
												rs.getString(i++),	//review
												rs.getInt(i++),		//like_number
												rs.getInt(i++),		//dislike_number
												rs.getInt(i++)	);	//del
				reviewList.add(dto);
			}
			System.out.println("5/6 getReviewList Success");
			
		} catch (SQLException e) {
			System.out.println("getReviewList Fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return reviewList;
	}
	
	public List<ReviewDto> getReviewList(String title) {		// 리뷰페이지에 뿌려질 리뷰"리스트"를 가져와(get)
		String sql = " SELECT * FROM EXHIBIT_REVIEW "
					+ " WHERE TITLE=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<ReviewDto> reviewList = new ArrayList<ReviewDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getReviewList Success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getReviewList Success");
			
			psmt.setString(1, title);
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getReviewList Success");
			
			while(rs.next()) {
				int i = 1;
				
				ReviewDto dto = new ReviewDto(	rs.getInt(i++),		//seq
												rs.getString(i++),	//id
												rs.getString(i++),	//exhibition_title
												rs.getString(i++),	//regdate
												rs.getInt(i++),		//star_number
												rs.getString(i++),	//review
												rs.getInt(i++),		//like_number
												rs.getInt(i++),		//dislike_number
												rs.getInt(i++)	);	//del
				reviewList.add(dto);
			}
			System.out.println("4/6 getReviewList Success");
			
		} catch (SQLException e) {
			System.out.println("getReviewList Fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return reviewList;
	}
	
	public List<ReviewDto> getReviewList(String title, int re_pageNum) {		// 리뷰페이지에 뿌려질 리뷰"리스트"를 가져와(get)
		String sql = " SELECT SEQ, ID, TITLE, REG_DATE, STAR, REVIEW, LIKE_NUMBER, DISLIKE, DEL "
				+ " FROM ( "
				+ " SELECT ROWNUM AS RNUM, SEQ, ID, TITLE, REG_DATE, STAR, REVIEW, LIKE_NUMBER, DISLIKE, DEL "
				+ " FROM EXHIBIT_REVIEW "
				+ " WHERE TITLE=?) "
				+ " WHERE RNUM >=? AND RNUM <=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<ReviewDto> reviewList = new ArrayList<ReviewDto>();
		
		// 페이징 시작과 끝
		// 뿌릴 개수 : 5
		int start = 1 + re_pageNum * 5;	// 처음 페이지 인덱스는 0이 들어옴
		int end = 5 + re_pageNum * 5;		// 0번 페이지 : 1+0*5 = 1, 5+0*5 = 5
		// 1 ~ 5, 6 ~ 10...
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getReviewList Success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getReviewList Success");
			
			psmt.setString(1, title);
			psmt.setInt(2, start);
			psmt.setInt(3, end);
			System.out.println("3/6 getReviewList Success");
			
			rs = psmt.executeQuery();
			System.out.println("4/6 getReviewList Success");
			
			while(rs.next()) {
				int i = 1;
				
				ReviewDto dto = new ReviewDto(	rs.getInt(i++),		//seq
												rs.getString(i++),	//id
												rs.getString(i++),	//exhibition_title
												rs.getString(i++),	//regdate
												rs.getInt(i++),		//star_number
												rs.getString(i++),	//review
												rs.getInt(i++),		//like_number
												rs.getInt(i++),		//dislike_number
												rs.getInt(i++)	);	//del
				reviewList.add(dto);
			}
			System.out.println("5/6 getReviewList Success");
			
		} catch (SQLException e) {
			System.out.println("getReviewList Fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return reviewList;
	}
	
	// 요청받은 전시회에 따른, 전체 리뷰갯수
	public int getAllCount(String title) {
		String sql = " SELECT COUNT(*) FROM EXHIBIT_REVIEW "
					+ " WHERE TITLE=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getAllCount Success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getAllCount Success");
			
			psmt.setString(1, title);
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getAllCount Success");
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			System.out.println("4/6 getAllCount Success");
			
		} catch (SQLException e) {
			System.out.println("getAllCount Fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return count;
	}
	
	public boolean writeReview(ReviewDto dto) {		// 리뷰를 쓰고싶은 메소드
		String sql = " INSERT INTO EXHIBIT_REVIEW "
					+ " (SEQ, ID, TITLE, REG_DATE, STAR, REVIEW, LIKE_NUMBER, DISLIKE, DEL ) "
					+ " VALUE(SEQ_REVIEW.NEXTVAL, ?, ?, SYSDATE, ?, ?, 0, 0, 0 ) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0 ;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getReviewList Success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getReivewList Success");
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setInt(3, dto.getStar());
			psmt.setString(4, dto.getReview());
			System.out.println("3/6 getReivewList Success");
			
			count = psmt.executeUpdate();
			System.out.println("4/6 getReviewList Success");
			
		} catch (SQLException e) {
			System.out.println("getReviewList Fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		
		return count > 0 ? true : false;
	}
	
	public boolean updateReview(int seq, String review, int star) {		// 자신이 쓴 글에 대한 수정 메소드 ※ 주의! 파라미터 순서를 잘 확인해!
		String sql = " UPDATE EXHIBIT_REVIEW "
					+ " SET REVIEW=?, STAR=? "
					+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 writeReview Success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 writeReview Success");
			
			psmt.setString(1, review);
			psmt.setInt(2, star);
			psmt.setInt(3, seq);
			System.out.println("3/6 writeReview Success");
			
			count = psmt.executeUpdate();
			System.out.println("4/6 writeReview Success");
			
		} catch (SQLException e) {
			System.out.println("writeReview Fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		
		return count > 0 ? true : false;
	}
	
	public boolean deleteReview(int seq) {		// 자신이 쓴 글에 대한 삭제 메소드
		String sql = " UPDATE EXHIBIT_REIVEW "
					+ " SET DEL=1 "
					+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 deleteReview Success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 deleteReview Success");
			
			psmt.setInt(1, seq);
			System.out.println("3/6 deleteReview Success");
			
		} catch (SQLException e) {
			System.out.println("deleteReview Success");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		
		return count > 0 ? true : false;
	}
	
	// 어떤 아이디가 어떤 전시회명에 대해 '좋아요'를 눌렀는지 안눌렀는지 판정할꺼야
	public int getLIKE_Decision(String sessionid, String title) {
		String sql = " SELECT LIKE_DECISION "
					+ " FROM LI_DI_DECISION "
					+ " WHERE ID=? AND TITLE=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getLIKE_Decision Success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getLIKE_Decision Success");
			
			psmt.setString(1, sessionid);
			psmt.setString(2, title);
			System.out.println("3/6 getLIKE_Decision Success");
			
			rs = psmt.executeQuery();
			System.out.println("4/6 getLIKE_Decision Success");
			
			while(rs.next()) {
				count = rs.getInt(1);
			}
			System.out.println("5/6 getLIKE_Decision Success");
			
		} catch (SQLException e) {
			System.out.println("getLIKE_Decision Fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return count;
	}
	
	public void setLIKE_Decision(String sessionid, String title) {
		String sql = " INSERT INTO LI_DI_DECISION "
					+ " VALUES(?, ?, 1, 0) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 setLIKE_Decision Success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 setLIKE_Decision Success");
			
			psmt.setString(1, sessionid);
			psmt.setString(2, title);
			System.out.println("3/6 setLIKE_Decision Success");
			
			psmt.executeUpdate();
			System.out.println("4/6 setLIKE_Decision Success");
			
		} catch (SQLException e) {
			System.out.println("setLIKE_Decision Fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
	}
	
	public void likeCount(String writerid, String title) {		// '좋아요'수를 올려줘
		String sql = " UPDATE EXHIBIT_REVIEW "
					+ " SET LIKE_NUMBER=LIKE_NUMBER+1 "
					+ " WHERE ID=? AND TITLE=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 likeCount Success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 likeCount Success");
			
			psmt.setString(1, writerid);
			psmt.setString(2, title);
			System.out.println("3/6 likeCount Success");
			
			psmt.executeUpdate();
			System.out.println("4/6 likeCount Success");
			
		} catch (SQLException e) {
			System.out.println("likeCount Fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
	}
	
	public int getDISLIKE_Decision(String sessionid, String title) {
		String sql = " SELECT DISLIKE_DECISION "
					+ " FROM LI_DI_DECISION "
					+ " WHERE ID=? AND TITLE=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getDISLIKE_Decision Success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getDISLIKE_Decision Success");
			
			psmt.setString(1, sessionid);
			psmt.setString(2, title);
			System.out.println("3/6 getDISLIKE_Decision Success");
			
			rs = psmt.executeQuery();
			System.out.println("4/6 getDISLIKE_Decision Success");
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			System.out.println("5/6 getDISLIKE_Decision Success");
			
		} catch (SQLException e) {
			System.out.println("getDISLIKE_Decision Fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return count;
	}
	
	public void setDISLIKE_Decision(String sessionid, String title) {
		String sql = " INSERT INTO LI_DI_DECISION "
					+ " VALUES(?, ?, 0, 1) ";
	
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 DISLIKE_Decision Success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 DISLIKE_Decision Success");
			
			psmt.setString(1, sessionid);
			psmt.setString(2, title);
			System.out.println("3/6 DISLIKE_Decision Success");
			
			psmt.executeUpdate();
			System.out.println("4/6 DISLIKE_Decision Success");
			
		} catch (SQLException e) {
			System.out.println("DISLIKE_Decision Fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
	}
	
	public void dislikeCount(String writerid, String title) {	// '싫어요'수를 올려줘
		String sql = " UPDATE EXHIBIT_REVIEW "
				+ " SET DISLIKE=DISLIKE+1 "
				+ " WHERE ID=? AND TITLE=? ";
	
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 dislikeCount Success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 dislikeCount Success");
			
			psmt.setString(1, writerid);
			psmt.setString(2, title);
			System.out.println("3/6 dislikeCount Success");
			
			psmt.executeUpdate();
			System.out.println("4/6 dislikeCount Success");
			
		} catch (SQLException e) {
			System.out.println("dislikeCount Fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
	}
	
	// 전시 디테일 뷰에 뿌릴 리뷰 3개 
	public List<ReviewDto> getReviewToDetail(String title){
		String sql =  " SELECT ID, TITLE, REG_DATE, STAR, REVIEW "
					+ " FROM  ( SELECT ROW_NUMBER()OVER (ORDER BY LIKE_NUMBER DESC) AS RNUM, "
								+ " ID, TITLE, REG_DATE, STAR, REVIEW "
							+ " FROM EXHIBIT_REVIEW  "
							+ " WHERE DEL = 0  AND TITLE = ? "
							+ " ORDER BY LIKE_NUMBER DESC, DISLIKE ASC ) "
					+ " WHERE RNUM <= 4 ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<ReviewDto> list = new ArrayList<ReviewDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getReviewList Success");
			
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getReviewList Success");
			
			psmt.setString(1, title);
			
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getReviewList Success");
			
			while(rs.next()) {
				int i = 1;
				
				ReviewDto dto = new ReviewDto(	0,		//seq
												rs.getString(i++),	//id
												rs.getString(i++),	//exhibition_title
												rs.getString(i++),	//regdate
												rs.getInt(i++),		//star_number
												rs.getString(i++),	//review
												0,		//like_number
												0,		//dislike_number
												0);	//del
				list.add(dto);
			}
			System.out.println("4/6 getReviewList Success");
			
		} catch (SQLException e) {
			System.out.println("getReviewList Fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return list;
		
	}
	
	//=================== 리뷰 게시판 용 ======================================================================================
		// 리뷰 게시판에 전시 정보 뿌리기 (현재 및 지난 전시만)
		public List<ExhibitDto> getExhibitReview(int pageNum){
			String sql =  " SELECT SEQ, BEGINDATE, ENDDATE, TITLE, PLACE, CONTENT, "
						+ " EX_TIME, LOC_INFO, DEL, CONTACT, CERTI_NUM, PRICE, FILENAME  "
						+ " FROM ( SELECT ROW_NUMBER()OVER ( ORDER BY BEGINDATE DESC ) AS RNUM, "
								+ " SEQ, BEGINDATE, ENDDATE, TITLE, PLACE, CONTENT, "
								+ " EX_TIME, LOC_INFO, DEL, CONTACT, CERTI_NUM, PRICE, FILENAME  "
								+ " FROM EXHIBIT "
								+ " WHERE BEGINDATE <= SYSDATE ) "
						+ " WHERE RNUM >= ? AND RNUM <= ? ";
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			
			List<ExhibitDto> list = new ArrayList<ExhibitDto>();
			
			// 페이징 시작과 끝
			// 뿌릴 개수 : 5 
			int start = 1 + pageNum * 5;	// 처음 페이지 인덱스는 0이 들어옴  
			int end = 5 + pageNum * 5;		// 0번 페이지 : 1+0*5 = 1, 5+0*5 = 5
			// 1 ~ 5, 6 ~ 10... 
			
			
			try {
				
				conn = DBConnection.getConnection();
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, start);
				psmt.setInt(2, end);
				
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					int i = 1;
					ExhibitDto dto = new ExhibitDto(rs.getInt(i++), 
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
													rs.getString(i++));
					list.add(dto);
					
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finally {
				DBClose.close(psmt, conn, rs);
			}
			
			return list;
			
		}
		// 페이징 할 때 모든 전시 콘텐츠 수 구하는 함수 
		public int getReviewExhibitNum() {
			
			String sql =  " SELECT COUNT(*) "
						+ " FROM EXHIBIT "
						+ " WHERE BEGINDATE <= SYSDATE ";

			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			
			int size = 0; 
			
			try {
				conn = DBConnection.getConnection();
				psmt = conn.prepareStatement(sql);
				
				rs = psmt.executeQuery();
				
				if(rs.next()) {
					size = rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finally {
				
				DBClose.close(psmt, conn, rs);
				
			}
			
			
			return size;
		}
}























































