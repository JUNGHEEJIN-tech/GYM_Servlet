package space.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import space.common.DataSource;
import space.dto.Free_BoardComment;

public class JdbcFree_BoardCommentDao implements Free_BoardCommentDao{

	@Override
	public List<Free_BoardComment> allList(int boardIdx) {
		List<Free_BoardComment> comments = new ArrayList<>();
        String sql = "SELECT FC.COMMENT_IDX, FC.CONTENT, FC.REGIST_DATE, FC.MEMBER_IDX, M.NAME, FC.IDX "
        		+ "FROM FREEBOARD_COMMENT FC JOIN MEMBER M "
        		+ "ON FC.MEMBER_IDX = M.MEMBER_IDX WHERE IDX = ? "
        		+ "ORDER BY REGIST_DATE";
        
        try (Connection conn = DataSource.getDataSource();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, boardIdx);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Free_BoardComment comment = new Free_BoardComment(
                        rs.getInt("COMMENT_IDX"),
                        rs.getString("CONTENT"),
                        rs.getTimestamp("REGIST_DATE"),
                        rs.getInt("MEMBER_IDX"),
                        rs.getInt("IDX"),
                        rs.getString("NAME"));
                    
                    comments.add(comment);
                }
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return comments;
	}

	@Override
	public int writeComment(Free_BoardComment comment) {
		int result = 0;
		
		String sql = "INSERT INTO FREEBOARD_COMMENT (CONTENT, MEMBER_IDX, IDX) VALUES (?, ?, ?)";        

        try (Connection conn = DataSource.getDataSource();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, comment.getContent());
            pstmt.setInt(2, comment.getMemberIdx());
            pstmt.setInt(3, comment.getIdx());
            
            result = pstmt.executeUpdate();            

        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return result;
	}

	@Override
	public int deleteComment(int commentIdx) {
		int result = 0;
		String sql = "DELETE FROM FREEBOARD_COMMENT WHERE COMMENT_IDX = ?";	        
	    try (Connection conn = DataSource.getDataSource();
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {	            
	         pstmt.setInt(1, commentIdx);
	            
	         result = pstmt.executeUpdate();	            

	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
			
	    return result;
	}
	
}
