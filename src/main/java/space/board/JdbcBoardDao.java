package space.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class JdbcBoardDao implements BoardDao {

    // 게시글 등록 메소드
    @Override
    public boolean insert(Board board) {
        try (Connection conn = DataSource.getDataSource();
             PreparedStatement pStatement = conn.prepareStatement(
                     "INSERT INTO board (title, writer, registdate, views) VALUES (?, ?, SYSTIMESTAMP, ?)")) {
            pStatement.setString(1, board.getTitle());
            pStatement.setString(2, board.getWriter());
            pStatement.setInt(3, board.getViews());

            int affectedRows = pStatement.executeUpdate();

            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 모든 게시글 조회 메소드
    @Override
    public List<Board> findAll() {
        List<Board> boards = new ArrayList<>();
        try (Connection conn = DataSource.getDataSource();
             PreparedStatement pStatement = conn
                     .prepareStatement("SELECT * FROM board ORDER BY id DESC FETCH FIRST 5 ROWS ONLY")) {

            ResultSet rs = pStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
                String writer = rs.getString("writer");
                Timestamp registdate = rs.getTimestamp("registdate");
                int views = rs.getInt("views");

                Board board = new Board();
                board.setId(id);
                board.setTitle(title);
                board.setWriter(writer);
                board.setRegistdate(registdate);
                board.setViews(views);

                boards.add(board);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return boards;
    }

    // 게시글 ID로 조회 메소드
    @Override
    public Board findById(int id) {
        Board board = null;

        try (Connection conn = DataSource.getDataSource();
             PreparedStatement pStatement = conn.prepareStatement("SELECT * FROM board WHERE id = ?")) {

            pStatement.setInt(1, id);

            ResultSet rs = pStatement.executeQuery();

            if (rs.next()) {
                String title = rs.getString("title");
                String writer = rs.getString("writer");
                Timestamp registdate = rs.getTimestamp("registdate");
                int views = rs.getInt("views");

                board = new Board();
                board.setId(id);
                board.setTitle(title);
                board.setWriter(writer);
                board.setRegistdate(registdate);  // 수정된 필드명 반영
                board.setViews(views);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return board;
    }

    // 게시글 수정 메소드
    @Override
    public boolean update(Board board) {
        try (Connection conn = DataSource.getDataSource();
             PreparedStatement pStatement = conn.prepareStatement(
                     "UPDATE board SET title = ?, writer = ?, registdate = ?, views = ? WHERE id = ?")) {
            pStatement.setString(1, board.getTitle());
            pStatement.setString(2, board.getWriter());
            pStatement.setTimestamp(3, board.getRegistdate());  // 수정된 필드명 반영
            pStatement.setInt(4, board.getViews());
            pStatement.setInt(5, board.getId());

            int affectedRows = pStatement.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 게시글 삭제 메소드
    @Override
    public boolean deleteById(int id) {
        try (Connection conn = DataSource.getDataSource();
             PreparedStatement pStatement = conn.prepareStatement("DELETE FROM board WHERE id = ?")) {
            pStatement.setInt(1, id);
            int affectedRows = pStatement.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static void main(String[] args) {
        BoardDao boardDao = new JdbcBoardDao();
        Board board = boardDao.findById(1);
        System.out.println(board);
    }

}
