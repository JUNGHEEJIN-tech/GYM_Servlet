package space.jdbc;

import java.util.List;

import space.dto.Notice_Board;

public interface Notice_BoardDao {
    List<Notice_Board> getAll();
    Notice_Board get(int boardIdx);
    void insert(Notice_Board noticeBoard);
    void update(Notice_Board noticeBoard);
    void delete(int boardIdx);
}
