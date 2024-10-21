package space.jdbc;

import java.util.List;

import space.dto.Free_Board;

public interface Free_BoardDao {	
	public List<Free_Board> allList();
	public int writeFreeBoard(Free_Board board);
	public int modifyFreeBoard(Free_Board board);
	public int deleteFreeBoard(int idx);
	public int getAllCount(String query, String keyword);
	// 전체 몇 개의 게시글인지를 출력한다. 아무것도 검색하지 않으면 모든 게시글 수가, 검색한 경우에는 검색 결과 게시글 수 출력.	
	public List<Free_Board> findBoard(String query, String keyword);
	// 검색 기능에 사용할 메소드. 제목+내용 / 글쓴이로 검색하는 2가지 기능을 가짐.
	public Free_Board getBoardInfo(int idx);
}
