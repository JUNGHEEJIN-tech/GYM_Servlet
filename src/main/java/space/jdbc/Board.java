package space.jdbc;

import java.util.List;


public interface Board<T> {
//	public List<T> allList(int pageNum);
//	public int write(T board);
//	public int modify(T board);
//	public int delete(int idx);
//	public int getAllCount(String query, String keyword);	 	
//	public List<T> findBoard(String query, String keyword, int pageNum);
//	public T getBoardInfo(int idx);
//
//	
//	//조회수 +1
//	public void hitUp(int idx);
//	
	
	
	
	public boolean insert(T board);
	public boolean update(T board);
	public List<T> findAll(int page);
	public T findByIdx(int idx);
	public boolean deleteByIdx(int idx);
	public void hitUp(int idx);

}
