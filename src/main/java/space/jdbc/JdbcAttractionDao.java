package space.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import space.common.DataSource;
import space.dto.Attraction;

public class JdbcAttractionDao implements AttractionDao{

	@Override
	public List<Attraction> allList() {
		List<Attraction> allList = new ArrayList<>();
		
		String sql = "SELECT ATTR_IDX, TITLE, CONTENT, TRAINER_IDX, "
				+ "TO_CHAR(PROG_TIME, 'YYYY-MM-DD') || 'T' || "
				+ "TO_CHAR(PROG_TIME, 'HH24:MI:SS')  AS PROG_TIME, "
				+ "TO_CHAR(END_TIME + INTERVAL '1' HOUR * PERIOD, 'YYYY-MM-DD') || 'T' || "
				+ "TO_CHAR(END_TIME + INTERVAL '1' HOUR * PERIOD, 'hh24:MI:SS') AS END_TIME "
				+ "FROM ATTRACTION";
		
		try (Connection conn = DataSource.getDataSource();
			PreparedStatement pstmt = conn.prepareStatement(sql)){
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				int idx = 0;
				allList.add(idx, new Attraction(rs.getInt("ATTR_IDX"),
							rs.getString("TITLE"),
							rs.getString("CONTENT"),
							rs.getInt("TRAINER_IDX"),
							rs.getString("PROG_TIME"),							
							rs.getString("END_TIME")));
							
				idx++;
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return allList;
	}

	@Override
	public int insert(Attraction attraction) {
		 String sql = "INSERT INTO ATTRACTION "
		 		+ "(TITLE, CONTENT, TRAINER_IDX, PROG_TIME, END_TIME, PERIOD) VALUES (?, ?, ?, TO_TIMESTAMP(?, 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP(?, 'YYYY-MM-DD HH24:MI'), ?)";
	        int result = 0;

	        try (Connection conn = DataSource.getDataSource();
	             PreparedStatement pstmt = conn.prepareStatement(sql)) {
	            pstmt.setString(1, attraction.getTitle());
	            pstmt.setString(2, attraction.getContent());
	            pstmt.setInt(3, attraction.getTrainer_idx());	        
	            pstmt.setString(4, attraction.getProg_time());
	            pstmt.setString(5, attraction.getEnd_time());
	            pstmt.setInt(6, attraction.getPeriod());
	            result = pstmt.executeUpdate();
	        } catch (Exception e) {
	            System.out.println(e.getMessage());
	        }

	        return result;
	}

	@Override
	public int update(Attraction attraction) {
		 String sql = "UPDATE ATTRACTION SET TITLE = ?, CONTENT = ?, TRAINER_IDX = ?, PROG_TIME = TO_TIMESTAMP(?, 'YYYY-MM-DD HH24:MI'), END_TIME = TO_TIMESTAMP(?, 'YYYY-MM-DD HH24:MI'), PERIOD = ? WHERE ATTR_IDX = ?";
	        int result = 0;

	        try (Connection conn = DataSource.getDataSource();
	             PreparedStatement pstmt = conn.prepareStatement(sql)) {
	            pstmt.setString(1, attraction.getTitle());
	            pstmt.setString(2, attraction.getContent());
	            pstmt.setInt(3, attraction.getTrainer_idx());
	            pstmt.setString(4, attraction.getProg_time());
	            pstmt.setString(5, attraction.getEnd_time());
	            pstmt.setInt(6, attraction.getPeriod());
	            pstmt.setInt(7, attraction.getAttr_idx());
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
	                        rs.getString("PROG_TIME"));
	            }
	        } catch (Exception e) {
	            System.out.println(e.getMessage());
	        }

	        return attraction;
	}

	@Override
	public List<Attraction> attractionListbyPagination(int pageNum) {
		
		List<Attraction> pagedList = new ArrayList<Attraction>();	

		String sql = "SELECT A.ATTR_IDX , A.TITLE, A.CONTENT, B.TRAINER_IDX, "
				+ "C.NAME AS NAME, A.PROG_TIME, A.END_TIME "
				+ "FROM ATTRACTION A "
				+ "JOIN TRAINER B ON A.TRAINER_IDX = B.TRAINER_IDX "
				+ "JOIN MEMBER C ON B.MEMBER_IDX = C.MEMBER_IDX "
				+ "ORDER BY ATTR_IDX DESC "
				+ "OFFSET " + ((pageNum -1) * 10) + " ROWS FETCH NEXT 10 ROWS ONLY";		
				
		try (Connection conn = DataSource.getDataSource();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery()){
			
			while (rs.next()) {
				pagedList.add(new Attraction(rs.getInt("ATTR_IDX"),
						rs.getString("TITLE"),
						rs.getString("CONTENT"),
						rs.getInt("TRAINER_IDX"),
						rs.getString("PROG_TIME"),							
						rs.getString("END_TIME"),
						rs.getString("NAME")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return pagedList;
	}

	@Override
	public int getAllCount() {
		int count = 0;
		
		String sql = "SELECT COUNT(*) CNT FROM ATTRACTION";
		
		try (Connection conn = DataSource.getDataSource();
			PreparedStatement pstmt = conn.prepareStatement(sql)){
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				count = rs.getInt("CNT");
			}
			
		} catch (SQLException e) {
			e.getStackTrace();
		}
		
		return count;
	}

}
