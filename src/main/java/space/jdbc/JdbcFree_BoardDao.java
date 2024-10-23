package space.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import space.common.DataSource;
import space.dto.Free_Board;
import space.dto.Member;

public class JdbcFree_BoardDao implements Free_BoardDao {
	
	private static JdbcFree_BoardDao instance = null;
	private JdbcFree_BoardDao(){}
	
	public static JdbcFree_BoardDao getInstance() {
		if (instance == null) {
			instance = new JdbcFree_BoardDao();
		}
		
		return instance;
	}
	
	
		
	@Override
	public List<Free_Board> allList() {
		List<Free_Board> allList = new ArrayList<Free_Board>();            
	    
	    // FREE_BOARD와 MEMBER 테이블을 조인하여 게시글 정보와 작성자 이름을 가져옴
	    String sql = "SELECT fb.IDX, fb.TITLE, fb.CONTENT, fb.REGIST_DATE,"
	    		+ "fb.VIEWS, m.MEMBER_IDX, m.NAME "
	    		+ "FROM FREEBOARD fb "
	    		+ "JOIN MEMBER m ON fb.MEMBER_IDX = m.MEMBER_IDX "
	    		+ "ORDER BY fb.REGIST_DATE DESC"; // MEMBER와 조인
	    
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
	            board.setMember(new Member(rs.getInt("MEMBER_IDX"), rs.getString("NAME")));
	            // 작성자 이름도 Free_Board 객체에 저장
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
		String sql = "INSERT INTO FREEBOARD "
				+ "(TITLE, CONTENT, REGIST_DATE, VIEWS, MEMBER_IDX) "
				+ "VALUES (?, ?, SYSTIMESTAMP, 0, ?)";
	    
	    try (Connection conn = DataSource.getDataSource();
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        
	        pstmt.setString(1, board.getTitle());
	        pstmt.setString(2, board.getContent());
	        pstmt.setInt(3, board.getMember().getIdx());	        
	        result = pstmt.executeUpdate();
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return result;
	}

	@Override
	public int modifyFreeBoard(Free_Board board) {
		int result = 0;
		
		String sql = "UPDATE FREEBOARD SET TITLE = ?, "
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
	        sql = "SELECT f.IDX, f.TITLE, f.CONTENT, f.REGIST_DATE, f.VIEWS, f.MEMBER_IDX, m.NAME "
	        		+ "FROM FREEBOARD f LEFT JOIN MEMBER m ON f.MEMBER_IDX = m.MEMBER_IDX "
	        		+ "WHERE f.TITLE LIKE ? OR f.CONTENT LIKE ?";
	    } else if (query.equals("writer")) {
	        sql = "SELECT f.IDX, f.TITLE, f.CONTENT, f.REGIST_DATE, f.VIEWS, f.MEMBER_IDX, m.NAME "
	        		+ "FROM FREEBOARD f LEFT JOIN MEMBER m ON f.MEMBER_IDX = m.MEMBER_IDX "
	        		+ "WHERE m.NAME LIKE ?";
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
	                board.setMember(new Member(rs.getInt("MEMBER_IDX"), rs.getString("NAME")));
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
	    PreparedStatement pstmt = null;
	    try (Connection conn = DataSource.getDataSource()) {
	        
	        // 검색 조건이 없으면 전체 게시글 수를 조회
	        if (query == null || query.isEmpty() || keyword == null || keyword.isEmpty()) {	        	
	            sql = "SELECT COUNT(*) CNT FROM FREEBOARD";	    
	            pstmt = conn.prepareStatement(sql);
	        } 
	        // 검색 조건이 있을 경우 제목 또는 내용에서 검색
	        else if (query.equals("content")) {
	            sql = "SELECT COUNT(*) CNT FROM FREEBOARD WHERE TITLE LIKE ? OR CONTENT LIKE ?";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, "%" + keyword + "%");
	            pstmt.setString(2, "%" + keyword + "%");
	        }
	        // 검색 조건이 작성자일 경우
	        else if (query.equals("writer")) {
	            sql = "SELECT COUNT(*) CNT FROM FREEBOARD fb JOIN MEMBER m ON fb.MEMBER_IDX = m.MEMBER_IDX WHERE m.NAME LIKE ?";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, "%" + keyword + "%");
	        }

	        // 쿼리 실행 및 결과 추출
	        try (ResultSet rs = pstmt.executeQuery()) {
	            if (rs.next()) {
	                count = rs.getInt("CNT"); // 첫 번째 컬럼의 값(총 게시글 수)을 가져옴
	            }
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return count;
	}


	@Override
	public Free_Board getBoardInfo(int idx) {
		
		Free_Board boardInfo = null;
		String sql = "SELECT fb.IDX, fb.TITLE, fb.CONTENT, fb.REGIST_DATE, "
				+ "fb.VIEWS, fb.MEMBER_IDX, m.NAME "
				+ "FROM FREEBOARD fb "
				+ "JOIN MEMBER m ON fb.MEMBER_IDX = m.MEMBER_IDX "
				+ "WHERE FB.IDX = ?";	
		
		try (Connection conn = DataSource.getDataSource();
			PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setInt(1, idx);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				boardInfo = new Free_Board(rs.getInt("IDX"), rs.getString("TITLE"), 
						rs.getString("CONTENT"), rs.getTimestamp("REGIST_DATE"),
						rs.getInt("VIEWS"), new Member(rs.getInt("MEMBER_IDX"), rs.getString("NAME")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return boardInfo;
	}


	@Override
	public void hitUp(int idx) {
		
		String sql = "UPDATE FREEBOARD SET VIEWS = VIEWS + 1 WHERE IDX = ?";
		
		try (Connection conn = DataSource.getDataSource();
			PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}	
}
