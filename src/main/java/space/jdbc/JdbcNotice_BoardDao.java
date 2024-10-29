package space.jdbc;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import space.common.DataSource;
import space.dto.Notice_Board;

public class JdbcNotice_BoardDao implements Notice_BoardDao {    
    
    @Override
    public List<Notice_Board> getAll() {
        List<Notice_Board> list = new ArrayList<>();
        String sql = "SELECT A.*, B.MEMBER_IDX, B.NAME AS WRITER FROM NOTICE_BOARD A JOIN MEMBER B ON A.MEMBER_IDX = B.MEMBER_IDX ORDER BY A.REGIST_DATE DESC";

        try (Connection conn = DataSource.getDataSource();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Notice_Board noticeBoard = new Notice_Board(
                    rs.getInt("NOTICE_IDX"),
                    rs.getString("TITLE"),
                    rs.getInt("MEMBER_IDX"),
                    rs.getString("CONTENT"),
                    rs.getTimestamp("REGIST_DATE"),
                    rs.getInt("VIEWS"),
                    rs.getString("WRITER")
                );
                list.add(noticeBoard);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // 게시글 작성 메소드
    @Override
    public int insert(Notice_Board noticeBoard) {
        String sql = "INSERT INTO NOTICE_BOARD (TITLE, MEMBER_IDX, CONTENT, REGIST_DATE, VIEWS) VALUES (?, ?, ?, SYSTIMESTAMP, 0)";
        int result = 0;

        try (Connection conn = DataSource.getDataSource();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, noticeBoard.getTitle());
            pstmt.setInt(2, noticeBoard.getMemberIdx());
            pstmt.setString(3, noticeBoard.getContent());

            result = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    // 게시글 수정 메소드
    @Override
    public int update(Notice_Board noticeBoard) {
        String sql = "UPDATE NOTICE_BOARD SET TITLE = ?, CONTENT = ? WHERE NOTICE_IDX = ?";
        int result = 0;

        try (Connection conn = DataSource.getDataSource();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, noticeBoard.getTitle());
            pstmt.setString(2, noticeBoard.getContent());
            pstmt.setInt(3, noticeBoard.getBoardIdx());

            result = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    // 게시글 삭제 메소드
    @Override
    public int delete(int boardIdx) {
        String sql = "DELETE FROM NOTICE_BOARD WHERE NOTICE_IDX = ?";
        int result = 0;

        try (Connection conn = DataSource.getDataSource();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, boardIdx);
            result = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    // 검색 메소드
    @Override
    public List<Notice_Board> findBoard(String query, String keyword) {
        List<Notice_Board> resultList = new ArrayList<>();
        String sql = "";

        if ("content".equals(query)) {
            sql = "SELECT A.*, B.NAME AS WRITER FROM NOTICE_BOARD A JOIN MEMBER B ON A.MEMBER_IDX = B.MEMBER_IDX WHERE A.TITLE LIKE ? OR A.CONTENT LIKE ?";
        } else if ("writer".equals(query)) {
            sql = "SELECT A.*, B.NAME AS WRITER FROM NOTICE_BOARD A JOIN MEMBER B ON A.MEMBER_IDX = B.MEMBER_IDX WHERE B.NAME LIKE ?";
        }

        try (Connection conn = DataSource.getDataSource();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            if ("content".equals(query)) {
                pstmt.setString(1, "%" + keyword + "%");
                pstmt.setString(2, "%" + keyword + "%");
            } else if ("writer".equals(query)) {
                pstmt.setString(1, "%" + keyword + "%");
            }

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Notice_Board noticeBoard = new Notice_Board(
                        rs.getInt("NOTICE_IDX"),
                        rs.getString("TITLE"),
                        rs.getInt("MEMBER_IDX"),
                        rs.getString("CONTENT"),
                        rs.getTimestamp("REGIST_DATE"),
                        rs.getInt("VIEWS"),
                        rs.getString("WRITER")
                    );
                    resultList.add(noticeBoard);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultList;
    }

    // 게시글 수 카운트 메소드
    @Override
    public int getAllCount(String query, String keyword) {
        int count = 0;
        String sql = "";

        if (query == null || query.isEmpty() || keyword == null || keyword.isEmpty()) {
            sql = "SELECT COUNT(*) AS CNT FROM NOTICE_BOARD";
        } else if ("content".equals(query)) {
            sql = "SELECT COUNT(*) AS CNT FROM NOTICE_BOARD WHERE TITLE LIKE ? OR CONTENT LIKE ?";
        } else if ("writer".equals(query)) {
            sql = "SELECT COUNT(*) AS CNT FROM NOTICE_BOARD A JOIN MEMBER B ON A.MEMBER_IDX = B.MEMBER_IDX WHERE B.NAME LIKE ?";
        }

        try (Connection conn = DataSource.getDataSource();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            if ("content".equals(query)) {
                pstmt.setString(1, "%" + keyword + "%");
                pstmt.setString(2, "%" + keyword + "%");
            } else if ("writer".equals(query)) {
                pstmt.setString(1, "%" + keyword + "%");
            }

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    count = rs.getInt("CNT");
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    // 게시글 조회수 증가 메소드
    @Override
    public void hitUp(int boardIdx) {
        String sql = "UPDATE NOTICE_BOARD SET VIEWS = VIEWS + 1 WHERE NOTICE_IDX = ?";

        try (Connection conn = DataSource.getDataSource();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, boardIdx);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 게시글 상세보기 메소드
    @Override
    public Notice_Board getBoardInfo(int boardIdx) {
        Notice_Board noticeBoard = null;
        String sql = "SELECT A.*, B.NAME AS WRITER FROM NOTICE_BOARD A JOIN MEMBER B ON A.MEMBER_IDX = B.MEMBER_IDX WHERE A.NOTICE_IDX = ?";

        try (Connection conn = DataSource.getDataSource();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, boardIdx);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                noticeBoard = new Notice_Board(
                    rs.getInt("NOTICE_IDX"),
                    rs.getString("TITLE"),
                    rs.getInt("MEMBER_IDX"),
                    rs.getString("CONTENT"),
                    rs.getTimestamp("REGIST_DATE"),
                    rs.getInt("VIEWS"),
                    rs.getString("WRITER")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return noticeBoard;
    }

}
