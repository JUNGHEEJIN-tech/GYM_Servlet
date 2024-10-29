package space.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import space.common.DataSource;
import space.dto.Attraction;

public class JdbcAttractionDao implements AttractionDao{

	@Override
	public List<Attraction> allList() {
		List<Attraction> allList = new ArrayList<>();
		
		String sql = "SELECT * FROM ATTRACTION";
		
		try (Connection conn = DataSource.getDataSource();
			PreparedStatement pstmt = conn.prepareStatement(sql)){
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				allList.add(new Attraction(rs.getInt("ATTR_IDX"),
							rs.getString("TITLE"),
							rs.getString("CONTENT"),
							rs.getInt("TRAINER_IDX"),
							rs.getTimestamp("PROG_TIME")));
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return allList;
	}

	@Override
	public int insert(Attraction attraction) {
		 String sql = "INSERT INTO ATTRACTION (TITLE, CONTENT, TRAINER_IDX, PROG_TIME) VALUES (?, ?, ?, ?)";
	        int result = 0;

	        try (Connection conn = DataSource.getDataSource();
	             PreparedStatement pstmt = conn.prepareStatement(sql)) {
	            pstmt.setString(1, attraction.getTitle());
	            pstmt.setString(2, attraction.getContent());
	            pstmt.setInt(3, attraction.getTrainer_idx());
	            pstmt.setTimestamp(4, attraction.getProg_time());
	            result = pstmt.executeUpdate();
	        } catch (Exception e) {
	            System.out.println(e.getMessage());
	        }

	        return result;
	}

	@Override
	public int update(Attraction attraction) {
		 String sql = "UPDATE ATTRACTION SET TITLE = ?, CONTENT = ?, TRAINER_IDX = ?, PROG_TIME = ? WHERE ATTR_IDX = ?";
	        int result = 0;

	        try (Connection conn = DataSource.getDataSource();
	             PreparedStatement pstmt = conn.prepareStatement(sql)) {
	            pstmt.setString(1, attraction.getTitle());
	            pstmt.setString(2, attraction.getContent());
	            pstmt.setInt(3, attraction.getTrainer_idx());
	            pstmt.setTimestamp(4, attraction.getProg_time());
	            pstmt.setInt(5, attraction.getAttr_idx());
	            result = pstmt.executeUpdate();
	        } catch (Exception e) {
	            System.out.println(e.getMessage());
	        }

	        return result;
	}

	@Override
	public int delete(int attr_idx) {
		  String sql = "DELETE FROM ATTRACTION WHERE ATTR_IDX = ?";
	        int result = 0;

	        try (Connection conn = DataSource.getDataSource();
	             PreparedStatement pstmt = conn.prepareStatement(sql)) {
	            pstmt.setInt(1, attr_idx);
	            result = pstmt.executeUpdate();
	        } catch (Exception e) {
	            System.out.println(e.getMessage());
	        }
	        return result;
	}

	@Override
	public Attraction getAttraction(int attr_idx) {
		  Attraction attraction = null;
	        String sql = "SELECT * FROM ATTRACTION WHERE ATTR_IDX = ?";

	        try (Connection conn = DataSource.getDataSource();
	             PreparedStatement pstmt = conn.prepareStatement(sql)) {
	            pstmt.setInt(1, attr_idx);
	            ResultSet rs = pstmt.executeQuery();
	            if (rs.next()) {
	                attraction = new Attraction(rs.getInt("ATTR_IDX"),
	                        rs.getString("TITLE"),
	                        rs.getString("CONTENT"),
	                        rs.getInt("TRAINER_IDX"),
	                        rs.getTimestamp("PROG_TIME"));
	            }
	        } catch (Exception e) {
	            System.out.println(e.getMessage());
	        }

	        return attraction;
	}

}
