package space.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import space.dto.Recruit_Board;
import space.common.DataSource;

public class JDBCRecruit_BoardDao implements Recruit_BoardDao {

	@Override
	public boolean insert(Recruit_Board board) {
        boolean result = false;

        try (Connection connection = DataSource.getDataSource();
             PreparedStatement pStatement = connection
                     .prepareStatement("INSERT INTO recruit_Board (title, content, writer, views) VALUES (?, ?, ?, 0)")) {

        pStatement.setString(1, board.getTitle());
        pStatement.setString(2, board.getContent());
        pStatement.setString(3, board.getWriter());

		int rows = pStatement.executeUpdate();

		if (rows > 0) {
            result = true;
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return result;
}

@Override
public List<Recruit_Board> findAll() {
    List<Recruit_Board> Boards = new ArrayList<>();

    try (Connection connection = DataSource.getDataSource();
         PreparedStatement preStatement = connection.prepareStatement("SELECT * FROM recruit_Board ORDER BY id DESC");
         ResultSet rs = preStatement.executeQuery()) {

        while (rs.next()) {
        	Recruit_Board board = new Recruit_Board();
        	board.setId(rs.getInt("id"));
        	board.setTitle(rs.getString("title"));
        	board.setContent(rs.getString("content"));
        	board.setWriter(rs.getString("writer"));
        	board.setRegist_Date(rs.getDate("regist_Date"));
        	board.setViews(rs.getInt("views"));

            Boards.add(board);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return Boards;
}

@Override
public Recruit_Board findById(int id) {
	Recruit_Board board =null;

    try (Connection connection = DataSource.getDataSource();
         PreparedStatement pStatement = connection.prepareStatement("SELECT * FROM recruit_Board WHERE id = ?")) {

        pStatement.setInt(1, id);

        try (ResultSet rs = pStatement.executeQuery()) {
            if (rs.next()) {
                board = new Recruit_Board();
                board.setId(rs.getInt("id"));
                board.setTitle(rs.getString("title"));
                board.setContent(rs.getString("content"));
                board.setWriter(rs.getString("writer"));
                board.setRegist_Date(rs.getDate("regist_Date"));
                board.setViews(rs.getInt("views"));
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return board;
}

@Override
public boolean update(Recruit_Board board) {
    boolean isUpdated = false;

    try (Connection connection = DataSource.getDataSource();
         PreparedStatement pStatement = connection
                 .prepareStatement("UPDATE recruit_Board SET title = ?, content = ?, writer = ? WHERE id = ?")) {

        pStatement.setString(1, board.getTitle());
        pStatement.setString(2, board.getContent());
        pStatement.setString(3, board.getWriter());
        pStatement.setInt(4, board.getId());
        
        int rows = pStatement.executeUpdate();
        if (rows > 0) {
            isUpdated = true;
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return isUpdated;
}

@Override
public int updateViews(int id) {
    int queryUpdate = 0;

    try (Connection connection = DataSource.getDataSource();
         PreparedStatement pStatement 
         = connection.prepareStatement("UPDATE recruit_Board SET views = views + 1 WHERE id = ?")) {

        pStatement.setInt(1, id);

        int rows = pStatement.executeUpdate();

        if (rows == 1) {
        	System.out.println("조회수 증가");
        	queryUpdate = 1;
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return queryUpdate;
}

 @Override
    public boolean deleteById(int id) {
        boolean isDeleted = false;

        try (Connection connection = DataSource.getDataSource();
             PreparedStatement pStatement = connection.prepareStatement("DELETE FROM recruit_Board WHERE id = ?")) {

            pStatement.setInt(1, id);

            int rowsAffected = pStatement.executeUpdate();
            if (rowsAffected > 0) {
                isDeleted = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isDeleted;
    }
 
    public List<Recruit_Board> search(String filter, String keyword) {
        List<Recruit_Board> boards = new ArrayList<>();
        String sql = "SELECT * FROM recruit_Board WHERE " + filter + " LIKE ?";

        try (Connection connection = DataSource.getDataSource();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            
        	preparedStatement.setString(1, "%" + keyword + "%");	            
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
            	Recruit_Board board = new Recruit_Board();
            	board.setId(rs.getInt("id"));
            	board.setTitle(rs.getString("title"));
            	board.setContent(rs.getString("content"));
            	board.setWriter(rs.getString("writer"));
            	board.setRegist_Date(rs.getDate("regist_Date"));
                boards.add(board);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return boards;
    }
}
