package space.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import space.common.DataSource;
import space.dto.Trainer;

public class JdbcTrainerDao implements TrainerDao{

	@Override
	public int isTrainer(int member_idx) {
		int result = 0;
		
		String sql = "SELECT * FROM TRAINER WHERE MEMBER_IDX = ?";
		try (Connection conn = DataSource.getDataSource();
			PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setInt(1, member_idx);
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				result = 1;
			}
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}
		
		return result;		
	}

	@Override
	public List<Trainer> trainerList() {
		 List<Trainer> trainers = new ArrayList<>();
		    
		    String sql = "SELECT TRAINER_IDX, MEMBER_IDX, LOGIN_ID, "
		    		+ "NAME FROM TRAINER NATURAL JOIN MEMBER";
		    try (Connection conn = DataSource.getDataSource();
		         PreparedStatement pstmt = conn.prepareStatement(sql);
		         ResultSet rs = pstmt.executeQuery()) {
		        
		        while (rs.next()) {
		            Trainer trainer = new Trainer();
		            trainer.setTrainer_idx(rs.getInt("TRAINER_IDX"));
		            trainer.setMember_idx(rs.getInt("MEMBER_IDX"));
		            trainer.setLogin_id(rs.getString("LOGIN_ID"));
		            trainer.setName(rs.getString("NAME"));
		            trainers.add(trainer);
		        }
		        
		    } catch (SQLException e) {            
		        e.printStackTrace();
		    }
		    
		    return trainers;
	}
	

}
