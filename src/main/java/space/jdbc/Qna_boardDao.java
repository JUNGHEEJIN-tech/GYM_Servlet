package space.jdbc;

import java.util.List;

import space.dto.Qna_board;

public interface Qna_boardDao {
	public List<Qna_board> allList(int pageNum);
	public int writeFreeBoard(Qna_board board);
	public int modifyFreeBoard(Qna_board board);
	public int deleteFreeBoard(int idx);
	public int getAllCount(String query, String keyword);	 	
	public List<Qna_board> findBoard(String query, String keyword, int pageNum);
	public Qna_board getBoardInfo(int idx);

	public void hitUp(int idx);

}
