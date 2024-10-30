package space.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import space.common.DataSource;
import space.dto.Qna_board;

public class JdbcQna_BoardDao implements Board<Qna_board>{

	@Override
	public boolean insert(Qna_board board) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(Qna_board board) {
		// TODO Auto-generated method stub
		return false;
	}

	
	//글의 제목, 인덱스, 작성자 등의 정보를 가져오고 글의 내용은 필요로 하지 않는다.
	@Override
	public List<Qna_board> findAll(int page) {
		
		List<Qna_board> allLst = new ArrayList();
		
		String sql = "SELECT * "
				+ "FROM QNA_BOARD qb "
				+ "INNER JOIN MEMBER m "
				+ "ON qb.MEMBER_IDX =  m.MEMBER_IDX"; 
		
		
		try(Connection conn = DataSource.getDataSource();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery())
		{
			while(rs.next())
			{
				Qna_board b = new Qna_board();
				
				
				b.setIdx(rs.getInt("idx"));
				b.setTitle(rs.getString("title"));
				b.setRegist_date(rs.getTimestamp("REGIST_DATE"));
				b.setViews(rs.getInt("views"));
				b.setWriter(rs.getString("name"));
				
				allLst.add(b);
			}
		}
		catch(SQLException e)
		{ 
			e.printStackTrace();
		}

		return allLst;
	}

	
	//글의 idx 로 검색.
	@Override
	public Qna_board findByIdx(int idx) {
		Qna_board board = null;
		String sql = "SELECT * "
				+ "FROM QNA_BOARD qb "
				+ "INNER JOIN MEMBER m "
				+ "ON qb.MEMBER_IDX =  m.MEMBER_IDX "
				+ "WHERE IDX = ?"; 
		
		
		try(Connection conn = DataSource.getDataSource();
				PreparedStatement pstmt = conn.prepareStatement(sql);)
		{
			pstmt.setInt(1, idx);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				board = new Qna_board();
				
				board.setIdx(rs.getInt("idx"));
				board.setTitle(rs.getString("title"));
				board.setRegist_date(rs.getTimestamp("REGIST_DATE"));
				board.setViews(rs.getInt("views"));
				board.setWriter(rs.getString("name"));
			}
			else
			{
				System.out.println("해당 인덱스를 가진 글이 업서용");				
			}
		}		
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return board;
	}

	// 제목 기준 검색. 검색이 완료된 글들은 리스트에 담아져서 반환함.
	public List<Qna_board> findByTitle(String title) {

		List<Qna_board> allLst = new ArrayList();

		String sql = "SELECT * "
					+ "FROM QNA_BOARD qb " 
					+ "INNER JOIN MEMBER m " 
					+ "ON qb.MEMBER_IDX =  m.MEMBER_IDX";

		try (Connection conn = DataSource.getDataSource();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			while (rs.next()) {
				Qna_board b = new Qna_board();

				b.setIdx(rs.getInt("idx"));
				b.setTitle(rs.getString("title"));
				b.setRegist_date(rs.getTimestamp("REGIST_DATE"));
				b.setViews(rs.getInt("views"));
				b.setWriter(rs.getString("name"));

				allLst.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return allLst;

	}
	
	@Override
	public boolean deleteByIdx(int idx) {
		boolean result = false;
		String sql = "DELETE FROM SQL_BOARD WHERE IDX = ?";
		try (Connection conn = DataSource.getDataSource(); 
				PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setInt(1, idx);
			if (pstmt.executeUpdate() != 0) {
				result = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;

	}
	
	//글의 내용을 출력해준다.
	//반환 값은 필요로 하지 않는다.
	public Qna_board showBoardDetail(int idx)
	{
		Qna_board b = null;
		
		
		String sql = "SELECT * "
				+ "FROM QNA_BOARD qb " 
				+ "INNER JOIN MEMBER m " 
				+ "ON qb.MEMBER_IDX =  m.MEMBER_IDX "
				+ "WHERE IDX = ?";
		try (Connection conn = DataSource.getDataSource();
				PreparedStatement pstmt = conn.prepareStatement(sql);) 
		{
			pstmt.setInt(1, idx);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				b = new Qna_board();
				b.setIdx(rs.getInt("idx"));
				b.setTitle(rs.getString("title"));
				b.setContent(rs.getString("content"));
				b.setRegist_date(rs.getTimestamp("regist_date"));
				b.setWriter(rs.getString("name"));
				b.setViews(rs.getInt("views"));
				
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return b;
	}

	@Override
	public void hitUp(int idx) {
		String sql = "UPDATE QNA_BOARD SET VIEWS = VIEWS + 1 WHERE IDX = ?";
		
		try (Connection conn = DataSource.getDataSource();
			PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
	
	
	public static void main(String[] args) {
		JdbcQna_BoardDao bDao = new JdbcQna_BoardDao();
		
		Qna_board b = bDao.showBoardDetail(1);
		
		System.out.println(b);
		
		
		
		//FINDALL TEST 완료
//		System.out.println("a");		
//		for(Qna_board b : bDao.findAll(1))
//		{
//			System.out.println(b);
//		}
	}
	

}
