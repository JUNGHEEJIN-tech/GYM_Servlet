package space.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.eclipse.jdt.internal.compiler.batch.Main;

import space.common.DataSource;
import space.dto.Qna_board;

public class JdbcQna_BoardDao implements Board<Qna_board>{

	//새 글이 작성될때 필요로 하는 정보는 제목과 내용, 글쓴이 3개의 정보를 필요로 한다.
	@Override
	public boolean insert(Qna_board board) {
		
		boolean result = false;
		
		String sql = "INSERT INTO QNA_BOARD (TITLE, CONTENT, VIEWS, MEMBER_IDX) "
				+ "VALUES (?, ?, 0, ?)"; 
		
		
		try(Connection conn = DataSource.getDataSource();
				PreparedStatement pstmt = conn.prepareStatement(sql))
		{
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());

			pstmt.setInt(3, board.getWriter_idx());
			
			pstmt.executeQuery();
			
			result = true;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return result;
	}
	
	//업데이트 문에서 바꿀수 있는것은 글 제목과 내용 두가지만 존재하며, 글 번호를 탐색하기 위한 idx도 필요로 한다.
	//테스트 완료
	@Override
	public boolean update(Qna_board board) {

		boolean result = false;
		 
		String sql = "UPDATE QNA_BOARD SET TITLE = ?, CONTENT = ? WHERE IDX = ?";
		
		try(Connection conn = DataSource.getDataSource();
				PreparedStatement pstmt = conn.prepareStatement(sql))
		{
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setInt(3, board.getIdx());
			
			if(pstmt.executeUpdate() != 0)
				result = true;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			result = false;
		}
		
		return result;
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
	
	public List<Qna_board> findBoard(String query, String keyWord, int pageNum)
	{
		List<Qna_board> resultList = new ArrayList();
		
		String sql = "";
		
		//검색 조건에 따른 다른 sql 문 입력.
		if(query.equals("content"))
		{
			sql = "SELECT q.IDX, q.TITLE, q.CONTENT, q.REGIST_DATE, q.VIEWS, q.MEMBER_IDX, m.NAME "
					+ "FROM qna_board q LEFT JOIN MEMBER m ON q.MEMBER_IDX = m.MEMBER_IDX "
					+ "WHERE q.TITLE LIKE ? or q.content like ? "
					+ "OFFSET 1 ROWS FETCH NEXT 10 ROWS ONLY ";
		}
		else if(query.equals("writer"))
		{
			sql = "SELECT q.IDX, q.TITLE, q.CONTENT, q.REGIST_DATE, q.VIEWS, q.MEMBER_IDX, m.NAME " 
	        		+"FROM qna_board q LEFT JOIN MEMBER m ON q.MEMBER_IDX = m.MEMBER_IDX " 
	        		+"WHERE m.NAME LIKE ? "
                    +"ORDER BY idx DESC " 
	        		+"OFFSET 1 ROWS FETCH NEXT 10 ROWS ONLY";
		}
		else
		{
			System.out.println("쿼리 오류");
			return null;
		}
		
		
		try(Connection conn = DataSource.getDataSource();
				PreparedStatement pstmt = conn.prepareStatement(sql))
		{
			if(query.equals("content"))
			{
				System.out.println("내용으로 탐색");
				pstmt.setString(1, "%" + keyWord + "%");
				pstmt.setString(2, "%" + keyWord + "%");
			}
			else if (query.equals("writer"))
			{
				pstmt.setString(1, "%" + keyWord + "%");
			}
			else
			{
				System.out.println("쿼리 오류");
				return null;
			}
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				Qna_board board = new Qna_board();
				
				board.setIdx(rs.getInt("idx"));
				board.setTitle(rs.getString("title"));
				board.setRegist_date(rs.getTimestamp("REGIST_DATE"));
				board.setViews(rs.getInt("views"));
				board.setWriter(rs.getString("name"));
				
				resultList.add(board);
			}			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		
		return resultList;
		
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

	//테스트 완료
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
		JdbcQna_BoardDao qDao = new JdbcQna_BoardDao();
		
		
		System.out.println("1");
		
		for(Qna_board board : qDao.findBoard("content", "질문", 1))
		{
			System.out.println(board);
		}
	}
	
	

}
