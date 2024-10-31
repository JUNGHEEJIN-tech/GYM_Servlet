package space.jdbc;

import java.util.List;

import space.dto.Attraction;

public interface AttractionDao {
	public List<Attraction> allList();
	public List<Attraction> attractionListbyPagination(int pageNum);
	public int insert(Attraction attraction);
	public int update(Attraction attraction);
	public int delete(int attr_idx);
	public Attraction getAttraction(int attr_idx);
	public int getAllCount(); 
}
