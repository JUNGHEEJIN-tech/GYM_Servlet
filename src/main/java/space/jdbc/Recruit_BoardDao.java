package space.jdbc;

import java.util.List;
import space.dto.Recruit_Board;

public interface Recruit_BoardDao {
	
	boolean insert(Recruit_Board board);
	
	List<Recruit_Board> findAll();
	
	Recruit_Board findById(int id);
	
	boolean update(Recruit_Board board);
	
	int updateViews(int id);

	boolean deleteById(int id);

	List<Recruit_Board> search(String filter, String keyword);

}
