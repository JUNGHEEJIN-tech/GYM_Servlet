package space.board;

import java.util.List;

public interface BoardDao {

	public boolean insert(Board board);
    public List<Board> findAll();
   
	public Board findById(int id);

    public boolean update(Board board);
    public boolean deleteById(int id);

   
     
}



