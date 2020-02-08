package CYH;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DB.DBClose;
import DB.DBConnection;

public class ReviewDao {
	private static ReviewDao reviewDao = new ReviewDao();
	
	private ReviewDao() {
		DBConnection.initConnection();
	}
	
	
	
	public static ReviewDao getInstance() {
		return reviewDao;
	}
	
	public List<ReviewDto> getReviewList() {		// 리뷰페이지에 뿌려질 리뷰"리스트"를 가져와(get)
		String sql = " SELECT *  "
					+ " FROM EXHIBIT_REVIEW ";
		
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
	
	public boolean writeReview(ReviewDto dto) {		// 리뷰를 쓰고싶은 메소드
		String sql = " INSERT INTO EXHIBIT_REVIEW "
					+ " (SEQ, ID, TITLE, REG_DATE, STAR, REVIEW, LIKE_NUMBER, DISLIKE, DEL) "
					+ " VALUE(SEQ_REVIEW.NEXTVAL, ?, ?, SYSDATE, ?, ?, 0, 0) ";
		
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
	
	public void likeCount(int seq) {		// '좋아요'수를 올려줘
		String sql = " UPDATE EXHIBIT_REVIEW "
					+ " SET LIKE_NUMBER=LIKE_NUMBER+1 "
					+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 likeCount Success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 likeCount Success");
			
			psmt.setInt(1, seq);
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
	
	public void dislikeCount(int seq) {	// '싫어요'수를 올려줘
		String sql = " UPDATE EXHIBIT_REVIEW "
				+ " SET DISLIKE=DISLIKE+1 "
				+ " WHERE SEQ=? ";
	
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 dislikeCount Success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 dislikeCount Success");
			
			psmt.setInt(1, seq);
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
}























































