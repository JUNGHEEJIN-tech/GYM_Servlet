package space.jdbc;

import java.util.List;


public interface Board<T> {
	
	public boolean insert(T board);
	public boolean update(T board);
	public List<T> findAll(int page);
	public T findByIdx(int idx);
	public boolean deleteByIdx(int idx);
	public void hitUp(int idx);

}
