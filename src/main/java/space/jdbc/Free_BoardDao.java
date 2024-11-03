package space.jdbc;

import java.util.List;

import space.dto.Free_Board;

public interface Free_BoardDao {	
	public List<Free_Board> allList(int pageNum);
	public int writeFreeBoard(Free_Board board);
	public int modifyFreeBoard(Free_Board board);
	public int deleteFreeBoard(int idx);
	public int getAllCount(String query, String keyword);		
	public List<Free_Board> findBoard(String query, String keyword, int pageNum);
	public Free_Board getBoardInfo(int idx);
	public void hitUp(int idx);
	
}
