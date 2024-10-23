package space.noticeboard;

import java.util.List;

public interface Notice_BoardDao {
    List<Notice_Board> getAll();
    Notice_Board get(int boardIdx);
    void insert(Notice_Board noticeBoard);
    void update(Notice_Board noticeBoard);
    void delete(int boardIdx);
}
