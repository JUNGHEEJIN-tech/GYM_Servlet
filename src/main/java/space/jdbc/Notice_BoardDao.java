package space.jdbc;

import java.util.List;
import space.dto.Notice_Board;

public interface Notice_BoardDao {
    // 전체 게시글 목록을 반환
    List<Notice_Board> getAll();
    
    // 새로운 게시글을 삽입
    int insert(Notice_Board noticeBoard);
    
    // 특정 게시글을 수정
    int update(Notice_Board noticeBoard);
    
    // 특정 게시글을 삭제
    int delete(int boardIdx);
    
    // 특정 게시글의 정보를 반환
    Notice_Board getBoardInfo(int boardIdx);
    
    // 조건에 따른 게시글 수를 반환 (검색어가 없으면 전체 게시글 수)
    int getAllCount(String query, String keyword);
    
    // 검색 조건에 맞는 게시글 목록을 반환 (제목/내용 또는 작성자로 검색)
    List<Notice_Board> findBoard(String query, String keyword);
    
    // 특정 게시글의 조회수를 증가
    void hitUp(int boardIdx);

	
}
