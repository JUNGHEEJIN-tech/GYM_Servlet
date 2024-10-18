package space.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import space.common.DataSource;
import space.dto.Free_Board;

public class JdbcFree_BoardDao implements Free_BoardDao {

	@Override
	public List<Free_Board> allList() {
		List<Free_Board> allList = new ArrayList<Free_Board>();			
	    String sql = "SELECT IDX, TITLE, CONTENT, REGIST_DATE, VIEWS, MEMBER_IDX FROM FREE_BOARD";
	    
	    try (Connection conn = DataSource.getDataSource();
	         PreparedStatement pstmt = conn.prepareStatement(sql);
	         ResultSet rs = pstmt.executeQuery()) {
	        
	        while (rs.next()) {
	            Free_Board board = new Free_Board();
	            board.setIdx(rs.getInt("IDX"));
	            board.setTitle(rs.getString("TITLE"));
	            board.setContent(rs.getString("CONTENT"));
	            board.setRegist_date(rs.getTimestamp("REGIST_DATE"));
	            board.setViews(rs.getInt("VIEWS"));
	            board.setMember_idx(rs.getInt("MEMBER_IDX"));
	            allList.add(board);
	        }
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return allList;
	}

	@Override
	public int writeFreeBoard(Free_Board board) {
		int result = 0;
		String sql = "INSERT INTO FREE_BOARD "
				+ "(TITLE, CONTENT, REGIST_DATE, VIEWS, MEMBER_IDX) "
				+ "VALUES (?, ?, SYSTIMESTAMP, 0, ?)";
	    
	    try (Connection conn = DataSource.getDataSource();
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        
	        pstmt.setString(1, board.getTitle());
	        pstmt.setString(2, board.getContent());
	        pstmt.setInt(3, board.getMember_idx());
	        
	        result = pstmt.executeUpdate();
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return result;
	}

	@Override
	public int modifyFreeBoard(Free_Board board) {
		int result = 0;
		
		String sql = "UPDATE FREE_BOARD SET TITLE = ?, "
				+ "CONTENT = ?, VIEWS = ? WHERE IDX = ?";
	    
	    try (Connection conn = DataSource.getDataSource();
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        
	        pstmt.setString(1, board.getTitle());
	        pstmt.setString(2, board.getContent());
	        pstmt.setInt(3, board.getViews());
	        pstmt.setInt(4, board.getIdx());
	        
	        result = pstmt.executeUpdate();
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return result;
	}

	@Override
	public int deleteFreeBoard(int idx) {
		int result = 0;
		String sql = "DELETE FROM FREE_BOARD WHERE IDX = ?";		    
		    try (Connection conn = DataSource.getDataSource();
		         PreparedStatement pstmt = conn.prepareStatement(sql)) {		        
		        pstmt.setInt(1, idx);
		        
		        result = pstmt.executeUpdate();
		        
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    
		    return result;
	}

	@Override
	public List<Free_Board> findBoard(String query, String keyword) {
		List<Free_Board> resultList = new ArrayList<>();
	    String sql = "";

	    // SQL 작성 (query 값에 따라 검색 조건 변경)
	    if (query.equals("content")) {
	        sql = "SELECT IDX, TITLE, CONTENT, REGIST_DATE, VIEWS, MEMBER_IDX FROM FREE_BOARD WHERE "
	        		+ "TITLE LIKE ? OR CONTENT LIKE ?";
	    } else if (query.equals("writer")) {
	        sql = "SELECT f.IDX, f.TITLE, f.CONTENT, f.REGIST_DATE, f.VIEWS, f.MEMBER_IDX "
	            + "FROM FREE_BOARD f JOIN MEMBER m ON f.MEMBER_IDX = m.IDX WHERE m.NAME LIKE ?";
	    }

	    try (Connection conn = DataSource.getDataSource();
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {

	        // 검색 키워드를 준비 (와일드카드 %를 이용한 부분 검색)
	        if (query.equals("content")) {
	            pstmt.setString(1, "%" + keyword + "%");
	            pstmt.setString(2, "%" + keyword + "%");
	        } else if (query.equals("writer")) {
	            pstmt.setString(1, "%" + keyword + "%");
	        }

	        try (ResultSet rs = pstmt.executeQuery()) {
	            while (rs.next()) {
	                Free_Board board = new Free_Board();
	                board.setIdx(rs.getInt("IDX"));
	                board.setTitle(rs.getString("TITLE"));
	                board.setContent(rs.getString("CONTENT"));
	                board.setRegist_date(rs.getTimestamp("REGIST_DATE"));
	                board.setViews(rs.getInt("VIEWS"));
	                board.setMember_idx(rs.getInt("MEMBER_IDX"));
	                resultList.add(board);
	            }
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return resultList;
	}

	@Override
	public int getAllCount(String query, String keyword) {
		
		int count = 0;
	    String sql = "";
	    
	    
	    try (Connection conn = DataSource.getDataSource();
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        
	        // 검색 조건이 없으면 전체 게시글 수를 조회
	        if (query == null || query.isEmpty() || keyword == null || keyword.isEmpty()) {
	            sql = "SELECT COUNT(*) FROM FREE_BOARD";	    
	        } 
	        // 검색 조건이 있을 경우 제목 또는 내용에서 검색
	        else if (query.equals("content")) {
	            sql = "SELECT COUNT(*) FROM FREE_BOARD WHERE TITLE LIKE ? OR CONTENT LIKE ?";	            
	            pstmt.setString(1, "%" + keyword + "%");
	            pstmt.setString(2, "%" + keyword + "%");
	        }
	        // 검색 조건이 작성자일 경우
	        else if (query.equals("writer")) {
	            sql = "SELECT COUNT(*) FROM FREE_BOARD fb JOIN MEMBER m ON fb.MEMBER_IDX = m.IDX WHERE m.NAME LIKE ?";	            
	            pstmt.setString(1, "%" + keyword + "%");
	        }

	        // 쿼리 실행 및 결과 추출
	        try (ResultSet rs = pstmt.executeQuery()) {
	            if (rs.next()) {
	                count = rs.getInt(1); // 첫 번째 컬럼의 값(총 게시글 수)을 가져옴
	            }
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return count;
	}

	
}
