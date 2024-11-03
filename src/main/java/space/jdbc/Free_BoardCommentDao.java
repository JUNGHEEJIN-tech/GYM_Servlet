package space.jdbc;

import java.util.List;

import space.dto.Free_BoardComment;

public interface Free_BoardCommentDao {
	public List<Free_BoardComment> allList(int boardIdx);
	public int writeComment(Free_BoardComment fbc);
	public int deleteComment(int comment_idx);
}
